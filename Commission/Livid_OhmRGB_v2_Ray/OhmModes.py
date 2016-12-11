# by amounra 1216 : http://www.aumhaa.com
# written against Live 9.7.1 release on 120716

from __future__ import absolute_import, print_function
import Live
import math
import sys
from re import *
from itertools import imap, chain, starmap, izip, izip_longest

from ableton.v2.base import inject, listens, listens_group
from ableton.v2.control_surface import ControlSurface, ControlElement, Layer, Skin, PrioritizedResource, Component, ClipCreator, DeviceBankRegistry
from ableton.v2.control_surface.elements import EncoderElement, ButtonMatrixElement, DoublePressElement, MultiElement, DisplayDataSource, SysexElement
from ableton.v2.control_surface.components import DrumGroupComponent, SessionOverviewComponent, M4LInterfaceComponent, ClipSlotComponent, SceneComponent, SessionComponent, TransportComponent, BackgroundComponent, ViewControlComponent, SessionRingComponent, SessionRecordingComponent, SessionNavigationComponent, MixerComponent, PlayableComponent
from ableton.v2.control_surface.components.mixer import simple_track_assigner
from ableton.v2.control_surface.mode import AddLayerMode, ModesComponent, DelayMode
from ableton.v2.control_surface.elements.physical_display import PhysicalDisplayElement
from ableton.v2.control_surface.components.session_recording import *

from ableton.v2.control_surface.control import PlayableControl, ButtonControl, control_matrix

from aumhaa.v2.base import initialize_debug
from aumhaa.v2.control_surface import SendLividSysexMode, MomentaryBehaviour, ExcludingMomentaryBehaviour, DelayedExcludingMomentaryBehaviour, ShiftedBehaviour, LatchingShiftedBehaviour, FlashingBehaviour, DefaultedBehaviour, CancellableBehaviourWithRelease
from aumhaa.v2.control_surface.mod_devices import *
from aumhaa.v2.control_surface.mod import *
from aumhaa.v2.control_surface.elements import MonoEncoderElement, MonoBridgeElement, generate_strip_string
from aumhaa.v2.control_surface.elements.mono_button import *
from aumhaa.v2.control_surface.components import MonoKeyGroupComponent, MonoDrumGroupComponent, MonoDeviceComponent, DeviceNavigator, TranslationComponent, MonoMixerComponent
from aumhaa.v2.control_surface.components.device import DeviceComponent
from aumhaa.v2.control_surface.components.mono_instrument import *
from aumhaa.v2.livid import LividControlSurface, LividSettings, LividRGB
from aumhaa.v2.control_surface.components.fixed_length_recorder import FixedLengthSessionRecordingComponent
from aumhaa.v2.control_surface.components.device import DeviceComponent

from Livid_OhmModes_v2.OhmModes import *

from .Map import *

debug = initialize_debug()

TEMPO_TOP = 200.0
TEMPO_BOTTOM = 60.0
MIDI_NOTE_TYPE = 0
MIDI_CC_TYPE = 1
MIDI_PB_TYPE = 2
MIDI_MSG_TYPES = (MIDI_NOTE_TYPE, MIDI_CC_TYPE, MIDI_PB_TYPE)
MIDI_NOTE_ON_STATUS = 144
MIDI_NOTE_OFF_STATUS = 128
MIDI_CC_STATUS = 176
MIDI_PB_STATUS = 224


class SpecialOhmSessionComponent(OhmSessionComponent):


	def _update_stop_clips_led(self, index):
		tracks_to_use = self._session_ring.tracks_to_use()
		track_index = index + self._session_ring.track_offset
		if self.is_enabled() and self._stop_track_clip_buttons != None and index < len(self._stop_track_clip_buttons):
			button = self._stop_track_clip_buttons[index]
			if button != None:
				value_to_send = None
				if track_index < len(tracks_to_use) and tracks_to_use[track_index].clip_slots:
					track = tracks_to_use[track_index]
					if track.fired_slot_index == -2:
						value_to_send = self._stop_clip_triggered_value
					elif track.playing_slot_index >= 0:
						value_to_send = self._stop_clip_value
				if value_to_send == None:
					button.set_light('Session.StopClip')
				elif in_range(value_to_send, 0, 128):
					button.send_value(value_to_send)
				else:
					button.set_light(value_to_send)
	

	def _update_stop_all_clips_button(self):
		if self.is_enabled():
			button = self._stop_all_button
			if button:
				button.set_light('Session.StopClipTriggered' if button.is_pressed() else 'Session.StopClip')
	


