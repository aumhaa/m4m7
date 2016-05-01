# by amounra 0416 : http://www.aumhaa.com
# written against Live 9.61 release on 042816

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

from CNTRLR import Cntrlr as BaseCntrlr
from CNTRLR.Cntrlr import CntrlrMonoInstrumentComponent

class GTrollMonoInstrumentComponent(CntrlrMonoInstrumentComponent):


	def _setup_shift_mode(self):
		super(GTrollMonoInstrumentComponent, self)._setup_shift_mode()
		#self._shifted = False
		#self._shift_mode = self.register_component(ModesComponent())
		#self._shift_mode.add_mode('disabled', [])
		#self._shift_mode.add_mode('shift', tuple([lambda a: self._on_shift_value(True), lambda a: self._on_shift_value(False)]), behaviour = ShiftCancellableBehaviourWithRelease())
		self._shift_mode.shift_button.color = 'MonoInstrument.ShiftOn'
		self._shift_mode.shift_button.disabled_color = 'MonoInstrument.ShiftOff'
	

class Cntrlr(BaseCntrlr):


	def __init__(self, *a, **k):
		super(Cntrlr, self).__init__(*a, **k)
		self._skin = Skin(CntrlrColors)
		for button in self._grid:
			button._skin = self._skin
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " for Georg Oswald " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_transport_control(self):
		super(Cntrlr, self)._setup_transport_control()
		self._transport._overdub_toggle.view_transform = lambda value: 'Transport.OverdubOn' if value else 'Transport.OverdubOff'
		self._transport.layer = Layer(priority = 4,
									play_button = self._button[24],
									overdub_button = self._button[25])
	

	def _setup_session_control(self):
		super(Cntrlr, self)._setup_session_control()
		self._session_navigation.nav_layer = AddLayerMode(self._session_navigation, Layer(priority = 4,
									page_down_button = self._button[22],
									page_up_button = self._button[23],
									page_left_button = self._button[20],
									page_right_button = self._button[21]))
		self._session.stop_clips_layer = AddLayerMode(self._session, Layer(priority = 4,
									stop_all_clips_button = self._button[29],))
	

	def _setup_session_recording_component(self):
		super(Cntrlr, self)._setup_session_recording_component()
		self._recorder.main_layer = AddLayerMode(self._recorder, Layer(priority = 4))
		self._recorder.shift_layer = AddLayerMode(self._recorder, Layer(priority = 4, automation_button = self._button[25]))
	

	def _setup_mixer_control(self):
		super(Cntrlr, self)._setup_mixer_control()

		mute_buttons = ButtonMatrixElement(name = 'mute_buttons', rows = [self._button[:4] + self._button[12:16]])
		select_buttons = ButtonMatrixElement(name = 'select_buttons', rows = [self._button[16:20] + self._button[28:32]])

		self._G_session_ring = SessionRingComponent(num_tracks = 8, num_scenes = 4)
		self._G_session_ring.set_enabled(False)

		self._G_mixer = MonoMixerComponent(name = 'Mixer', num_returns = 4,tracks_provider = self._G_session_ring, track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)

		if FREE_ENCODER_IS_CROSSFADER:
			self._mixer.layer = Layer(priority = 4, crossfader_control = self._encoder[1])
		#self._G_mixer.select_dial_layer = AddLayerMode(self._G_mixer, Layer(priority = 5, 
		#									track_select_dial = self._encoder[3],))
		self._G_mixer.main_faders_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											volume_controls = self._fader_matrix.submatrix[:8, :],))
		self._G_mixer.main_buttons_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,
											arming_track_select_buttons = select_buttons,
											solo_buttons = self._key_matrix.submatrix[4:12, :1],))
		self._G_mixer.shifted_buttons_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,))
		self._G_mixer.solo_buttons_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											solo_buttons = self._key_matrix.submatrix[4:12, :1],))
		self._G_mixer.mute_buttons_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,))

		self._G_mixer.stop_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											stop_clip_buttons = self._key_matrix.submatrix[8:12, 1:],))

		self._G_mixer.main_knobs_layer = AddLayerMode(self._G_mixer, Layer(priority = 4))

		self._G_mixer.master_fader_layer = AddLayerMode(self._G_mixer.master_strip(), Layer(priority = 4,))
		self._G_mixer.instrument_buttons_layer = AddLayerMode(self._G_mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,
											track_select_buttons = select_buttons,))
		self._G_mixer.set_enabled(False)
	

	def _setup_device_control(self):
		super(Cntrlr, self)._setup_device_control()
		self._device_navigator.main_layer = AddLayerMode(self._device_navigator, Layer(priority = 4,
											prev_button = self._encoder_button[8], 
											next_button = self._encoder_button[9], 
											exit_button = self._encoder_button[10], 
											enter_button = self._encoder_button[11],))
	

	def _setup_instrument(self):
		self._grid_resolution = self.register_disconnectable(GridResolution())
		self._c_instance.playhead.enabled = True
		self._playhead_element = PlayheadElement(self._c_instance.playhead)

		self._drum_group_finder = PercussionInstrumentFinderComponent(device_parent=self.song.view.selected_track)

		self._instrument = CntrlrMonoInstrumentComponent(name = 'InstrumentComponent', is_enabled = True, script = self, skin = self._skin, grid_resolution = self._grid_resolution, drum_group_finder = self._drum_group_finder, parent_task_group = self._task_group, settings = DEFAULT_INSTRUMENT_SETTINGS, device_provider = self._device_provider)
		self._instrument.shift_button_layer = AddLayerMode(self._instrument, Layer(priority = 5, session_mode_button = self._button[26], shift_mode_button = self._button[27]))
		self._instrument.audioloop_layer = AddLayerMode(self._instrument, Layer(priority = 5))

		self._instrument.keypad_shift_layer = AddLayerMode(self._instrument, Layer(priority = 5, 
									scale_up_button = self._button[31], 
									scale_down_button = self._button[30],
									offset_up_button = self._button[11], 
									offset_down_button = self._button[10],
									vertical_offset_up_button = self._button[9],
									vertical_offset_down_button = self._button[8],))

		self._instrument.drumpad_shift_layer = AddLayerMode(self._instrument, Layer(priority = 5, 
									scale_up_button = self._button[31],
									scale_down_button = self._button[30],
									drum_offset_up_button = self._button[11], 
									drum_offset_down_button = self._button[10],
									drumpad_mute_button = self._button[9],
									drumpad_solo_button = self._button[8],))

		self._instrument._keypad.sequencer_layer = LayerMode(self._instrument._keypad, Layer(priority = 5, 
																										playhead = self._playhead_element,
		 																								keypad_matrix = self._matrix.submatrix[:,:],))
		self._instrument._keypad.split_layer = LayerMode(self._instrument._keypad, Layer(priority = 5, 
																										keypad_matrix = self._matrix.submatrix[:,:],))
		self._instrument._keypad.sequencer_shift_layer = LayerMode(self._instrument._keypad, Layer(priority = 5, 
																										keypad_matrix = self._matrix.submatrix[:,:], 
																										loop_selector_matrix = self._key_matrix.submatrix[4:8, 0], 
																										quantization_buttons = self._key_matrix.submatrix[:7, 1], 
																										follow_button = self._button[23]))
		self._instrument._keypad.sequencer_session_layer = LayerMode(self._instrument._keypad, Layer(priority = 5, 
																										playhead = self._playhead_element,))
		self._instrument._keypad.split_session_layer = LayerMode(self._instrument._keypad, Layer(priority = 5, 
																										split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._keypad.sequencer_session_shift_layer = LayerMode(self._instrument._keypad, Layer(priority = 5,
																										loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], 
																										quantization_buttons = self._key_matrix.submatrix[:7, 1:], 
																										follow_button = self._button[23]))

		self._instrument._drumpad.sequencer_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										playhead = self._playhead_element, 
																										drumpad_matrix = self._matrix.submatrix[:,:],))
		self._instrument._drumpad.split_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										drumpad_matrix = self._matrix.submatrix[:,:], 
																										split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._drumpad.sequencer_shift_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										drumpad_matrix = self._matrix.submatrix[:,:], 
																										loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], 
																										quantization_buttons = self._key_matrix.submatrix[:7, 1:], 
																										follow_button = self._button[23]))
		self._instrument._drumpad.sequencer_session_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										playhead = self._playhead_element,))
		self._instrument._drumpad.split_session_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._drumpad.sequencer_session_shift_layer = LayerMode(self._instrument._drumpad, Layer(priority = 5, 
																										loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], 
																										quantization_buttons = self._key_matrix.submatrix[:7, 1:], 
																										follow_button = self._button[23]))

		#self._instrument.set_session_mode_button(self._button[30])
	

	def _setup_modes(self):

		common = CompoundMode(self._mixer,
									self._session_ring)
		main_buttons=CompoundMode(self._G_mixer.main_buttons_layer,
									self._session_navigation,
									self._session_navigation.nav_layer,
									self._transport,
									self._recorder,
									self._recorder.main_layer, 
									self._device)
		shifted_main_buttons=CompoundMode(self._G_mixer.shifted_buttons_layer,
									self._recorder, 
									self._recorder.shift_layer,
									self._session,
									self._session.scene_launch_layer,
									self._session.stop_clips_layer,
									self._device)
		main_faders=CompoundMode(self._G_mixer.main_faders_layer, 
									self._G_mixer.master_fader_layer)
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
		self._modswitcher.add_mode('mod', [self.modhandler, self._modalt_mode, main_faders, self._G_mixer.main_knobs_layer, self._device, self._device_navigator.main_layer,	main_dials, DelayMode(self.modhandler.update, delay = .5, parent_task_group = self._task_group)])
		self._modswitcher.add_mode('instrument', [self._instrument.shift_button_layer, main_buttons, main_faders, self._G_mixer.main_knobs_layer, self._device, self._device_navigator.main_layer]) #self._instrument.shift_button_layer, self._optional_translations])
		self._modswitcher.selected_mode = 'instrument'
		self._modswitcher.set_enabled(False)

		self._instrument._main_modes = ModesComponent(name = 'InstrumentModes')
		self._instrument._main_modes.add_mode('disabled', [main_buttons, main_dials, self._device.main_layer, self._session, self._session, self._session.clip_launch_layer])
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
													self._G_mixer,
													main_faders, 
													self._G_mixer.main_knobs_layer,
													self._device,
													self._device.main_layer,
													self._device_navigator,
													self._device_navigator.main_layer,
													self._device_navigator.select_dial_layer])
		self._main_modes.add_mode('ModSwitcher', [common,
													main_faders, 
													main_dials, 
													self._G_mixer.main_knobs_layer,
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
													self._G_mixer.main_knobs_layer, 
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
													self._G_mixer.main_knobs_layer, 
													self._device.main_layer,
													self._device_navigator,
													self._device_navigator.main_layer,
													self._device_navigator.select_dial_layer], 
													behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], DeviceSelector_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 
		self._main_modes.selected_mode = 'disabled'
		self._main_modes.set_enabled(True)

		self._test.subject = self._instrument._main_modes
	



#a