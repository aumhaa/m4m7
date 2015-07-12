# by amounra 0615 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys

""" _Framework files """
from _Framework.Dependency import inject
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.CompoundComponent import CompoundComponent
from _Framework.ControlElement import ControlElement, ControlElementClient
from _Framework.ControlSurface import OptimizedControlSurface, ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.DeviceComponent import DeviceComponent
from _Framework.EncoderElement import EncoderElement
from _Framework.InputControlElement import *
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.SceneComponent import SceneComponent
from _Framework.SessionComponent import SessionComponent
from _Framework.SessionZoomingComponent import SessionZoomingComponent
from _Framework.SliderElement import SliderElement
from _Framework.TransportComponent import TransportComponent
from _Framework.ModesComponent import EnablingModesComponent, DelayMode, CompoundMode, AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.Layer import Layer, SimpleLayerOwner
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *

from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext
from _Framework.Skin import Skin
from _Framework.Profile import profile

"""Imports from the Monomodular Framework"""
from _Mono_Framework.MonoEncoderElement import CodecEncoderElement, MonoEncoderElement
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoModes import SendLividSysexMode, SendSysexMode, CancellableBehaviourWithRelease, ColoredCancellableBehaviourWithRelease, MomentaryBehaviour, BicoloredMomentaryBehaviour, DefaultedBehaviour
from _Mono_Framework.LiveUtils import *
from _Mono_Framework.Debug import *



debug = initialize_debug()


"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *


def release_control(control):
	if control != None:
		control.release_parameter()



def get_track(device):
	def dig(obj):
		if hasattr(obj, 'canonical_parent'):
			#debug('hasattr canonical_parent')
			if isinstance(obj.canonical_parent, Live.Track.Track):
				#debug('returning track:', obj.canonical_parent)
				return obj.canonical_parent
			else:
				return dig(obj.canonical_parent)
		else:
			#debug('obj has no canonical parent, returning none')
			return None
	track = None
	if device:
		track = dig(device)
	return track
	


def encode_name_to_sysex(name):
	shortname = generate_strip_string(name)
	msg = []
	try:
		shortname = (ord(c) for c in str(generate_strip_string(name)))
	except:
		shortname = (ord(c) for c in 'disp_err')
	return shortname


def generate_strip_string(display_string):
	NUM_CHARS_PER_DISPLAY_STRIP = 12
	if (not display_string):
		return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
	if ((len(display_string.strip()) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.endswith('dB') and (display_string.find('.') != -1))):
		display_string = display_string[:-2]
	if (len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)):
		for um in [' ',
		 'i',
		 'o',
		 'u',
		 'e',
		 'a']:
			while ((len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.rfind(um, 1) != -1)):
				um_pos = display_string.rfind(um, 1)
				display_string = (display_string[:um_pos] + display_string[(um_pos + 1):])
	else:
		display_string = display_string.center((NUM_CHARS_PER_DISPLAY_STRIP - 1))
	ret = u''
	for i in range((NUM_CHARS_PER_DISPLAY_STRIP - 1)):
		if ((ord(display_string[i]) > 127) or (ord(display_string[i]) < 0)):
			ret += ' '
		else:
			ret += display_string[i]
	ret += ' '
	#ret = ret.replace(' ', '_')
	assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
	return ret



class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		component.pop_mode(mode)
	

	def update_button(self, component, mode, selected_mode):
		button = component.get_mode_button(mode)
		groups = component.get_mode_groups(mode)
		selected_groups = component.get_mode_groups(selected_mode)
		value = (mode == selected_mode or bool(groups & selected_groups))*32 or 1
		button.send_value(value, True)
	


