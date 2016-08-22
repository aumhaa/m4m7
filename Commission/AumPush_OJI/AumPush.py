# by amounra 0915 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import Live.DrumPad
from contextlib import contextmanager
from functools import partial
from itertools import izip, chain, imap, ifilter
from re import *
import logging
logger = logging.getLogger(__name__)

from ableton.v2.control_surface.component import Component as ControlSurfaceComponent
from ableton.v2.control_surface.elements.display_data_source import DisplayDataSource
from ableton.v2.control_surface.mode import LatchingBehaviour
#from _Framework.ModesComponent import CompoundMode, AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour

from ableton.v2.control_surface.resource import PrioritizedResource
from ableton.v2.control_surface import defaults
from ableton.v2.control_surface.components import MixerComponent, TransportComponent
from ableton.v2.control_surface.skin import *
from ableton.v2.base import inject, clamp, nop, const, NamedTuple, listens, listens_group, find_if, mixin, forward_property, first, NamedTuple, in_range, flatten, task
from ableton.v2.control_surface import BackgroundLayer, ClipCreator, ControlSurface, DeviceBankRegistry, Layer, midi
from ableton.v2.control_surface.components import ViewControlComponent, BackgroundComponent, M4LInterfaceComponent, ModifierBackgroundComponent, SessionNavigationComponent, SessionRingComponent, SessionOverviewComponent, ViewControlComponent
from ableton.v2.control_surface.elements import adjust_string, ButtonElement, ButtonMatrixElement, ChoosingElement, ComboElement, DoublePressContext, MultiElement, OptionalElement, to_midi_value
from ableton.v2.control_surface.mode import CompoundMode, AddLayerMode, LazyComponentMode, ReenterBehaviour, ModesComponent, EnablingModesComponent
from ableton.v2.control_surface.input_control_element import ParameterSlot

from Push.push import Push
from Push.device_navigation_component import DeviceNavigationComponent
from Push.actions import *
from Push.navigation_node import make_navigation_node, RackNode
from Push.special_chan_strip_component import SpecialChanStripComponent
from Push.special_mixer_component import SpecialMixerComponent
from Push.mode_behaviours import CancellableBehaviour
from Push import sysex

from pushbase.value_component import ValueComponent, ParameterValueComponent, ValueDisplayComponent, ParameterValueDisplayComponent
from pushbase.configurable_button_element import ConfigurableButtonElement
from pushbase.instrument_component import InstrumentComponent
from pushbase.step_seq_component import StepSeqComponent
from pushbase.loop_selector_component import LoopSelectorComponent
from pushbase.clip_control_component import ClipControlComponent
from pushbase.device_component import DeviceComponent as ProviderDeviceComponent
from pushbase.note_repeat_component import NoteRepeatComponent
from pushbase.matrix_maps import PAD_TRANSLATIONS, FEEDBACK_CHANNELS
from pushbase.control_element_factory import create_sysex_element
from pushbase.touch_encoder_element import TouchEncoderElement
from pushbase.touch_strip_element import TouchStripElement
from pushbase.touch_strip_controller import TouchStripControllerComponent, TouchStripEncoderConnection
from pushbase.selection import PushSelection
from pushbase.accent_component import AccentComponent
from pushbase.auto_arm_component import AutoArmComponent
from pushbase.matrix_maps import *
from pushbase.consts import *
from pushbase.scrollable_list_component import ScrollableListWithTogglesComponent
from pushbase.device_parameter_component import DeviceParameterComponent
from pushbase.skin_default import make_default_skin


from aumhaa.v2.control_surface.components.mono_device import MonoDeviceComponent
from aumhaa.v2.control_surface.components.device_selector import DeviceSelectorComponent
from aumhaa.v2.control_surface.components.reset_sends import ResetSendsComponent
from aumhaa.v2.control_surface.elements.mono_encoder import MonoEncoderElement
from aumhaa.v2.control_surface.components.mono_mixer import MixerComponentBase, TrackArmState
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.base.debug import *
from aumhaa.v2.control_surface.mod import *

from .Map import *

debug = initialize_debug()

