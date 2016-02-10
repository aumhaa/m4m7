# by amounra 0915 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import Live.DrumPad
import logging
logger = logging.getLogger(__name__)

from contextlib import contextmanager
from functools import partial
from itertools import izip, chain, imap, ifilter
from re import *

from ableton.v2.control_surface.component import Component as ControlSurfaceComponent
from ableton.v2.control_surface.elements.display_data_source import DisplayDataSource
from ableton.v2.control_surface.mode import LatchingBehaviour
#from _Framework.ModesComponent import CompoundMode, AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour

from aumhaa.v2.control_surface.components.mode_selector import ModeSelectorComponent
#from _Framework.SysexValueControl import SysexValueControl

from ableton.v2.control_surface.resource import PrioritizedResource
from ableton.v2.base.slot import listens, listens_group
from ableton.v2.control_surface import defaults
from ableton.v2.base import task
from ableton.v2.control_surface.components import MixerComponent, TransportComponent

from ableton.v2.control_surface.skin import *
from ableton.v2.base import inject, clamp, nop, const, NamedTuple, listens, listens_group, find_if, mixin, forward_property, first, NamedTuple, in_range, flatten
from ableton.v2.control_surface import BackgroundLayer, ClipCreator, ControlSurface, DeviceBankRegistry, Layer, midi
from ableton.v2.control_surface.components import BackgroundComponent, M4LInterfaceComponent, ModifierBackgroundComponent, SessionNavigationComponent, SessionRingComponent, SessionOverviewComponent, ViewControlComponent
from ableton.v2.control_surface.elements import adjust_string, ButtonElement, ButtonMatrixElement, ChoosingElement, ComboElement, DoublePressContext, MultiElement, OptionalElement, to_midi_value
from ableton.v2.control_surface.mode import CompoundMode, AddLayerMode, LazyComponentMode, ReenterBehaviour, ModesComponent, EnablingModesComponent
from ableton.v2.control_surface.input_control_element import ParameterSlot

from Push.push import Push
from Push.handshake_component import HandshakeComponent, make_dongle_message
from pushbase.value_component import ValueComponent, ParameterValueComponent, ValueDisplayComponent, ParameterValueDisplayComponent
from pushbase.configurable_button_element import ConfigurableButtonElement
from pushbase.special_mixer_component import SpecialMixerComponent
from Push.special_physical_display import SpecialPhysicalDisplay
from pushbase.instrument_component import InstrumentComponent
from pushbase.step_seq_component import StepSeqComponent
from pushbase.loop_selector_component import LoopSelectorComponent
from ableton.v2.control_surface.components.view_control import ViewControlComponent
from pushbase.clip_control_component import ClipControlComponent
from pushbase.device_component import DeviceComponent as ProviderDeviceComponent
from Push.device_navigation_component import DeviceNavigationComponent

from pushbase.note_repeat_component import NoteRepeatComponent
from pushbase.matrix_maps import PAD_TRANSLATIONS, FEEDBACK_CHANNELS
from Push.browser_component import BrowserComponent
from Push.browser_model_factory import make_browser_model
from Push.actions import *
from Push.user_settings_component import UserComponent
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
#from Push.settings import make_pad_parameters, SETTING_WORKFLOW, SETTING_THRESHOLD, SETTING_CURVE
from Push.navigation_node import make_navigation_node, RackNode
from pushbase.scrollable_list_component import ScrollableListWithTogglesComponent
from pushbase.special_mixer_component import SpecialMixerComponent
from pushbase.special_chan_strip_component import SpecialChanStripComponent
from pushbase.device_parameter_component import DeviceParameterComponent
from Push.mode_behaviours import CancellableBehaviour
from Push import sysex

from aumhaa.v2.control_surface.components.mono_device import NewMonoDeviceComponent as MonoDeviceComponent
from aumhaa.v2.control_surface.components.device_selector import NewDeviceSelectorComponent as DeviceSelectorComponent
from aumhaa.v2.control_surface.components.reset_sends import ResetSendsComponent
from aumhaa.v2.control_surface.elements.mono_encoder import MonoEncoderElement
from aumhaa.v2.control_surface.components.mono_mixer import MixerComponentBase, TrackArmState
#from aumhaa.v2.control_surface.components.channel_strip import ChannelStripComponentBase
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.base.debug import *
from aumhaa.v2.control_surface.mod import *
from aumhaa.v2.control_surface.components.channel_strip import ChannelStripComponent as OldChannelStripComponent
from Map import *

debug = initialize_debug()

from ModDevices import *

CHANNEL_TEXT = ['Ch. 1', 'Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8']

AUMPUSH_SCALENAMES = ['Keys', 'Major', 'Minor', 'Auto', 'Chromatic']



####post 9.5

def tracks_to_use_from_song(song):
    return tuple(song.visible_tracks) + tuple(song.return_tracks)