class CrateClipSlotComponent(ClipSlotComponent):


	def __init__(self, script = None, *a, **k):
		super(CrateClipSlotComponent, self).__init__(*a, **k)
		self._script = script
		self._on_name_changed_slot = self.register_slot(None, self._name_listener, 'name')
	

	def set_clip_slot(self, clip_slot):
 		assert (clip_slot == None or isinstance(clip_slot, Live.ClipSlot.ClipSlot))
		if clip_slot != None:
			clip = clip_slot.clip 
		else:
			clip = None
		self._on_name_changed_slot.subject = clip
		super(CrateClipSlotComponent, self).set_clip_slot(clip_slot)
	

	def _name_listener(self):
		debug('_name_listener')
		self.update()
	

	def update(self):
		super(CrateClipSlotComponent, self).update()
		new_name = ' '
		if self._allow_updates:
			 if self.is_enabled() and not self._launch_button_value.subject == None:
				if (self._clip_slot != None):
					if self.has_clip():
						new_name = self._clip_slot.clip.name
				self._script.clip_name(self._launch_button_value.subject, new_name)
	

class CrateSceneComponent(SceneComponent):


	clip_slot_component_type = CrateClipSlotComponent

	def __init__(self, script = None, *a, **k):
		self._script = script
		super(CrateSceneComponent, self).__init__(*a, **k)
	

	def _create_clip_slot(self):
		return self.clip_slot_component_type(self._script)
	

	def update(self):
		super(SceneComponent, self).update()
		if self._allow_updates:
			if self._scene != None and self.is_enabled():
				clip_index = self._track_offset
				tracks = self.song().tracks
				clip_slots = self._scene.clip_slots
				#if self._track_offset > 0:
				#	real_offset = 0
				#	visible_tracks = 0
				#	while visible_tracks < self._track_offset and len(tracks) > real_offset:
				#		if tracks[real_offset].is_visible:
				#			visible_tracks += 1
				#		real_offset += 1

				#	clip_index = real_offset
				for slot in self._clip_slots:
					#while len(tracks) > clip_index and not tracks[clip_index].is_visible:
					#	clip_index += 1

					if len(clip_slots) > clip_index:
						slot.set_clip_slot(clip_slots[clip_index])
					else:
						slot.set_clip_slot(None)
					clip_index += 1

			else:
				for slot in self._clip_slots:
					slot.set_clip_slot(None)

			self._update_launch_button()
		else:
			self._update_requests += 1
	


class CrateSessionComponent(SessionComponent):


	scene_component_type = CrateSceneComponent

	def __init__(self, script = None, *a, **k):
		self._script = script
		self._group_track = None
		self._group_track_offset = 0
		self._track_offset = 0
		super(CrateSessionComponent, self).__init__(*a, **k)
	

	def _create_scene(self):
		return self.scene_component_type(script = self._script, num_slots=self._num_tracks, tracks_to_use_callback=self.tracks_to_use)
	

	def _end_initialisation(self):
		self.on_selected_scene_changed()
		self.set_offsets(0, 0)
	

	def tracks_to_use(self):
		list_of_tracks = None
		if self._mixer != None:
			list_of_tracks = self._mixer.tracks_to_use()
		else:
			list_of_tracks = self.song().tracks
		return list_of_tracks
	

	def _change_offsets(self, *a, **k):
		super(CrateSessionComponent, self)._change_offsets(*a, **k)
		self._update_track_nav_buttons()
	

	def on_enabled_changed(self):	
		super(CrateSessionComponent, self).on_enabled_changed()
		debug('session enabled:', self.name, self.is_enabled())
		self.is_enabled() and self._update_track_select_names() and self._update_track_nav_buttons()
	

	def set_group_track(self, track_name):
		tracks = [track for track in self.song().tracks]
		for index, track in enumerate(tracks):
			if track and track.name and track.name == track_name:
				self._group_track = track
				self._group_track_offset = index
				self._update_track_select_names()
				self.set_offsets(self._group_track_offset + 1, self.scene_offset())
				break
	

	def _update_track_select_names(self):
		nav_buttons = self._on_track_nav_button_value.subject
		tracks = [track for track in self.song().tracks]
		num_tracks = len(tracks)
		if nav_buttons:
			for _,  index in nav_buttons.iterbuttons():
				if (index[0]+self._group_track_offset+1)<num_tracks:
					name = tracks[index[0]+self._group_track_offset+1].name
					self._script.track_name(index[0], name)
				else:
					self._script.track_name(index[0], ' ')
	
			
	def set_track_nav_buttons(self, buttons):
		self._clear_track_select_names()
		self._on_track_nav_button_value.subject = buttons
	

	@subject_slot('value')
	def _on_track_nav_button_value(self, value, num, *a, **k):
		debug('_on_track_nav_button_value', value, num)
		if value:
			self.set_offsets(self._group_track_offset + num + 1, self.scene_offset())
		else:
			self._update_track_nav_buttons()
	

	def _update_track_nav_buttons(self):
		buttons = self._on_track_nav_button_value.subject
		track_num = self.track_offset()
		if buttons:
			for button, address in buttons.iterbuttons():
				if (address[0] + self._group_track_offset + 1) == track_num:
					button.turn_on()
				else:
					button.turn_off()
	

	def _clear_track_select_names(self):
		nav_buttons = self._on_track_nav_button_value.subject
		if nav_buttons:
			for _,  index in nav_buttons.iterbuttons():
				self._script.track_name(index[0], ' ')
	


