# by amounra 0117 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys
from re import *
from ableton.v2.control_surface.mode import ModesComponent
from ableton.v2.control_surface import ControlSurface, Layer
from ableton.v2.base import listens, listens_group
from ableton.v2.control_surface.elements import ButtonMatrixElement, EncoderElement, DoublePressElement, ButtonElement, Color
from ableton.v2.control_surface import CompoundComponent, Component, ClipCreator
from ableton.v2.control_surface.components import SceneComponent
from ableton.v2.control_surface.input_control_element import MIDI_CC_TYPE, MIDI_NOTE_TYPE
from ableton.v2.control_surface.components import SessionRecordingComponent, ViewControlComponent
from ableton.v2.control_surface.skin import Skin
from ableton.v2.control_surface.components.session_ring import SessionRingComponent
from ableton.v2.control_surface.components.mixer import simple_track_assigner

from aumhaa.v2.control_surface.components.fixed_length_recorder import FixedLengthSessionRecordingComponent
from aumhaa.v2.control_surface.elements.mono_encoder import CodecEncoderElement
from aumhaa.v2.control_surface.elements.mono_bridge import MonoBridgeElement
from aumhaa.v2.control_surface.elements.mono_button import MonoButtonElement
from aumhaa.v2.control_surface.elements.mono_encoder import MonoEncoderElement
from aumhaa.v2.control_surface.components import MonoMixerComponent
from aumhaa.v2.base.debug import *
from aumhaa.v2.livid.colors import *

from pushbase.auto_arm_component import AutoArmComponent
from pushbase.actions import UndoRedoComponent, DeleteAndReturnToDefaultComponent, DeleteComponent, DeleteSelectedClipComponent, DeleteSelectedSceneComponent


import logging
logger = logging.getLogger(__name__)

debug = initialize_debug()

PEDAL_DEFS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10, 11]
LED_DEFS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
VALUES = [[1, 1, 1], [1, 1, 0], [0, 1, 1], [1, 0, 1], [1, 0, 0], [0, 1, 0], [0, 0, 1]]

STATE_COLORS = [5, 1, 6, 3, 4, 7]
LIVE_STATE_COLORS = [7, 5, 6, 3]
STATES = ['RECORDING', 'NONE', 'PLAYING', 'OVERDUBBING', 'WAITING', 'MUTED'] 
LIVE_STATES = ['MUTED', 'RECORDING', 'PLAYING', 'OVERDUBBING']

LENGTH_VALUES = [2, 3, 4]

class MONOFCBColors:


	class DefaultButton:
		On = LividRGB.WHITE
		Off = LividRGB.OFF
		Disabled = LividRGB.OFF
		Alert = LividRGB.BlinkFast.WHITE
	

	class Transport:
		OverdubOn = LividRGB.BlinkFast.RED
		OverdubOff = LividRGB.RED
		PlayOff = LividRGB.GREEN
		PlayOn = LividRGB.BlinkSlow.GREEN
		StopOn = LividRGB.BLUE
		StopOff = LividRGB.OFF
	

	class Session:
		StopClipTriggered = LividRGB.BlinkFast.BLUE
		StopClip = LividRGB.BLUE
		Scene = LividRGB.CYAN
		NoScene = LividRGB.OFF
		SceneTriggered = LividRGB.BlinkFast.BLUE
		ClipTriggeredPlay = LividRGB.BlinkFast.GREEN
		ClipTriggeredRecord = LividRGB.BlinkFast.RED
		RecordButton = LividRGB.OFF
		ClipEmpty = LividRGB.OFF
		ClipStopped = LividRGB.WHITE
		ClipStarted = LividRGB.GREEN
		ClipRecording = LividRGB.RED
		NavigationButtonOn = LividRGB.BLUE
		PageNavigationButtonOn = LividRGB.CYAN
		Empty = LividRGB.OFF
	

	class Mixer:
		SoloOn = LividRGB.CYAN
		SoloOff = LividRGB.OFF
		MuteOn = LividRGB.YELLOW
		MuteOff = LividRGB.OFF
		ArmSelected = LividRGB.GREEN
		ArmSelectedImplicit = LividRGB.MAGENTA
		ArmUnselected = LividRGB.RED
		ArmOff = LividRGB.OFF
		StopClip = LividRGB.BLUE
		SelectedOn = LividRGB.BLUE
		SelectedOff = LividRGB.OFF
	

	class Recording:
		On = LividRGB.BlinkFast.RED
		Off = LividRGB.RED
		Transition = LividRGB.BlinkSlow.RED
	

	class Recorder:
		On = LividRGB.WHITE
		Off = LividRGB.BLUE
		NewOn = LividRGB.BlinkFast.YELLOW
		NewOff = LividRGB.YELLOW
		FixedOn = LividRGB.BlinkFast.CYAN
		FixedOff = LividRGB.CYAN
		RecordOn = LividRGB.BlinkFast.GREEN
		RecordOff = LividRGB.GREEN
		FixedAssigned = LividRGB.MAGENTA
		FixedNotAssigned = LividRGB.OFF
		OverdubOn = LividRGB.BlinkFast.RED
		OverdubOff = LividRGB.RED
	