from ModDevices import *

CHANNEL_TEXT = ['Ch. 1', 'Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8']

class AumPush(Push):


	device_provider_class = ModDeviceProvider

	def __init__(self, c_instance):
		self._monomod_version = 'b996'
		self._cntrlr_version = 'b996'
		self._host_name = 'AumPush'
		self._color_type = 'Push'
		self._auto_arm_calls = 0
		self.log_message = logger.warning
		super(AumPush, self).__init__(c_instance)
		with self.component_guard():
			self._device_component._alt_pressed = False
			self.set_feedback_channels(FEEDBACK_CHANNELS)
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
	

	def _create_skin(self):
		debug('creating skin colors')
		return merge_skins(make_default_skin(), Skin(AumPushColors))
	

	@listens('failure')
	def _on_handshake_failure(self, bootloader_mode):
		debug('Handshake failed.')
	

	@listens('success')
	def _on_handshake_success(self):
		debug('Handshake succeded with firmware version %.2f!' % self._handshake.firmware_version)
		self.update()
		if hasattr(self._c_instance, 'set_firmware_version'):
			debug('setting firmware version:', self._handshake.firmware_version)
			self._c_instance.set_firmware_version(self._handshake.firmware_version)
			if self._handshake.has_version_requirements(1, 16):
				self._user.settings = self._settings
			else:
				settings = copy(self._settings)
				del settings['aftertouch_threshold']
				self._user.settings = settings
	

	def _setup_mod(self):

		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		with inject(register_component = const(self._register_component), song = const(self.song)).everywhere():
			self.modhandler = PushModHandler(self) ## song = self.song, register_component = self._register_component)
		self.modhandler.name = 'ModHandler'
		self.modhandler.layer = Layer( priority = 10, lock_button = self.elements.note_mode_button, grid = self.elements.matrix, shift_button = self.elements.shift_button, alt_button = self.elements.select_button, key2_buttons = self.elements.track_state_buttons, key_buttons = self.elements.select_buttons)
		self.modhandler.legacy_shift_layer = AddLayerMode( self.modhandler, Layer(priority = 6, 
																			nav_up_button = self.elements.nav_up_button, 
																			nav_down_button = self.elements.nav_down_button, 
																			nav_left_button = self.elements.nav_left_button, 
																			nav_right_button = self.elements.nav_right_button,
																			channel_buttons = self.elements.matrix.submatrix[:, 1:2], 
																			nav_matrix = self.elements.matrix.submatrix[4:8, 2:6] ))
		self.modhandler.shift_layer = AddLayerMode( self.modhandler, Layer( priority = 6, 
																			device_selector_matrix = self.elements.matrix.submatrix[:, :1],
																			lock_button = self.elements.master_select_button, 
																			name_display_line = self.elements.display_line3, 
																			value_display_line = self.elements.display_line4 ))
		self.modhandler.alt_layer = AddLayerMode( self.modhandler, Layer( priority = 6, 
																			alt_name_display_line = self.elements.display_line3, 
																			alt_value_display_line = self.elements.display_line4 )) 
	

	def _init_matrix_modes(self):
		super(AumPush, self)._init_matrix_modes()
		self._setup_mod()
		self._note_modes.add_mode('mod', [self.modhandler])
		self._note_modes.add_mode('looperhack', [self._audio_loop])
	

	def _init_device(self, *a, **k):
		super(AumPush, self)._init_device(*a, **k)
		self._device = self._device_component
		debug('device_provider:', self._device_component._device_provider)
		self._on_new_device_set.subject = self._device_provider
	

	@listens('device')
	def _on_new_device_set(self):
		self.schedule_message(1, self._select_note_mode)
	

	def _select_note_mode(self, mod_device = None):
		if not self._main_modes.selected_mode is 'troll':
			track = self.song.view.selected_track
			drum_device, sliced_simpler = self._percussion_instruments_for_track(track)
			self._drum_component.set_drum_group_device(drum_device)
			self._slicing_component.set_simpler(sliced_simpler)
			channelized = False
			debug('select_note_mode: ' + str(self.modhandler.active_mod()) + ' ' + str(len(track.devices)))
			if not (self._note_modes.selected_mode is 'mod' and self.modhandler.is_locked()):
				if track == None or track.is_foldable or track in self.song.return_tracks or track == self.song.master_track or (hasattr(track, 'is_frozen') and track.is_frozen):
					self._note_modes.selected_mode = 'disabled'
				elif self.modhandler.active_mod():
					self._note_modes.selected_mode = 'mod'
				elif track and track.has_audio_input:
					self._note_modes.selected_mode = 'looperhack'
				elif drum_device:
					self._note_modes.selected_mode = 'drums'
				elif sliced_simpler:
					self._note_modes.selected_mode = 'slicing'
				else:
					self._note_modes.selected_mode = 'instrument'
				self.reset_controlled_track()
				debug('new note mode is:', self._note_modes.selected_mode)
	

	def _on_selected_track_changed(self):
		super(AumPush, self)._on_selected_track_changed()
		self.reset_controlled_track()
		self._main_modes.pop_groups(['add_effect'])
		self._note_repeat_enabler.selected_mode = 'disabled'
		self.schedule_message(1, self._select_note_mode)
	

	def disconnect(self):
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log closed >>>>>>>>>>>>>>>>>>>>>>>>') 
		super(AumPush, self).disconnect()
	

	def set_highlighting_session_component(self, session_component):
		self._highlighting_session_component = session_component
		session_component and self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('AumPush')
	


