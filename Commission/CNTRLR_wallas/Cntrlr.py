# by amounra 0416 : http://www.aumhaa.com
# written against Live 9.61 release on 042916


from __future__ import absolute_import, print_function
import Live
import time
import math
import sys

from ableton.v2.base import inject, listens, listens_group, inject
from ableton.v2.control_surface import ControlSurface, ControlElement, Layer, Skin, PrioritizedResource, Component, ClipCreator, DeviceBankRegistry
from ableton.v2.control_surface.elements import ButtonMatrixElement, DoublePressElement, MultiElement, DisplayDataSource, SysexElement
from ableton.v2.control_surface.components import M4LInterfaceComponent, ClipSlotComponent, SceneComponent, SessionComponent, TransportComponent, BackgroundComponent, ViewControlComponent, SessionRingComponent, SessionRecordingComponent, SessionNavigationComponent, SessionOverviewComponent, MixerComponent, PlayableComponent
from ableton.v2.control_surface.components.mixer import simple_track_assigner
from ableton.v2.control_surface.mode import AddLayerMode, ModesComponent, DelayMode, CompoundMode
from ableton.v2.control_surface.elements.physical_display import PhysicalDisplayElement
from ableton.v2.control_surface.components.session_recording import *
from ableton.v2.control_surface.control import PlayableControl, ButtonControl, control_matrix
from ableton.v2.control_surface.components.scroll import ScrollComponent
from ableton.v2.control_surface.components.view_control import BasicSceneScroller

from aumhaa.v2.base import initialize_debug
from aumhaa.v2.control_surface import SendLividSysexMode, MomentaryBehaviour, ExcludingMomentaryBehaviour, DelayedExcludingMomentaryBehaviour, ShiftedBehaviour, LatchingShiftedBehaviour, FlashingBehaviour
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.mod import *
from aumhaa.v2.control_surface.elements import MonoEncoderElement, MonoBridgeElement, generate_strip_string, CodecEncoderElement
from aumhaa.v2.control_surface.elements.mono_button import *
from aumhaa.v2.control_surface.components import DeviceNavigator, TranslationComponent, MonoMixerComponent, ResetSendsComponent, DeviceSelectorComponent, MonoMixerComponent
from aumhaa.v2.control_surface.components.device import DeviceComponent
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.control_surface.mono_modes import SendLividSysexMode, SendSysexMode, CancellableBehaviourWithRelease, ColoredCancellableBehaviourWithRelease, MomentaryBehaviour, BicoloredMomentaryBehaviour, DefaultedBehaviour
from aumhaa.v2.livid import LividControlSurface, LividSettings, LividRGB
from aumhaa.v2.control_surface.components.fixed_length_recorder import FixedLengthSessionRecordingComponent

from pushbase.auto_arm_component import AutoArmComponent
from pushbase.grid_resolution import GridResolution
from pushbase.playhead_element import PlayheadElement
from pushbase.percussion_instrument_finder_component import PercussionInstrumentFinderComponent, find_drum_group_device
from pushbase.drum_group_component import DrumGroupComponent

debug = initialize_debug()


"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *
from .ModDevices import *
from .Map import *



check_model = (240, 126, 127, 6, 1, 247)
factoryreset = (240,0,1,97,8,6,247)
SLOWENCODER = (240, 0, 1, 97, 8, 30, 69, 00, 247)
NORMALENCODER = (240, 0, 1, 97, 8, 30, 00, 00, 247)
FASTENCODER = (240, 0, 1, 97, 8, 30, 04, 00, 247)





"""We need to override the update notification call in AutoArmComponent"""

class CntrlrAutoArmComponent(AutoArmComponent):


	def _update_notification(self):
		pass
	


class CntrlrTransportComponent(TransportComponent):


	def _update_stop_button_color(self):
		self._stop_button.color = 'Transport.StopOn' if self._play_toggle.is_toggled else 'Transport.StopOff'
	

	def _update_tap_tempo_button(self):
		if self.is_enabled() and self._tap_tempo_button:
			self._tap_tempo_button.set_light('Transport.TapTempoOn')
	