class LoopPedalButtonElement(MonoButtonElement):


	def __init__(self, *a, **k):
		self._last = 0
		super(LoopPedalButtonElement, self).__init__(*a, **k)
	

	def receive_value(self, value):
		self._verify_value(value)
		value = int(value > 120)*127
		self._last_sent_message = None
		if value != self._last:
			self.notify_value(value)
			self._last = value
			if self._report_input:
				is_input = True
				self._report_value(value, is_input)
	


class LoopPedalExpressionElement(EncoderElement):


	def __init__(self, script, *a, **k):
		self._last = 0
		self._script = script
		super(LoopPedalExpressionElement, self).__init__(*a, **k)
	

	def receive_value(self, value):
		#debug('exp val ' + str(value))
		#value = min(127, max(0, (value - 96)*4))
		#self._script.log_message('exp new val ' + str(value))
		self._verify_value(value)
		if (value > self._last and (value - self._last) < 10) or (value < self._last and (self._last - value) < 10):
			self.notify_value(value)
			self._last = value
			if self._report_input:
				is_input = True
				self._report_value(value, is_input)
		else:
			orig_value = value
			value += int((value - self._last) > 0)*5
			self.notify_value(value)
			self._script.schedule_message(1, self.update_value, [orig_value, value])
			self._last = value
	

	def update_value(self, values):
		if values[1] is self._last:
			self.receive_value(values[0])
	


class RGB_LED(MonoButtonElement):


	def __init__(self, red, green, blue, *a, **k):
		super(RGB_LED, self).__init__(*a, **k)
		self._color_map = [1, 2, 3, 4, 5, 6, 7]
		self._red = red
		self._green = green
		self._blue = blue
	

	def send_value(self, value, force = False):
		if(type(self) != type(None)):
			assert (value != None)
			assert isinstance(value, int)
			assert (value in range(128))
			if (force or self._force_next_send or ((value != self._last_sent_value) and self._is_being_forwarded)):
				data_byte1 = self._original_identifier
				if value in range(1, 127):
					data_byte2 = self._color_map[(value - 1) % (self._num_colors)]
				elif value == 127:
					data_byte2 = self._color_map[self._num_colors-1]
				else:
					data_byte2 = self._darkened
				self._color = data_byte2
				self.send_RGB(data_byte2)
				self._last_sent_message = [value]
				if self._report_output:
					is_input = True
					self._report_value(value, (not is_input))
				self._flash_state = round((value -1)/self._num_colors)
				self._force_next_value = False
	

	def flash(self, timer):
		if (self._flash_state in range(1, self._num_flash_states) and (timer % self._flash_state) == 0):
			data_byte2 = self._color * int((timer % (self._flash_state * 2)) > 0)
			status_byte = self._original_channel
			self.send_RGB(data_byte2)
	

	def send_RGB(self, value):
		values = [0, 0, 0]
		if not value == 0:
			values = VALUES[(value-1)%7]
		#self._script.log_message('sending values: ' + str(values))
		self._red.send_value(values[0]*127, True)
		self._green.send_value(values[1]*127, True)
		self._blue.send_value(values[2]*127, True)
	


