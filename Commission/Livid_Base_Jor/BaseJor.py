# by amounra 0817 : http://www.aumhaa.com
# written against Live 9.73

from __future__ import absolute_import, print_function
import Live
import math
import sys
from re import *
from itertools import imap, chain, starmap

from ableton.v2.base import inject, listens, listens_group
from ableton.v2.control_surface import ControlSurface, ControlElement, Layer, Skin, PrioritizedResource, Component, ClipCreator, DeviceBankRegistry
from ableton.v2.control_surface.elements import ButtonMatrixElement, DoublePressElement, MultiElement, DisplayDataSource, SysexElement
from ableton.v2.control_surface.components import M4LInterfaceComponent, ClipSlotComponent, SceneComponent, SessionComponent, TransportComponent, BackgroundComponent, ViewControlComponent, SessionRingComponent, SessionRecordingComponent, SessionNavigationComponent, MixerComponent, PlayableComponent
from ableton.v2.control_surface.components.mixer import simple_track_assigner, right_align_return_tracks_track_assigner
from ableton.v2.control_surface.mode import AddLayerMode, ModesComponent, DelayMode
from ableton.v2.control_surface.elements.physical_display import PhysicalDisplayElement
from ableton.v2.control_surface.components.session_recording import *

from ableton.v2.control_surface.control import PlayableControl, ButtonControl, control_matrix

from aumhaa.v2.base import initialize_debug
from aumhaa.v2.control_surface import SendLividSysexMode, MomentaryBehaviour, ExcludingMomentaryBehaviour, DelayedExcludingMomentaryBehaviour, ShiftedBehaviour, LatchingShiftedBehaviour, FlashingBehaviour
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.mod import *
from aumhaa.v2.control_surface.elements import MonoEncoderElement, MonoBridgeElement, generate_strip_string
from aumhaa.v2.control_surface.elements.mono_button import *
from aumhaa.v2.control_surface.components import MonoDeviceComponent, DeviceNavigator, TranslationComponent, MonoMixerComponent
from aumhaa.v2.control_surface.components.device import DeviceComponent
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.livid import LividControlSurface, LividSettings, LividRGB
from aumhaa.v2.control_surface.components.fixed_length_recorder import FixedLengthSessionRecordingComponent
from aumhaa.v2.control_surface.components.device import DeviceComponent

from pushbase.auto_arm_component import AutoArmComponent
from pushbase.grid_resolution import GridResolution
from pushbase.playhead_element import PlayheadElement
from pushbase.percussion_instrument_finder import PercussionInstrumentFinder, find_drum_group_device
from pushbase.drum_group_component import DrumGroupComponent

from Livid_Base_v2.Base import *

debug = initialize_debug()

def getSong():
	"""Gets a the current Song instance"""
	return Live.Application.get_application().get_document()


def tracks_to_use():
	return getSong().visible_tracks + getSong().return_tracks

