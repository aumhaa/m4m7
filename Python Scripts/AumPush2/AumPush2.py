# by amounra 0915 : http://www.aumhaa.com

#from __future__ import absolute_import, print_function

import Live
import Live.DrumPad
import logging
logger = logging.getLogger(__name__)

from contextlib import contextmanager
from functools import partial
from itertools import izip, chain, imap, ifilter
import re

from ableton.v2.control_surface.component import Component as ControlSurfaceComponent
from ableton.v2.control_surface.elements.display_data_source import DisplayDataSource
#from _Framework.ModesComponent import CompoundMode, AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour

from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.SysexValueControl import SysexValueControl

from ableton.v2.control_surface.resource import PrioritizedResource
from ableton.v2.base.slot import listens, listens_group
from ableton.v2.control_surface import defaults
from ableton.v2.base import task
from ableton.v2.control_surface.components import MixerComponent, TransportComponent

#from ableton.v2.control_surface.skin import *
from ableton.v2.base import inject, clamp, nop, const, NamedTuple, listens, listens_group, find_if, mixin, forward_property, first, NamedTuple, in_range, flatten, liveobj_valid
from ableton.v2.control_surface import BackgroundLayer, ClipCreator, ControlSurface, DeviceBankRegistry, Layer, midi
from ableton.v2.control_surface.components import DeviceComponent, BackgroundComponent, M4LInterfaceComponent, ModifierBackgroundComponent, SessionNavigationComponent, SessionRingComponent, SessionOverviewComponent, ViewControlComponent
from ableton.v2.control_surface.elements import adjust_string, ButtonElement, ButtonMatrixElement, ChoosingElement, ComboElement, DoublePressElement, DoublePressContext, MultiElement, OptionalElement, to_midi_value
from ableton.v2.control_surface.mode import CompoundMode, AddLayerMode, LazyComponentMode, ReenterBehaviour, ModesComponent, EnablingModesComponent, SetAttributeMode
from ableton.v2.control_surface.input_control_element import ParameterSlot

from Push2.push2 import Push2
#from Push2.handshake_component import HandshakeComponent, make_dongle_message
from pushbase.value_component import ValueComponent, ParameterValueComponent, ValueDisplayComponent, ParameterValueDisplayComponent
from pushbase.configurable_button_element import ConfigurableButtonElement
from pushbase.special_mixer_component import SpecialMixerComponent
#from Push.special_physical_display import SpecialPhysicalDisplay
from pushbase.instrument_component import InstrumentComponent
from pushbase.step_seq_component import StepSeqComponent
from pushbase.loop_selector_component import LoopSelectorComponent
#from _Framework.ViewControlComponent import ViewControlComponent
from pushbase.clip_control_component import ClipControlComponent
#from pushbase.provider_device_component import ProviderDeviceComponent
from Push2.device_navigation import DeviceNavigationComponent
from Push2.device_component import DeviceComponent as DeviceComponentBase, parameter_sensitivities
from pushbase.device_chain_utils import is_simpler

from pushbase.note_repeat_component import NoteRepeatComponent
from pushbase.matrix_maps import PAD_TRANSLATIONS, FEEDBACK_CHANNELS
from Push2.browser_component import BrowserComponent
#from Push.browser_model_factory import make_browser_model
from Push2.actions import *
#from Push.user_settings_component import UserComponent
from pushbase.control_element_factory import create_sysex_element
#from pushbase.message_box_component import DialogComponent, NotificationComponent
from pushbase.touch_encoder_element import TouchEncoderElement
from pushbase.touch_strip_element import TouchStripElement
from pushbase.touch_strip_controller import TouchStripControllerComponent, TouchStripEncoderConnection
from pushbase.selection import PushSelection
from pushbase.accent_component import AccentComponent
from pushbase.auto_arm_component import AutoArmComponent
from pushbase.matrix_maps import *
from pushbase.consts import *
from Push.settings import make_pad_parameters #, #SETTING_WORKFLOW
from Push.navigation_node import make_navigation_node, RackNode
from pushbase.scrollable_list_component import ScrollableListWithTogglesComponent
from pushbase.special_mixer_component import SpecialMixerComponent
from pushbase.special_chan_strip_component import SpecialChanStripComponent
from pushbase.device_parameter_component import DeviceParameterComponent
from pushbase.message_box_component import Messenger
from pushbase.control_element_factory import create_button
from Push2 import sysex
#from pushbase.provider_device_component import ProviderDeviceComponent
from pushbase import consts