class MonolooperComponent(CompoundComponent):


	def __init__(self, leds, script, *a, **k):
		super(MonolooperComponent, self).__init__(*a, **k)
		self._script = script
		self._leds = leds
		self._all_loops_selected = False
		self._selected_loop = None
		self._select_buttons_pressed = []
		self._select_buttons = None
		self._doublepress_select_buttons = None
		self._record_button = None
		self._overdub_button = None
		self._mute_button = None
		self._reverse_button = None
		self._trans1_button = None
		self._trans2_button = None
		self._trans3_button = None
		self._loopers = [Monoloop(self, index, None) for index in range(16)]
		for looper in self._loopers:
			self.register_components(looper)
		self.on_enabled_changed.subject = self._script._device_provider
		#self._select_looper(0)
	

	def disconnect(self, *a, **k):
		self.on_enabled_changed.subject = None
		super(MonolooperComponent, self).disconnect()
	

	def update(self):
		if self.is_enabled():
			for index in range(len(self._loopers)):
				key = str('@loop' + str(index + 1))
				preset = None
				for track in self.song.tracks:
					for device in self.enumerate_track_device(track):
						if(match(key, str(device.name)) != None):
							preset = device
							break
				for return_track in self.song.return_tracks:
					for device in self.enumerate_track_device(return_track):
						if(match(key, str(device.name)) != None):
							preset = device
							break
				for device in self.enumerate_track_device(self.song.master_track):
					if(match(key, str(device.name)) != None):
						preset = device
						break
				self._loopers[index].set_device(preset)
			if self._selected_loop:
				index = self._loopers.index(self._selected_loop)
				#debug('engaging translation for looper:', index)
				self._trans1_button and self._trans1_button.set_identifier(self._trans1_button.original_identifier())
				self._trans2_button and self._trans2_button.set_identifier(self._trans2_button.original_identifier())
				self._trans1_button and self._trans1_button.set_channel(index)
				self._trans2_button and self._trans2_button.set_channel(index)
				#self._trans3_button and self._trans3_button.set_channel(index)
				#self._script._send_midi(tuple([176, 112, 2]))
				self._script._send_midi(tuple([176, 108, index+1]))
			else:
				#debug('engaging translation for no looper')
				self._trans1_button and self._trans1_button.set_identifier(100)
				self._trans2_button and self._trans2_button.set_identifier(101)
				self._trans1_button and self._trans1_button.set_channel(0)
				self._trans2_button and self._trans2_button.set_channel(0)
				#self._trans3_button and self._trans3_button.set_identifier(102)
				#self._trans3_button and self._trans3_button.set_channel(0)
				#self._script._send_midi(tuple([176, 109, 13]))
				#self._script._send_midi(tuple([176, 109, 13]))
				self._script._send_midi(tuple([176, 108, 0]))
	

	@listens('device')
	def on_enabled_changed(self):
		if self.is_enabled():
			self.update()
	

	def set_select_buttons(self, matrix):
		self._select_buttons = matrix
		self._on_select_value.subject = matrix
	

	def set_doublepress_select_buttons(self, matrix):
		self._doublepress_select_buttons = matrix
		self._on_doublepress_select_value.subject = matrix
	

	def set_record_button(self, button):
		self._record_button = button
		self._on_record_value.subject = button
	

	def set_mute_button(self, button):
		self._mute_button = button
		self._on_mute_value.subject = button
	

	def set_overdub_button(self, button):
		self._overdub_button = button
		self._on_overdub_value.subject = button
	

	def set_expression_pedal(self, pedal):
		self._expression_pedal = pedal
		self._on_expression_value.subject = pedal
	

	def set_reverse_button(self, button):
		self._reverse_button = button
		self._on_reverse_value.subject = button
	

	def set_clear_button(self, button):
		self._clear_button = button
		self._on_clear_value.subject = button
	

	def set_trans1_button(self, button):
		self._trans1_button = button
	

	def set_trans2_button(self, button):
		self._trans2_button = button
	

	def set_trans3_button(self, button):
		self._trans3_button = button
	

	def _update_buttons(self):
		if self.is_enabled():
			if not self._selected_loop is None:
				self._mute_button and self._mute_button.send_value(int(self._selected_loop._state is 'MUTED'))
				self._record_button and self._record_button.send_value(2 if self._selected_loop._state is 'RECORDING' else 1 if self._selected_loop._state is 'PLAYING' else 0)
				self._overdub_button and self._overdub_button.send_value(int(self._selected_loop._state is 'OVERDUBBING'))
			else:
				self._mute_button and self._mute_button.send_value(0)
				self._record_button and self._record_button.send_value(0)
				self._overdub_button and self._overdub_button.send_value(0)
	

	def set_leds(self, leds):
		assert(len(leds) == len(self._loopers))
		for index in range(len(self._loopers)):
			self._loopers[index]._set_led(leds[index])
	

	@listens('value')
	def _on_select_value(self, value, x, y, is_momentary):
		#self._script.log_message('select: %(x)s %(y)s %(value)s %(is_momentary)s' % {'x':x, 'y':y, 'value':value, 'is_momentary':is_momentary})
		buttons = self._on_select_value.subject
		button = self._on_select_value.subject.get_button(y, x)
		if value:
			self._select_buttons_pressed.append(button)
			if buttons[1] in self._select_buttons_pressed and buttons[2] in self._select_buttons_pressed:
				self._select_buttons_pressed.remove(buttons[1])
				self._select_buttons_pressed.remove(buttons[2])
				self._select_all_loops()
			if buttons[0] in self._select_buttons_pressed and buttons[1] in self._select_buttons_pressed:
				self._select_buttons_pressed.remove(buttons[0])
				self._select_buttons_pressed.remove(buttons[1])
				self._select_prev_loop()
			if buttons[2] in self._select_buttons_pressed and buttons[3] in self._select_buttons_pressed:
				self._select_buttons_pressed.remove(buttons[2])
				self._select_buttons_pressed.remove(buttons[3])
				self._select_next_loop()
		elif button in self._select_buttons_pressed:
			self._select_buttons_pressed.remove(button)
			self._select_looper(x)
	

	@listens('value')
	def _on_doublepress_select_value(self, value, x, y, is_momentary):
		#self._script.log_message('doublepress_select: %(x)s %(y)s %(value)s %(is_momentary)s' % {'x':x, 'y':y, 'value':value, 'is_momentary':is_momentary})
		#self._loopers[x].display_looper()
		#self._script.toggle_device_control(x)
		pass
	

	@listens('value')
	def _on_record_value(self, value):
		if not self._all_loops_selected and self._selected_loop:
			self._selected_loop.hit_record(value)
	

	@listens('value')
	def _on_mute_value(self, value):
		if self._selected_loop:
			loops = self._loopers if self._all_loops_selected else [self._selected_loop]
			if len(loops) > 1:
				for loop in loops:
					loop.set_mute(1)
			else:
				for loop in loops:
					loop.hit_mute(value)
	

	@listens('value')
	def _on_overdub_value(self, value):
		if self._selected_loop:
			loops = self._loopers if self._all_loops_selected else [self._selected_loop]
			for loop in loops:
				loop.hit_overdub(value)
	

	@listens('value')
	def _on_reverse_value(self, value):
		if value and self._selected_loop:
			loops = self._loopers if self._all_loops_selected else [self._selected_loop]
			for loop in loops:
				loop.hit_reverse()
	

	@listens('value')
	def _on_clear_value(self, value):
		if value and self._selected_loop:
			loops = self._loopers if self._all_loops_selected else [self._selected_loop]
			for loop in loops:
				loop.hit_clear()
	

	@listens('value')
	def _on_expression_value(self, value):
		if self._selected_loop:
			loops = self._loopers if self._all_loops_selected else [self._selected_loop]
			for loop in loops:
				loop.set_feedback(value)
	

	def _select_looper(self, number):
		self._all_loops_selected = False
		if number in range(16):
			self._selected_loop = self._loopers[number]
			#self._selected_loop.display_looper()
		else:
			self._selected_loop = None
		self.update()
	

	def _select_all_loops(self):
		if self._all_loops_selected:
			self._all_loops_selected = False
			#self._script.toggle_mode()
		else:
			self._all_loops_selected = True
			self.update()
		#self._selected_loop = self._all_loopers
	

	def _select_prev_loop(self):
		#self._script.log_message('select prev loop!')
		self._select_looper(max(0, self._selected_loop._index - 1))
	

	def _select_next_loop(self):
		#self._script.log_message('select next loop!')
		self._select_looper(min(15, self._selected_loop._index + 1))
	

	def enumerate_track_device(self, track):
		devices = []
		if hasattr(track, 'devices'):
			for device in track.devices:
				devices.append(device)
				if device.can_have_chains:
					for chain in device.chains:
						for chain_device in self.enumerate_track_device(chain):
							devices.append(chain_device)
		return devices
	