class BaseJor(Base):


	def __init__(self, *a, **k):
		super(BaseJor, self).__init__(*a, **k)
	

	def _setup_controls(self, *a, **k):
		super(BaseJor, self)._setup_controls(*a, **k)
		self._touchpad_multi = MultiElement(self._touchpad[0], self._touchpad[1], self._touchpad[2], self._touchpad[3], self._touchpad[4], self._touchpad[5],)
	
	def _setup_translations(self):
		controls = self._pad[:6] + self._pad[8:14] + self._pad[16:22] + self._pad[24:30] + self._fader[:6] + self._pad_CC[:6] + self._pad_CC[8:14] + self._pad_CC[16:22] + self._pad_CC[24:30]
		if CAP_BUTTON_TRANSLATIONS:
			controls = controls + self._touchpad
		self._translations = BaseDisplayingTranslationComponent(controls, USER_OFFSET)
		self._translations.name = 'TranslationComponent'
		self._translations._channel = USER_OFFSET
		self._translations.layer = Layer(priority = 10, channel_selector_buttons = self._nav_buttons, display = self._display)
		self._translations.set_enabled(False)

		controls = [self._pad[6], self._pad[7], self._pad[14], self._pad[15], self._pad[22], self._pad[23], self._pad[30], self._pad[31], self._pad_CC[6], self._pad_CC[7], self._pad_CC[14], self._pad_CC[15], self._pad_CC[22], self._pad_CC[23], self._pad_CC[30], self._pad_CC[31]]
		self._translationsJor = BaseDisplayingTranslationComponent(controls, 15)
		self._translationsJor.name = 'JorTranslationComponent'
		self._translationsJor._channel = 15
		self._translationsJor.set_enabled(False)
	

	def _setup_mixer_control(self):
		self._mixer = MonoMixerComponent(name = 'Mixer', num_returns = 4,tracks_provider = self._session_ring, track_assigner = right_align_return_tracks_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)
		self._mixer.master_strip().layer = Layer(priority = 4, volume_control = self._fader[8])
		self._mixer.volume_layer = AddLayerMode(self._mixer, Layer(priority = 4, volume_controls = self._fader_matrix.submatrix[:6, :]))
		self._mixer.select_layer = AddLayerMode(self._mixer, Layer(priority = 4, track_select_buttons = self._touchpad_matrix.submatrix[:6, :]))
		selected_strip = self._mixer.selected_strip()
		selected_strip.set_invert_mute_feedback(True)
		self._mixer.selected_channel_controls_layer = AddLayerMode(selected_strip, Layer(priority = 4, arm_button = self._button[6], solo_button = self._button[5], mute_button = self._button[4], stop_button = self._button[7]))
		self._mixer.selected_sends_layer = AddLayerMode(selected_strip, Layer(priority = 4, send_controls = self._fader_matrix.submatrix[:4, :]))
		self._mixer.returns_layer = AddLayerMode(self._mixer, Layer(priority = 4, return_controls = self._fader_matrix.submatrix[4:6, :]))
		self._mixer.channel_controls_layer = AddLayerMode(self._mixer, Layer(priority = 4, mute_buttons = self._base_grid.submatrix[:6, :1],
																		solo_buttons = self._base_grid.submatrix[:6, 1:2],
																		arm_buttons = self._base_grid.submatrix[:6, 2:3],
																		stop_clip_buttons = self._base_grid.submatrix[:6, 3:4]))
		#self._mixer.navigation_layer = AddLayerMode(self._mixer, Layer(priority = 4, previous_track_button = self._touchpad[6], next_track_button = self._touchpad[7]))
		self._mixer.set_enabled(False)

		self._view_controller = ViewControlComponent()
		self._view_controller.layer = Layer(priority = 4, prev_track_button = self._touchpad[6], next_track_button = self._touchpad[7])
		self._view_controller.set_enabled(False)
	

	def _setup_session_control(self):
		self._session_ring = SessionRingComponent(num_tracks = 6, num_scenes = 4, tracks_to_use = tracks_to_use)
		self._session_ring.set_enabled(False)

		self._session_navigation = SessionNavigationComponent(session_ring = self._session_ring)
		self._session_navigation.navigation_layer = AddLayerMode(self._session_navigation, Layer(priority = 4, up_button = self._button[4], down_button = self._button[5], left_button = self._button[6], right_button = self._button[7]))
		self._session_navigation.page_navigation_layer = AddLayerMode(self._session_navigation, Layer(priority = 4, page_up_button = self._button[4], page_down_button = self._button[5], page_left_button = self._button[6], page_right_button = self._button[7]))
		self._session_navigation._vertical_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation.set_enabled(False)

		self._session = BaseSessionComponent(name = 'Session', parent_task_group = self._task_group, session_ring = self._session_ring, auto_name = True)
		hasattr(self._session, '_enable_skinning') and self._session._enable_skinning()
		self._session.cliplaunch_layer = AddLayerMode(self._session, Layer(priority = 4, clip_launch_buttons = self._base_grid.submatrix[:6, :]))
		self._session.overlay_cliplaunch_layer = AddLayerMode(self._session, Layer(priority = 4, clip_launch_buttons = self._base_grid.submatrix[:5, :], scene_launch_buttons = self._base_grid.submatrix[5:6, :]))
		#self._session.clipstop_layer = AddLayerMode(self._session, Layer(priority = 4, stop_track_clip_buttons = self._base_grid.submatrix[:, 3:4]))
		self._session.set_enabled(False)
	

	def _setup_instrument(self):
		self._grid_resolution = GridResolution()

		self._c_instance.playhead.enabled = True
		self._playhead_element = PlayheadElement(self._c_instance.playhead)
		#self._playhead_element.reset()

		quantgrid = ButtonMatrixElement([self._base_grid._orig_buttons[2][4:8], self._base_grid._orig_buttons[3][4:7]])

		self._drum_group_finder = PercussionInstrumentFinder(device_parent=self.song.view.selected_track)

		self._instrument = BaseMonoInstrumentComponent(name = 'InstrumentModes', script = self, skin = self._skin, drum_group_finder = self._drum_group_finder, grid_resolution = self._grid_resolution, settings = DEFAULT_INSTRUMENT_SETTINGS, device_provider = self._device_provider, parent_task_group = self._task_group)
		self._instrument.layer = Layer(priority = 6, base_display = self._display)
		self._instrument.audioloop_layer = LayerMode(self._instrument, Layer(priority = 6, loop_selector_matrix = self._base_grid))

		self._instrument.keypad_options_layer = AddLayerMode(self._instrument, Layer(priority = 6, 
									base_display = self._display,
									scale_up_button = self._touchpad[7], 
									scale_down_button = self._touchpad[6],
									offset_up_button = self._touchpad[5], 
									offset_down_button = self._touchpad[4],
									vertical_offset_up_button = self._touchpad[3],
									vertical_offset_down_button = self._touchpad[2],
									split_button = self._touchpad[0], 
									sequencer_button = self._touchpad[1]))
		self._instrument.drumpad_options_layer = AddLayerMode(self._instrument, Layer(priority = 6, 
									base_display = self._display,
									scale_up_button = self._touchpad[7],
									scale_down_button = self._touchpad[6],
									drum_offset_up_button = self._touchpad[5], 
									drum_offset_down_button = self._touchpad[4],
									drumpad_mute_button = self._touchpad[3],
									drumpad_solo_button = self._touchpad[2],
									split_button = self._touchpad[0], 
									sequencer_button = self._touchpad[1]))

		self._instrument._keypad.octave_toggle_layer = AddLayerMode(self._instrument._keypad, Layer(priority = 7, offset_shift_toggle = self._button[4]))
		self._instrument._drumpad.octave_toggle_layer = AddLayerMode(self._instrument._drumpad, Layer(priority = 7, offset_shift_toggle = self._button[4]))

		self._instrument._keypad.main_layer = LayerMode(self._instrument._keypad, Layer(priority = 6, keypad_matrix = self._base_grid.submatrix[:6,:]))
		self._instrument._keypad.select_layer = LayerMode(self._instrument._keypad, Layer(priority = 6, keypad_select_matrix = self._base_grid.submatrix[:6, :]))
		self._instrument._keypad.split_layer = LayerMode(self._instrument._keypad, Layer(priority = 6, keypad_matrix = self._base_grid.submatrix[:6, 2:4]))
		self._instrument._keypad.split_select_layer = LayerMode(self._instrument._keypad, Layer(priority = 6, keypad_select_matrix = self._base_grid.submatrix[:6, 2:4]))

		self._instrument._keypad.sequencer_layer = AddLayerMode(self._instrument._keypad, Layer(priority = 6, playhead = self._playhead_element, sequencer_matrix = self._base_grid.submatrix[:6, :2]))
		self._instrument._keypad.sequencer_shift_layer = AddLayerMode(self._instrument._keypad, Layer(priority = 6, loop_selector_matrix = self._base_grid.submatrix[:6, :1], quantization_buttons = self._base_grid.submatrix[:7, 1:2], follow_button = self._pad[15]))

		self._instrument._drumpad.main_layer = LayerMode(self._instrument._drumpad, Layer(priority = 6, drumpad_matrix = self._base_grid.submatrix[:6,:]))
		self._instrument._drumpad.select_layer = LayerMode(self._instrument._drumpad, Layer(priority = 6, drumpad_select_matrix = self._base_grid.submatrix[:6,:]))
		self._instrument._drumpad.split_layer = LayerMode(self._instrument._drumpad, Layer(priority = 6, drumpad_matrix = self._base_grid.submatrix[:4, :],))
		self._instrument._drumpad.split_select_layer = LayerMode(self._instrument._drumpad, Layer(priority = 6, drumpad_select_matrix = self._base_grid.submatrix[:4,:]))

		self._instrument._drumpad.sequencer_layer = AddLayerMode(self._instrument._drumpad, Layer(priority = 6, playhead = self._playhead_element, sequencer_matrix = self._base_grid.submatrix[4:6, :]))
		self._instrument._drumpad.sequencer_shift_layer = AddLayerMode(self._instrument._drumpad, Layer(priority = 6, loop_selector_matrix = self._base_grid.submatrix[4:6, :2],)) # quantization_buttons = quantgrid, follow_button = self._pad[31]))

		self._instrument._selected_session._keys_layer = LayerMode(self._instrument._selected_session, Layer(priority = 6, clip_launch_buttons = self._base_grid.submatrix[:6, :2]))
		self._instrument._selected_session._drum_layer = LayerMode(self._instrument._selected_session, Layer(priority = 6, clip_launch_buttons = self._base_grid.submatrix[4:6, :]))

		self._instrument._main_modes = ModesComponent(name = 'InstrumentModes')
		self._instrument._main_modes.add_mode('disabled', [])
		self._instrument._main_modes.add_mode('drumpad', [self._instrument._drumpad, self._instrument._drumpad.main_layer, self.midi_mode_sysex])
		self._instrument._main_modes.add_mode('drumpad_split', [self._instrument._drumpad, self._instrument._drumpad.split_layer, self._instrument._selected_session, self._instrument._selected_session._drum_layer, self.splitvertical_mode_sysex])
		self._instrument._main_modes.add_mode('drumpad_sequencer', [self._instrument._drumpad, self._instrument._drumpad.sequencer_layer, self._instrument._drumpad.split_layer, self.splitvertical_mode_sysex])
		self._instrument._main_modes.add_mode('drumpad_shifted', [self._instrument._drumpad, self._instrument._drumpad.select_layer, self._instrument.drumpad_options_layer, self._instrument._drumpad.octave_toggle_layer, self.midi_mode_sysex])
		self._instrument._main_modes.add_mode('drumpad_split_shifted', [ self._instrument._drumpad, self._instrument._drumpad.split_select_layer, self._instrument.drumpad_options_layer, self._instrument._drumpad.octave_toggle_layer, self._instrument._selected_session, self._instrument._selected_session._drum_layer])
		self._instrument._main_modes.add_mode('drumpad_sequencer_shifted', [self._instrument._drumpad, self._instrument._drumpad.split_select_layer, self._instrument._drumpad.sequencer_shift_layer, self._instrument.drumpad_options_layer, self._instrument._drumpad.octave_toggle_layer, self.splitvertical_mode_sysex])
		self._instrument._main_modes.add_mode('keypad', [self._instrument._keypad, self._instrument._keypad.main_layer, self.midi_mode_sysex])
		self._instrument._main_modes.add_mode('keypad_split', [self._instrument._keypad, self._instrument._keypad.split_layer, self._instrument._selected_session, self._instrument._selected_session._keys_layer, self.splithorizontal_mode_sysex])
		self._instrument._main_modes.add_mode('keypad_sequencer', [self._instrument._keypad, self._instrument._keypad.sequencer_layer, self._instrument._keypad.split_layer, self.splithorizontal_mode_sysex], )
		self._instrument._main_modes.add_mode('keypad_shifted', [self._instrument._keypad, self._instrument._keypad.select_layer, self._instrument.keypad_options_layer, self._instrument._keypad.octave_toggle_layer, self.midi_mode_sysex])
		self._instrument._main_modes.add_mode('keypad_split_shifted', [self._instrument._keypad, self._instrument._keypad.split_select_layer, self._instrument.keypad_options_layer, self._instrument._keypad.octave_toggle_layer, self._instrument._selected_session, self._instrument._selected_session._keys_layer])
		self._instrument._main_modes.add_mode('keypad_sequencer_shifted', [self._instrument._keypad, self._instrument._keypad.split_select_layer, self._instrument._keypad.sequencer_shift_layer, self._instrument.keypad_options_layer, self._instrument._keypad.octave_toggle_layer, self.splithorizontal_mode_sysex])
		self._instrument._main_modes.add_mode('audioloop', [self._instrument.audioloop_layer, self.live_mode_sysex])
		self._instrument.register_component(self._instrument._main_modes)
		self._instrument.set_enabled(False)

	def _setup_main_modes(self):
		self._main_modes = BaseDisplayingModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', [self._background])
		self._main_modes.add_mode('Clips_shifted', [self._mixer, self._mixer.volume_layer, self._mixer.select_layer, self._mixer.channel_controls_layer, self._session_ring, self._session_navigation, self._session_navigation.page_navigation_layer, self.clips_layer_sysex, self.live_mode_sysex, self._translationsJor, self._view_controller], groups = ['shifted'], behaviour = self._shift_latching(color = 'MainModes.Clips'), display_string = MODE_DATA['Clips_shifted'])
		self._main_modes.add_mode('Clips', [self._mixer, self._mixer.volume_layer, self._mixer.select_layer,  self._session_ring, self._session, self._session.cliplaunch_layer, self._session_navigation, self._session_navigation.navigation_layer, self.clips_layer_sysex, self.live_mode_sysex, self._translationsJor, self._view_controller], behaviour = self._shift_latching(color = 'MainModes.Clips'), display_string = MODE_DATA['Clips'])
		self._main_modes.add_mode('Sends_shifted', [self._mixer, self._mixer.returns_layer, self._mixer.selected_sends_layer, self.sends_layer_sysex, self._session_ring, self._recorder, self._recorder.alt_layer, self._instrument, tuple([self._send_instrument_shifted, self._send_instrument_unshifted]), self._translationsJor, self._view_controller], groups = ['shifted'], behaviour = self._shift_latching(color = 'MainModes.Sends'), display_string = MODE_DATA['Sends_shifted'])   #self._instrument,
		self._main_modes.add_mode('Sends', [self._mixer, self._mixer.returns_layer, self._mixer.selected_sends_layer, self.sends_layer_sysex, self._mixer.select_layer,  self._session_ring, self._transport, self._recorder, self._recorder.main_layer, self._instrument, self._translationsJor, self._view_controller], behaviour = self._shift_latching(color = 'MainModes.Sends'), display_string = MODE_DATA['Sends'])
		self._main_modes.add_mode('Device_shifted', [self.device_layer_sysex, self._modswitcher, self._mixer, self._session_ring, tuple([self._send_instrument_shifted, self._send_instrument_unshifted]), self._device, self._device.parameters_layer, self._device_navigator.alt_layer,  self._translationsJor, self._view_controller], groups = ['shifted'], behaviour = self._shift_latching(color = 'MainModes.Device'), display_string = MODE_DATA['Device_shifted'])
		self._main_modes.add_mode('Device', [self.device_layer_sysex, self._modswitcher, self._mixer, self._mixer.select_layer, self._session_ring, self._device, self._device.parameters_layer, self._device.nav_layer, self._device_navigator.main_layer,self._translationsJor, self._view_controller], behaviour = self._shift_latching(color = 'MainModes.Device'), display_string = MODE_DATA['Device'])
		self._main_modes.add_mode('User_shifted', [self._translations, self._mixer, self._mixer.select_layer, self.user_layer_sysex, self.user_mode_sysex, self._translationsJor, self._view_controller ], groups = ['shifted'], behaviour = self._shift_latching(color = 'MainModes.User'), display_string = MODE_DATA['User'])
		self._main_modes.add_mode('User', [self._translations, self._mixer, self._mixer.select_layer, self.user_layer_sysex, self.user_mode_sysex, self._translationsJor, self._view_controller], behaviour = self._shift_latching(color = 'MainModes.User'), display_string = MODE_DATA['User'])
		self._main_modes.add_mode('Select', [self._mixer, self._mixer.volume_layer, self._mixer.selected_channel_controls_layer, self._session_ring, self._session, self._session.overlay_cliplaunch_layer, self.clips_layer_sysex], behaviour = DelayedExcludingMomentaryBehaviour(excluded_groups = ['shifted']), display_string = MODE_DATA['Select'])  #excluded_groups = ['shifted']
		self._main_modes.Select_button._send_current_color = lambda: None  #cant have the multielement updating its button color since it belongs to select buttons, this is the easiest way to deal with it....should probably override in a separate behaviour class
		self._main_modes.layer = Layer(priority = 4, Clips_button=self._button[0], Sends_button=self._button[1], Device_button=self._button[2], User_button=self._button[3], Select_button=self._touchpad_multi, display = self._display)
		self._main_modes.selected_mode = 'disabled'
		self._main_modes.set_enabled(True)
	




#	a