class OhmModesRay(OhmModes):


	_sysex_id = 2
	_alt_sysex_id = 7
	_model_name = 'Ohm'
	_version_check = 'b996'
	_host_name = 'Ohm'
	device_provider_class = ModDeviceProvider

	def __init__(self, c_instance):
		super(OhmModes, self).__init__(c_instance)
		self._skin = Skin(OhmColors)
		with self.component_guard():
			self._define_sysex()
			self._setup_controls()
			self._setup_background()
			self._setup_m4l_interface()
			#self._setup_translations()
			self._setup_session_control()
			self._setup_mixer_control()
			#self._setup_device_control()
			#self._setup_transport_control()
			#self._setup_drumgroup()
			#self._setup_keygroup()
			#self._setup_bassgroup()
			#self._setup_mod()
			#self._setup_modswitcher()
			self._setup_modes()
		#self._on_device_changed.subject = self._device_provider
	

	def _setup_session_control(self):
		self._session_ring = SessionRingComponent(num_tracks = 7, num_scenes = 7)
		self._session_ring.set_enabled(True)

		self._session_navigation = SessionNavigationComponent(session_ring = self._session_ring)
		self._session_navigation.scroll_navigation_layer = AddLayerMode(self._session_navigation, Layer(priority = 5, up_button = self._menu[1], down_button = self._menu[4], left_button = self._menu[3], right_button = self._menu[5]))
		self._session_navigation.page_navigation_layer = AddLayerMode(self._session_navigation, Layer(priority = 5, page_up_button = self._menu[2], page_down_button = self._menu[5], page_left_button = self._menu[3], page_right_button = self._menu[4]))
		self._session_navigation._vertical_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_up_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._horizontal_banking.scroll_down_button.color = 'Session.NavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._vertical_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_up_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation._horizontal_paginator.scroll_down_button.color = 'Session.PageNavigationButtonOn'
		self._session_navigation.set_enabled(False)

		self._session = SpecialOhmSessionComponent(name = 'Session', session_ring = self._session_ring, auto_name = True)
		self._session.set_enabled(False)
		self._session.clip_launch_layer = AddLayerMode(self._session, Layer(priority = 5,  clip_launch_buttons = self._matrix.submatrix[:7,:7]))
		self._session.scene_launch_layer = AddLayerMode(self._session, Layer(priority = 5,  scene_launch_buttons = self._matrix.submatrix[7,:7]))
		self._session.stop_clips_layer = AddLayerMode(self._session, Layer(priority = 5,  stop_track_clip_buttons = self._matrix.submatrix[:7,7], stop_all_clips_button = self._grid[7][7]))

		"""self._session_zoom = SessionOverviewComponent(name = 'Session_Overview', session_ring = self._session_ring, enable_skinning = True)
		self._session_zoom.layer = Layer(priority = 5, button_matrix = self._matrix.submatrix[:7,:7])
		self._session_zoom.set_enabled(False)

		self._session_modes = ModesComponent(name = 'Session_Modes')
		self._session_modes.add_mode('disabled', [self._session, 
														self._session.clip_launch_layer, 
														self._session.scene_launch_layer, 
														self._session_navigation, 
														self._session_navigation.scroll_navigation_layer])
		self._session_modes.add_mode('enabled', [self._session, 
														self._session.scene_launch_layer, 
														self._session_zoom, 
														self._session_navigation, 
														self._session_navigation.page_navigation_layer],  
														behaviour = DefaultedBehaviour())
		self._session_modes.layer = Layer(priority = 5, enabled_button = self._grid[7][7])
		self._session_modes.selected_mode = 'disabled'
		self._session_modes.set_enabled(False)"""
		
	

	def _setup_mixer_control(self):
		self._mixer = OhmMixerComponent(name = 'Mixer', tracks_provider = self._session_ring, track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)
		#self._mixer.layer = Layer(priority = 5, volume_controls = self._fader_matrix.submatrix[:7, :], prehear_volume_control = self._dial[15], crossfader_control = self._crossfader)
		self._mixer.layer = Layer(priority = 5, solo_buttons = self._button_matrix.submatrix[:7,:])
		"""self._mixer.master_strip().layer = Layer(priority = 5, volume_control = self._fader[7], select_button = self._button[7])
		self._mixer.mix_layer = AddLayerMode(self._mixer, Layer(priority = 5, mute_buttons = self._matrix.submatrix[:7,5], 
													solo_buttons = self._matrix.submatrix[:7,6], 
													arm_buttons = self._matrix.submatrix[:7,7], 
													send_controls = self._dial_matrix.submatrix[:,:2],
													pan_controls = self._dial_matrix.submatrix[:7,2:],
													track_select_buttons = self._button_matrix.submatrix[:7,:],))
		self._mixer.dj_layer = AddLayerMode(self._mixer, Layer(priority = 5, mute_buttons = self._matrix.submatrix[:7,5],
													crossfade_toggles = self._matrix.submatrix[:7,6],
													end_pan_controls = self._dial_matrix.submatrix[:3,3],
													eq_gain_controls = self._dial_matrix.submatrix[:,:3],
													track_select_buttons = self._button_matrix.submatrix[:7,:],))
		self._mixer.instrument_layer = AddLayerMode(self._mixer, Layer(priority = 5, 
													instrument_send_controls = self._dial_matrix.submatrix[:,2:],
													arming_track_select_buttons = self._button_matrix.submatrix[:7,:]))
		"""
	

	def _setup_modes(self):

		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', [self._background])
		self._main_modes.add_mode('Mix', [self._mixer, self._session, self._session.stop_clips_layer, self._session.clip_launch_layer, self._session.scene_launch_layer, self._session_navigation, self._session_navigation.scroll_navigation_layer])

		self._main_modes.selected_mode = 'disabled'
		self._main_modes.set_enabled(True)
	