class Monoloop(ControlSurfaceComponent):


	def __init__(self, parent, index, led, *a, **k):
		super(Monoloop, self).__init__()
		self._parent = parent
		self._script = parent._script
		self._index = index
		self._led = led
		self._parameters = None
		self._controls = None
		self._device = None
		self._record = None
		self._overdub = None
		self._mute = None
		self._clear = None
		self._reverse = None
		self._feedback = None
		self._volume = None
		self._speed = None
		self._livereverse = None
		self._livefeedback = None
		self._state = 'MUTED'
		self._reversed = False
	

	def set_device(self, device):
		self._device = None
		self.on_state_change.subject = None
		self.on_position_change.subject = None
		self._record = None
		self._overdub = None
		self._mute = None
		self._clear = None
		self._reverse = None
		self.on_livelooper_state_change.subject = None
		self._livereverse = None
		if isinstance(device, Live.Device.Device):
			if str(device.class_name) == 'MxDeviceAudioEffect':
				self._device = device
				for parameter in device.parameters:
					if parameter.name == 'state':
						self.on_state_change.subject = parameter
					elif parameter.name == 'position':
						self.on_position_change.subject = parameter
					elif parameter.name == 'loop':
						self._record = parameter
					elif parameter.name == 'overdub':
						self._overdub = parameter
					elif parameter.name == 'mute':
						self._mute = parameter
					elif parameter.name == 'clear':
						self._clear = parameter
					elif parameter.name == 'reverse':
						self._reverse = parameter
					elif parameter.name == 'feedback':
						self._feedback = parameter
					elif parameter.name == 'volume':
						self._volume = parameter
					elif parameter.name == 'speed':
						self._speed = parameter
			elif str(device.class_name == 'Looper'):
				self._device = device
				for parameter in device.parameters:
					if parameter.name == 'State':
						self.on_livelooper_state_change.subject = parameter
					elif parameter.name == 'Reverse':
						self._livereverse = parameter
					elif parameter.name == 'Feedback':
						self._livefeedback = parameter
		self.update()
	

	@listens('value')
	def on_state_change(self):
		if self.is_enabled():
			if not self.on_state_change.subject == None:
				val = int(self.on_state_change.subject.value)
				#if val < len(STATE_COLORS):
				#	self._led.send_value(STATE_COLORS[val] + (self.is_selected()*7), True)
				
				#state = self._record.value or  self._mute.value * 2 or self._overdub.value * 3 or self._clear.value * 4 or self._speed * 5
				self._state = STATES[val]
				if self is self._parent._selected_loop:
					self._parent._update_buttons()
	

	@listens('value')
	def on_livelooper_state_change(self):
		if self.is_enabled():
			if not self.on_livelooper_state_change.subject == None:
				val = int(self.on_livelooper_state_change.subject.value)
				#self._led.send_value(LIVE_STATE_COLORS[int(self.on_livelooper_state_change.subject.value)] + (self.is_selected()*7), True)
				self._state = LIVE_STATES[val]
				if self is self._parent._selected_loop:
					self._parent._update_buttons()
	

	@listens('value')
	def on_position_change(self):
		#self._script.log_message('position change: ' + str(self.on_position_change.subject.value))
		pass
	

	@listens('value')
	def on_mute_change(self):
		self.on_state_change()
	

	@listens('value')
	def on_record_change(self):
		self.on_state_change()
	

	@listens('value')
	def on_overdub_change(self):
		self.on_state_change()
	

	def update(self):
		if not self._device is None:
			self.on_state_change()
			self.on_livelooper_state_change()
		else:
			self._led and self._led.send_value(0, True)
	

	def hit_record(self, value):
		if not self._record is None:
			#self._record.value = self._record.max if self._record.value == self._record.min else self._record.min
			self._record.begin_gesture();
			self._record.value = self._record.max if value else self._record.min
			self._record.end_gesture();
		elif not self.on_livelooper_state_change.subject is None and value:
			self.on_livelooper_state_change.subject.value = 2 if not self.on_livelooper_state_change.subject.value != 1 else 1	
	

	def hit_overdub(self, value):
		if not self._overdub is None:
			#self._overdub.value = self._overdub.max if self._overdub.value == self._overdub.min else self._overdub.min
			self._overdub.begin_gesture();
			self._overdub.value = self._overdub.max if value else self._overdub.min
			self._overdub.end_gesture();
		elif not self.on_livelooper_state_change.subject is None and value:
			self.on_livelooper_state_change.subject.value = 3 if self.on_livelooper_state_change.subject.value != 3 else 2
	

	def hit_mute(self, value):
		if not self._mute is None:
			#self._mute.value = self._mute.max if self._mute.value == self._mute.min else self._mute.min
			self._mute.begin_gesture();
			self._mute.value = self._mute.max if value else self._mute.min
			self._mute.end_gesture();
		elif not self.on_livelooper_state_change.subject is None and value:
			self.on_livelooper_state_change.subject.value = 0 if self.on_livelooper_state_change.subject.value != 0 else 2	
	

	def set_mute(self, val):
		if not self._mute is None:
			if val:
				if not self.on_state_change.subject.value == 5:
					self._mute.value = self._mute.max
					self._mute.value = self._mute.min
			else:
				if self.on_state_change.subject.value == 5:
					self._mute.value = self._mute.max
					self._mute.value = self._mute.min
		elif not self.on_livelooper_state_change.subject is None:
			if val:
				if not self.on_livelooper_state_change.subject.value == 0:
					self.on_livelooper_state_change.subject.value = 0
				else:
					self.on_livelooper_state_change.subject.value = 2		
	

	def hit_clear(self):
		if not self._clear is None:
			self._clear.value = self._clear.max
			self._clear.value = self._clear.min
	

	def hit_reverse(self):
		if not self._reverse is None:
			self._reverse.value = self._reverse.max
			self._reverse.value = self._reverse.min
		elif not self._livereverse is None:
			self._livereverse.value = self._livereverse.max if self._livereverse.value == self._livereverse.min else self._livereverse.min
	

	def set_feedback(self, val):
		if not self._feedback is None:
			self._feedback.value = ((self._feedback.max - self._feedback.min) * val/127) + self._feedback.min
		elif not self._livefeedback is None:
			self._livefeedback.value = ((self._livefeedback.max - self._livefeedback.min) * val/127) + self._livefeedback.min
	

	def is_selected(self):
		#debug('is selected:', self._index, self is self._parent._selected_loop or self._parent._all_loops_selected)
		return self is self._parent._selected_loop or self._parent._all_loops_selected
	

	def display_looper(self):
		if not self._device is None:
			self.song.view.select_device(self._device)
			#self._script.set_appointed_device(self._device)
	

	def disconnect(self):
		super(Monoloop, self).disconnect()
	