class OldSpecialMixerComponent(MixerComponentBase):


	num_label_segments = 4

	def __init__(self, *a, **k):
		debug('OldSpec k:', k)
		super(OldSpecialMixerComponent, self).__init__(*a, **k)
		self._pan_send_index = 0
		self._pan_send_controls = None
		self._pan_send_names_display = None
		self._pan_send_values_display = None
		self._pan_send_graphics_display = None
		self._pan_send_toggle_skip = False
		self._selected_track_data_sources = map(DisplayDataSource, ('',) * self.num_label_segments)
		self._selected_track_data_sources[0].set_display_string('Track Selection:')
		self._selected_track_name_data_source = self._selected_track_data_sources[1]
		self._on_selected_track_changed.subject = self.song.view
		self._update_selected_track_name()
	

	def tracks_to_use(self):
		return tracks_to_use_from_song(self.song)
	

	def _create_strip(self):
		return OldSpecialChanStripComponent()
	

	def set_pan_send_toggle(self, toggle):
		"""
		The pan_send_toggle cycles through the different pan, or send
		modes changing the bejhaviour of the pan_send display and
		controls.
		"""
		self._pan_send_toggle = toggle
		self._on_pan_send_value.subject = toggle
		self._pan_send_toggle_skip = True
	

	def set_selected_values_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_data_sources(index) for index in xrange(8) ]
			display.set_data_sources(sources)
	

	def set_selected_graphics_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_graphic_sources(index) for index in xrange(8) ]
			display.set_data_sources(sources)
	

	def set_selected_names_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_name_sources(index) for index in xrange(8) ]
			display.set_data_sources(sources)
	

	def set_selected_track_name_display(self, display):
		if display:
			display.set_data_sources(self._selected_track_data_sources)
	

	def set_track_select_buttons(self, buttons):
		for strip, button in map(None, self._channel_strips, buttons or []):
			if button:
				button.set_on_off_values('Option.Selected', 'Option.Unselected')
			strip.set_select_button(button)
	

	def set_solo_buttons(self, buttons):
		for strip, button in map(None, self._channel_strips, buttons or []):
			if button:
				button.set_on_off_values('Mixer.SoloOn', 'Mixer.SoloOff')
			strip.set_solo_button(button)
	

	def set_mute_buttons(self, buttons):
		for strip, button in map(None, self._channel_strips, buttons or []):
			if button:
				button.set_on_off_values('Mixer.MuteOff', 'Mixer.MuteOn')
			strip.set_mute_button(button)
	

	def set_track_names_display(self, display):
		if display:
			sources = [ strip.track_name_data_source() for strip in self._channel_strips ]
			display.set_data_sources(sources)
	

	def set_volume_names_display(self, display):
		self._set_parameter_names_display(display, 0)
	

	def set_volume_values_display(self, display):
		self._set_parameter_values_display(display, 0)
	

	def set_volume_graphics_display(self, display):
		self._set_parameter_graphics_display(display, 0)
	

	def set_volume_controls(self, controls):
		for strip, control in map(None, self._channel_strips, controls or []):
			strip.set_volume_control(control)
	

	def set_pan_send_names_display(self, display):
		self._normalize_pan_send_index()
		self._pan_send_names_display = display
		self._set_parameter_names_display(display, self._pan_send_index + 1)
	

	def set_pan_send_values_display(self, display):
		self._normalize_pan_send_index()
		self._pan_send_values_display = display
		self._set_parameter_values_display(display, self._pan_send_index + 1)
	

	def set_pan_send_graphics_display(self, display):
		self._normalize_pan_send_index()
		self._pan_send_graphics_display = display
		self._set_parameter_graphics_display(display, self._pan_send_index + 1)
	

	def set_pan_send_controls(self, controls):
		self.set_send_controls(None)
		self.set_pan_controls(None)
		self._pan_send_controls = controls
		self._normalize_pan_send_index()
		if self._pan_send_index == 0:
			self.set_pan_controls(controls)
		else:
			sends = self._pan_send_index - 1
			self.set_send_controls(map(lambda ctl: (None,) * sends + (ctl,), controls or []))
	

	def set_selected_controls(self, controls):
		strip = self.selected_strip()
		if controls:
			strip.set_volume_control(controls[0])
			strip.set_pan_control(controls[1])
			strip.set_send_controls(controls[2:])
		else:
			strip.set_volume_control(None)
			strip.set_pan_control(None)
			strip.set_send_controls(tuple())
	

	def on_track_list_changed(self):
		super(OldSpecialMixerComponent, self).on_track_list_changed()
		self._update_pan_sends()
	

	def set_pan_controls(self, controls):
		for strip, control in map(None, self._channel_strips, controls or []):
			strip.set_pan_control(control)
	

	def set_send_controls(self, controls):
		for strip, control in map(None, self._channel_strips, controls or []):
			strip.set_send_controls(control)
	

	def _set_parameter_names_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_name_sources(parameter) for strip in self._channel_strips ]
			display.set_data_sources(sources)
	

	def _set_parameter_values_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_data_sources(parameter) for strip in self._channel_strips ]
			display.set_data_sources(sources)
	

	def _set_parameter_graphics_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_graphic_sources(parameter) for strip in self._channel_strips ]
			display.set_data_sources(sources)
	

	@listens('value')
	def _on_pan_send_value(self, value):
		if not self._pan_send_toggle_skip and self.is_enabled() and (value or not self._pan_send_toggle.is_momentary()):
			self._pan_send_index += 1
			self._update_pan_sends()
		self._pan_send_toggle_skip = False
	

	def _update_pan_sends(self):
		self.set_pan_send_controls(self._pan_send_controls)
		self.set_pan_send_names_display(self._pan_send_names_display)
		self.set_pan_send_graphics_display(self._pan_send_graphics_display)
	

	def _normalize_pan_send_index(self):
		if len(self.song.tracks) == 0 or self._pan_send_index > len(self.song.tracks[0].mixer_device.sends):
			self._pan_send_index = 0
	

	def _reassign_tracks(self):
		tracks = self.tracks_to_use()
		returns = self.song.return_tracks
		num_empty_tracks = max(0, len(self._channel_strips) + self._track_offset - len(tracks))
		num_visible_tracks = max(0, len(tracks) - len(returns) - self._track_offset)
		num_visible_returns = len(self._channel_strips) - num_empty_tracks - num_visible_tracks
		for index in range(len(self._channel_strips)):
			track_index = self._track_offset + index
			if len(tracks) > track_index:
				track = tracks[track_index]
				if tracks[track_index] not in returns:
					self._channel_strips[index].set_track(track)
				else:
					self._channel_strips[index + num_empty_tracks].set_track(track)
			else:
				self._channel_strips[index - num_visible_returns].set_track(None)
	

	@listens('selected_track.name')
	def _on_selected_track_changed(self):
		self._update_selected_track_name()
	

	def _update_selected_track_name(self):
		selected = self.song.view.selected_track
		self._selected_track_name_data_source.set_display_string(selected.name)
	


TRACK_FOLD_DELAY = 0.5
TRACK_PARAMETER_NAMES = ('Volume', 'Pan', 'Send A', 'Send B', 'Send C', 'Send D', 'Send E', 'Send F', 'Send G', 'Send H', 'Send I', 'Send J', 'Send K', 'Send L')

def param_value_to_graphic(param, graphic):
	if param != None:
		param_range = param.max - param.min
		graph_range = len(graphic) - 1
		value = int((param.value - param.min) / param_range * graph_range)
		graphic_display_string = graphic[value]
	else:
		graphic_display_string = ' '
	return graphic_display_string


