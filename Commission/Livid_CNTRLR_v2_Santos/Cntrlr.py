# by amounra 0916 : http://www.aumhaa.com
# written against Live 9.7b7 release on 091116

from __future__ import absolute_import, print_function
import Live
import time
import math
import sys
from itertools import count
import logging
logger = logging.getLogger(__name__)

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
from pushbase.percussion_instrument_finder import PercussionInstrumentFinder, find_drum_group_device
from pushbase.drum_group_component import DrumGroupComponent

"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *
from .ModDevices import *
from .Map import *

from Livid_CNTRLR_v2.Cntrlr import Cntrlr as Base_Cntrlr, CntrlrSessionNavigationComponent

debug = initialize_debug()

def log_flattened_arguments(*a, **k):
	args = ''
	for item in a:
		args = args + str(item) + ' '
	logger.info(args)


debug = log_flattened_arguments


def enumerate_track_device(track):
	devices = []
	if hasattr(track, 'devices'):
		for device in track.devices:
			devices.append(device)
			if device.can_have_chains:
				for chain in device.chains:
					for chain_device in enumerate_track_device(chain):
						devices.append(chain_device)
	return devices



class SpecialClipSlotComponent(ClipSlotComponent):


	def _do_launch_clip(self, fire_state, *a, **k):
		super(SpecialClipSlotComponent, self)._do_launch_clip(fire_state, *a, **k)
		if fire_state:
			track = None if not self._clip_slot else self._clip_slot.canonical_parent
			paired_track = None
			if track and track.name == 'Group A1':
				clip_index = [clip_slot for clip_slot in track.clip_slots].index(self._clip_slot)
				for t in self.song.visible_tracks:
					if t.name == 'Group A2':
						paired_track = t
						break
			elif track and track.name == 'Group A2':
				clip_index = [clip_slot for clip_slot in track.clip_slots].index(self._clip_slot)
				for t in self.song.visible_tracks:
					if t.name == 'Group A1':
						paired_track = t
						break
			paired_track and paired_track.clip_slots[clip_index].fire()
	

	def _feedback_value(self, track, slot_or_clip):
		if self._clip_slot != None:
			#track = self._clip_slot.canonical_parent
			#slot_or_clip = self._clip_slot.clip if self.has_clip() else self._clip_slot
			if slot_or_clip.is_triggered:
				return self._triggered_to_record_color if slot_or_clip.will_record_on_start else self._triggered_to_play_color
			if slot_or_clip.is_playing:
				return self._recording_color if slot_or_clip.is_recording else self._started_value
			if slot_or_clip.color != None:
				if track.name in ('Group A1', 'Group A2'):
					return 'Session.GroupA_Stopped'
				elif track.name == 'Group B':
					return 'Session.GroupB_Stopped'
				elif track.name == 'Group C':
					return 'Session.GroupC_Stopped'
				else:
					return self._color_value(slot_or_clip)
			if getattr(slot_or_clip, 'controls_other_clips', True):
				if track.name in ('Group A1', 'Group A2'):
					return 'Session.GroupA_Stopped'
				elif track.name == 'Group B':
					return 'Session.GroupB_Stopped'
				elif track.name == 'Group C':
					return 'Session.GroupC_Stopped'
 				elif self._stopped_color != None:
					return self._stopped_color
			if self._track_is_armed(track) and self._clip_slot.has_stop_button and self._record_button_color != None:
				return self._record_button_color
			return self._empty_slot_color
	


class SpecialSceneComponent(SceneComponent):


	clip_slot_component_type = SpecialClipSlotComponent

	def test_function(self):
		pass
	


class SpecialCntrlrSessionComponent(SessionComponent):


	scene_component_type = SpecialSceneComponent

	def set_clip_launch_buttons(self, buttons):
		if buttons:
			for button, (x, y) in buttons.iterbuttons():
				scene = self.scene(y)
				slot = scene.clip_slot(x)
				slot.set_launch_button(button)

		else:
			for x, y in product(xrange(self._session_ring.num_tracks), xrange(self._session_ring.num_scenes)):
				scene = self.scene(y)
				slot = scene.clip_slot(x)
				slot.set_launch_button(None)
	

	def set_scene_launch_buttons(self, buttons):
		assert( not buttons or (buttons.height() == self._session_ring.num_scenes and buttons.width() == 1) )
		if buttons:
			for button, (_, y) in buttons.iterbuttons():
				scene = self.scene(y)
				scene.set_launch_button(button)

		else:
			for x in xrange(self._session_ring.num_scenes ):
				scene = self.scene(x)
				scene.set_launch_button(None)
	



