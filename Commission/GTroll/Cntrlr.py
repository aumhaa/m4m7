# by amounra 0215 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys
from itertools import count

""" _Framework files """
from _Framework.Dependency import inject
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
#from _Framework.ChannelStripComponent import ChannelStripComponent
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.CompoundComponent import CompoundComponent
from _Framework.ControlElement import ControlElement, ControlElementClient
from _Framework.ControlSurface import OptimizedControlSurface, ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.DeviceComponent import DeviceComponent
from _Framework.EncoderElement import EncoderElement
from _Framework.InputControlElement import *
#from _Framework.MixerComponent import MixerComponent
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.SceneComponent import SceneComponent
from _Framework.SessionComponent import SessionComponent
from _Framework.SessionZoomingComponent import SessionZoomingComponent	#DeprecatedSessionZoomingComponent as SessionZoomingComponent
from _Framework.SliderElement import SliderElement
from _Framework.TransportComponent import TransportComponent
from _Framework.ModesComponent import EnablingModesComponent, DelayMode, CompoundMode, AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.Layer import Layer
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *
from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext
from _Framework.Skin import Skin

"""Imports from the Monomodular Framework"""
from _Mono_Framework.CodecEncoderElement import CodecEncoderElement
from _Mono_Framework.EncoderMatrixElement import NewEncoderMatrixElement as EncoderMatrixElement
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.DeviceSelectorComponent import NewDeviceSelectorComponent as DeviceSelectorComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.DeviceNavigator import DeviceNavigator
from _Mono_Framework.MonoM4LInterfaceComponent import MonoM4LInterfaceComponent
from _Mono_Framework.MonoMixerComponent import MixerComponent
from _Mono_Framework.MonoModes import SendLividSysexMode, SendSysexMode, CancellableBehaviourWithRelease, ColoredCancellableBehaviourWithRelease, MomentaryBehaviour, BicoloredMomentaryBehaviour, DefaultedBehaviour
from _Mono_Framework.LiveUtils import *
from _Mono_Framework.Debug import *
from _Mono_Framework.Mod import *
from _Mono_Framework.LividColors import *
from _Mono_Framework.LividUtilities import LividSettings
from _Mono_Framework.MonoInstrumentComponent import *
from _Mono_Framework.TranslationComponent import TranslationComponent
from _Framework.SessionRecordingComponent import *
from _Framework.ViewControlComponent import ViewControlComponent

debug = initialize_debug()


"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *
from ModDevices import *
from Map import *



from _Mono_Framework._deprecated.AutoArmComponent import AutoArmComponent
from _Mono_Framework.MonoInstrumentComponent import PlayheadElement
from _Mono_Framework._deprecated.GridResolution import GridResolution


check_model = (240, 126, 127, 6, 1, 247)
factoryreset = (240,0,1,97,8,6,247)
SLOWENCODER = (240, 0, 1, 97, 8, 30, 69, 00, 247)
NORMALENCODER = (240, 0, 1, 97, 8, 30, 00, 00, 247)
FASTENCODER = (240, 0, 1, 97, 8, 30, 04, 00, 247)


from Livid_CNTRLR_2.Cntrlr import Cntrlr as Base_Cntrlr, CntrlrSessionComponent, CntrlrMonoInstrumentComponent

from _Framework.ButtonElement import Color
from _Mono_Framework.LividColors import *



class GTrollCntrlrMonoInstrumentComponent(CntrlrMonoInstrumentComponent):


	def _setup_shift_mode(self):
		self._shifted = False
		self._shift_mode = ModesComponent()
		self._shift_mode.add_mode('shift', tuple([self._enable_shift, self._disable_shift]), behaviour = ColoredCancellableBehaviourWithRelease(color = 'MonoInstrument.ShiftOn', off_color = 'MonoInstrument.ShiftOff') if SHIFT_LOCK else BicoloredMomentaryBehaviour(color = 'MonoInstrument.ShiftOn', off_color = 'MonoInstrument.ShiftOff'))
		self._shift_mode.add_mode('disabled', None)
		self._shift_mode.selected_mode = 'disabled'
	


