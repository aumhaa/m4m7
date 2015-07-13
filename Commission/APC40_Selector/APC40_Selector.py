from __future__ import with_statement
from functools import partial

import Live

from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ChannelTranslationSelector import ChannelTranslationSelector
from _Framework.ControlSurface import ControlSurface, OptimizedControlSurface
from _Framework.DeviceComponent import DeviceComponent
from _Framework.Layer import Layer
from _Framework.ModesComponent import ModesComponent
from _Framework.Resource import PrioritizedResource
from _Framework.SessionZoomingComponent import SessionZoomingComponent #as SessionZoomingComponentBase
from _Framework.Skin import merge_skins
from _Framework.Util import nop
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.SceneComponent import SceneComponent
from _Framework.ClipSlotComponent import ClipSlotComponent


from _Framework.EncoderElement import EncoderElement
from _Framework.SliderElement import SliderElement
from _Framework.ButtonElement import ButtonElement, Color
from _Framework.InputControlElement import InputControlElement, MIDI_NOTE_TYPE, MIDI_CC_TYPE

from _Framework.ModesComponent import DelayMode, AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *
from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext

from _Framework.Skin import Skin

from _APC.APC import APC
from _APC.ControlElementUtils import make_pedal_button, make_slider, make_knob, make_encoder
from _APC.DeviceBankButtonElement import DeviceBankButtonElement
from _APC.DeviceComponent import DeviceComponent
from _APC.MixerComponent import MixerComponent
from _APC.SkinDefault import make_default_skin, make_biled_skin
from _APC.DetailViewCntrlComponent import DetailViewCntrlComponent
from _APC.RingedEncoderElement import RingedEncoderElement

from APC40.APC40 import APC40
from APC40.TransportComponent import TransportComponent
from APC40.SessionComponent import SessionComponent


from _Mono_Framework.Debug import *

debug = initialize_debug()

SESSION_WIDTH = 8
SESSION_HEIGHT = 5
MIXER_SIZE = 8
FALLBACK_CONTROL_OWNER_PRIORITY = -1



GREEN = Color(1)
GREEN_BLINK = Color(2)
RED = Color(3)
RED_BLINK = Color(4)
AMBER = Color(5)
AMBER_BLINK = Color(6)

class BiLedColors:


	class Session:
		ClipStopped = AMBER
		ClipStarted = GREEN
		ClipRecording = RED
		ClipTriggeredPlay = GREEN
		ClipTriggeredRecord = RED
		ClipSelected = AMBER_BLINK
		ClipSelectedRecording = RED_BLINK
		ClipSelectedPlaying = GREEN_BLINK
		ClipEmpty = Color(0)
		Scene = Color(0)
		SceneTriggered = GREEN_BLINK
		NoScene = Color(0)
		StopClip = Color(0)
		StopClipTriggered = GREEN_BLINK
		RecordButton = Color(0)
	

	class Zooming:
		Selected = AMBER
		Stopped = RED
		Playing = GREEN
		Empty = Color(0)
	

def make_biled_skin():
	return Skin(BiLedColors)



class SelectingClipSlotComponent(ClipSlotComponent):


	def __init__(self, script = None, *a, **k):
		self._script = script
		self._clip_selected_play_value = 'Session.ClipSelectedPlaying'
		self._clip_selected_record_value = 'Session.ClipSelectedRecording'
		self._clip_selected_value = 'Session.ClipSelected'
		super(SelectingClipSlotComponent, self).__init__(*a, **k)
		self._on_selected_track_changed.subject = self.song().view
		self._on_selected_scene_changed.subject = self.song().view
	

	def _do_launch_clip(self, value):
		if value and self._clip_slot:
			self.song().view.highlighted_clip_slot =  self._clip_slot
	

	def _feedback_value(self):
		if self._clip_slot != None:
			if self._clip_slot == self.song().view.highlighted_clip_slot:
				track = self._clip_slot.canonical_parent
				slot_or_clip = self._clip_slot.clip if self.has_clip() else self._clip_slot
				if slot_or_clip.is_triggered:
					return self._clip_selected_record_value if slot_or_clip.will_record_on_start else self._clip_selected_play_value
				elif slot_or_clip.is_playing:
					return self._clip_selected_record_value if slot_or_clip.is_recording else self._clip_selected_play_value
				else:
					return self._clip_selected_value
			else:
				track = self._clip_slot.canonical_parent
				slot_or_clip = self._clip_slot.clip if self.has_clip() else self._clip_slot
				if slot_or_clip.is_triggered:
					return self._triggered_to_record_value if slot_or_clip.will_record_on_start else self._triggered_to_play_value
				elif slot_or_clip.is_playing:
					return self._recording_value if slot_or_clip.is_recording else self._started_value
				elif slot_or_clip.color != None:
					return self._color_value(slot_or_clip.color)
				elif getattr(slot_or_clip, 'controls_other_clips', True) and self._stopped_value != None:
					return self._stopped_value
				elif self._track_is_armed(track) and self._clip_slot.has_stop_button:
					if self._record_button_value != None:
						return self._record_button_value
	

	@subject_slot('selected_track')
	def _on_selected_track_changed(self):
		self.update()
	

	@subject_slot('selected_scene')
	def _on_selected_scene_changed(self):
		self.update()
	


class SelectingSceneComponent(SceneComponent):


	clip_slot_component_type = SelectingClipSlotComponent

	def __init__(self, script = None, *a, **k):
		self._script = script
		super(SelectingSceneComponent, self).__init__(*a, **k)
	

	def _create_clip_slot(self):
		return self.clip_slot_component_type(self._script)
	