class MonoFCBE3(ControlSurface):


	def __init__(self, *a, **k):
		self.log_message = logger.warning
		super(MonoFCBE3, self).__init__(*a, **k)
		self._monomod_version = 'b996'
		self._codec_version = 'b996'
		self._cntrlr_version = 'b996'
		self._cntrlr = None
		self._host_name = 'MonoFCBE3'
		self._color_type = 'Monochrome'
		self.hosts = []
		self._timer = 0
		self.flash_status = 1
		self._touched = 0
		self._last_main_mode = 'looper'
		self._skin = Skin(MONOFCBColors)
		with self.component_guard():
			self._setup_monobridge()
			self._setup_controls()
			self._setup_looper()
			#self._setup_undo()
			self._setup_delete_actions()
			#self._setup_autoarm()
			self._setup_viewcontrol()
			self._setup_session_recording_component()
			self._setup_mixer()
			self._setup_modes()
		#self._on_device_changed.subject = self._device_provider
		self.schedule_message(1, self._open_log)
		self._on_device_changed.subject = self._device_provider
		self._on_selected_track_changed.subject = self.song.view
		#self._loop_selector.set_enabled(True)
	

	"""script initialization methods"""
	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._monomod_version) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		self._pedal = [None for index in range(14)]
		for index in range(5):
			self._pedal[index] = DoublePressElement(MonoButtonElement(is_momentary = True, msg_type = MIDI_NOTE_TYPE, channel = 0, identifier = PEDAL_DEFS[index], name = 'Pedal_'+str(index), script = self, skin = self._skin))
			self._pedal[index]._report = False
		for index in range(7):
			self._pedal[index+5] = MonoButtonElement(is_momentary = True, msg_type = MIDI_NOTE_TYPE, channel = 0, identifier = PEDAL_DEFS[index+5], name = 'Pedal_'+str(index+5), script = self, skin = self._skin)
			self._pedal[index+5]._report = False
		self._pedal[12] = LoopPedalExpressionElement(script = self, msg_type = MIDI_CC_TYPE, channel = 0, identifier = 102, map_mode = Live.MidiMap.MapMode.absolute)
		self._pedal[12].name = 'Pedal_'+str(12)
		self._pedal[12]._report = False
		self._pedal[13] = LoopPedalExpressionElement(script = self, msg_type = MIDI_CC_TYPE, channel = 0, identifier = 103, map_mode = Live.MidiMap.MapMode.absolute)
		self._pedal[13].name = 'Pedal_'+str(13)
		self._pedal[13]._report = False
		self._leds = self._pedal[5:9]
		self._select_buttons = ButtonMatrixElement()
		self._select_buttons.name = 'SelectMatrix'
		self._select_buttons.add_row([self._pedal[5], self._pedal[6], self._pedal[7], self._pedal[8]])
		#self._doublepress_select_buttons = ButtonMatrixElement()
		#self._doublepress_select_buttons.name = 'DoublepressSelectMatrix'
		#self._doublepress_select_buttons.add_row([self._pedal[9].double_press, self._pedal[8].double_press, self._pedal[7].double_press, self._pedal[6].double_press])

		self._overdub_button = self._pedal[0]
		self._record_button = self._pedal[1]
		self._mute_button = self._pedal[2]
		self._reverse_button = self._pedal[3]
	

	def _setup_mixer(self):
		self._session_ring = SessionRingComponent(name = 'Session_Ring', num_tracks = 0, num_scenes = 0)
		self._mixer = MonoMixerComponent(name = 'Mixer',tracks_provider = self._session_ring, track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)
		self._mixer._selected_strip.layer = Layer(priority = 4, volume_control = self._pedal[13], arm_button = self._pedal[7])
	

	def _setup_looper(self):
		self._looper = MonolooperComponent(self._leds, self)
		self._looper.layer = Layer(record_button = self._pedal[0],
									overdub_button = self._pedal[1], 
									mute_button = self._pedal[2],
									reverse_button = self._pedal[3],
									trans1_button = self._pedal[5],
									trans2_button = self._pedal[6],
									expression_pedal = self._pedal[12],)
	

	def _setup_undo(self):
		self._undo = UndoRedoComponent(name='Undo', is_root=True)
		self._undo.layer = Layer(undo_button=self._pedal[4])
		self._undo.set_enabled(False)
	

	def _setup_delete_actions(self):
		#self._delete_component = DeleteComponent(name='Deleter', is_root=True)
		#self._delete_component.layer = Layer(delete_button='delete_button')
		#self._delete_default_component = DeleteAndReturnToDefaultComponent(name='DeleteAndDefault', is_root=True)
		#self._delete_default_component.layer = Layer(delete_button='delete_button')
		self._delete_clip = DeleteSelectedClipComponent(name='Selected_Clip_Deleter')
		self._delete_clip.layer = Layer(action_button=self._pedal[4])
		self._delete_clip.set_enabled(False)
		#self._delete_scene = DeleteSelectedSceneComponent(name='Selected_Scene_Deleter', is_root=True)
		#self._delete_scene.layer = Layer(action_button=self._with_shift('delete_button'))


	def _setup_viewcontrol(self):
		self._viewcontrol = ViewControlComponent()
		self._viewcontrol.layer = Layer(priority = 4, prev_track_button = self._pedal[11], next_track_button = self._pedal[10])
		self._viewcontrol.set_enabled(False)
	

	def _setup_session_recording_component(self):
		self._clip_creator = ClipCreator()
		self._clip_creator.name = 'ClipCreator'
		self._recorder = FixedLengthSessionRecordingComponent(length_values = LENGTH_VALUES, clip_creator = self._clip_creator, view_controller = self._viewcontrol)

		#self._recorder = FixedLengthSessionRecordingComponent(view_controller = self._viewcontrol)
		self._recorder.layer = Layer(priority = 4, new_button = self._pedal[8], record_button = self._pedal[9])
		self._recorder.set_enabled(False)
	

	def _setup_autoarm(self):
		self._auto_arm = AutoArmComponent(name='Auto_Arm')
		self._auto_arm.can_auto_arm_track = self._can_auto_arm_track
		self._auto_arm._update_notification = lambda: None
	

	def _setup_modes(self):
		self._button_modes = ModesComponent(name='Button_Modes')
		self._button_modes.add_mode('looper', [self._looper, self._viewcontrol, self._recorder, self._delete_clip])
		self._button_modes.selected_mode = 'looper'
		self._button_modes.set_enabled(True)
	

	def receive_led(self, button, value):
		#self.log_message('receive led: ' + str(index) + ' ' + str(value))
		pass
	

	"""called on timer"""
	def update_display(self):
		super(MonoFCBE3, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

	
	@listens('selected_track')
	def _on_selected_track_changed(self):
		self.detect_aliased_looper()
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('Livid Minim Input')
	

	def detect_aliased_looper(self):
		device = self._device_provider.device
		if device:
			found = -1
			for index in range(16):
				key = str('@loop' + str(index + 1))
				preset = None
				if(match(key, str(device.name)) != None):
					found = index
					break
			if found > -1:
				self._looper._select_looper(index)
		else:
			current_track = self.song.view.selected_track
			#debug('current track is:', current_track)
			key = str('@l:')
			looper_number = -1
			if current_track.name.startswith(key) and len(current_track.name)>4:
				looper_number = int(current_track.name[3])-1
			self._looper._select_looper(looper_number)
		
	

	@listens('device')
	def _on_device_changed(self):
		debug('on device changed')
		device = self._device_provider.device
		if device:
			found = -1
			for index in range(16):
				key = str('@loop' + str(index + 1))
				preset = None
				if(match(key, str(device.name)) != None):
					found = index
					break
			if found > -1:
				self._looper._select_looper(index)
	