class Cntrlr(Base_Cntrlr):


	def __init__(self, *a, **k):
		super(Cntrlr, self).__init__(*a, **k)
		self._skin = Skin(CntrlrColors)
		for button in self._grid:
			button._skin = self._skin

	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " for Georg Oswald " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_mixer_control(self):

		mute_buttons = ButtonMatrixElement(name = 'mute_buttons', rows = [self._button[:4] + self._button[12:16]])
		select_buttons = ButtonMatrixElement(name = 'select_buttons', rows = [self._button[16:20] + self._button[28:32]])

		is_momentary = True
		self._num_tracks = (8)
		self._mixer = MixerComponent(num_tracks = 8, num_returns = 4, name = 'Mixer', auto_name = True, invert_mute_feedback = True)
		self._mixer.set_track_offset(0)
		if self._mixer.channel_strip(0)._track:
			self.song().view.selected_track = self._mixer.channel_strip(0)._track
		if FREE_ENCODER_IS_CROSSFADER:
			self._mixer.layer = Layer(priority = 4, crossfader_control = self._encoder[1])
		self._mixer.select_dial_layer = AddLayerMode(self._mixer, Layer(priority = 5, 
											track_select_dial = self._encoder[3],))
		self._mixer.main_faders_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											volume_controls = self._fader_matrix.submatrix[:8, :],))
		self._mixer.main_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,
											arming_track_select_buttons = select_buttons,
											solo_buttons = self._key_matrix.submatrix[4:12, :1],))
		self._mixer.shifted_buttons_layer = self._mixer.main_buttons_layer
		self._mixer.solo_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											solo_buttons = self._key_matrix.submatrix[4:12, :1],))
		self._mixer.mute_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,))

		self._mixer.stop_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											stop_clip_buttons = self._key_matrix.submatrix[8:12, 1:],))

		self._mixer.main_knobs_layer = AddLayerMode(self._mixer, Layer(priority = 4))

		self._mixer.master_fader_layer = AddLayerMode(self._mixer.master_strip(), Layer(priority = 4,))
		self._mixer.instrument_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											mute_buttons = mute_buttons,
											track_select_buttons = select_buttons,))
		self._mixer.set_enabled(True)
	

	def _setup_instrument(self):
		self._grid_resolution = self.register_disconnectable(GridResolution())
		self._c_instance.playhead.enabled = True
		self._playhead_element = PlayheadElement(self._c_instance.playhead)
		self._playhead_element.reset()

		self._instrument = GTrollCntrlrMonoInstrumentComponent(self, self._skin, grid_resolution = self._grid_resolution, name = 'InstrumentModes')
		self._instrument.shift_button_layer = AddLayerMode(self._instrument, Layer(priority = 5, session_mode_button = self._button[30], shift_mode_button = self._button[31]))
		self._instrument.audioloop_layer = LayerMode(self._instrument, Layer(priority = 4, loop_selector_matrix = self._key_matrix.submatrix[:, :1]))
		self._instrument.keypad_shift_layer = AddLayerMode(self._instrument, Layer(priority = 4, 
									scale_up_button = self._button[31], 
									scale_down_button = self._button[30],
									offset_up_button = self._button[11], 
									offset_down_button = self._button[10],
									vertical_offset_up_button = self._button[9],
									vertical_offset_down_button = self._button[8]))
		self._instrument.drumpad_shift_layer = AddLayerMode(self._instrument, Layer(priority = 4, 
									scale_up_button = self._button[31],
									scale_down_button = self._button[30],
									drum_offset_up_button = self._button[11], 
									drum_offset_down_button = self._button[10],
									drumpad_mute_button = self._button[9],
									drumpad_solo_button = self._button[8]))
		self._instrument._keypad.main_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, keypad_matrix = self._matrix))
		self._instrument._keypad.sequencer_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, playhead = self._playhead_element, keypad_matrix = self._matrix, sequencer_matrix = self._key_matrix.submatrix[:,:1]))
		self._instrument._keypad.split_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, keypad_matrix = self._matrix, split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._keypad.sequencer_shift_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, keypad_matrix = self._matrix, loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], quantization_buttons = self._key_matrix.submatrix[:7, 1:], follow_button = self._button[23]))
		self._instrument._keypad.sequencer_session_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, playhead = self._playhead_element, sequencer_matrix = self._key_matrix.submatrix[:,:1]))
		self._instrument._keypad.split_session_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._keypad.sequencer_session_shift_layer = LayerMode(self._instrument._keypad, Layer(priority = 4, loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], quantization_buttons = self._key_matrix.submatrix[:7, 1:], follow_button = self._button[23]))

		self._instrument._drumpad.main_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, drumpad_matrix = self._matrix))
		self._instrument._drumpad.sequencer_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, playhead = self._playhead_element, drumpad_matrix = self._matrix, sequencer_matrix = self._key_matrix.submatrix[:,:1]))
		self._instrument._drumpad.split_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, drumpad_matrix = self._matrix, split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._drumpad.sequencer_shift_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, drumpad_matrix = self._matrix, loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], quantization_buttons = self._key_matrix.submatrix[:7, 1:], follow_button = self._button[23]))
		self._instrument._drumpad.sequencer_session_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, playhead = self._playhead_element, sequencer_matrix = self._key_matrix.submatrix[:,:1]))
		self._instrument._drumpad.split_session_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, split_matrix = self._key_matrix.submatrix[:16,:1]))
		self._instrument._drumpad.sequencer_session_shift_layer = LayerMode(self._instrument._drumpad, Layer(priority = 4, loop_selector_matrix = self._key_matrix.submatrix[4:8, :1], quantization_buttons = self._key_matrix.submatrix[:7, 1:], follow_button = self._button[23]))

		self._instrument._keypad.matrix_layer = AddLayerMode(self._instrument._keypad, Layer(priority = 4, keypad_matrix = self._matrix))
		self._instrument._drumpad.matrix_layer = AddLayerMode(self._instrument._drumpad, Layer(priority = 4, drumpad_matrix = self._matrix))

		#self._instrument.set_session_mode_button(self._button[30])
		self._instrument.set_enabled(False)
	

	def _setup_modes(self):
		self._instrument.shift_button_layer = AddLayerMode(self._instrument, Layer(priority = 5, session_mode_button = self._button[26], shift_mode_button = self._button[27]))

		self._transport.layer = Layer(priority = 4,
									play_button = self._button[24],
									record_button = self._button[25])
		self._recorder.main_layer = AddLayerMode(self._recorder, Layer(priority = 4, record_button = self._button[25]))
		self._recorder.shift_layer = AddLayerMode(self._recorder, Layer(priority = 4, automation_button = self._button[25]))
		self._session.page_nav_layer = AddLayerMode(self._session, Layer(priority = 4,
									page_down_button = self._button[21],
									page_up_button = self._button[20],
									page_left_button = self._button[22],
									page_right_button = self._button[23]))
		self._session.set_mixer(None)
		super(Cntrlr, self)._setup_modes()


		main_buttons=CompoundMode(self._mixer.main_buttons_layer, self._transport, self._recorder.main_layer, self._device)
		shifted_main_buttons=CompoundMode(self._mixer.mute_buttons_layer, self._recorder.shift_layer, self._session.scene_launch_layer, self._device)
		main_faders=CompoundMode(self._mixer.main_faders_layer, self._mixer.master_fader_layer)
		main_dials=CompoundMode(self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)
		shifted_dials=CompoundMode(self._session.bank_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)

		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', None)
		self._main_modes.add_mode('MixMode', [self._instrument, self._instrument.shift_button_layer, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer, self._session.page_nav_layer])	 # self._session.dial_nav_layer, self._mixer.dial_nav_layer, ])
		self._main_modes.add_mode('ModSwitcher', [main_faders, main_dials, self._mixer.main_knobs_layer, self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on, self._modswitcher, DelayMode(self._update_modswitcher, delay = .1)], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		self._main_modes.add_mode('Translations', [main_faders, main_dials, self._mixer.main_knobs_layer, self._translations, DelayMode(self._translations.selector_layer, delay = .1)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		self._main_modes.add_mode('DeviceSelector', [DelayMode(self._device_selector, delay = .1), DelayMode(self.modhandler.lock_layer, delay = .1), DelayMode(self._device_selector.assign_layer, delay = .2), main_buttons, main_dials, main_faders, self._mixer.main_knobs_layer, self._device, self._device.main_layer, self._device_navigator], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], DeviceSelector_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 
	

	def _setup_modes(self):

		self._instrument.shift_button_layer = AddLayerMode(self._instrument, Layer(priority = 5, session_mode_button = self._button[26], shift_mode_button = self._button[27]))

		self._instrument._keypad._note_sequencer._playhead_component._feedback_channels = [0]
		self._instrument._drumpad._step_sequencer._playhead_component._feedback_channels = [0]

		self._device_navigator.main_layer = AddLayerMode(self._device_navigator, Layer(priority = 4, 
											prev_button = self._encoder_button[8], 
											next_button = self._encoder_button[9], 
											exit_button = self._encoder_button[10], 
											enter_button = self._encoder_button[11],))

		self._session.scene_launch_layer = AddLayerMode(self._session, Layer(priority = 4, 
									stop_all_clips_button = self._button[28],))

		self._transport.layer = Layer(priority = 4,
									play_button = self._button[24],
									record_button = self._button[25])
		self._recorder.main_layer = AddLayerMode(self._recorder, Layer(priority = 4, record_button = self._button[25]))
		self._recorder.shift_layer = AddLayerMode(self._recorder, Layer(priority = 4, automation_button = self._button[25]))

		#self._session.page_nav_layer = AddLayerMode(self._session, Layer(priority = 4,
		#							scene_bank_down_button = self._button[21],
		#							scene_bank_up_button = self._button[20],
		#							track_bank_down_button = self._button[22],
		#							track_bank_up_button = self._button[23]))

		self._session.page_nav_layer = AddLayerMode(self._session, Layer(priority = 4,
									page_down_button = self._button[21],
									page_up_button = self._button[20],
									page_left_button = self._button[22],
									page_right_button = self._button[23]))
		self._session.set_mixer(None)

		main_buttons=CompoundMode(self._mixer.main_buttons_layer, self._transport, self._recorder.main_layer, self._device)
		shifted_main_buttons=CompoundMode(self._mixer.solo_buttons_layer, self._recorder.shift_layer, self._session.scene_launch_layer, self._device)
		main_faders=CompoundMode(self._mixer.main_faders_layer, self._mixer.master_fader_layer)
		main_dials=CompoundMode(self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)
		shifted_dials=CompoundMode(self._session.bank_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)

		main_buttons=CompoundMode(self._mixer.main_buttons_layer, self._transport, self._recorder.main_layer, self._device)
		shifted_main_buttons=CompoundMode(self._mixer.mute_buttons_layer, self._recorder.shift_layer, self._session.scene_launch_layer, self._device)
		main_faders=CompoundMode(self._mixer.main_faders_layer, self._mixer.master_fader_layer)
		main_dials=CompoundMode(self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)
		shifted_dials=CompoundMode(self._session.bank_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on)

		self._modalt_mode = ModesComponent(name = 'ModAltMode')
		self._modalt_mode.add_mode('disabled', None)
		self._modalt_mode.add_mode('enabled', [tuple([self._enable_mod_alt, self._disable_mod_alt])], behaviour = CancellableBehaviourWithRelease, toggle_value = 'Mod.AltOn')
		self._modalt_mode.selected_mode = 'disabled'
		self._modalt_mode.layer = Layer(priority = 4, toggle_button = self._encoder_button[1])
		self._modalt_mode.set_enabled(False)

		self._modswitcher = ModesComponent(name = 'ModSwitcher')  # is_enabled = False)
		self._modswitcher.add_mode('mod', [self.modhandler, self._modalt_mode, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer,	main_dials])
		self._modswitcher.add_mode('instrument', [self._instrument, self._instrument.shift_button_layer, main_buttons, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer]) #self._instrument.shift_button_layer, self._optional_translations])
		self._modswitcher.set_enabled(False)

		self._instrument._main_modes = ModesComponent(name = 'InstrumentModes')
		self._instrument._main_modes.add_mode('disabled', None)
		self._instrument._main_modes.add_mode('drumpad', [self._instrument._drumpad.sequencer_layer, main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_split', [self._instrument._drumpad.split_layer,	main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer', [self._instrument._drumpad.sequencer_layer, main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_shifted', [self._instrument._drumpad.sequencer_shift_layer, self._instrument.drumpad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_split_shifted', [self._instrument._drumpad.split_layer, self._instrument.drumpad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_shifted', [self._instrument._drumpad.sequencer_shift_layer, self._instrument.drumpad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad', [self._instrument._keypad.sequencer_layer, main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad_split', [self._instrument._keypad.split_layer, main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer', [self._instrument._keypad.sequencer_layer, main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad_shifted', [self._instrument._keypad.sequencer_layer, self._instrument.keypad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad_split_shifted', [self._instrument._keypad.split_layer, self._instrument.keypad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_shifted', [self._instrument._keypad.sequencer_shift_layer, self._instrument.keypad_shift_layer, shifted_main_buttons, main_dials])
		self._instrument._main_modes.add_mode('drumpad_session', [self._instrument._drumpad.sequencer_session_layer, main_buttons,	DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('drumpad_split_session', [self._instrument._drumpad.split_session_layer, main_buttons,  DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_session', [self._instrument._drumpad.sequencer_session_layer, main_buttons,   DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('drumpad_shifted_session', [self._instrument._drumpad.sequencer_session_shift_layer, self._instrument.drumpad_shift_layer, main_buttons, self._session_zoom.buttons_layer, shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_split_shifted_session', [self._instrument._drumpad.split_session_layer, self._instrument.drumpad_shift_layer, shifted_main_buttons,	 self._session_zoom.buttons_layer, shifted_dials])
		self._instrument._main_modes.add_mode('drumpad_sequencer_shifted_session', [self._instrument._drumpad.sequencer_session_shift_layer, self._instrument.drumpad_shift_layer, shifted_main_buttons,   self._session_zoom.buttons_layer, shifted_dials])
		self._instrument._main_modes.add_mode('keypad_session', [self._instrument._keypad.sequencer_session_layer, main_buttons, DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('keypad_split_session', [self._instrument._keypad.split_session_layer, main_buttons, DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_session', [self._instrument._keypad.sequencer_session_layer, main_buttons, DelayMode(self._session.clip_launch_layer, delay = .1), main_dials])
		self._instrument._main_modes.add_mode('keypad_shifted_session', [self._instrument._keypad.sequencer_session_shift_layer, self._instrument.keypad_shift_layer, shifted_main_buttons,	  self._session_zoom.buttons_layer, shifted_dials])
		self._instrument._main_modes.add_mode('keypad_split_shifted_session', [self._instrument._keypad.split_session_layer, self._instrument.keypad_shift_layer, shifted_main_buttons,	  self._session_zoom.buttons_layer, shifted_dials])
		self._instrument._main_modes.add_mode('keypad_sequencer_shifted_session', [self._instrument._keypad.sequencer_session_shift_layer, self._instrument.keypad_shift_layer, shifted_main_buttons,	self._session_zoom.buttons_layer, shifted_dials])

		self._instrument._main_modes.add_mode('audioloop', [self._instrument.audioloop_layer, main_buttons, main_dials, DelayMode(DelayMode(self._session.clip_launch_layer, delay = .1))])
		self._instrument._main_modes.add_mode('audioloop_shifted', [self._instrument.audioloop_layer, shifted_main_buttons, main_dials, self._session_zoom.buttons_layer, shifted_dials])
		#self._instrument._main_modes.add_mode('audioloop_shifted_session', [self._instrument.audioloop_layer, self._session, shifted_main_buttons, main_dials, self._session_zoom.buttons_layer, shifted_dials])
		self._instrument.register_component(self._instrument._main_modes)
		self._instrument.set_enabled(False)

		#self._main_modes = ModesComponent(name = 'MainModes')
		#self._main_modes.add_mode('disabled', None)
		#self._main_modes.add_mode('MixMode', [self._instrument, self._instrument.shift_button_layer, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer, self._session.page_nav_layer])	 # self._session.dial_nav_layer, self._mixer.dial_nav_layer, ])
		#self._main_modes.add_mode('ModSwitcher', [main_faders, main_dials, self._mixer.main_knobs_layer, self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on, self._modswitcher, DelayMode(self._update_modswitcher)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		#self._main_modes.add_mode('ModSwitcher', [main_faders, main_dials, self._mixer.main_knobs_layer, self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on, self._modswitcher, DelayMode(self._update_modswitcher, delay = .1)], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		#self._main_modes.add_mode('Translations', [main_faders, main_dials, self._mixer.main_knobs_layer, self._translations, DelayMode(self._translations.selector_layer, delay = .1)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		#self._main_modes.add_mode('DeviceSelector', [DelayMode(self._device_selector, delay = .1), DelayMode(self.modhandler.lock_layer, delay = .1), DelayMode(self._device_selector.assign_layer, delay = .2), main_buttons, main_dials, main_faders, self._mixer.main_knobs_layer, self._device, self._device.main_layer, self._device_navigator], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		#self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], DeviceSelector_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 

		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', None)
		self._main_modes.add_mode('MixMode', [self._instrument, self._instrument.shift_button_layer, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer, self._session.page_nav_layer])	 # self._session.dial_nav_layer, self._mixer.dial_nav_layer, ])
		self._main_modes.add_mode('ModSwitcher', [main_faders, main_dials, self._mixer.main_knobs_layer, self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on, self._modswitcher, DelayMode(self._update_modswitcher, delay = .1)], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		self._main_modes.add_mode('Translations', [main_faders, main_dials, self._mixer.main_knobs_layer, self._translations, DelayMode(self._translations.selector_layer, delay = .1)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		self._main_modes.add_mode('DeviceSelector', [DelayMode(self._device_selector, delay = .1), DelayMode(self.modhandler.lock_layer, delay = .1), DelayMode(self._device_selector.assign_layer, delay = .2), main_buttons, main_dials, main_faders, self._mixer.main_knobs_layer, self._device, self._device.main_layer, self._device_navigator], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], DeviceSelector_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 


	def set_feedback_channels(self, *a, **k):
		pass
	

#	a