from aumhaa.v2.control_surface.components.mono_device import NewMonoDeviceComponent as MonoDeviceComponent
from aumhaa.v2.control_surface.components.device_selector import DeviceSelectorComponent
from aumhaa.v2.control_surface.components.reset_sends import ResetSendsComponent
from aumhaa.v2.control_surface.elements.mono_encoder import MonoEncoderElement
from aumhaa.v2.control_surface.components.mono_mixer import MixerComponentBase, TrackArmState
#from aumhaa.v2.control_surface.components.channel_strip import ChannelStripComponentBase
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.base.debug import *
from aumhaa.v2.control_surface.mod import *
from aumhaa.v2.control_surface.components.channel_strip import ChannelStripComponent as OldChannelStripComponent
from colors import make_default_skin
from Map import *

from Push2.mixer_control_component import MixerControlComponent
from Push2.track_mixer_control_component import TrackMixerControlComponent as TrackMixerControlComponentBase

debug = initialize_debug()

from ModDevices import *



####post 9.5

def tracks_to_use_from_song(song):
    return tuple(song.visible_tracks) + tuple(song.return_tracks)



class AumPushValueComponent(ValueComponent):


	@listens('value')
	def _on_encoder_value(self, value):
		value = self.view_transform(getattr(self._subject, self._property_name)) + value * self.encoder_factor
		setattr(self._subject, self._property_name, self.model_transform(value))
	


class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	