class ToggleDeviceEnabledComponent(DeviceSelectorComponent):


	def __init__(self, *a, **k):
		self._primary_devices = [None for index in range(8)]
		self._device_registry = [[] for index in range(8)]
		self._colors = [[1, 5], [1, 4], [1, 6], [1, 7], [1, 5], [1, 4], [1, 6], [1, 7]]
		super(ToggleDeviceEnabledComponent, self).__init__(*a, **k)
	

	def scan_all(self):
		debug('scan all--------------------------------')
		self._device_registry = [[] for index in range(8)]
		prefix = str(self._prefix)+':'
		offset = self._offset
		preset = None
		tracks = self.song.tracks + self.song.return_tracks + tuple([self.song.master_track])
		for track in tracks:
			for device in enumerate_track_device(track):
				for index, entry in enumerate(self._device_registry):
					key = str(prefix + str(index + 1 + offset))
					if device.name.startswith(key+' ') or device.name == key:
						self._device_registry[index].append(device)
					elif (device.name.startswith('*' +key+' ') or device.name == ('*' +key))  and device.can_have_chains and len(device.chains) and len(device.chains[0].devices):
						self._device_registry[index].append(device.chains[0].devices[0])
		#self.update()
	

	def select_device(self, index):
		if self.is_enabled():
			preset = []
			if index < len(self._device_registry):
				preset = self._device_registry[index] 
			if len(preset):
				old_value = isinstance(preset[0], Live.Device.Device) and preset[0].parameters[0].value
				for device in preset:
					if isinstance(device, Live.Device.Device):
						device.parameters[0].value = int(not old_value)
			self.update()
	

	def update(self):
		debug('toggler update')
		if self.is_enabled():
			if len(self._device_registry) != len(self._buttons):
				self.scan_all()
			self._primary_devices = [None for index in range(8)]
			for index in range(len(self._device_registry)):
				entry = self._device_registry[index]
				if not entry is None and len(entry):
					self._primary_devices[index] = entry[0].parameters[0]
			debug('primary devices', self._primary_devices)
			self._on_on_off_value_changed.replace_subjects(subjects = self._primary_devices)
			self._on_on_off_value_changed()
	

	@listens_group('value')
	def _on_on_off_value_changed(self, value = None):
		for index, button in enumerate(self._buttons):
			debug('on on off:', button, index)
			color = 0 if self._primary_devices[index] is None else self._colors[index][int(self._primary_devices[index].value)]
			button and button.send_value(color)
	