class OldSpecialChanStripComponent(OldChannelStripComponent, Messenger):


	def __init__(self, *a, **k):
		super(OldSpecialChanStripComponent, self).__init__(*a, **k)
		self.empty_color = 'Option.Unused'
		self._invert_mute_feedback = True
		self._duplicate_button = None
		self._selector_button = None
		self._delete_handler = None
		self._track_parameter_name_sources = [ DisplayDataSource(' ') for _ in xrange(14) ]
		self._track_parameter_data_sources = [ DisplayDataSource(' ') for _ in xrange(14) ]
		self._track_parameter_graphic_sources = [ DisplayDataSource(' ') for _ in xrange(14) ]
		self._on_return_tracks_changed.subject = self.song
		self._on_selected_track_changed.subject = self.song.view
		#self._fold_task = self._tasks.add(Task.sequence(Task.wait(TRACK_FOLD_DELAY), Task.run(self._do_fold_track))).kill()
		self._cue_volume_slot = self.register_disconnectable(ParameterSlot())
		self._track_state = self.register_disconnectable(TrackArmState())
		self._on_arm_state_changed.subject = self._track_state
	

	def set_delete_handler(self, delete_handler):
		self._delete_handler = delete_handler
	

	def set_volume_control(self, control):
		if control:
			control.mapping_sensitivity = CONTINUOUS_MAPPING_SENSITIVITY
		super(OldSpecialChanStripComponent, self).set_volume_control(control)
	

	def set_pan_control(self, control):
		if control:
			control.mapping_sensitivity = CONTINUOUS_MAPPING_SENSITIVITY
		super(OldSpecialChanStripComponent, self).set_pan_control(control)
	

	def set_send_controls(self, controls):
		if controls != None:
			for control in controls:
				if control:
					control.mapping_sensitivity = CONTINUOUS_MAPPING_SENSITIVITY

		super(OldSpecialChanStripComponent, self).set_send_controls(controls)
	

	def set_cue_volume_control(self, control):
		if control:
			control.mapping_sensitivity = CONTINUOUS_MAPPING_SENSITIVITY
		self._cue_volume_slot.control = control
	

	def set_duplicate_button(self, duplicate_button):
		self._duplicate_button = duplicate_button
	

	def set_selector_button(self, selector_button):
		self._selector_button = selector_button
	

	def track_parameter_data_sources(self, index):
		return self._track_parameter_data_sources[index]
	

	def track_parameter_graphic_sources(self, index):
		return self._track_parameter_graphic_sources[index]
	

	def track_parameter_name_sources(self, index):
		return self._track_parameter_name_sources[index]
	

	def get_track(self):
		return self._track
	

	def set_track(self, track):
		self._track_state.set_track(track)
		super(OldSpecialChanStripComponent, self).set_track(track)
		self._update_track_listeners()
		self._update_parameter_name_sources()
		self._update_parameter_values()
	

	@listens('arm')
	def _on_arm_state_changed(self):
		if self.is_enabled() and self._track:
			self._update_track_button()
	

	@listens('return_tracks')
	def _on_return_tracks_changed(self):
		self._update_track_listeners()
		self._update_parameter_name_sources()
		self._update_parameter_values()
	

	@listens('selected_track')
	def _on_selected_track_changed(self):
		self.on_selected_track_changed()
	

	def on_selected_track_changed(self):
		self._update_track_listeners()
		self._update_track_name_data_source()
		self._update_track_button()
	

	def _update_track_button(self):
		if self.is_enabled() and self._select_button != None:
			if self._track == None:
				self._select_button.set_light(self.empty_color)
			elif self._track.can_be_armed and (self._track.arm or self._track.implicit_arm):
				if self._track == self.song.view.selected_track:
					self._select_button.set_light('Mixer.ArmSelected')
				else:
					self._select_button.set_light('Mixer.ArmUnselected')
			elif self._track == self.song.view.selected_track:
				self._select_button.turn_on()
			else:
				self._select_button.turn_off()
	

	def _update_track_listeners(self):
		mixer = self._track.mixer_device if self._track else None
		sends = mixer.sends if mixer and self._track != self.song.master_track else ()
		cue_volume = mixer.cue_volume if self._track == self.song.master_track else None
		self._cue_volume_slot.parameter = cue_volume
		self._on_volume_value_changed.subject = mixer and mixer.volume
		self._on_panning_value_changed.subject = mixer and mixer.panning
		self._on_sends_value_changed.replace_subjects(sends)
	

	def _update_parameter_name_sources(self):
		num_params = self._track and len(self._track.mixer_device.sends) + 2
		for index, source in enumerate(self._track_parameter_name_sources):
			if index < num_params:
				source.set_display_string(TRACK_PARAMETER_NAMES[index])
			else:
				source.set_display_string(' ')
	

	def _update_track_name_data_source(self):
		if self._track_name_data_source:
			if self._track != None:
				selected = self._track == self.song.view.selected_track
				prefix = CHAR_SELECT if selected else ''
				self._track_name_data_source.set_display_string(prefix + self._track.name)
			else:
				self._track_name_data_source.set_display_string(' ')
	

	@property
	def _is_deleting(self):
		return self._delete_handler and self._delete_handler.is_deleting
	

	def _select_value(self, value):
		if self.is_enabled() and self._track:
			if value and self._duplicate_button and self._duplicate_button.is_pressed():
				self._do_duplicate_track(self._track)
			elif value and self._is_deleting:
				self._do_delete_track(self._track)
			elif value and self._shift_pressed:
				self._do_toggle_arm(exclusive=False)
			else:
				self._select_value_without_modifier(value)
	

	def _mute_value(self, value):
		if self.is_enabled() and self._track != None:
			if not self._mute_button.is_momentary() or value != 0:
				if self._is_deleting:
					self._delete_handler.delete_clip_envelope(self._track.mixer_device.track_activator)
				else:
					super(OldSpecialChanStripComponent, self)._mute_value(value)
	

	def _do_toggle_arm(self, exclusive = False):
		if self._track.can_be_armed:
			self._track.arm = not self._track.arm
			if exclusive and (self._track.implicit_arm or self._track.arm):
				for track in self.song.tracks:
					if track.can_be_armed and track != self._track:
						track.arm = False
	

	def _select_value_without_modifier(self, value):
		if value and self.song.view.selected_track == self._track:
			self._do_toggle_arm(exclusive=self.song.exclusive_arm)
		else:
			super(OldSpecialChanStripComponent, self)._select_value(value)
		if value and self._track.is_foldable and self._select_button.is_momentary():
			self._fold_task.restart()
		else:
			self._fold_task.kill()
	

	def _do_delete_track(self, track):
		try:
			track_index = list(self.song.tracks).index(track)
			name = track.name
			self.song.delete_track(track_index)
			self.show_notification(MessageBoxText.DELETE_TRACK % name)
		except RuntimeError:
			self.expect_dialog(MessageBoxText.TRACK_DELETE_FAILED)
		except ValueError:
			pass
	

	def _do_duplicate_track(self, track):
		try:
			track_index = list(self.song.tracks).index(track)
			self.song.duplicate_track(track_index)
			self.show_notification(MessageBoxText.DUPLICATE_TRACK % track.name)
		except Live.Base.LimitationError:
			self.expect_dialog(MessageBoxText.TRACK_LIMIT_REACHED)
		except RuntimeError:
			self.expect_dialog(MessageBoxText.TRACK_DUPLICATION_FAILED)
		except ValueError:
			pass
	

	def _do_select_track(self, track):
		pass
	

	def _do_fold_track(self):
		if self.is_enabled() and self._track != None and self._track.is_foldable:
			self._track.fold_state = not self._track.fold_state
	

	@listens('value')
	def _on_volume_value_changed(self):
		if self.is_enabled() and self._track != None:
			param = self._track.mixer_device.volume
			text = self._track_parameter_data_sources[0]
			graph = self._track_parameter_graphic_sources[0]
			text.set_display_string(str(param))
			graph.set_display_string(param_value_to_graphic(param, GRAPH_VOL))
	

	@listens('value')
	def _on_panning_value_changed(self):
		if self.is_enabled() and self._track != None:
			param = self._track.mixer_device.panning
			text = self._track_parameter_data_sources[1]
			graph = self._track_parameter_graphic_sources[1]
			text.set_display_string(str(param))
			graph.set_display_string(param_value_to_graphic(param, GRAPH_PAN))
	

	@listens_group('value')
	def _on_sends_value_changed(self, send):
		if self.is_enabled() and self._track != None and self._track != self.song.master_track and send in list(self._track.mixer_device.sends):
			index = list(self._track.mixer_device.sends).index(send) + 2
			text = self._track_parameter_data_sources[index]
			graph = self._track_parameter_graphic_sources[index]
			text.set_display_string(str(send))
			graph.set_display_string(param_value_to_graphic(send, GRAPH_VOL))
	

	def _update_parameter_values(self):
		for source in flatten(zip(self._track_parameter_data_sources, self._track_parameter_graphic_sources)):
			source.set_display_string(' ')

		self._on_volume_value_changed()
		self._on_panning_value_changed()
		if self._track and self._track != self.song.master_track:
			map(self._on_sends_value_changed, self._track.mixer_device.sends)
	


class AumPushValueComponent(ValueComponent):


	@listens('value')
	def _on_encoder_value(self, value):
		value = self.view_transform(getattr(self._subject, self._property_name)) + value * self.encoder_factor
		setattr(self._subject, self._property_name, self.model_transform(value))
	


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
	

	#@listens('touch_value')
	@listens('value')
	def _on_send_a_button_value(self, value):
		value and self.reset_send(0)
	

	#@listens('touch_value')
	@listens('value')
	def _on_send_b_button_value(self, value):
		value and self.reset_send(1)
	

	#@listens('touch_value')
	@listens('value')
	def _on_send_c_button_value(self, value):
		value and self.reset_send(2)
	

	#@listens('touch_value')
	@listens('value')
	def _on_send_d_button_value(self, value):
		value and self.reset_send(3)
	

	def tracks_to_use(self):
		return self._song.tracks
	

	def returns_to_use(self):
		return self._song.return_tracks
	


class AumpushDeviceParameterComponent(DeviceParameterComponent):


	def _release_parameters(self):
		for encoder in self._parameter_controls or []:
			not encoder==None and encoder.release_parameter()
	