class ModDispayComponent(ControlSurfaceComponent):


	def __init__(self, parent, display_strings, value_strings, *a, **k):
		assert len(display_strings) == len(value_strings)
		super(ModDispayComponent, self).__init__(*a, **k)
		self.num_segments = len(display_strings)
		self._parent = parent
		self._name_display_line = None
		self._value_display_line = None
		self._name_data_sources = [ DisplayDataSource(string) for string in display_strings ]
		self._value_data_sources = [ DisplayDataSource(string) for string in value_strings ]
	

	def set_name_display_line(self, display_line):
		self._name_display_line = display_line
		if self._name_display_line:
			self._name_display_line.set_data_sources(self._name_data_sources)
	

	def set_value_display_line(self, display_line):
		self._value_display_line = display_line
		if self._value_display_line:
			self._value_display_line.set_data_sources(self._value_data_sources)
	

	def set_name_string(self, value, source = 0):
		if source in range(len(self._name_data_sources)):
			self._name_data_sources[source].set_display_string(str(value))
	

	def set_value_string(self, value, source = 0):
		if source in range(len(self._value_data_sources)):
			self._value_data_sources[source].set_display_string(str(value))
	

	def update(self):
		pass
	


class ModShiftBehaviour(ModeButtonBehaviour):


	def press_immediate(self, component, mode):
		component.push_mode(mode)
	

	def release_immediate(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	

	def release_delayed(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	


class PushModHandler(ModHandler):


	def __init__(self, *a, **k):
		self._color_type = 'Push'
		self._grid = None
		addresses = {'key2': {'obj':Array('key2', 8), 'method':self._receive_key2},
					'push_name_display': {'obj': Array('push_name_display', 8, _value = ' '), 'method': self._receive_push_name_display},
					'push_value_display': {'obj': Array('push_value_display', 8, _value = ' '), 'method': self._receive_push_value_display},
					'push_alt_name_display': {'obj': Array('push_alt_name_display', 8, _value = ' '), 'method': self._receive_push_alt_name_display},
					'push_alt_value_display': {'obj': Array('push_alt_value_display', 8, _value = ' '), 'method': self._receive_push_alt_value_display}}
		super(PushModHandler, self).__init__(addresses = addresses, *a, **k)
		self.nav_box = self.register_component(NavigationBox(self, 16, 16, 8, 8, self.set_offset,)) # song = self.song, register_component = self.register_component, is_enabled = False))
		self._push_colors = range(128)
		self._push_colors[1:8] = [3, 85, 33, 95, 5, 21, 67]
		self._push_colors[127] = 67
		self._shifted = False
		self._shift_display = ModDispayComponent(self, [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
		self._alt_display = ModDispayComponent(self, [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
	

	def select_mod(self, mod):
		super(PushModHandler, self).select_mod(mod)
		self._script._select_note_mode()
		self.update()
		debug('modhandler select mod: ' + str(mod))
	

	def _receive_grid(self, x, y, value = -1, identifier = -1, channel = -1, *a, **k):
		#debug('_receive_base_grid:', x, y, value, identifier, channel)
		mod = self.active_mod()
		if mod and self._grid_value.subject:
			if mod.legacy:
				x = x-self.x_offset
				y = y-self.y_offset
			if x in range(8) and y in range(8):
				value > -1 and self._grid_value.subject.send_value(x, y, self._push_colors[self._colors[value]], True)
				button = self._grid_value.subject.get_button(y, x)
				if button:
					new_identifier = identifier if identifier > -1 else button._original_identifier
					new_channel = channel if channel > -1 else button._original_channel
					button._msg_identifier != new_identifier and button.set_identifier(new_identifier)
					button._msg_channel != new_channel and button.set_channel(new_channel)
					button.set_enabled((channel, identifier) == (-1, -1))
	

	def _receive_key(self, x, value):
		#debug('_receive_key:', x, value)
		if not self._keys_value.subject is None:
			self._keys_value.subject.send_value(x, 0, self._push_colors[self._colors[value]], True)
	

	def _receive_key2(self, x, value):
		debug('_receive_key2:', x, value)
		if not self._keys2_value.subject is None:
			self._keys2_value.subject.send_value(x, 0, self._push_colors[self._colors[value]], True)
	

	def set_key2_buttons(self, keys):
		self._keys2_value.subject = keys
		if self.active_mod():
			self.active_mod()._addresses['key2'].restore()
	

	@listens('value')
	def _keys2_value(self, value, x, y, *a, **k):
		debug('_keys2_value', value, x, y)
		if self._active_mod:
			self._active_mod.send('key2', x, value)
	

	def _receive_push_name_display(self, x, value):
		if not self._shift_display is None:
			self._shift_display.set_name_string(str(value), x)
	

	def _receive_push_value_display(self, x, value):
		if not self._shift_display is None:
			self._shift_display.set_value_string(str(value), x)
	

	def _receive_push_alt_name_display(self, x, value):
		if not self._alt_display is None:
			self._alt_display.set_name_string(str(value), x)
	

	def _receive_push_alt_value_display(self, x, value):
		if not self._alt_display is None:
			self._alt_display.set_value_string(str(value), x)
	

	def set_name_display_line(self, display):
		if self._shift_display:
			self._shift_display.set_name_display_line(display)
	

	def set_value_display_line(self, display):
		if self._shift_display:
			self._shift_display.set_value_display_line(display)
	

	def set_alt_name_display_line(self, display):
		if self._alt_display:
			self._alt_display.set_name_display_line(display)
			self.log_message('setting alt display')
	

	def set_alt_value_display_line(self, display):
		if self._alt_display:
			self._alt_display.set_value_display_line(display)
	

	def update_device(self):
		if self.is_enabled() and not self._device_component is None:
			self._device_component.update()
			self._device_component._update_parameters()
	

	@listens('value')
	def _shift_value(self, value, *a, **k):
		debug('mod shift value:', value)
		self._is_shifted = not value is 0
		mod = self.active_mod()
		if mod:
			mod.send('shift', value)
		if self._is_shifted:
			self.shift_layer and self.shift_layer.enter_mode()
			if mod and mod.legacy:
				self.legacy_shift_layer and self.legacy_shift_layer.enter_mode()

		else:
			self.legacy_shift_layer and self.legacy_shift_layer.leave_mode()
			self.shift_layer and self.shift_layer.leave_mode()
		self.update()
	

	def update(self, *a, **k):
		mod = self.active_mod()
		if not mod is None:
			mod.restore()
		else:
			if not self._grid_value.subject is None:
				self._grid_value.subject.reset()
			if not self._keys_value.subject is None:
				self._keys_value.subject.reset()
	






#a