class Cntrlr(LividControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for Livid CNTRLR "


	_sysex_id = 8
	_model_name = 'Cntrlr'
	_host_name = 'Cntrlr'
	monomodular = None

	device_provider_class = ModDeviceProvider

	def __init__(self, *a, **k):
		super(Cntrlr, self).__init__(*a, **k)
		self._skin = Skin(CntrlrColors)
		self._device_selection_follows_track_selection = FOLLOW
		with self.component_guard():
			self._setup_controls()
			self._define_sysex()
			self._setup_background()
			#self._setup_autoarm()
			self._setup_session_control()
			self._setup_mixer_control()
			self._setup_transport_control()
			#self._setup_device_control()
			#self._setup_device_selector()
			#self._setup_session_recording_component()
			#self._setup_viewcontrol()
			#self._setup_modes() 
			self._setup_m4l_interface()
	

	def _initialize_script(self):
		super(Cntrlr, self)._initialize_script()
		self._connected = True
		#self._main_modes.selected_mode = 'MixMode'

		self._session_ring._update_highlight()
		self._session_ring.track_offset = 0
		if liveobj_valid(self.song.visible_tracks[0]):
			self.song.view.selected_track = self.song.visible_tracks[0]
	

	def _setup_controls(self):
		is_momentary = True
		optimized = True
		resource = PrioritizedResource
		self._fader = [MonoEncoderElement(msg_type = MIDI_CC_TYPE, channel = CHANNEL, identifier = CNTRLR_FADERS[index], name = 'Fader_' + str(index), num = index, script = self,  optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(8)]
		self._dial_left = [MonoEncoderElement(msg_type = MIDI_CC_TYPE, channel = CHANNEL, identifier = CNTRLR_KNOBS_LEFT[index], name = 'Dial_Left_' + str(index), num = CNTRLR_KNOBS_LEFT[index], script = self, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(12)]
		self._dial_right = [MonoEncoderElement(msg_type = MIDI_CC_TYPE, channel = CHANNEL, identifier = CNTRLR_KNOBS_RIGHT[index], name = 'Dial_Right_' + str(index), num = CNTRLR_KNOBS_RIGHT[index], script = self, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(12)]
		self._encoder = [CodecEncoderElement(msg_type = MIDI_CC_TYPE, channel = CHANNEL, identifier = CNTRLR_DIALS[index], name = 'Encoder_' + str(index), num = CNTRLR_DIALS[index], script = self, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(12)] 
		self._encoder_button = [MonoButtonElement(is_momentary = is_momentary, msg_type = MIDI_NOTE_TYPE, channel = CHANNEL, identifier = CNTRLR_DIAL_BUTTONS[index], name = 'Encoder_Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(12)]	
		self._grid = [MonoButtonElement(is_momentary = is_momentary, msg_type = MIDI_NOTE_TYPE, channel = CHANNEL, identifier = CNTRLR_GRID[index], name = 'Grid_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(16)]
		self._button = [MonoButtonElement(is_momentary = is_momentary,msg_type = MIDI_NOTE_TYPE, channel = CHANNEL, identifier = CNTRLR_BUTTONS[index], name = 'Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(32)]
		self._knobs = self._dial_left + self._dial_right

		self._fader_matrix = ButtonMatrixElement(name = 'Fader_Matrix', rows = [self._fader])
		self._matrix = ButtonMatrixElement(name = 'Matrix', rows = [self._grid[index*4:(index*4)+4] for index in range(4)])
		self._knob_left_matrix = ButtonMatrixElement(name = 'Knob_Left_Matrix', rows = [self._dial_left[index*4:(index*4)+4] for index in range(3)])
		self._knob_right_matrix = ButtonMatrixElement(name = 'Knob_Right_Matrix', rows = [self._dial_right[index*4:(index*4)+4] for index in range(3)])
		self._dial_matrix = ButtonMatrixElement(name = 'Dial_Matrix', rows = [self._encoder[index*4:(index*4)+4] for index in range(3)])
		self._dial_button_matrix = ButtonMatrixElement(name = 'Dial_Button_Matrix', rows = [self._encoder_button[index*4:(index*4)+4] for index in range(1,3)])
		self._key_matrix = ButtonMatrixElement(name = 'Key_Matrix', rows = [self._button[0:16], self._button[16:32]])
		
		self._translated_controls = self._fader + self._knobs + self._encoder[4:] + self._grid + self._button
	

	def _setup_background(self):
		self._background = BackgroundComponent(name = 'Background')
		self._background.layer = Layer(priority = 3, matrix = self._matrix.submatrix[:,:], faders = self._fader_matrix.submatrix[:,:], left_knobs = self._knob_left_matrix.submatrix[:,:], right_knobs = self._knob_right_matrix.submatrix[:,:], dials = self._dial_matrix, dial_buttons = self._dial_button_matrix.submatrix[:,:], keys = self._key_matrix.submatrix[:,:])
		self._background.set_enabled(True)
	

	def _define_sysex(self):
		#self.encoder_navigation_on = SendLividSysexMode(livid_settings = self._livid_settings, call = 'set_encoder_encosion_mode', message = [13, 0, 0, 0]) 
		pass
	

	def _setup_transport_control(self):
		self._transport = CntrlrTransportComponent(name = 'Transport') 
		self._transport._play_toggle.view_transform = lambda value: 'Transport.PlayOn' if value else 'Transport.PlayOff'
		self._transport._record_toggle.view_transform = lambda value: 'Transport.RecordOn' if value else 'Transport.RecordOff'
		self._transport._nudge_up_toggle.view_transform = lambda value: 'Transport.NudgeOn' if value else 'Transport.NudgeOff'
		self._transport._nudge_down_toggle.view_transform = lambda value: 'Transport.NudgeOn' if value else 'Transport.NudgeOff'
		self._transport._loop_toggle.view_transform = lambda value: 'Transport.LoopOn' if value else 'Transport.LoopOff'
		self._transport.layer = Layer(priority = 4,
									play_button = self._button[28],
									stop_button = self._button[29],
									record_button = self._button[30],
									tap_tempo_button = self._button[31],
									nudge_up_button = self._button[3],
									nudge_down_button = self._button[19],
									loop_button = self._button[23])
		self._transport.set_enabled(True)
	

	def _setup_autoarm(self):
		self._auto_arm = CntrlrAutoArmComponent(name='Auto_Arm')
		#self._auto_arm._update_notification = lambda a: None
		self._auto_arm.can_auto_arm_track = self._can_auto_arm_track
	

	def _setup_session_recording_component(self):
		self._clip_creator = ClipCreator()
		self._clip_creator.name = 'ClipCreator'
		self._recorder = FixedLengthSessionRecordingComponent(clip_creator = self._clip_creator, view_controller = ViewControlComponent(), name = 'SessionRecorder') # is_enabled = False)
		self._recorder.main_layer = AddLayerMode(self._recorder, Layer(priority = 4, record_button = self._button[29]))
		#self._recorder.shift_layer = AddLayerMode(self._recorder, Layer(priority = 4, automation_button = self._button[29]))
		self._recorder.set_enabled(False)
	

	def _setup_session_control(self):
		self._session_ring = SessionRingComponent(num_tracks = 4, num_scenes = 4)
		self._session_ring.set_enabled(True)

		self._session_navigation = SessionNavigationComponent(name = 'SessionNavigation', session_ring = self._session_ring)

		self._session_navigation._vertical_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_up_button.disabled_color = 'Session.PageNavigationButtonOff'
		self._session_navigation._vertical_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_down_button.disabled_color = 'Session.PageNavigationButtonOff'
		self._session_navigation._horizontal_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_up_button.disabled_color = 'Session.PageNavigationButtonOff'
		self._session_navigation._horizontal_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_down_button.disabled_color = 'Session.PageNavigationButtonOff'

		self._session_navigation.layer = Layer(priority = 4,
									down_button = self._button[14],
									up_button = self._button[15],
									left_button = self._button[12],
									right_button = self._button[13])
		self._session_navigation.set_enabled(True)

		self._session = SessionComponent(session_ring = self._session_ring, auto_name = True)
		hasattr(self._session, '_enable_skinning') and self._session._enable_skinning()
		self._session.layer = Layer(priority = 4,
									clip_launch_buttons = self._matrix.submatrix[:,:])
		self._session.set_enabled(True)
	

	def _setup_mixer_control(self):
		self._mixer_session_ring = SessionRingComponent(num_tracks = 4, num_scenes = 4)
		self._mixer = MonoMixerComponent(name = 'Mixer', tracks_provider = self._mixer_session_ring, track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)

		self._mixer.layer = Layer(priority = 4, 
											solo_buttons = self._key_matrix.submatrix[8:11, 0],
											stop_clip_buttons = self._key_matrix.submatrix[:3, 0],
											track_select_buttons = self._key_matrix.submatrix[4:8, 0],)
		self._mixer.set_enabled(True)
	

	def _setup_device_control(self):
		self._device_selection_follows_track_selection = FOLLOW
		self._device = DeviceComponent(name = 'Device_Component', device_provider = self._device_provider, device_bank_registry = DeviceBankRegistry())
		self._device.layer = Layer(priority = 4, parameter_controls = self._dial_matrix.submatrix[:, 1:3],)
		#self._device.mod_layer = AddLayerMode(self._device, Layer(priority = 4, parameter_controls = self._dial_matrix.submatrix[:, 1:3],))
		self._device.main_layer = AddLayerMode(self._device, Layer(priority = 4, parameter_controls = self._dial_matrix.submatrix[:, 1:3], 
												on_off_button = self._encoder_button[4],
												bank_prev_button = self._encoder_button[6],
												bank_next_button = self._encoder_button[7],))
												#lock_button = self._encoder_button[5],
		self._device.set_enabled(False)

		self._device_navigator = DeviceNavigator(self._device_provider, self._mixer, self)
		self._device_navigator.name = 'Device_Navigator'
		self._device_navigator.select_dial_layer = AddLayerMode(self._device_navigator, Layer(priority = 6, device_select_dial = self._encoder[0],))
		self._device_navigator.main_layer = AddLayerMode(self._device_navigator, Layer(priority = 4, 
											prev_chain_button = self._encoder_button[8], 
											next_chain_button = self._encoder_button[9], 
											exit_button = self._encoder_button[10], 
											enter_button = self._encoder_button[11],))
		self._device_navigator.set_enabled(False)
	

	def _setup_device_selector(self):
		self._device_selector = DeviceSelectorComponent(self)
		self._device_selector.name = 'Device_Selector'
		#self._device_selector.select_layer = AddLayerMode(self._device_selector, Layer(priority = 6 , matrix = self._matrix.submatrix[:, :]))
		self._device_selector.select_layer = AddLayerMode(self._device_selector, Layer(priority = 6, matrix = ButtonMatrixElement(rows = [self._grid[:4],self._grid[4:8],self._grid[8:12],self._grid[12:14]])))
		self._device_selector.assign_layer = AddLayerMode(self._device_selector, Layer(priority = 7, assign_button = self._grid[14]))
		self._device_selector.set_enabled(False)
	

	def _setup_viewcontrol(self):
		self._view_control = ViewControlComponent(name='View_Control')
		self._view_control.main_layer = AddLayerMode(self._view_control, Layer(priority = 5, 
																				scene_select_dial = self._encoder[2],
																				track_select_dial = self._encoder[3],))
		#self._view_control.main_layer = AddLayerMode(self._view_control, Layer(prev_track_button=self._button[24], 
		#											next_track_button= self._button[25], 
		#											next_scene_button=self._button[27], 
		#											prev_scene_button = self._button[26]))
		self._view_control.set_enabled(False)
	

	def _setup_modes(self):

		common = CompoundMode(self._mixer,
									self._session_ring)
		main_buttons=CompoundMode(self._mixer.main_buttons_layer, 
									self._transport,
									self._recorder,
									self._recorder.main_layer, 
									self._device,)
		shifted_main_buttons=CompoundMode(self._mixer.solo_buttons_layer, 
									self._recorder, 
									self._recorder.shift_layer,
									self._session.scene_launch_layer,
									self._device,)
		main_faders=CompoundMode(self._mixer.main_faders_layer, 
									self._mixer.master_fader_layer)
		main_dials=CompoundMode(self._view_control,
									self._view_control.main_layer,
									self._device_navigator,
									self._device_navigator.select_dial_layer,
									self.encoder_navigation_on)
		shifted_dials=CompoundMode(self._session_navigation,
									self._session_navigation.nav_dial_layer,
									self._device_navigator,
									self._device_navigator.select_dial_layer,
									self.encoder_navigation_on)

		self._modalt_mode = ModesComponent(name = 'ModAltMode')
		self._modalt_mode.add_mode('disabled', None)
		self._modalt_mode.add_mode('enabled', [tuple([self._enable_mod_alt, self._disable_mod_alt])], behaviour = CancellableBehaviourWithRelease(), cycle_mode_button_color = 'Mod.AltOn')
		self._modalt_mode.selected_mode = 'disabled'
		self._modalt_mode.set_enabled(False)
		self._modalt_mode.layer = Layer(priority = 4, enabled_button = self._encoder_button[1])

		self._modswitcher = ModesComponent(name = 'ModSwitcher')
		self._modswitcher.add_mode('mod', [self.modhandler, self._modalt_mode, main_faders, self._mixer.main_knobs_layer, self._device, main_dials, DelayMode(self.modhandler.update, delay = .5, parent_task_group = self._task_group)])
		self._modswitcher.add_mode('instrument', [self._instrument.shift_button_layer, main_buttons, main_faders, self._mixer.main_knobs_layer, self._device, self._device.main_layer, self._device_navigator, self._device_navigator.main_layer, self._device_navigator.select_dial_layer]) #self._instrument.shift_button_layer, self._optional_translations])
		self._modswitcher.selected_mode = 'instrument'
		self._modswitcher.set_enabled(False)

		self._instrument._main_modes = ModesComponent(name = 'InstrumentModes')
		self._instrument._main_modes.add_mode('disabled', [main_buttons, 
																					main_dials, 
																					self._device.main_layer, 
																					self._session, 
																					self._session, 
																					self._session.clip_launch_layer])
		self._instrument._main_modes.add_mode('drumpad', [self._instrument._drumpad.sequencer_layer, 
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_split', [self._instrument._drumpad.split_layer,
																					self._instrument._selected_session,
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer', [self._instrument._drumpad.sequencer_layer, 
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_shifted', [self._instrument._drumpad.sequencer_shift_layer, 
																					self._instrument.drumpad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_split_shifted', [self._instrument._drumpad.split_layer, 
																					self._instrument.drumpad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_shifted', [self._instrument._drumpad.sequencer_shift_layer, 
																					self._instrument.drumpad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad', [self._instrument._keypad.sequencer_layer, 
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_split', [self._instrument._keypad.split_layer,
																					self._instrument._selected_session,
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer', [self._instrument._keypad.sequencer_layer, 
																					main_buttons,
																					self._device.main_layer,
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_shifted', [self._instrument._keypad.sequencer_shift_layer, 
																					self._instrument.keypad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad_split_shifted', [self._instrument._keypad.split_layer, 
																					self._instrument.keypad_shift_layer,
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_shifted', [self._instrument._keypad.sequencer_shift_layer, 
																					self._instrument.keypad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_session', [self._instrument._drumpad.sequencer_session_layer, 
																					main_buttons,
																					self._device.main_layer,
																					self._session,
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_split_session', [self._instrument._drumpad.split_session_layer,
																					self._instrument._selected_session,
																					main_buttons,
																					self._device.main_layer,
																					self._session,
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_session', [self._instrument._drumpad.sequencer_session_layer, 
																					main_buttons,
																					self._device.main_layer,
																					self._session,  
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('drumpad_shifted_session', [self._instrument._drumpad.sequencer_session_shift_layer, 
																					self._instrument.drumpad_shift_layer, 
																					main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_split_shifted_session', [self._instrument._drumpad.split_session_layer,
																					self._instrument.drumpad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_shifted_session', [self._instrument._drumpad.sequencer_session_shift_layer, 
																					self._instrument.drumpad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad_session', [self._instrument._keypad.sequencer_session_layer, 
																					main_buttons,
																					self._device.main_layer,
																					self._session, 
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_split_session', [self._instrument._keypad.split_session_layer,
																					self._instrument._selected_session,
																					main_buttons,
																					self._device.main_layer,
																					self._session,
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_session', [self._instrument._keypad.sequencer_session_layer, 
																					main_buttons,
																					self._device.main_layer,
																					self._session, 
																					DelayMode(self._session.clip_launch_layer, delay = .1), 
																					main_dials])
		self._instrument._main_modes.add_mode('keypad_shifted_session', [self._instrument._keypad.sequencer_session_shift_layer, 
																					self._instrument.keypad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad_split_shifted_session', [self._instrument._keypad.split_session_layer, 
																					self._instrument.keypad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_shifted_session', [self._instrument._keypad.sequencer_session_shift_layer,
																					self._instrument.keypad_shift_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])

		self._instrument._main_modes.add_mode('audioloop', [self._instrument.audioloop_layer, 
																					main_buttons,
																					self._device.main_layer,
																					main_dials,
																					self._session,
																					DelayMode(self._session.clip_launch_layer, delay = .1)])
		self._instrument._main_modes.add_mode('audioloop_shifted', [self._instrument.audioloop_layer, 
																					shifted_main_buttons,
																					self._device.main_layer,
																					self._session_zoom, 
																					shifted_dials])
		#self._instrument._main_modes.add_mode('audioloop_shifted_session', [self._instrument.audioloop_layer, self._session, shifted_main_buttons, main_dials, shifted_dials])
		self._instrument.register_component(self._instrument._main_modes)
		self._instrument._main_modes.selected_mode = 'disabled'
		self._instrument.set_enabled(True)

		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', [self._background])
		self._main_modes.add_mode('MixMode', [common, 
													self._instrument, 
													self._instrument.shift_button_layer,
													self._mixer,
													main_faders, 
													self._mixer.main_knobs_layer,
													self._device,
													self._device.main_layer,
													self._device_navigator,
													self._device_navigator.main_layer,
													self._device_navigator.select_dial_layer])
		self._main_modes.add_mode('ModSwitcher', [common,
													main_faders, 
													main_dials, 
													self._mixer.main_knobs_layer,
													self._view_control,
													self._view_control.main_layer,
													self._device_navigator,
													self._device_navigator.select_dial_layer, 
													self.encoder_navigation_on, 
													self._modswitcher, 
													DelayMode(self._update_modswitcher, delay = .1)], 
													behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		self._main_modes.add_mode('Translations', [common, 
													main_faders, 
													main_dials,
													self._mixer.main_knobs_layer, 
													self._translations, 
													DelayMode(self._translations.selector_layer, delay = .1)], 
													behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		self._main_modes.add_mode('DeviceSelector', [common,
													self._device_selector,
													DelayMode(self._device_selector.select_layer, delay = .1),
													DelayMode(self.modhandler.lock_layer, delay = .1),
													DelayMode(self._device_selector.assign_layer, delay = .5), 
													main_buttons,
													main_dials, 
													main_faders, 
													self._mixer.main_knobs_layer, 
													self._device.main_layer,
													self._device_navigator,
													self._device_navigator.main_layer,
													self._device_navigator.select_dial_layer], 
													behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], DeviceSelector_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 
		self._main_modes.selected_mode = 'disabled'
		self._main_modes.set_enabled(True)

		self._test.subject = self._instrument._main_modes
	

	def _setup_modes(self):
		pass
	

	def _setup_m4l_interface(self):
		self._m4l_interface = M4LInterfaceComponent(controls=self.controls, component_guard=self.component_guard, priority = 10)
		self._m4l_interface.name = "M4LInterface"
		self.get_control_names = self._m4l_interface.get_control_names
		self.get_control = self._m4l_interface.get_control
		self.grab_control = self._m4l_interface.grab_control
		self.release_control = self._m4l_interface.release_control
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('Cntrlr Input')
	

	def _get_num_tracks(self):
		return self.num_tracks
	



#	a