class AumPushTrollComponent(CompoundComponent):


	def __init__(self, script, device_component, *a, **k):
		super(AumPushTrollComponent, self).__init__(*a, **k)
		self._script = script
		self._device_component = device_component

        #self._session_ring = SessionRingComponent(num_tracks=16, num_scenes=1, tracks_to_use=partial(tracks_to_use_from_song, self.song))

		self._mixer = TrollMixerComponent(num_tracks = 16, num_returns = 4, device_component = self._device_component)
		self._mixer._sends_layer = LayerMode(self._mixer, Layer())
		self._mixer._left_layer = LayerMode(self._mixer, Layer())
		self._mixer._right_layer = LayerMode(self._mixer, Layer())
		self._mixer._master_layer = LayerMode(self._mixer, Layer())

		self._device_selector = AumPushDeviceSelectorComponent(self._script)
		self._device_selector.layer = Layer()

		self._send_reset = AumPushResetSendsComponent(self._script)
		self._send_reset.layer = Layer()

		self._device1 = AumpushDeviceParameterComponent(parameter_provider=self._device_component)
		self._device2 = AumpushDeviceParameterComponent(parameter_provider=self._device_component)
		self.register_component(self._device1)
		self.register_component(self._device2)

		self._trollmodes = ModesComponent(name = 'TrollMode')  # is_enabled = False)
		self.register_component(self._trollmodes)

		#self._trollmodes.set_enabled(False)
		
	

	def set_enabled(self, enabled = True):
		super(AumPushTrollComponent, self).set_enabled(enabled)
		if not enabled:
			self._script.schedule_message(1, self._script._select_note_mode)
	

	def _find_device1(self):
		if self._device1:
			if len(self.song.return_tracks) > 0:
				if len(self.song.return_tracks[0].devices) > 0:
					#if self._device1.parameter_provider._locked_to_device:
					#	self._device1.parameter_provider.set_lock_to_device(False, self._device1.parameter_provider._device)
					self._device1.parameter_provider.set_device(self.song.return_tracks[0].devices[0])
	

	def _find_device2(self):
		if self._device2:
			if len(self.song.return_tracks) > 1:
				if len(self.song.return_tracks[1].devices) > 0:
					#if self._device2.parameter_provider._locked_to_device:
					#	self._device2.parameter_provider.set_lock_to_device(False, self._device2.parameter_provider._device)
					self._device2.parameter_provider.set_device(self.song.return_tracks[1].devices[0])
	


class AumPushDeviceSelectorComponent(DeviceSelectorComponent):


	def __init__(self, *a, **k):
		super(AumPushDeviceSelectorComponent, self).__init__(*a, **k)
	


class AumPushSpecialMixerComponent(OldSpecialMixerComponent):


	def _create_strip(self):
		return AumPushSpecialChanStripComponent()
	

	def set_crossfader_control(self, control):
		if self._crossfader_control != None:
			self._crossfader_control.release_parameter()
		self._crossfader_control = control
		self.update()
	


class TrollMixerComponent(AumPushSpecialMixerComponent):


	def __init__(self, device_component, *a, **k):
		super(TrollMixerComponent, self).__init__(*a, **k)
		self._input_name_sources = [ DisplayDataSource('In1'),  DisplayDataSource('In2'), DisplayDataSource('In3'), DisplayDataSource('In4')]
		self._parameter_provider = device_component
		self._input_device = DeviceParameterComponent(self._parameter_provider)
		self.register_component(self._input_device)
	

	def tracks_to_use(self):
		return tuple(self._song.visible_tracks)
	

	def set_track_grid(self, buttons):
		
		BUTTON_COLORS = ['Scales.Selected', 'Scales.Chromatic', 'DrumGroup.PadMutedSelected', 'Scales.Unselected']
		if buttons:
			for button, _ in buttons.iterbuttons():
				button.use_default_message()
				button.set_enabled(True)
				button.set_on_off_values('Scales.Diatonic', BUTTON_COLORS[int(index/4)])
				self.channel_strip(index).set_select_button(button)
		#super(TrollMixerComponent, self).set_track_select_buttons(buttons)
	

	def set_right_select_buttons(self, buttons):
		for strip, button in map(None, self._channel_strips[8:12], buttons or []):
			strip.set_select_button(button)
	

	def set_return_select_buttons(self, buttons):
		for strip, button in map(None, self._return_strips, buttons or []):
			strip.set_select_button(button)
	

	def _set_parameter_names_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_name_sources(parameter) for strip in self._channel_strips ][:8]
			display.set_data_sources(sources)
	

	def _set_parameter_values_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_data_sources(parameter) for strip in self._channel_strips ][:8]
			display.set_data_sources(sources)
	

	def _set_parameter_graphics_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_graphic_sources(parameter) for strip in self._channel_strips ][:8]
			display.set_data_sources(sources)
	

	def set_right_volume_controls(self, controls):
		for strip, control in map(None, self._channel_strips[8:12], controls or []):
			strip and strip.set_volume_control(control)
	

	def set_input_volume_controls(self, controls):
		if controls:
			self._input_device.set_parameter_controls( [control for control, _ in controls.iterbuttons()] )
		else:
			self._input_device.set_parameter_controls(None)
	

	def set_right_track_names_display(self, display):
		if display:
			sources = [ strip.track_name_data_source() for strip in self._channel_strips[8:12] ] + self._input_device._parameter_name_data_sources[:4]
			display.set_data_sources(sources)
	

	def set_right_volume_values_display(self, display):
		self.set_right_parameter_values_display(display, 0)
	

	def set_right_volume_graphics_display(self, display):
		self.set_right_parameter_graphics_display(display, 0)
	

	def set_right_parameter_values_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_data_sources(parameter) for strip in self._channel_strips ][8:12] + self._input_device._parameter_value_data_sources[:4]
			display.set_data_sources(sources)
	

	def set_right_parameter_graphics_display(self, display, parameter):
		if display:
			sources = [ strip.track_parameter_graphic_sources(parameter) for strip in self._channel_strips ][8:12] + self._input_device._parameter_graphic_data_sources[:4]
			display.set_data_sources(sources)
	

	def set_track_names_display(self, display):
		if display:
			sources = [ self.channel_strip(index).track_name_data_source() for index in range(8) ]
			display.set_data_sources(sources)
	

	def set_encoder_names_display(self, display):
		if display:
			sources = []
			for index in range(4):
				sources.append(self.return_strip(index).track_name_data_source())
			for index in range(4):
				sources.append(self.channel_strip(index+12).track_parameter_name_sources(0))
			display.set_data_sources(sources)
	

	def set_encoder_values_display(self, display):
		if display:
			sources = []
			for index in range(4):
				sources.append(self.return_strip(index).track_parameter_data_sources(0))
			for index in range(4):
				sources.append(self.channel_strip(index+12).track_parameter_data_sources(0))
			display.set_data_sources(sources)
	

	def set_selected_names_display(self, display):
		pass
	

	def set_selected_controls(self, controls):
		strip = self.selected_strip()
		if controls:
			strip.set_send_controls(controls)
		else:
			strip.set_send_controls(tuple())
	

	def set_return_controls(self, controls):
		for strip, control in map(None, self._return_strips, controls or []):
			#debug('strip and control:', strip, control)
			strip.set_volume_control(control)
	

	def set_send_return_names_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_name_sources(index) for index in xrange(2,6) ]
			for index in range(4):
				sources.append(self.return_strip(index).track_name_data_source())
			display.set_data_sources(sources)
	

	def set_send_return_values_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_data_sources(index) for index in xrange(2,6) ]
			for index in range(4):
				sources.append(self.return_strip(index).track_parameter_graphic_sources(0))
			display.set_data_sources(sources)
	

	def set_send_return_graphics_display(self, display):
		if display:
			sources = [ self.selected_strip().track_parameter_graphic_sources(index) for index in xrange(2,6) ]
			for index in range(4):
				sources.append(self.return_strip(index).track_parameter_data_sources(0))
			display.set_data_sources(sources)
	

	def _reassign_tracks(self):
		#tracks = self.tracks_to_use()
		#returns = self.song.return_tracks
		#num_empty_tracks = max(0, len(self._channel_strips) + self._track_offset - len(tracks))
		#num_visible_tracks = max(0, len(tracks) - len(returns) - self._track_offset)
		#num_visible_returns = len(self._channel_strips) - num_empty_tracks - num_visible_tracks
		#for index in range(len(self._channel_strips)):
		#	track_index = self._track_offset + index
		#	if len(tracks) > track_index:
		#		track = tracks[track_index]
		#		if tracks[track_index] not in returns:
		#			self._channel_strips[index].set_track(track)
		#		else:
		#			self._channel_strips[index + num_empty_tracks].set_track(track)
		#	else:
		#		self._channel_strips[index - num_visible_returns].set_track(None)

		#for index in range(len(self._return_strips)):
		#	if len(returns) > index:
		#		self._return_strips[index].set_track(returns[index])
		#	else:
		#		self._return_strips[index].set_track(None)
		MixerComponentBase._reassign_tracks(self)
	

	def find_inputs(self):
		found_device = None
		tracks = self.song.tracks
		for track in tracks:
			if track.name == 'Inputs':
				for device in track.devices:
					if bool(device.can_have_chains) and device.name.endswith('Inputs'):
						found_device = device
		self._parameter_provider.set_device(found_device)
	

	def find_perc_crossfader(self):
		found_parameter = None
		tracks = self.song.tracks
		for track in tracks:
			if track.name == 'Perc':
				for device in track.devices:
					if bool(device.can_have_chains) and device.name == 'Perc':
						for parameter in device.parameters:
							if parameter.name == 'XFade':
								found_parameter = parameter
		return found_parameter
	

	"""this method is used to find the devices the alt controls will latch to"""
	def _find_devices(self):
		if self._device1:
			if len(self.song.return_tracks) > 0:
				if len(self.song.return_tracks[0].devices) > 0:
					if self._device1._locked_to_device:
						self._device1.set_lock_to_device(False, self._device1._device)
					self._device1.set_lock_to_device(True, self.song.return_tracks[0].devices[0])
		if self._device2:
			if len(self.song.return_tracks) > 1:
				if len(self.song.return_tracks[1].devices) > 0:
					if self._device2._locked_to_device:
						self._device2.set_lock_to_device(False, self._device2._device)
					self._device2.set_lock_to_device(True, self.song.return_tracks[1].devices[0])
	