class SelectingSessionComponent(SessionComponent):


	scene_component_type = SelectingSceneComponent

	def __init__(self, script = None, *a, **k):
		self._script = script
		super(SelectingSessionComponent, self).__init__(*a, **k)
	

	def _create_scene(self):
		return self.scene_component_type(script = self._script, num_slots=self._num_tracks, tracks_to_use_callback=self.tracks_to_use)
	

	def on_enabled_changed(self):
		super(SelectingSessionComponent, self).on_enabled_changed()
		debug('session enabled:', self.name, self.is_enabled())
	


class APC40_Selector(APC40):



	def __init__(self, *a, **k):
		super(APC40, self).__init__(*a, **k)
		self._color_skin = make_biled_skin()
		self._default_skin = make_default_skin()
		with self.component_guard():
			self._create_controls()
			self._create_session()
			self._create_alt_session()
			self._create_mixer()
			self._create_device()
			self._create_detail_view_control()
			self._create_transport()
			self._create_global_control()
			self._create_session_switcher()
			self._create_delete_component()
			self._create_fallback_control_owner()
			self._session.set_mixer(self._mixer)
			self._alt_session.set_mixer(self._mixer)
			self.set_highlighting_session_component(self._session)
			self.set_device_component(self._device)
			for component in self.components:
				component.set_enabled(False)

		self._device_selection_follows_track_selection = True
	

	def _on_handshake_successful(self):
		self._suppress_session_highlight = False
		for component in self.components:
			if hasattr(component, 'name') and not (component.name.endswith('Session_Control') or component.name.endswith('Session_Overview')):
				component.set_enabled(True)

		self._on_selected_track_changed()
		self._do_combine()
	

	def _create_session(self):
		self._session = SessionComponent(SESSION_WIDTH, SESSION_HEIGHT, auto_name=True, enable_skinning=True, is_enabled=False, layer=Layer(track_bank_left_button=self._left_button, track_bank_right_button=self._right_button, scene_bank_up_button=self._up_button, scene_bank_down_button=self._down_button, stop_all_clips_button=self._stop_all_button, stop_track_clip_buttons=self._track_stop_buttons, scene_launch_buttons=self._scene_launch_buttons, clip_launch_buttons=self._session_matrix, slot_launch_button=self._selected_slot_launch_button, selected_scene_launch_button=self._selected_scene_launch_button))
		self._session_zoom = SessionZoomingComponent(self._session, name='Session_Overview', enable_skinning=True, is_enabled=False, layer=Layer(button_matrix=self._shifted_matrix, nav_up_button=self._with_shift(self._up_button), nav_down_button=self._with_shift(self._down_button), nav_left_button=self._with_shift(self._left_button), nav_right_button=self._with_shift(self._right_button), scene_bank_buttons=self._shifted_scene_buttons))
		self._session.link_with_track_offset(0)
	

	def _create_alt_session(self):
		self._alt_session = SelectingSessionComponent(self, SESSION_WIDTH, SESSION_HEIGHT, auto_name=True, enable_skinning=True, is_enabled=False, layer=Layer(priority = 2, track_bank_left_button=self._left_button, track_bank_right_button=self._right_button, scene_bank_up_button=self._up_button, scene_bank_down_button=self._down_button, stop_all_clips_button=self._stop_all_button, stop_track_clip_buttons=self._track_stop_buttons, scene_launch_buttons=self._scene_launch_buttons, clip_launch_buttons=self._session_matrix, slot_launch_button=self._selected_slot_launch_button,))
		self._alt_session.name = 'Alt_Session_Control'
		self._alt_session_zoom = SessionZoomingComponent(self._alt_session, name='Alt_Session_Overview', enable_skinning=True, is_enabled=False, layer=Layer(priority = 2, button_matrix=self._shifted_matrix, nav_up_button=self._with_shift(self._up_button), nav_down_button=self._with_shift(self._down_button), nav_left_button=self._with_shift(self._left_button), nav_right_button=self._with_shift(self._right_button), scene_bank_buttons=self._shifted_scene_buttons))
		self._alt_session.link_with_track_offset(0)
	

	def _create_session_switcher(self):
		self._session_switcher =  ModesComponent(name = 'SessionSwitcher')  # is_enabled = False)
		self._session_switcher.add_mode('session', [self._session, self._session_zoom], toggle_value = 'DefaultButton.Off')
		self._session_switcher.add_mode('altsession', [self._alt_session, self._alt_session_zoom, tuple([self._enable_alt_session, self._disable_alt_session])], toggle_value = 'DefaultButton.On')
		self._session_switcher.layer = Layer(toggle_button = self._detail_toggle_button)
		self._session_switcher.selected_mode = 'session'
	

	def _enable_alt_session(self):
		self.set_highlighting_session_component(self._alt_session)
	

	def _disable_alt_session(self):
		self.set_highlighting_session_component(self._session)
	

	def _create_detail_view_control(self):
		self._detail_view_toggler = DetailViewCntrlComponent(name='Detail_View_Control', is_enabled=False, layer=Layer(device_clip_toggle_button=self._device_clip_toggle_button, device_nav_left_button=self._detail_left_button, device_nav_right_button=self._detail_right_button))
	

	def _create_delete_component(self):
		self._delete_component =  ModesComponent(name = 'DeleteClipComponent')
		self._delete_component.add_mode('disabled', None)
		self._delete_component.add_mode('enabled', [DelayMode(tuple([self._delete_on, self._delete_off]), delay = 1.5) ])
		self._delete_component.layer = Layer(toggle_button = self._selected_scene_launch_button)
		self._delete_component.selected_mode = 'disabled'
	

	def _delete_on(self):
		slot = self.song().view.highlighted_clip_slot
		if slot != None and slot.has_clip:
			slot.delete_clip()
	

	def _delete_off(self):
		pass
	

	def _create_global_control(self):
		super(APC40_Selector, self)._create_global_control()
	