class CrateSetSessionComponent(CrateSessionComponent):


	def set_group_track(self, track_name):
		tracks = [track for track in self.song().tracks]
		for index, track in enumerate(tracks):
			if track and track.name and track.name == track_name:
				self._group_track = track
				self._group_track_offset = index
				self._update_track_select_names()
				self.set_offsets(self._group_track_offset, self.scene_offset())
				break
	


class CrateButtonElement(MonoButtonElement):


	def __init__(self, *a, **k):
		super(CrateButtonElement, self).__init__(*a, **k)
	


class FireNextClipComponent(ControlSurfaceComponent):


	def __init__(self, *a, **k):
		super(FireNextClipComponent, self).__init__(*a, **k)
		self._track = None
		self._last_clip_played_index = -1
		
	

	def set_track(self, name):
		for track in self.song().tracks:
			if track and hasattr(track, 'name') and track.name == name:
				self._track = track
				self._on_clip_played_listener.subject = self._track
				break
	

	def set_button(self, button):
		debug(self.name, 'set_button:', button)
		self._on_button_value.subject = button
	

	@subject_slot('value')
	def _on_button_value(self, value):
		debug('_on_button_value:', value)
		if value:
			self._fire_next_clip()
	

	def _fire_next_clip(self):
		debug('fire next clip')
		if self._track:
			debug('track is:', self._track)
			next_clip_slot = 0
			slot_index = self._track.playing_slot_index
			if slot_index > -1:
				next_clip_slot = slot_index + 1
			elif self._last_clip_played_index:
				next_clip_slot = self._last_clip_played_index + 1
			debug('slot index is:', next_clip_slot)
			if len(self._track.clip_slots) > next_clip_slot:
				self._track.clip_slots[next_clip_slot].fire()
	

	@subject_slot('playing_slot_index')
	def _on_clip_played_listener(self, *a, **k):
		if self._track.playing_slot_index > -1:
			self._last_clip_played_index = max(self._track.playing_slot_index, -1)
		debug('_on_clip_played_listener', self._last_clip_played_index)
	