class AumPushSpecialChanStripComponent(OldSpecialChanStripComponent):


	def __init__(self, *a, **k):
		super(AumPushSpecialChanStripComponent, self).__init__(*a, **k)
		#self._on_color = 
	

	def _arm_value(self, value):
		assert(not self._arm_button != None)
		assert(value in range(128))
		if self.is_enabled():
			if self._track != None and self._track.can_be_armed:
				arm_exclusive = self.song.exclusive_arm != self._shift_pressed
				new_value = not self._track.arm
				respect_multi_selection = self._track.is_part_of_selection
				for track in self.song.tracks:
					if track.can_be_armed:
						if track == self._track or respect_multi_selection and track.is_part_of_selection:
							track.arm = new_value
						#elif arm_exclusive and track.arm:
						#	track.arm = False
	

	def _select_value(self, value):
		if self.is_enabled() and self._track and value:
			if self._duplicate_button and self._duplicate_button.is_pressed():
				self._do_duplicate_track(self._track)
			elif hasattr(self, '._delete_button') and self._delete_button.is_pressed():
				self._do_delete_track(self._track)
			elif self._shift_pressed:
				if self._track.can_be_armed:
					self._track.arm = not self._track.arm
			else:
				if self._track.can_be_armed and self.song.view.selected_track == self._track:
					self._track.arm = not self._track.arm
				else:
					super(OldSpecialChanStripComponent, self)._select_value(value)
				#if self._track.can_be_armed and (self._track.implicit_arm or self._track.arm):
				#	for track in self.song.tracks:
				#		if track.can_be_armed and track != self._track:
				#			track.arm = False

			if self._selector_button and self._selector_button.is_pressed():
				self._do_select_track(self._track)
				if not self._shift_pressed:
					if self._track.is_foldable and self._select_button.is_momentary():
						self._fold_task.restart()
					else:
						self._fold_task.kill()
	

	def set_select_button(self, button):
		if button != self._select_button:
			if self._select_button != None:
				self._select_button.remove_value_listener(self._select_value)
				self._select_button.reset()
			self._select_button = button
			self._select_button != None and self._select_button.add_value_listener(self._select_value)
		self.update()
	

	def _update_track_listeners(self):
		mixer = self._track.mixer_device if self._track else None
		sends = mixer.sends if mixer and self._track != self.song.master_track else ()
		cue_volume = mixer.crossfader if self._track == self.song.master_track else None
		self._cue_volume_slot.parameter = cue_volume
		self._on_volume_value_changed.subject = mixer and mixer.volume
		self._on_panning_value_changed.subject = mixer and mixer.panning
		self._on_sends_value_changed.replace_subjects(sends)
	

	"""def _update_parameter_name_sources(self):
		num_params = self._track and len(self._track.mixer_device.sends) + 2
		for index, source in enumerate(self._track_parameter_name_sources):
			if index < num_params:
				source.set_display_string(TRACK_PARAMETER_NAMES[index])
			else:
				source.set_display_string(' ')"""
	

	def _update_track_button(self):
		if self.is_enabled() and self._select_button != None:
			if self._track == None:
				self._select_button.set_light(self.empty_color)
			#elif self._track.can_be_armed and (self._track.arm or self._track.implicit_arm):
			#	if self._track == self.song.view.selected_track:
			#		self._select_button.set_light('Mixer.ArmSelected')
			#	else:
			#		self._select_button.set_light('Mixer.ArmUnselected')
			elif self._track == self.song.view.selected_track:
				self._select_button.turn_on()
			else:
				self._select_button.turn_off()
	


class AumPushInstrumentComponent(InstrumentComponent):


	def _override_channel(self):
		return -1
	

	def _setup_instrument_mode(self):
		if self.is_enabled() and self._matrix:
			self._matrix.reset()
			pattern = self._pattern
			max_j = self._matrix.width() - 1
			for button, (i, j) in ifilter(first, self._matrix.iterbuttons()):
				if not button == None:
					profile = 'default' if self._takeover_pads else 'instrument'
					button.sensitivity_profile = profile
					note_info = pattern.note(i, max_j - j)
					if note_info.index != None:
						button.set_on_off_values('Instrument.NoteAction', 'Instrument.' + note_info.color)
						button.turn_off()
						button.set_enabled(self._takeover_pads)
						if override_channel > -1:
							button.set_channel(override_channel)
						else:
							button.set_channel(note_info.channel)
						button.set_identifier(note_info.index)
					else:
						button.set_channel(NON_FEEDBACK_CHANNEL)
						button.set_light('Instrument.' + note_info.color)
						button.set_enabled(True)
	

	def on_selected_track_changed(self, *a, **k):
		super(AumPushInstrumentComponent, self).on_selected_track_changed(*a, **k)
		self.update()
	