class CancellableBehaviourWithRelease(CancellableBehaviour):


	def press_immediate(self, component, mode):
		active_modes = component.active_modes
		groups = component.get_mode_groups(mode)
		if mode in active_modes:
			"""can_cancel_mode = any(imap(lambda other: groups & component.get_mode_groups(other), active_modes))
			debug('mode not in active_modes', can_cancel_mode)
			if can_cancel_mode:
				groups and component.pop_groups(groups)
			else:"""
			component.pop_mode(mode)
			self.restore_previous_mode(component)
		else:
			debug('mode in active_modes')
			self.remember_previous_mode(component)
			component.push_mode(mode)
	

	def release_delayed(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	


class AumPushResetSendsComponent(ResetSendsComponent):


	def __init__(self, *a, **k):
		super(AumPushResetSendsComponent, self).__init__(*a, **k)
		self._buttons = []
	

	def set_buttons(self, buttons):
		self._buttons = buttons
		self._on_button_value.replace_subjects(buttons)
		#debug('send reset, set buttons:', buttons)
		if buttons:
			for button in buttons:
				button and button.set_light('ResetSendsColor')
	

	def set_send_a_button(self, button):
		self._on_send_a_button_value.subject = button
		button and button.send_value(1)
	

	def set_send_b_button(self, button):
		self._on_send_b_button_value.subject = button
		button and button.send_value(1)
	

	def set_send_c_button(self, button):
		self._on_send_c_button_value.subject = button
		button and button.send_value(1)
	

	def set_send_d_button(self, button):
		self._on_send_d_button_value.subject = button
		button and button.send_value(1)
	

	@listens('value')
	def _on_send_a_button_value(self, value):
		value and self.reset_send(0)
	

	@listens('value')
	def _on_send_b_button_value(self, value):
		value and self.reset_send(1)
	

	@listens('value')
	def _on_send_c_button_value(self, value):
		value and self.reset_send(2)
	

	@listens('value')
	def _on_send_d_button_value(self, value):
		value and self.reset_send(3)
	


class TrollMixerControlComponent(TrackMixerControlComponentBase):


	def __init__(self, script = None, *a, **k):
		self._script = script
		self._main_offset = 0
		self._troll_offset = 1
		self._mode_on_troll_entrance = 'global'
		debug('making track mixer...')
		super(TrollMixerControlComponent, self).__init__(*a, **k)
	

	def _troll_mode(self):
		val = False
		if hasattr(self._script, '_troll_modes'):
			val = self._script._troll_modes.selected_mode is 'enabled'
		debug('mixer._troll_mode():', val)
		return val
	

	def _get_track_mixer_parameters(self):
		if self._troll_mode():
			mixer_params = []
			if self._tracks_provider.selected_item:
				mixer = self._tracks_provider.selected_item.mixer_device
				rets = list(self.song.return_tracks)[:4]
				returns = [ret.mixer_device.volume for ret in rets]
				mixer_params = [mixer.volume] + list(mixer.sends[:4]) + returns[:4]
			return mixer_params
		else:
			return TrackMixerControlComponentBase._get_track_mixer_parameters(self)
	

	def _update_scroll_buttons(self):
		if self.is_enabled():
			if self._troll_mode():
				num_return_tracks = self._number_sends()
				self.scroll_right_button.enabled = self._number_sends() and self._scroll_offset < 2
				self.scroll_left_button.enabled = self._scroll_offset > 0
				self._update_view_slots()
			else:
				return TrackMixerControlComponentBase._update_scroll_buttons(self)
	

	def _update_scroll_offset(self):
		if self._troll_mode():
			new_number_return_tracks = self._number_sends()
			self._update_controls()
			self._update_scroll_buttons()
			self._number_return_tracks = new_number_return_tracks
		else:
			return TrackMixerControlComponentBase._update_scroll_offset(self)
	

	def _scroll_controls(self, delta):
		if self._troll_mode():
			num_return_tracks = self._number_sends()
			self._scroll_offset = clamp(self._scroll_offset + delta, 0, 2)
			self.notify_scroll_offset()
			self._update_controls()
			self._update_scroll_buttons()
		else:
			return TrackMixerControlComponentBase._scroll_controls(self, delta)
	


class AumPush2DeviceComponent(DeviceComponentBase):


	def __init__(self, script = None, *a, **k):
		self._script = script
		self._alt_pressed = False
		super(AumPush2DeviceComponent, self).__init__(*a, **k)
	

	"""
	def _get_provided_parameters(self):
		_, parameters = self._current_bank_details() if (self.device() or self._script._troll_modes.selected_mode is 'enabled') else (None, ())
		return [ self._create_parameter_info(p) for p in parameters ]
	

	def _sensitivity(self, sensitivity_key, parameter):
		sensitivity = None
		device = self.device()
		#debug('device', device)
		if hasattr(device, 'class_name'):
			#debug('device class', device.class_name)
			sensitivity = parameter_sensitivities(device.class_name, parameter)[sensitivity_key]
			if liveobj_valid(parameter) and is_simpler(device) and liveobj_valid(device.sample):
				if parameter.name in self.ZOOM_SENSITIVE_PARAMETERS:
					if self.use_waveform_navigation:
						sensitivity *= device.waveform_navigation.visible_proportion
					else:
						sensitivity *= self._zoom_handling.zoom_factor
				if parameter.name in self.PARAMETERS_RELATIVE_TO_ACTIVE_AREA:
					active_area_quotient = device.sample.length / float(device.sample.end_marker - device.sample.start_marker + 1)
					sensitivity *= active_area_quotient
		else:
			sensitivity = 1.0
		#debug('sensitivity:', sensitivity)
		return sensitivity
	
	"""

	def _current_bank_details(self):
		debug('current bank deets...')
		"""
		if self._script._troll_modes.selected_mode is 'enabled':
			track_mixer = self._script._model.mixerView.trackControlView
			mixer_params = []
			if track_mixer._tracks_provider.selected_item:
				mixer = track_mixer._tracks_provider.selected_item.mixer_device
			rets = list(self.song.return_tracks)[:4]
			returns = [ret.mixer_device.volume for ret in rets]
			mixer_params = list(mixer.sends[:4]) + returns
			debug('returning troll params:', mixer_params)
			return ('troll', mixer_params)
		"""
		if not self._script.modhandler.active_mod() is None:
			#debug('bank deets: active_mod')
			if self._script.modhandler.active_mod() and self._script.modhandler.active_mod()._param_component._device_parent != None:
				bank_name = self._script.modhandler.active_mod()._param_component._bank_name
				bank = [param._parameter for param in self._script.modhandler.active_mod()._param_component._params]
				if self._script.modhandler._alt_value.subject and self._script.modhandler._alt_value.subject.is_pressed():
					bank = bank[8:]
				#debug('current mod bank details: ' + str(bank_name) + ' ' + str(bank))
				return (bank_name, bank)
			else:
				#debug('returning ProviderDeviceComponent...')
				return DeviceComponentBase._current_bank_details(self)
				#super(AumPush2DeviceComponent, self)._current_bank_details()
		else:
			#debug('no mod found, returning ProviderDeviceComponent...')
			return DeviceComponentBase._current_bank_details(self)
			#super(AumPush2DeviceComponent, self)._current_bank_details()
	


class AumPush2(Push2):


	device_component_class = AumPush2DeviceComponent

	def __init__(self, c_instance, model):
		self._monomod_version = 'b996'
		self._cntrlr_version = 'b996'
		self._host_name = 'AumPush2'
		self._color_type = 'Push'
		self._auto_arm_calls = 0
		self.log_message = logger.warning

		super(AumPush2, self).__init__(c_instance, model)
		with self.component_guard():
			self._hack_stuff()
		self._on_selected_track_changed.subject = self.song.view
		#self._on_main_mode_changed.subject = self._main_modes
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush2 ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
	

	def _create_components(self):
		self._remove_pedal()
		super(AumPush2, self)._create_components()
	

	#no idea why this is messing up the stock colors?
	def _create_skin(self):
		return self.register_disconnectable(make_default_skin())
	

	def _setup_mod(self):

		def get_monomodular(host):
				if isinstance(__builtins__, dict):
					if not 'monomodular' in __builtins__.keys() or not isinstance(__builtins__['monomodular'], ModRouter):
						__builtins__['monomodular'] = ModRouter(song = self.song, register_component = self._register_component)
				else:
					if not hasattr(__builtins__, 'monomodular') or not isinstance(__builtins__['monomodular'], ModRouter):
						setattr(__builtins__, 'monomodular', ModRouter(song = self.song, register_component = self._register_component))
				monomodular = __builtins__['monomodular']
				if not monomodular.has_host():
					monomodular.set_host(host)
				return monomodular
		

		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		with inject(register_component = const(self._register_component), song = const(self.song)).everywhere():
			self.modhandler = PushModHandler(self) ## song = self.song, register_component = self._register_component)
		#debug('mod task group:', self.modhandler.parent_task_group)
		self.modhandler.name = 'ModHandler'
		self.modhandler.layer = Layer( priority = 6, lock_button = self.elements.note_mode_button, grid = self.elements.matrix, 
																			shift_button = self.elements.shift_button, 
																			alt_button = self.elements.select_button,
																			nav_up_button = self.elements.octave_up_button, 
																			nav_down_button = self.elements.octave_down_button, 
																			nav_left_button = self.elements.in_button, 
																			nav_right_button = self.elements.out_button,
																			key_buttons = self.elements.side_buttons,
																			)
		#self.modhandler.layer.priority = 0
		self.modhandler.legacy_shift_layer = AddLayerMode( self.modhandler, Layer(priority = 7, 
																			device_selector_matrix = self.elements.matrix.submatrix[:, :1],
																			channel_buttons = self.elements.matrix.submatrix[:, 1:2], 
																			nav_matrix = self.elements.matrix.submatrix[4:8, 2:6],
																			))
		self.modhandler.shift_layer = AddLayerMode( self.modhandler, Layer( priority = 7, 
																			device_selector_matrix = self.elements.matrix.submatrix[:, :1],
																			))
																			#lock_button = self.elements.master_select_button,
																			#))
		self.modhandler.alt_layer = AddLayerMode( self.modhandler, Layer( priority = 7, 
																			))
																			#key_buttons = self.elements.select_buttons))
																			#key_buttons = self.elements.track_state_buttons))

	

	def _init_matrix_modes(self):
		super(AumPush2, self)._init_matrix_modes()
		#self._setup_monoinstrument()
		self._setup_mod()
		self._note_modes.add_mode('mod', [self.modhandler])
		self._note_modes.add_mode('looperhack', [self._audio_loop])
	

	def _create_device_component(self):
		return self.device_component_class(script = self, device_decorator_factory=self._device_decorator_factory, device_bank_registry=self._device_bank_registry, banking_info=self._banking_info, name='DeviceComponent', is_enabled=True, is_root=True)
	

	def _init_device(self):
		super(AumPush2, self)._init_device()
		self._device = self._device_component
		self.modhandler.set_device_component(self._device_component)
		self._on_device_changed.subject = self._device_provider
	

	def _create_main_mixer_modes(self):
		self._mixer_control = MixerControlComponent(name='Global_Mix_Component', view_model=self._model.mixerView, tracks_provider=self._session_ring, is_enabled=False, layer=Layer(controls='fine_grain_param_controls', volume_button='track_state_buttons_raw[0]', panning_button='track_state_buttons_raw[1]', send_slot_one_button='track_state_buttons_raw[2]', send_slot_two_button='track_state_buttons_raw[3]', send_slot_three_button='track_state_buttons_raw[4]', send_slot_four_button='track_state_buttons_raw[5]', send_slot_five_button='track_state_buttons_raw[6]', cycle_sends_button='track_state_buttons_raw[7]'))
		self._model.mixerView.realtimeMeterData = self._mixer_control.real_time_meter_handlers
		track_mixer_control = TrollMixerControlComponent(script = self, name='Track_Mix_Component', is_enabled=False, tracks_provider=self._session_ring, layer=Layer(controls='fine_grain_param_controls', scroll_left_button='track_state_buttons_raw[6]', scroll_right_button='track_state_buttons_raw[7]'))
		self._track_mixer_control = track_mixer_control
		self._model.mixerView.trackControlView = track_mixer_control
		self._mix_modes = ModesComponent(is_enabled=False)
		self._mix_modes.add_mode('global', self._mixer_control)
		self._mix_modes.add_mode('track', track_mixer_control)
		self._mix_modes.selected_mode = 'global'
		self._model.mixerSelectView = self._mixer_control
		self._model.trackMixerSelectView = track_mixer_control

		class MixModeBehaviour(ReenterBehaviour):

			def press_immediate(behaviour_self, component, mode):
				if self._is_on_master() and self._mix_modes.selected_mode != 'track':
					self._mix_modes.selected_mode = 'track'
				super(MixModeBehaviour, behaviour_self).press_immediate(component, mode)
			
			def on_reenter(behaviour_self):
				if not self._is_on_master():
					self._mix_modes.cycle_mode()
			
		

		self._main_modes.add_mode('mix', [self._mix_modes, tuple([self._check_track_mixer_entry, self._check_track_mixer_exit]), SetAttributeMode(obj=self._note_editor_settings_component, attribute='parameter_provider', value=self._track_parameter_provider)], behaviour=MixModeBehaviour())
	

	def _with_select(self, button):
		return ComboElement(button, [self.elements.select_button])
	

	def _hack_stuff(self):

		self._crossfader_strip = TouchStripControllerComponent()
		self._crossfader_strip.layer = Layer(touch_strip = self.elements.touch_strip_control)
		self._crossfader_strip.set_enabled(False)

		self._device_selector = DeviceSelectorComponent(self)
		self._device_selector._off_value = 64
		self._device_selector.layer = Layer(priority = 9, matrix = self.elements.matrix.submatrix[:, :4])
		self._device_selector.set_enabled(False)

		self._send_reset = AumPushResetSendsComponent(self)
		self._send_reset.layer = Layer(priority = 9, send_a_button = self._with_select(self.elements.track_state_buttons_raw[4]), send_b_button = self._with_select(self.elements.track_state_buttons_raw[5]), send_c_button = self._with_select(self.elements.track_state_buttons_raw[6]), send_d_button = self._with_select(self.elements.track_state_buttons_raw[7]))
		self._send_reset.set_enabled(False)

		static_modes = CompoundMode(tuple([self._grab_crossfader, self._release_crossfader]), self._crossfader_strip, self._device_selector, self._send_reset)
		self._troll_modes = ModesComponent()
		self._troll_modes.add_mode('disabled', [], cycle_mode_button_color = 'DefaultButton.Off')
		self._troll_modes.add_mode('enabled', [static_modes, tuple([self._grab_track_mode, self._release_track_mode, ])], cycle_mode_button_color = 'DefaultButton.Alert')
		self._troll_modes.layer = Layer(priority = 6, cycle_mode_button = 'master_select_button')
		self._troll_modes.selected_mode = 'disabled'

		#self.schedule_message(5, self._remove_pedal)
	

	@listens('selected_mode')
	def _on_main_mode_changed(self, mode):
		debug('main_mode selected mode is now:', mode)
		#if self._troll_modes.selected_mode is 'enabled' and not mode is 'device':
		#	self._troll_modes.selected_mode = 'disabled'
	

	def _init_main_modes(self):
		super(AumPush2, self)._init_main_modes()
		self._on_main_mode_changed.subject = self._main_modes
	

	def _grab_track_mode(self):
		debug('grab device mode')
		"""self._main_modes.pop_unselected_modes()
		if not self._main_modes.selected_mode is 'device':
			self._main_modes.push_mode('device')
		self._device_component._update_parameters()"""
		
		self._track_mixer_control._mode_on_troll_entrance = self._mix_modes.selected_mode
		self._track_mixer_control._main_offset = self._track_mixer_control.scroll_offset
		self._track_mixer_control._scroll_offset = self._track_mixer_control._troll_offset
		if self._main_modes.selected_mode is 'mix':
			self._check_track_mixer_entry()
	

	def _release_track_mode(self):
		debug('release device mode')
		"""if self._troll_modes.selected_mode is 'enabled':
			self._troll_modes.selected_mode = 'disabled'
		if len(self._main_modes.active_modes) > 1:
			self._main_modes.pop_mode('device')
		self._device_component._update_parameters()"""
		
		self._track_mixer_control._troll_offset = self._track_mixer_control.scroll_offset
		self._track_mixer_control._scroll_offset = self._track_mixer_control._main_offset
		if self._main_modes.selected_mode is 'mix':
			self._mix_modes.selected_mode = self._track_mixer_control._mode_on_troll_entrance
			if self._track_mixer_control._mode_on_troll_entrance is 'track':
				self._track_mixer_control.notify_scroll_offset()
				self._track_mixer_control.update()
	

	def _check_track_mixer_entry(self):
		debug('_check_track_mixer_entry')
		if self._troll_modes.selected_mode is 'enabled':
			if not self._mix_modes.selected_mode is 'track':
				self._mix_modes.push_mode('track')
			self._track_mixer_control.notify_scroll_offset()
			self._track_mixer_control.update()
	

	def _check_track_mixer_exit(self):
		debug('_check_track_mixer_exit')
	

	def _disable_troll(self):
		#self._troll_modes.selected_mode = 'disabled'
		debug('disable troll')
	

	def _init_mute_solo_stop(self):
		super(AumPush2, self)._init_mute_solo_stop()
		self._master_selector.layer = Layer(toggle_button=self._with_select('master_select_button'))
	

	def _grab_crossfader(self):
		self._crossfader_strip.set_parameter(self.song.master_track.mixer_device.crossfader)
	

	def _release_crossfader(self):
		self._crossfader_strip.set_parameter(None)
	

	def _remove_pedal(self):

		#self.real_foot_pedal_button = self.elements.foot_pedal_button
		self.elements.foot_pedal_button = DoublePressElement(create_button(127, name = 'Foot_Pedal', skin = self._skin, is_rgb=True))
		for control in self.controls:
			if isinstance(control, ConfigurableButtonElement) and control._original_identifier is 69:
				self.log_message('found control: ' + str(control))
				self.controls.remove(control)
				break
		self.request_rebuild_midi_map()
	

	@listens('device')
	def _on_device_changed(self):
		debug('_on_device_changed')
		#self.schedule_message(1, self._select_note_mode)
		#self._select_note_mode()
	

	@listens('selected_track')
	def _on_selected_track_changed(self):
		#if self._troll_modes.selected_mode is 'enabled':
		#	self._device_component._update_parameters()
		pass
	

	def _select_note_mode(self, mod_device = None):
		track = self.song.view.selected_track
		drum_device, sliced_simpler = self._percussion_instruments_for_track(track)
		self._drum_component.set_drum_group_device(drum_device)
		self._slicing_component.set_simpler(sliced_simpler)
		debug('select_note_mode: ', self.modhandler.is_locked(), self.modhandler.active_mod(), len(track.devices))
		if not (self._note_modes.selected_mode is 'mod' and self.modhandler.is_locked()):
			if track == None or track.is_foldable or track in self.song.return_tracks or track == self.song.master_track or track.is_frozen:
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
	

	def disconnect(self):
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush2 ' + str(self._monomod_version) + ' log closed >>>>>>>>>>>>>>>>>>>>>>>>') 
		super(AumPush2, self).disconnect()
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('AumPush2')
	


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
		super(PushModHandler, self).__init__(*a, **k)
		self.nav_box = self.register_component(AumPushNavigationBox(self, 16, 16, 8, 8, self.set_offset,)) # song = self.song, register_component = self.register_component, is_enabled = False))
		self._push_colors = range(128)
		self._push_colors[1:8] = [120, 30, 12, 20, 65, 11, 125]
		self._push_colors[127] = 125
		self._shifted = False
	

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
				button = self._grid_value.subject.get_button(x, y)
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
			self._device_component._update_parameters()
	

	@listens('value')
	def _shift_value(self, value, *a, **k):
		debug('mod shift value:', value)
		self._is_shifted = not value is 0
		button = self._shift_value.subject
		debug('shift button:', button)
		button and self._is_shifted and button.set_light('DefaultButton.On') or button.set_light('DefaultButton.Off')
		mod = self.active_mod()
		if mod:
			mod.send('shift', value)
		if self.is_shifted():
			self.shift_layer and self.shift_layer.enter_mode()
			if mod and mod.legacy:
				self.legacy_shift_layer and self.legacy_shift_layer.enter_mode()

		else:
			self.legacy_shift_layer and self.legacy_shift_layer.leave_mode()
			self.shift_layer and self.shift_layer.leave_mode()
		self.update()
	

	@listens('value')
	def _alt_value(self, value, *a, **k):
		self._is_alted = not value is 0
		button = self._alt_value.subject
		debug('alt button:', button)
		button and self._is_alted and button.set_light('DefaultButton.On') or button.set_light('DefaultButton.Off')
		mod = self.active_mod()
		if mod:
			mod.send('alt', value)
			mod._param_component._is_alted = bool(value)
			mod._param_component.update()
			#self.update_device()
		if self.is_alted():
			self.alt_layer and self.alt_layer.enter_mode()
		else:
			self.alt_layer and self.alt_layer.leave_mode()
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
	

	def set_shift_button(self, button):
		button and button.set_on_off_values('DefaultButton.On', 'DefaultButton.Off')
		super(PushModHandler, self).set_shift_button(button)
	

	def set_alt_button(self, button):
		debug('setting alt button:', button)
		button and button.set_on_off_values('DefaultButton.On', 'DefaultButton.Off')
		super(PushModHandler, self).set_alt_button(button)
	


class AumPushNavigationBox(NavigationBox):


	def update(self):
		nav_grid = self._on_navigation_value.subject
		left_button = self._on_nav_left_value.subject
		right_button = self._on_nav_right_value.subject
		up_button = self._on_nav_up_value.subject
		down_button = self._on_nav_down_value.subject
		xinc = self._x_inc
		yinc = self._y_inc
		xoff = self.x_offset
		yoff = self.y_offset
		xmax = xoff+self._window_x
		ymax = yoff+self._window_y
		if nav_grid:
			for button, coord in nav_grid.iterbuttons():
				x = coord[0]
				y = coord[1]
				button.set_light(((x*xinc) in range(xoff, xmax)) and ((y*yinc) in range(yoff, ymax)))
		left_button and left_button.set_light('DefaultButton.On' if (xoff>0) else 'DefaultButton.Off')
		right_button and right_button.set_light('DefaultButton.On' if (xoff<(self.width()-self._window_x)) else 'DefaultButton.Off')
		up_button and up_button.set_light('DefaultButton.On' if (yoff>0) else 'DefaultButton.Off')
		down_button and down_button.set_light('DefaultButton.On' if (yoff<(self.height()-self._window_y)) else 'DefaultButton.Off')
	

#a