class Crate(ControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for Crate "


	def __init__(self, *a, **k):
		super(Crate, self).__init__(*a, **k)
		self._host_name = 'Crate'
		self._version_check = '1.0'
		self._rgb = 0
		self._timer = 0
		self._touched = 0
		self.flash_status = 1
		with self.component_guard():
			self._setup_monobridge()
			self._setup_controls()
			self._setup_session()
			self._setup_next_buttons()
			self._setup_modes()
			self._create_fallback_control_owner()
		self.schedule_message(1, self._open_log)
		self.schedule_message(3, self._initialize_surface)
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _initialize_surface(self):
		debug('setting to main mode')
		#self._main_modes.selected_mod = 'Main'
		#self._session.set_enabled(True)
	

	def port_settings_changed(self):
		debug('port settings changed!')
		self._connected = False
		super(Crate, self).port_settings_changed()
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _with_shift(self, button):
		return ComboElement(button, modifiers=[self._shift_button])
	

	def _setup_controls(self):
		self._button = [CrateButtonElement(True, MIDI_NOTE_TYPE, 0, index, name = 'Button_' + str(index), script = self) for index in range(20)]
		self._track_button = [CrateButtonElement(True, MIDI_NOTE_TYPE, 0, index+50, name = 'Button_' + str(index+50), script = self) for index in range(6)]
		self._next_button = [CrateButtonElement(True, MIDI_NOTE_TYPE, 0, index+60, name = 'Button_' + str(index+60), script = self) for index in range(2)]
		self._crate_button = [CrateButtonElement(True, MIDI_NOTE_TYPE, 0, index+70, name = 'Button_' + str(index+70), script = self) for index in range(3)]

		self._matrix = ButtonMatrixElement(name = 'Matrix', rows = [[self._button[index]] for index in range(20)])

		self._left_matrix = ButtonMatrixElement(name = 'Left_Matrix', rows = [[self._button[index]] for index in range(10)])
		self._right_matrix = ButtonMatrixElement(name = 'Right_Matrix', rows = [[self._button[index]] for index in range(10,20)])

		self._track_select_matrix = ButtonMatrixElement(name = 'Track_Matrix', rows = [self._track_button])

	

	def _setup_session(self):
		self._left_session = CrateSessionComponent(script = self, name = 'Session_Component_A', num_tracks = 1, num_scenes = 20, autonaming = True, is_enabled = False, layer = Layer(priority = 1, clip_launch_buttons = self._matrix, track_nav_buttons = self._track_select_matrix))
		self._left_session.set_group_track('DECK A')
		self._left_session_zooming = SessionZoomingComponent(session = self._left_session)

		self._right_session = CrateSessionComponent(script = self, name = 'Session_Component_B', num_tracks = 1, num_scenes = 20, autonaming = True, is_enabled = False, layer = Layer(priority = 1, clip_launch_buttons = self._matrix, track_nav_buttons = self._track_select_matrix))
		self._right_session.set_group_track('DECK B')
		self._right_session_zooming = SessionZoomingComponent(session = self._right_session)

		self._left_set_session = CrateSetSessionComponent(script = self, name = 'Session_Component_SETA', num_tracks = 1, num_scenes = 10, autonaming = True, is_enabled = False, layer = Layer(priority = 1, clip_launch_buttons = self._left_matrix))
		self._left_set_session.set_group_track('SET A')
		self._left_set_session_zooming = SessionZoomingComponent(session = self._left_set_session)

		self._right_set_session = CrateSetSessionComponent(script = self, name = 'Session_Component_SETB', num_tracks = 1, num_scenes = 10, autonaming = True, is_enabled = False, layer = Layer(priority = 1, clip_launch_buttons = self._right_matrix))
		self._right_set_session.set_group_track('SET B')
		self._right_set_session_zooming = SessionZoomingComponent(session = self._right_set_session)
	

	def _setup_next_buttons(self):
		self._next_a_button = FireNextClipComponent()
		self._next_a_button.set_track('SET A')
		self._next_a_button.layer = Layer(button = self._next_button[0])

		self._next_b_button = FireNextClipComponent()
		self._next_b_button.set_track('SET B')
		self._next_b_button.layer = Layer(button = self._next_button[1])
	

	def _setup_modes(self):

		next_buttons = CompoundMode(self._next_a_button, self._next_a_button)
		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', None)
		self._main_modes.add_mode('left_session', [self._left_session, next_buttons])
		self._main_modes.add_mode('right_session', [self._right_session, next_buttons])
		self._main_modes.add_mode('set_session', [self._left_set_session, self._right_set_session, next_buttons])
		self._main_modes.layer = Layer(priority = 6, left_session_button = self._crate_button[0], right_session_button = self._crate_button[1], set_session_button = self._crate_button[2])
		self._main_modes.selected_mode = 'set_session'
		self._main_modes.set_enabled(True)

		#self._next_a_button.set_enabled(True)
		#self._next_b_button.set_enabled(True)
	

	def _create_fallback_control_owner(self):
		self.register_disconnectable(SimpleLayerOwner(layer=Layer(_matrix=self._matrix, priority=0)))
	

	def update_display(self):
		super(Crate, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)		
	

	@subject_slot('appointed_device')
	def _on_device_changed(self):
		debug('appointed device changed, script')
	

	def generate_strip_string(self, display_string):
		NUM_CHARS_PER_DISPLAY_STRIP = 12
		if (not display_string):
			return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
		if ((len(display_string.strip()) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.endswith('dB') and (display_string.find('.') != -1))):
			display_string = display_string[:-2]
		if (len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			for um in [' ',
			 'i',
			 'o',
			 'u',
			 'e',
			 'a']:
				while ((len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.rfind(um, 1) != -1)):
					um_pos = display_string.rfind(um, 1)
					display_string = (display_string[:um_pos] + display_string[(um_pos + 1):])
		else:
			display_string = display_string.center((NUM_CHARS_PER_DISPLAY_STRIP - 1))
		ret = u''
		for i in range((NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			if ((ord(display_string[i]) > 127) or (ord(display_string[i]) < 0)):
				ret += ' '
			else:
				ret += display_string[i]

		ret += ' '
		ret = ret.replace(' ', '_')
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, (MonoEncoderElement, CodecEncoderElement))):
			pn = str(self.generate_strip_string(name))
			pv = str(self.generate_strip_string(value))
			self._monobridge._send(sender.name, 'lcd_name', pn)
			self._monobridge._send(sender.name, 'lcd_value', pv)
	

	def touched(self):
		if self._touched is 0:
			self._monobridge._send('touch', 'on')
			self.schedule_message(2, self.check_touch)
		self._touched +=1
	

	def check_touch(self):
		if self._touched > 5:
			self._touched = 5
		elif self._touched > 0:
			self._touched -= 1
		if self._touched is 0:
			self._monobridge._send('touch', 'off')
		else:
			self.schedule_message(2, self.check_touch)
	

	def handle_sysex(self, midi_bytes):
		pass
	

	def disconnect(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<<<<<< " + str(self._host_name) + " log closed >>>>>>>>>>>>>>>>>>>>>>>>>")
		super(Crate, self).disconnect()
	

	def handle_sysex(self, midi_bytes):
		#debug('sysex: ', str(midi_bytes))
		pass
	

	def clip_name(self, sender, name):
		#message_bytes = [240, 112] + [self._button.index(sender)] + encode_name_to_sysex(name) + [247]
		offset = self._button.index(sender)
		shortname = encode_name_to_sysex(name)
		display_sysex = (240,
			 0,
			 0,
			 102,
			 1,
			 offset) + tuple(shortname) + (247,)
		#self.send_midi(display_sysex)
		self._do_send_midi(display_sysex)
	

	def track_name(self, offset, name):
		#message_bytes = [240, 112] + [self._button.index(sender)] + encode_name_to_sysex(name) + [247]
		shortname = encode_name_to_sysex(name)
		display_sysex = (240,
			 0,
			 0,
			 102,
			 2,
			 offset) + tuple(shortname) + (247,)
		#self.send_midi(display_sysex)
		self._do_send_midi(display_sysex)
	




#	a