class AumPushDeviceNavigationComponent(DeviceNavigationComponent):


	def __init__(self, script, *a, **k):
		self._script = script
		super(AumPushDeviceNavigationComponent, self).__init__(*a, **k)
	

	@listens('selected_device')
	def _on_selected_device_changed(self):
		selected_device = self._selected_track.view.selected_device
		#if selected_device:
		#	self._script.log_message('selected_device=' + str(selected_device.name))
		if selected_device == None:
			self._set_current_node(self._make_exit_node())
			return
		is_just_default_child_selection = False
		if self._current_node and self._current_node.children:
			selected = self.selected_object
			#self._script.log_message('selected=' + str(selected))
			if isinstance(selected, Live.DrumPad.DrumPad) and find_if(lambda pad: pad.chains and pad.chains[0].devices and pad.chains[0].devices[0] == selected_device, selected.canonical_parent.drum_pads):
				is_just_default_child_selection = True
			if isinstance(selected, Live.Chain.Chain) and selected_device and selected_device.canonical_parent == selected and selected.devices[0] == selected_device:
				is_just_default_child_selection = True
		if not is_just_default_child_selection:
			if selected_device:
				target = selected_device.canonical_parent
				self._script.log_message('target=' + str(target))
				if (not self._current_node or self._current_node.object != target): 
					node = self._make_navigation_node(target, is_entering=False)
					#self._script.log_message('node=' + str(node))
					self._set_current_node(node)
	


class AumPushMonoInstrumentComponent(MonoInstrumentComponent):


	def _offset_value(self, offset):
		super(AumPushMonoInstrumentComponent, self)._offset_value(offset)
		self._keypad._on_keypad_matrix_value.subject and self._keypad.set_keypad_matrix(self._keypad._on_keypad_matrix_value.subject)
	

	def _vertical_offset_value(self, offset):
		super(AumPushMonoInstrumentComponent, self)._vertical_offset_value(offset)
		self._keypad._on_keypad_matrix_value.subject and self._keypad.set_keypad_matrix(self._keypad._on_keypad_matrix_value.subject)
	

	def _scale_offset_value(self, offset):
		super(AumPushMonoInstrumentComponent, self)._scale_offset_value(offset)
		self._keypad._on_keypad_matrix_value.subject and self._keypad.set_keypad_matrix(self._keypad._on_keypad_matrix_value.subject)
	

	def _split_mode_value(self, mode):
		super(AumPushMonoInstrumentComponent, self)._split_mode_value(mode)
		self._keypad._on_keypad_matrix_value.subject and self._keypad.set_keypad_matrix(self._keypad._on_keypad_matrix_value.subject)
	

	def _sequencer_mode_value(self, mode):
		super(AumPushMonoInstrumentComponent, self)._sequencer_mode_value(mode)
		self._keypad._on_keypad_matrix_value.subject and self._keypad.set_keypad_matrix(self._keypad._on_keypad_matrix_value.subject)
	