class Cntrlr(Base_Cntrlr):


	def __init__(self, *a, **k):
		super(Cntrlr, self).__init__(*a, **k)
		self._skin = Skin(CntrlrColors)
		for button in self._grid:
			button._skin = self._skin
		self._main_modes.selected_mode = 'Translations'
		self.schedule_message(3, self.initialize_translations)
	

	def initialize_santos_mode(self):
		self._main_modes.selected_mode = 'SantosMode'
		self._device_toggle.scan_all()
		self._session_ring.set_offsets(1, 0)
	

	def initialize_translations(self):
		self._main_modes.selected_mode = "Translations"
		self.schedule_message(3, self.initialize_santos_mode)
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " for Santos Garcia " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_device_toggle(self):
		self._device_toggle = ToggleDeviceEnabledComponent(self, "@dd")
		self._device_toggle.layer = Layer(priority = 9,  matrix = self._key_matrix.submatrix[4:12, 1:])
		self._device_toggle.set_enabled(False)
	

	def _update_session_position(self):
		self._session_ring.set_offsets(1, 0)
	

	def _setup_mixer_control(self):
		self._mixer = MonoMixerComponent(name = 'Mixer', num_returns = 4,tracks_provider = SessionRingComponent(num_tracks = 4, num_scenes = 4), track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)

		if FREE_ENCODER_IS_CROSSFADER:
			self._mixer.layer = Layer(priority = 4, crossfader_control = self._encoder[1])
		self._mixer.main_faders_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											volume_controls = self._fader_matrix.submatrix[:4, :],
											return_controls = self._fader_matrix.submatrix[4:, :],))
		self._mixer.main_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4, 
											mute_buttons = self._key_matrix.submatrix[8:12, 1:],
											stop_clip_buttons = self._key_matrix.submatrix[4:8, 1:],
											arming_track_select_buttons = self._key_matrix.submatrix[:4, 1:],))
		self._mixer.solo_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											solo_buttons = self._key_matrix.submatrix[8:12, 1:],))
		self._mixer.shifted_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											track_select_buttons = self._key_matrix.submatrix[:4, 1:],
											stop_clip_buttons = self._key_matrix.submatrix[4:8, 1:],
											solo_buttons = self._key_matrix.submatrix[8:12, 1:],))
		self._mixer.stop_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											stop_clip_buttons = self._key_matrix.submatrix[8:12, 1:],))
		if EQS_INSTEAD_OF_MACROS:
			self._mixer.main_knobs_layer = AddLayerMode(self._mixer, Layer(priority = 4,
												send_controls = self._knob_left_matrix,
												eq_gain_controls = self._knob_right_matrix))
		else:
			self._mixer.main_knobs_layer = AddLayerMode(self._mixer, Layer(priority = 4,
												send_controls = self._knob_left_matrix,
												parameter_controls = self._knob_right_matrix))
		#self._mixer.main_knobs_layer = AddLayerMode(self._mixer, Layer(priority = 4))
		self._mixer.master_fader_layer = AddLayerMode(self._mixer.master_strip(), Layer(priority = 4,
											volume_control = self._fader[7]))
		self._mixer.instrument_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											mute_buttons = self._key_matrix.submatrix[:4, 1:],
											track_select_buttons = self._key_matrix.submatrix[4:8, 1:],))
		self._mixer.set_enabled(False)
	

	def _setup_session_control(self):
		self._session_ring = SessionRingComponent(num_tracks = 3, num_scenes = 4)
		self._session_ring.set_enabled(False)


		self._session_navigation = CntrlrSessionNavigationComponent(name = 'SessionNavigation', session_ring = self._session_ring)

		self._session_navigation._vertical_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'

		self._session_navigation.bank_dial_layer = AddLayerMode(self._session_navigation, Layer(priority = 5, 
									track_bank_dial = self._encoder[3], 
									scene_bank_dial = self._encoder[2],))
		self._session_navigation.nav_dial_layer = AddLayerMode(self._session_navigation, Layer(priority = 5,
									scene_nav_dial = self._encoder[2],
									track_nav_dial = self._encoder[3],))
		self._session_navigation.select_dial_layer = AddLayerMode(self._session_navigation, Layer(priority = 5))
		"""self._session_navigation.nav_layer = AddLayerMode(self._session_navigation, Layer(priority = 4,
									page_down_button = self._button[14],
									page_up_button = self._button[15],
									page_left_button = self._button[12],
									page_right_button = self._button[13]))"""
		self._session_navigation.nav_layer = AddLayerMode(self._session_navigation, Layer(priority = 4))

		self._session_navigation.set_enabled(False)

		self._session = SpecialCntrlrSessionComponent(session_ring = self._session_ring, auto_name = True)
		hasattr(self._session, '_enable_skinning') and self._session._enable_skinning()
		self._session.clip_launch_layer = LayerMode(self._session, Layer(priority = 4,
									clip_launch_buttons = self._matrix.submatrix[:,:]))
		self._session.scene_launch_layer = AddLayerMode(self._session._selected_scene, Layer(priority = 4, 
									launch_button = self._button[28],))
		self._session.set_enabled(False)

		self._session_zoom = SessionOverviewComponent(name = 'SessionZoom', session_ring = self._session_ring, enable_skinning = True)
		self._session_zoom.layer = Layer(priority = 4, button_matrix = self._matrix.submatrix[:,:])

		self._session.clip_launch_layer = LayerMode(self._session, Layer(priority = 4,
									clip_launch_buttons = self._matrix.submatrix[:3,:],
									scene_launch_buttons = self._matrix.submatrix[3:,:]))
		self._session_ring.set_offsets(1, 0)

		self._session_zoom.set_enabled(False)
	

	def _setup_translations2(self):
		self._translated_controls2 = self._knobs  #+ self._button[:20] + self._button[28:]

		self._translations2 = TranslationComponent(self._translated_controls2, user_channel_offset = 9, channel = 9)
		self._translations2.name = 'TranslationComponent'
		self._translations2.layer = Layer(priority = 10,)
		self._translations2.set_enabled(False)
	

	def _setup_modes(self):

		self._setup_device_toggle()
		self._setup_translations2()

		self._mixer.santos_buttons_layer = AddLayerMode(self._mixer, Layer(priority = 4,
											arming_track_select_buttons = self._key_matrix.submatrix[:4, 1:],))

		super(Cntrlr, self)._setup_modes()

		common = CompoundMode(self._mixer,
									self._session_ring)
		main_buttons=CompoundMode(self._mixer.main_buttons_layer, 
									self._transport,
									self._recorder,
									self._recorder.main_layer, 
									self._device,
									self._device.button_layer)
		shifted_main_buttons=CompoundMode(self._mixer.solo_buttons_layer, 
									self._recorder, 
									self._recorder.shift_layer,
									self._session,
									self._session.scene_launch_layer,
									self._device,
									self._device.button_layer)
		main_faders=CompoundMode(self._mixer.main_faders_layer, 
									self._mixer.master_fader_layer)
		main_dials=CompoundMode(self._view_control,
									self._view_control.main_layer,
									self._device,
									self._device.dial_layer,
									self._device_navigator.select_dial_layer, 
									self.encoder_navigation_on)
		shifted_dials=CompoundMode(self._session_navigation,
									self._session_navigation.nav_dial_layer,
									self._device,
									self._device.dial_layer,
									self._device_navigator.select_dial_layer,
									self.encoder_navigation_on)



		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', [self._background])
		self._main_modes.add_mode('MixMode', [common, 
													self._instrument, 
													self._instrument.shift_button_layer,
													self._mixer,
													main_faders, 
													self._mixer.main_knobs_layer,
													self._device,
													self._device_navigator,
													self._device_navigator.main_layer,],
													behaviour = DefaultedBehaviour(default_mode = 'SantosMode',color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.add_mode('ModSwitcher', [common,
													main_faders, 
													main_dials, 
													self._mixer.main_knobs_layer, 
													self._session_navigation.select_dial_layer, 
													self._view_control,
													self._view_control.main_layer, 
													self._device_navigator.select_dial_layer, 
													self.encoder_navigation_on, self._modswitcher, 
													DelayMode(self._update_modswitcher, delay = .1)], 
													behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		self._main_modes.add_mode('Translations', [common, 
													main_faders, 
													main_dials,
													self._mixer.main_knobs_layer, 
													self._translations, 
													DelayMode(self._translations.selector_layer, delay = .1)], 
													behaviour = DefaultedBehaviour(default_mode = 'SantosMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		self._main_modes.add_mode('DeviceSelector', [common,
													self._device_selector,
													DelayMode(self._device_selector.select_layer, delay = .1),
													DelayMode(self.modhandler.lock_layer, delay = .1),
													DelayMode(self._device_selector.assign_layer, delay = .5), 
													main_buttons, 
													main_dials, 
													main_faders, 
													self._mixer.main_knobs_layer, 
													self._device,
													self._device_navigator], 
													behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		self._main_modes.add_mode('SantosMode', [self._mixer, 
													self._mixer.main_faders_layer, 
													self._device_toggle, 
													self._translations2, 
													self._instrument, 
													self._instrument.shift_button_layer, 
													self._mixer.santos_buttons_layer, 
													self._device, self._device_navigator, 
													self._session_ring, 
													DelayMode(self._update_session_position, delay = .1)], )

		self._main_modes.layer = Layer(priority = 4, ModSwitcher_button = self._encoder_button[2], MixMode_button = self._encoder_button[0], Translations_button = self._encoder_button[3]) #, 
		self._main_modes.selected_mode = 'disabled'
		self._main_modes.set_enabled(True)	

	



#	a