class AumPush(Push):


	def __init__(self, c_instance):
		self._monomod_version = 'b996'
		self._cntrlr_version = 'b996'
		self._host_name = 'AumPush'
		self._color_type = 'Push'
		self._auto_arm_calls = 0
		#self.matrix_rows_raw = None
		self.log_message = logger.warning
		super(AumPush, self).__init__(c_instance)
		with self.component_guard():
			self._device_component._alt_pressed = False
			#self._device_parameter_component.add_device_listener(self._on_new_device_set)
			self.set_feedback_channels(FEEDBACK_CHANNELS)
			self._hack_stuff()
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
		self.schedule_message(5, self.status_check)
	

	def status_check(self):
		debug('status check:')
		debug('preferences_key:', self.preferences_key)
		debug('preferences:', self.preferences)
	

	def _create_pad_sensitivity_update(self):
		self._skin = merge_skins(self._skin, Skin(AumPushColors))
		super(AumPush, self)._create_pad_sensitivity_update()
	

	"""def _init_instrument(self):
		super(AumPush, self)._init_instrument()
		self._instrument._instrument._setup_instrument_mode = self._make_setup_instrument_mode(self._instrument._instrument)
	"""

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
	

	def _get_current_instrument_channel(self):
		#self.log_message('_get_current_instrument_channel channel')
		cur_track = self._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if len(cur_chan) == 0:
				self.set_feedback_channels(FEEDBACK_CHANNELS)
				return -1
			elif cur_chan in CHANNEL_TEXT:
				chan = CHANNEL_TEXT.index(cur_chan)
				self.set_feedback_channels([chan])
				return chan
			else:
				self.set_feedback_channels(FEEDBACK_CHANNELS)
				return -1
		else:
			self.set_feedback_channels(FEEDBACK_CHANNELS)
			return -1
	

	def _setup_monoinstrument(self):
		debug('matrix is:', self.elements.matrix)
		#self._instrument_matrix = ButtonMatrixElement(name = 'InstrumentMatrix', rows = self.elements.matrix_rows_raw, song = self.song, register_control = self._register_control)
		#self._instrument_matrix = self.matrix

		self._monoinstrument = AumPushMonoInstrumentComponent(self, self._skin, grid_resolution = self._grid_resolution, scalenames = AUMPUSH_SCALENAMES) # modhandler = self.modhandler )
		self._monoinstrument.name = 'InstrumentModes'
		self._monoinstrument.layer = Layer(priority = 5, shift_button = self.elements.scale_presets_button,
									octave_up_button = self.elements.octave_up_button,
									octave_down_button = self.elements.octave_down_button)
		self._monoinstrument.keypad_shift_layer = AddLayerMode(self._monoinstrument, Layer(priority = 5, 
									scale_up_button = self.elements.track_state_buttons_raw[7], 
									scale_down_button = self.elements.track_state_buttons_raw[6],
									offset_up_button = self.elements.track_state_buttons_raw[5],
									offset_down_button = self.elements.track_state_buttons_raw[4],
									vertical_offset_up_button = self.elements.track_state_buttons_raw[3],
									vertical_offset_down_button = self.elements.track_state_buttons_raw[2],))
		self._monoinstrument._keypad.main_layer = LayerMode(self._monoinstrument._keypad, Layer(priority = 5, 
									keypad_matrix = self.elements.matrix))
		self._monoinstrument._keypad.shift_layer = LayerMode(self._monoinstrument._keypad, Layer(priority = 5,
									keypad_matrix = self.elements.matrix))
		self._monoinstrument._keypad.sequencer_layer = LayerMode(self._monoinstrument._keypad, Layer(priority = 5, playhead = self.elements.playhead_element, keypad_matrix = self.elements.matrix.submatrix[:, 4:8], sequencer_matrix = self.elements.matrix.submatrix[:, :4]))
		self._monoinstrument._keypad.sequencer_shift_layer = LayerMode(self._monoinstrument._keypad, Layer(priority = 5, playhead = self.elements.playhead_element, keypad_matrix = self.elements.matrix.submatrix[:, 4:8], sequencer_matrix = self.elements.matrix.submatrix[:, :4]))
		self._monoinstrument.set_enabled(False)

		self._monoinstrument._main_modes = ModesComponent()
		self._monoinstrument._main_modes.add_mode('disabled', [])
		self._monoinstrument._main_modes.add_mode('keypad', [self._monoinstrument._keypad.main_layer])
		self._monoinstrument._main_modes.add_mode('keypad_shifted', [self._monoinstrument._keypad.shift_layer, self._monoinstrument.keypad_shift_layer])
		self._monoinstrument._main_modes.add_mode('keypad_sequencer_shifted', [self._monoinstrument._keypad.sequencer_shift_layer, self._monoinstrument.keypad_shift_layer])
		self._monoinstrument._main_modes.add_mode('keypad_sequencer', [self._monoinstrument._keypad.sequencer_layer])
		self._monoinstrument._main_modes.selected_mode = 'disabled'
		self._monoinstrument.register_component(self._monoinstrument._main_modes)
	

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
		self.modhandler.name = 'ModHandler'
		self.modhandler.layer = Layer( priority = 6, lock_button = self.elements.note_mode_button, grid = self.elements.matrix, shift_button = self.elements.shift_button, alt_button = self.elements.select_button, key_buttons = self.elements.track_state_buttons)
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
		#self._setup_monoinstrument()
		self._setup_mod()
		self._note_modes.add_mode('mod', [self.modhandler])
		#self._note_modes.add_mode('monoinstrument', [self._monoinstrument])
		self._note_modes.add_mode('looperhack', [self._audio_loop])
	

	def _init_device(self, *a, **k):
		super(AumPush, self)._init_device(*a, **k)
		self._device = self._device_component
		self._device_component._current_bank_details = self._make_current_bank_details(self._device_component)
		self.modhandler.set_device_component(self._device_component)
		self._on_new_device_set.subject = self._device_provider
		#self._device_navigation._on_selected_device_changed = self._make_on_selected_device_changed(self._device_navigation)
	

	def _with_select(self, button):
		return ComboElement(button, self.elements.select_button)
	

	def _setup_troll(self):
		debug('setup_troll')
		self._troll = AumPushTrollComponent(self, self._device_component)

		self._crossfader_strip = TouchStripControllerComponent()
		self._crossfader_strip.layer = Layer(touch_strip = self.elements.touch_strip_control)
		self._crossfader_strip.set_enabled(False)

		self._troll._mixer._master_strip.layer = Layer(priority = 6, select_button = self._with_select(self.elements.master_select_button))

		self._troll._mixer._sends_layer = LayerMode(self._troll._mixer, Layer(priority = 6, track_select_buttons = self.elements.select_buttons, right_select_buttons = self.elements.track_state_buttons.submatrix[:4, :], return_select_buttons = self.elements.track_state_buttons.submatrix[4:, :], selected_controls = self.elements.global_param_controls.submatrix[:4, :], send_return_names_display=self.elements.display_line1, send_return_values_display=self.elements.display_line2, send_return_graphics_display=self.elements.display_line3, return_controls = self.elements.global_param_controls.submatrix[4:, :])) #, 
		self._troll._mixer._left_layer = LayerMode(self._troll._mixer, Layer(priority = 6, track_select_buttons = self.elements.select_buttons, right_select_buttons = self.elements.track_state_buttons.submatrix[:4, :], return_select_buttons = self.elements.track_state_buttons.submatrix[4:, :], volume_controls = self.elements.global_param_controls, track_names_display=self.elements.display_line1, volume_values_display=self.elements.display_line2, volume_graphics_display=self.elements.display_line3))
		self._troll._mixer._right_layer = LayerMode(self._troll._mixer, Layer(priority = 6, track_select_buttons = self.elements.select_buttons, right_select_buttons = self.elements.track_state_buttons.submatrix[:4, :], return_select_buttons = self.elements.track_state_buttons.submatrix[4:, :], right_volume_controls = self.elements.global_param_controls.submatrix[:4, :], input_volume_controls = self.elements.global_param_controls.submatrix[4:, :], right_track_names_display=self.elements.display_line1, right_volume_values_display=self.elements.display_line2, right_volume_graphics_display=self.elements.display_line3))
		self._troll._mixer._device_layer = LayerMode(self._troll._mixer, Layer(priority = 6, track_select_buttons = self.elements.select_buttons, right_select_buttons = self.elements.track_state_buttons.submatrix[:4, :], return_select_buttons = self.elements.track_state_buttons.submatrix[4:, :], )) 

		#self._troll._send_reset._touch_layer = LayerMode(self._troll._send_reset, Layer(priority = 6, send_a_button = self._with_select(self._global_param_controls[4]), send_b_button = self._with_select(self._global_param_controls[5]), send_c_button = self._with_select(self._global_param_controls[6]), send_d_button = self._with_select(self._global_param_controls[7])))
		self._troll._send_reset.layer = Layer(priority = 6, send_a_button = self._with_select(self.elements.track_state_buttons_raw[4]), send_b_button = self._with_select(self.elements.track_state_buttons_raw[5]), send_c_button = self._with_select(self.elements.track_state_buttons_raw[6]), send_d_button = self._with_select(self.elements.track_state_buttons_raw[7]))

		self._troll._device_selector.layer = Layer(priority = 6, matrix = self.elements.matrix.submatrix[:, :4])

		self._troll._device1.layer = Layer(priority = 6, parameter_controls = self.elements.global_param_controls, name_display_line=self.elements.display_line1, value_display_line=self.elements.display_line2, graphic_display_line=ComboElement('display_line3', 'any_touch_button'))
		self._troll._device2.layer = Layer(priority = 6, parameter_controls = self.elements.global_param_controls, name_display_line=self.elements.display_line1, value_display_line=self.elements.display_line2, graphic_display_line=ComboElement('display_line3', 'any_touch_button'))

		static_modes = CompoundMode(self._troll._mixer, self._crossfader_strip, tuple([self._grab_crossfader, self._release_crossfader]), self._troll._device_selector, self._troll._send_reset)
		self._troll._trollmodes.add_mode('sends', [static_modes, self._troll._mixer._sends_layer])
		self._troll._trollmodes.add_mode('left', [static_modes, self._troll._mixer._left_layer])
		self._troll._trollmodes.add_mode('right', [static_modes, self._troll._mixer._right_layer, self._troll._mixer.find_inputs])
		self._troll._trollmodes.add_mode('device', [static_modes, self._troll._mixer._device_layer, self._device_parameter_component])
		self._troll._trollmodes.add_mode('fx1', [static_modes, self._troll._mixer._device_layer, self._troll._device1, self._troll._find_device1])
		self._troll._trollmodes.add_mode('fx2', [static_modes, self._troll._mixer._device_layer, self._troll._device2, self._troll._find_device2])
		self._troll._trollmodes.selected_mode = 'sends'
		self._troll._trollmodes.layer = Layer(priority = 6, sends_button = self.elements.side_buttons_raw[0], left_button = self.elements.side_buttons_raw[1], right_button = self.elements.side_buttons_raw[2], device_button = self.elements.side_buttons_raw[3], fx1_button = self.elements.side_buttons_raw[4], fx2_button = self.elements.side_buttons_raw[5])

		self._troll.set_enabled(False)
	

	def _hack_stuff(self):
		#self._stop_selected_strip.subject = self._with_select(self.elements.global_track_stop_button)
		#self._stop_selected_strip.subject = ComboElement('global_track_stop_button', modifier = 'select_button')

		#self._step_sequencer._drum_group._update_control_from_script = self._make_update_control_from_script(self._step_sequencer._drum_group)

		self.schedule_message(5, self._remove_pedal)
	

	def _create_main_modes_layer(self):
		debug('create_main_modes_layer')
		self._setup_troll()
		self._main_modes.add_mode('troll', [self._troll], behaviour = CancellableBehaviourWithRelease())
		return Layer(priority = 6, troll_button='master_select_button', volumes_button='vol_mix_mode_button', pan_sends_button='pan_send_mix_mode_button', track_button='single_track_mix_mode_button', clip_button='clip_mode_button', device_button='device_mode_button', browse_button='browse_mode_button', add_effect_right_button='create_device_button', add_effect_left_button=self._with_shift('create_device_button'), add_instrument_track_button='create_track_button')
	

	@listens('value')
	def _stop_selected_strip(self, value):
		debug('stop selected strip')
		track = self._mixer.selected_strip._track
		track and hasattr(track, 'stop_all_clips') and track.stop_all_clips()
	

	def _grab_crossfader(self):
		debug('grab crossfader')
		self._crossfader_strip.set_parameter(self.song.master_track.mixer_device.crossfader)
	

	def _release_crossfader(self):
		self._crossfader_strip.set_parameter(None)
	

	def _remove_pedal(self):

		#self._session_recording.layer = Layer(new_button=OptionalElement(self._new_button, self._settings['workflow'], False), scene_list_new_button=OptionalElement(self._new_button, self._settings[SETTING_WORKFLOW], True), record_button=self._record_button, automation_button=self._automation_button, new_scene_button=ComboElement(self._new_button, [self._shift_button]), re_enable_automation_button=ComboElement(self._automation_button, [self._shift_button]), delete_automation_button=ComboElement(self._automation_button, [self._delete_button]), length_button=self._fixed_length_button)
		self._session_recording.layer = Layer(new_button=OptionalElement(self.elements.new_button, self._settings['workflow'], False), scene_list_new_button=OptionalElement(self.elements.new_button, self._settings['workflow'], True), record_button='record_button', automation_button='automation_button', new_scene_button=self._with_shift('new_button'), re_enable_automation_button=self._with_shift('automation_button'), delete_automation_button=ComboElement('automation_button', 'delete_button'),)  ##foot_switch_button=self.elements.foot_pedal_button.single_press, _uses_foot_pedal='foot_pedal_button')
		for control in self.controls:
			if isinstance(control, ConfigurableButtonElement) and control._original_identifier is 69:
				self.log_message('found control: ' + str(control))
				self.controls.remove(control)
				break
		self._foot_pedal_button = None
		self.request_rebuild_midi_map()
	

	def _make_update_control_from_script(self, drum_group):
		def _update_control_from_script(): 
			takeover_drums = drum_group._takeover_drums or drum_group._selected_pads
			profile = 'default' if takeover_drums else 'drums'
			if drum_group._drum_matrix:
				for button, _ in drum_group._drum_matrix.iterbuttons():
					if button:
						translation_channel = self._get_current_instrument_channel()
						if translation_channel < 0:
							translation_channel = PAD_FEEDBACK_CHANNEL
						button.set_channel(translation_channel)
						button.set_enabled(takeover_drums and (translation_channel is PAD_FEEDBACK_CHANNEL))
						button.sensitivity_profile = profile
		return _update_control_from_script
		
	

	@listens('device')
	def _on_new_device_set(self):
		self.schedule_message(1, self._select_note_mode)
	

	def _select_note_mode(self, mod_device = None):
		if not self._main_modes.selected_mode is 'troll':
			track = self.song.view.selected_track
			#drum_device = self._percussion_instrument_finder.drum_group
			#self._drum_step_sequencer.set_drum_group_device(drum_device)
			#drum_device = find_if(lambda d: d.can_have_drum_pads, track.devices)
			drum_device, sliced_simpler = self._percussion_instruments_for_track(track)
			self._drum_component.set_drum_group_device(drum_device)
			self._slicing_component.set_simpler(sliced_simpler)
			channelized = False
			if track.has_midi_input and track.current_input_sub_routing in ['Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8', 'Ch. 9', 'Ch. 10', 'Ch. 11', 'Ch. 12', 'Ch. 13']:
				channelized = True
			debug('select_note_mode: ' + str(self.modhandler.active_mod()) + ' ' + str(len(track.devices)))
			if not (self._note_modes.selected_mode is 'mod' and self.modhandler.is_locked()):
				#self._drum_step_sequencer.set_drum_group_device(drum_device)
				if track == None or track.is_foldable or track in self.song.return_tracks or track == self.song.master_track or (hasattr(track, 'is_frozen') and track.is_frozen):
					self._note_modes.selected_mode = 'disabled'
				elif self.modhandler.active_mod():
					self._note_modes.selected_mode = 'mod'
				elif track and track.has_audio_input:
					self._note_modes.selected_mode = 'looperhack'
				#elif channelized:
				#	self._note_modes.selected_mode = 'monoinstrument'
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
	

	def _make_current_bank_details(self, device_component):
		def _current_bank_details():
			if not self.modhandler.active_mod() is None:
				#debug('bank deets: active_mod')
				if self.modhandler.active_mod() and self.modhandler.active_mod()._param_component._device_parent != None:
					bank_name = self.modhandler.active_mod()._param_component._bank_name
					bank = [param._parameter for param in self.modhandler.active_mod()._param_component._params]
					if self.modhandler._alt_value.subject and self.modhandler._alt_value.subject.is_pressed():
						bank = bank[8:]
					#debug('current mod bank details: ' + str(bank_name) + ' ' + str(bank))
					return (bank_name, bank)
				else:
					#debug('returning ProviderDeviceComponent...')
					return ProviderDeviceComponent._current_bank_details(device_component)
			else:
				#debug('no mod found, returning ProviderDeviceComponent...')
				return ProviderDeviceComponent._current_bank_details(device_component)
		return _current_bank_details
		
	

	def _make_setup_instrument_mode(self, instrument_component):
		def _setup_instrument_mode():
			if instrument_component.is_enabled() and instrument_component._matrix:
				instrument_component._matrix.reset()
				pattern = instrument_component._pattern
				max_j = instrument_component._matrix.width() - 1
				for button, (i, j) in ifilter(first, instrument_component._matrix.iterbuttons()):
					if not button == None:
						profile = 'default' if instrument_component._takeover_pads else 'instrument'
						button.sensitivity_profile = profile
						note_info = pattern.note(i, max_j - j)
						if note_info.index != None:
							button.set_on_off_values('Instrument.NoteAction', 'Instrument.' + note_info.color)
							button.turn_off()
							button.set_enabled(instrument_component._takeover_pads)
							button.set_channel(note_info.channel)
							button.set_identifier(note_info.index)
						else:
							button.set_channel(NON_FEEDBACK_CHANNEL)
							button.set_light('Instrument.' + note_info.color)
							button.set_enabled(True)
					else:
						self.log_message('button is None: ' + str(i, j))
		return _setup_instrument_mode
		
	

	def set_highlighting_session_component(self, session_component):
		self._highlighting_session_component = session_component
		session_component and self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('AumPush')
	

	def _make_channel_strip_arm_value(self, channelstrip):
		def _arm_value(value):
			assert(not channelstrip._arm_button != None)
			assert(value in range(128))
			#self.log_message('channelstrip arm value')
			if channelstrip.is_enabled():
				if channelstrip._track != None and channelstrip._track.can_be_armed:
					arm_exclusive = channelstrip._song.exclusive_arm != channelstrip._shift_pressed
					new_value = not channelstrip._track.arm
					respect_multi_selection = channelstrip._track.is_part_of_selection
					for track in channelstrip._song.tracks:
						if track.can_be_armed:
							if track == channelstrip._track or respect_multi_selection and track.is_part_of_selection:
								track.arm = new_value
								#self.log_message('armed track')
							#elif arm_exclusive and track.arm:
							#	track.arm = False
		return _arm_value
		
	


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
		addresses = {'push_name_display': {'obj': Array('push_name_display', 8, _value = ' '), 'method': self._receive_push_name_display},
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