# by amounra 0615 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import datetime
import math
import sys

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
from _Framework.Profile import profile

"""Imports from the Monomodular Framework"""
from _Mono_Framework.MonoEncoderElement import CodecEncoderElement, MonoEncoderElement
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
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

from Livid_CNTRLR_2.Cntrlr import *

debug = initialize_debug()


"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *
from ModDevices import *
from Map import *


from Push.AutoArmComponent import AutoArmComponent
from Push.SessionRecordingComponent import *
from Push.ViewControlComponent import ViewControlComponent
from Push.DrumGroupComponent import DrumGroupComponent
from Push.StepSeqComponent import StepSeqComponent
from Push.PlayheadElement import PlayheadElement
from Push.PlayheadComponent import PlayheadComponent
from Push.GridResolution import GridResolution
from Push.ConfigurableButtonElement import ConfigurableButtonElement
from Push.LoopSelectorComponent import LoopSelectorComponent
from Push.Actions import CreateInstrumentTrackComponent, CreateDefaultTrackComponent, CaptureAndInsertSceneComponent, DuplicateDetailClipComponent, DuplicateLoopComponent, SelectComponent, DeleteComponent, DeleteSelectedClipComponent, DeleteSelectedSceneComponent, CreateDeviceComponent
from Push.SelectPlayingClipComponent import SelectPlayingClipComponent


check_model = (240, 126, 127, 6, 1, 247)
factoryreset = (240,0,1,97,8,6,247)
SLOWENCODER = (240, 0, 1, 97, 8, 30, 69, 00, 247)
NORMALENCODER = (240, 0, 1, 97, 8, 30, 00, 00, 247)
FASTENCODER = (240, 0, 1, 97, 8, 30, 04, 00, 247)


DEVICE_COLORS = {'midi_effect':2,
				'audio_effect':5,
				'instrument':3,
				'Operator':4,
				'DrumGroupDevice':6,
				'MxDeviceMidiEffect':2,
				'MxDeviceInstrument':3,
				'MxDeviceAudioEffect':5,
				'InstrumentGroupDevice':3,
				'MidiEffectGroupDevice':2,
				'AudioEffectGroupDevice':5}

SELECTED_COLORSHIFT = 7


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
	



class PO10EncoderElement(CodecEncoderElement):


	def __init__(self, *a, **k):
		super(PO10EncoderElement, self).__init__(*a, **k)
	

	def release_parameter(self):
		if self._parameter_to_map_to != None:
			self.end_gesture()
			self._parameter_to_map_to = None
			self._request_rebuild()
		self._parameter_last_num_value = 0
	

class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		component.pop_mode(mode)
	

	def update_button(self, component, mode, selected_mode):
		button = component.get_mode_button(mode)
		groups = component.get_mode_groups(mode)
		selected_groups = component.get_mode_groups(selected_mode)
		value = (mode == selected_mode or bool(groups & selected_groups))*32 or 1
		button.send_value(value, True)
	


class ResetSendsComponent(ControlSurfaceComponent):


	def __init__(self, script, *a, **k):
		super(ResetSendsComponent, self).__init__(*a, **k)
		self._script = script
	

	def set_button(self, button):
		self._on_button_value.subject = button
		button and button.set_light('ResetSendsColor')
	

	def update(self):
		pass
	
	
	@subject_slot('value')
	def _on_button_value(self, value):
		if value:
			self._on_button_value.subject and self.reset_send()
	

	def reset_send(self):
		for track in self.tracks_to_use():
			for send in track.mixer_device.sends[:6]:
				send.value = 0
		for track in self.returns_to_use():
			for send in track.mixer_device.sends[:6]:
				send.value = 0
	

	def tracks_to_use(self):
		return self.song().tracks
	

	def returns_to_use(self):
		return self.song().return_tracks
	


class DefaultsComponent(ControlSurfaceComponent):


	def __init__(self, parent, prefix = '@def', *a, **k):
		super(DefaultsComponent, self).__init__(*a, **k)
		self._parent = parent
		self._prefix = prefix
		self._button = None
		self._defaults_registry = []
	

	def disconnect(self, *a, **k):
		super(DefaultsComponent, self).disconnect()
	

	def set_button(self, button):
		self._button = button
		self._on_button_value.subject = self._button
		self.update()
	

	@subject_slot('value')
	def _on_button_value(self, value):
		if self.is_enabled():
			if value:
				self.set_defaults()
	

	def set_defaults(self):
		debug('set_defaults--------------------------------')
		for track in self.song().tracks:
			for device in self.enumerate_track_device(track):
				if device.class_name.endswith('GroupDevice'):
					self.scan_device(device)
		for return_track in self.song().return_tracks:
			for device in self.enumerate_track_device(return_track):
				if device.class_name.endswith('GroupDevice'):
					self.scan_device(device)
		for device in self.enumerate_track_device(self.song().master_track):
			if device.class_name.endswith('GroupDevice'):
				self.scan_device(device)
	

	def scan_device(self, device):
		prefix = str(self._prefix)+':'
		for param in device.parameters:
			for item in param.name.split(' '):
				if item.startswith(prefix):
					vals = item.split(':')
					self.set_param_to_default(param, vals[1])
	

	def set_param_to_default(self, param, val):
		rst_val = float(val)/100
		newval = float(rst_val * (param.max - param.min)) + param.min
		param.value = newval
	

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
	

	def on_enabled_changed(self):
		if self.is_enabled():
			self.update()
	


class HKDefaultsComponent(DefaultsComponent):


	def set_defaults(self):
		super(HKDefaultsComponent, self).set_defaults()
		self._parent._sendreset_component.reset_send()
	

	def scan_device(self, device):
		prefix = str(self._prefix)+':'
		for param in device.parameters:
			for item in param.name.split(' '):
				if item.startswith(prefix) or item.startswith('@rst:'):
					vals = item.split(':')
					self.set_param_to_default(param, vals[1])
	


class PO10SessionComponent(SessionComponent):


	def _do_show_highlight(self):
		if self._highlighting_callback != None:
			return_tracks = self.song().return_tracks
			if len(return_tracks) > 0:
				include_returns = return_tracks[0] in self.tracks_to_use()
				self._show_highlight and self._highlighting_callback(self._track_offset, self._scene_offset, self.width(), self.height(), include_returns)
			else:
				self._highlighting_callback(-1, -1, -1, -1, include_returns)
	


class ParamButton(ControlSurfaceComponent):


	def __init__(self, parent, *a, **k):
		super(ParamButton, self).__init__(*a, **k)
		self._parent = parent
		self._button = None
		self._original_param = None
		self._param = None
		self._action = self.no_action
		#self._feedback = self._no_feedback
		self._default = None
		self._type = None
	

	def set_button(self, button):
		self._on_button_value.subject = button
		button and button.turn_off()
	

	@subject_slot('value')
	def _on_button_value(self, value):
		debug('_on_button_value', value)
		if value > 0:
			#debug('on_button_value to action, value is:', value)
			self._action()
	

	@subject_slot('value')
	def _on_param_value_changed(self):
		if self._type and self._param:
			value = self._param.value
			button = self._on_button_value.subject
			if button:
				if self._type is 'rst':
					if value != self._default:
						button.turn_off()
					else:
						button.turn_on()
				elif self._type is 'tog':
					if value != self._param.min:
						button.turn_on()
					else:
						button.turn_off()
				elif self._type is 'min':
					if value == self._param.min:
						button.turn_on()
					else:
						button.turn_off()
				elif self._type is 'max':
					if value == self._param.max:
						button.turn_on()
					else:
						button.turn_off()
	

	def _on_shift_state_changed(self, param):
		if self._type is 'shft' and self._param != None:
			button = self._on_button_value.subject
			value = self._original_param != param
			debug('_on_shift_state_changed, orig:', self._original_param.name if self._original_param else None, 'param:', param.name if param else None, 'shifted:', value)
			if value:
				button and button.turn_on()
			else:
				button and button.turn_off()
	

	def set_param(self, param):
		self._action = self.no_action
		self._type = None
		self._default = None
		self._original_param = param
		self._param = None
		self._on_param_value_changed.subject = None
		self._on_button_value.subject and self._on_button_value.subject.turn_off()
		if param and param.name:
			#self._on_param_name_changed.subject = param
			self._scan_param(param)
			#debug('param:', self._param.name if self._param else None, self._type, self._default, self._action)
		self._on_param_value_changed()

	

	def _scan_param(self, param):
		if param and param.name:
			name = param.name
			if name:
				for item in name.split(' '):
					if len(str(item)) and str(item)[0]=='@':
						vals = item[1:].split(':')
						if vals[0] == 'rst':
							self._action = self.set_param_to_default
							self._type = 'rst'
							rst_val = float(vals[1])/100
							self._default = float(rst_val * (param.max - param.min)) + param.min
							self._param = param
							self._on_param_value_changed.subject = param
							break
						elif vals[0] == 'tog':
							self._action = self.toggle
							self._type = 'tog'
							self._param = param
							self._on_param_value_changed.subject = param
							break
						elif vals[0] == 'min':
							self._action = self.set_to_min
							self._type = 'min'
							self._param = param
							self._on_param_value_changed.subject = param
							break
						elif vals[0] == 'max':
							self._action = self.set_to_max
							self._type = 'max'
							self._param = param
							self._on_param_value_changed.subject = param
							break
						elif vals[0] == 'onoff':
							self._action = self.toggle
							self._type = 'tog'
							self._param = self._parent._device.parameters[0]
							self._on_param_value_changed.subject = self._param
							break
						elif vals[0] =='shft':
							self._action = self.shift
							self._type = 'shft'
							self._param = param
							self._on_param_value_changed.subject = None
						elif vals[0] == 'prm':
							parameters = [p for p in self._parent._device.parameters]
							for parameter in parameters:
								if parameter.name.startswith(vals[1]):
									if len(vals)>3 and vals[2] == 'rst':
										self._action = self.set_param_to_default
										self._type = 'rst'
										rst_val = float(vals[3])/100
										self._default = float(rst_val * (parameter.max - parameter.min)) + parameter.min
										self._param = parameter
										self._on_param_value_changed.subject = parameter
										break
									else:
										self._action = self.toggle
										self._type = 'tog'
										self._param = parameter
										self._on_param_value_changed.subject = parameter
										break
						elif vals[0] == 'defaults':
							self._action = self._set_all_to_defaults
							self._type = 'defaults'
							break
	

	@subject_slot('name')
	def _on_param_name_changed(self):
		debug('on_param_name_changed')
		self._scan_param(self._original_param)
		self._on_param_value_changed()
	

	def no_action(self):
		pass
	

	def set_param_to_default(self):
		debug('set_param_to_default', self._param, self._default)
		if self._param and self._default:
			self._param.value = self._default
	

	def toggle(self):
		if self._param:
			#debug('toggle:', 'val', self._param.value, 'min:', self._param.min, 'max:', self._param.max, 'val == min:', self._param.value == self._param.min, 'val == max', self._param.value == self._param.max, 'val > min', self._param.value > self._param.min)
			if self._param.value > self._param.min:
				self._param.value = float(self._param.min)
			else:
				self._param.value = float(self._param.max)
		else:
			debug('no param to toggle')
	

	def set_to_min(self):
		if self._param:
			self._param.value = self._param.min
	

	def set_to_max(self):
		if self._param:
			self._param.value = self._param.max
	

	def shift(self):
		debug('button shift action...')
		self._parent._shift_param(self._param)
	

	def _set_all_to_defaults(self):
		self._parent and self._parent.set_all_params_to_defaults()
	


class PO10DeviceComponent(DeviceComponent):


	def __init__(self, *a, **k):
		self._param_buttons = [ParamButton(self) for index in range(8)]
		self._send_controls = []
		self._send_feedback = []
		self._send_buttons = []
		super(PO10DeviceComponent, self).__init__(*a, **k)
		self._shifted_parameters = []
		self._show_msg_callback = self._msg_pass
	

	def _shift_param(self, param):
		shifted = False
		for entry in self._shifted_parameters:
			if entry[0] == self._device and entry[1] == param:
				shifted = True
		if shifted:
			debug('unshifting param')
			self._shifted_parameters.remove(entry)
			self._assign_parameters()
		else:
			debug('shifting param')
			self._shifted_parameters.append([self._device, param])
			self._assign_parameters()
	

	def _msg_pass(self, *a, **k):
		pass
	

	def set_parameter_buttons(self, controls):
		for param_button in list(self._param_buttons or []):
			param_button.set_button(None)
		buttons = [button for button, address in controls.iterbuttons()] if controls else []
		for index in range(len(self._param_buttons)):
			if len(buttons)>index:
				self._param_buttons[index].set_button(buttons[index])

		#self._on_parameter_button_value.subject = controls
	

	@subject_slot('value')
	def _on_parameter_button_value(self, val, num, *a, **k):
		debug('_on_parameter_button_value', a, k)
		if val:
			if self._parameter_controls and self._parameter_controls[num] and not self._parameter_controls[num]._parameter_to_map_to is None:
				name = None
				try:
					param = self._parameter_controls[num]._parameter_to_map_to
				except:
					param = None
				if param:
					name = param.name
				if name:
					for item in name.split(' '):
						if len(str(item)) and str(item)[0]=='@':
							vals = item[1:].split(':')
							if vals[0] == 'rst':
								self.set_param_to_default(param, vals[1])
								break
							elif vals[0] == 'tog':
								self.toggle_param(param)
								break
							elif vals[0] == 'min':
								param.value = param.min
								break
							elif vals[0] == 'max':
								param.value = param.max
								break
							elif vals[0] == 'onoff':
								self.toggle_param(self._device.parameters[0])
								break
							elif vals[0] == 'prm':
								parameters = [p for p in self._device.parameters]
								for parameter in parameters:
									if parameter.name.startswith(vals[1]):
										if len(vals)>3 and vals[2] == 'rst':
											self.set_param_to_default(parameter, vals[3])
										else:
											self.toggle_param(parameter)
								break
							elif vals[0] == 'defaults':
								self.set_all_params_to_default()
								break
	

	def _assign_parameters(self):
		assert(self.is_enabled())
		assert(self._device != None)
		assert(self._parameter_controls != None)
		self._bank_name, bank = self._current_bank_details()
		index = 0
		for control, parameter, button in zip(self._parameter_controls, bank, self._param_buttons):
			if control != None:
				is_shift_param = False
				shifted_parameter = None
				name = parameter.name
				if name:
					for entry in self._shifted_parameters:
						if entry[0] == self._device and entry[1] == parameter:
							for item in name.split(' '):
								if item.startswith('@shft:'):
									new_name = item[6:]
									for param in self._device.parameters:
										if param and param.name and param.name.startswith(new_name):
											shifted_parameter = param
											break
				if shifted_parameter != None:
					control.connect_to(shifted_parameter)
					if button:
						button.set_param(parameter)
				elif parameter != None:
					control.connect_to(parameter)
					if button:
						button.set_param(parameter)
				else:
					control.release_parameter()
					if button:
						button.set_param(None)
				self._param_buttons[index] and self._param_buttons[index]._on_shift_state_changed(control._parameter_to_map_to)
			index += 1
		self._release_parameters(self._parameter_controls[len(bank):])
		if len(self._param_buttons)>len(bank):
			for button in self._param_buttons[len(bank):]:
				button.set_param(None)

		#for control, parameter in zip(self._param_buttons, bank):
		#	if control != None:
		#			control.set_param(parameter)

		track = get_track(self._device)
		returns = self.returns_to_use()
		#debug('track is:', track)
		if track:
			if track in returns:
				send_number = [ret for ret in returns].index(track)
				debug('track in returns, send_number:', send_number)
				send_tracks_to_use = self._current_send_track_details()
				debug('send_tracks_to_use:', send_tracks_to_use)
				for track, send_control in zip(send_tracks_to_use, self._send_controls):
					if track:
						debug('send assign:', track, send_number, send_control)
						send_control != None and send_control.connect_to(track.mixer_device.sends[send_number])
					else:
						send_control != None and send_control.release_parameter()
				for track, feedback_control in zip(send_tracks_to_use, self._send_feedback):
					if track:
						debug('feedback assign:', track, send_number, feedback_control)
						feedback_control != None and feedback_control.connect_to(track.mixer_device.sends[send_number])
					else:
						feedback_control != None and feedback_control.release_parameter()
			else:
				if self._send_controls != None:
					index = 0
					for send_control in self._send_controls:
						if send_control != None:
							if index < len(track.mixer_device.sends):
								send_control.connect_to(track.mixer_device.sends[index])
							else:
								send_control.release_parameter()
						index += 1
				if self._send_feedback != None:
					index = 0
					for send_control in self._send_feedback:
						if send_control != None:
							if index < len(track.mixer_device.sends):
								send_control.connect_to(track.mixer_device.sends[index])
							else:
								send_control.release_parameter()
						index += 1
	

	def _current_send_track_details(self):
		sends_list = [None for index in range(5)]
		tracks = self.song().tracks
		track_names = [track.name for track in tracks]
		for number, name in enumerate(TRACK_NAMES_FOR_SENDS):
			if name in track_names:
				sends_list[number] = tracks[track_names.index(name)]
		return sends_list
	

	def set_all_params_to_defaults(self):
		debug('set all parmas to default')
		if self._parameter_controls:
			for control in self._parameter_controls:
				name = None
				try:
					param = control._parameter_to_map_to
				except:
					param = None
				if param:
					name = param.name
					debug('param name:', name)
					if name:
						for item in name.split(' '):
							if len(str(item)) and str(item)[0]=='@':
								vals = item[1:].split(':')
								if vals[0] in ['rst', 'def', 'defaults']:
									self.set_param_to_default(param, vals[1])
								else:
									debug('no def value...')
	

	def set_param_to_default(self, param, val):
		rst_val = float(val)/100
		newval = float(rst_val * (param.max - param.min)) + param.min
		param.value = newval
	

	def toggle_param(self, param):
		if param.value == param.min:
			param.value = param.max
		else:
			param.value = param.min
	

	def set_send_controls(self, controls):
		for control in list(self._send_controls or []):
			release_control(control)
		self._send_controls = controls
	

	def set_send_feedback(self, controls):
		for control in list(self._send_feedback or []):
			release_control(control)
		self._send_feedback = controls
	

	def set_send_buttons(self, buttons):
		#for button in list(self._send_buttons or []):
		#	release_control(button)
		self._on_send_button_value.subject = buttons
	

	@subject_slot('value')
	def _on_send_button_value(self, *a, **k):
		debug('_on_send_button_value', a, k)
	

	def returns_to_use(self):
		return self.song().return_tracks[:8]
	

	def _with_shift(self, button):
		return ComboElement(button, modifiers=[self._shift_button])
	


class PO10DeviceSelectorComponent(ControlSurfaceComponent):


	def __init__(self, script, device_component, prefix = '@d', *a, **k):
		super(PO10DeviceSelectorComponent, self).__init__(*a, **k)
		self.log_message = script.log_message
		self._script = script
		self._prefix = prefix
		self._device_component = device_component
		self._buttons = []
		self._offset = 0
		self._device_registry = []
		self._watched_device = None
		self._device_colors = DEVICE_COLORS
		self._selected_colorshift = SELECTED_COLORSHIFT
		self._device_listener.subject = self.song()
		self._device_listener()
	

	def disconnect(self, *a, **k):
		super(PO10DeviceSelectorComponent, self).disconnect()
	

	def set_matrix(self, matrix):
		buttons = []
		if not matrix is None:
			for button, address in matrix.iterbuttons():
				#self._script.log_message('button is: ' + str(button))
				if not button is None:
					button.use_default_message()
					button.set_enabled(True)
					buttons.append(button)
		self.set_buttons(buttons)
	

	def set_buttons(self, buttons):
		self._buttons = buttons or []
		self._on_button_value.replace_subjects(self._buttons)
		self.update()
	

	@subject_slot_group('value')
	def _on_button_value(self, value, sender):
		if self.is_enabled():
			if value:
				self.select_device(self._buttons.index(sender))
	

	def select_device(self, index):
		if self.is_enabled():
			preset = None
			if index < len(self._device_registry):
				preset = self._device_registry[index]
			#debug('before view device:', preset)
			if not preset is None and isinstance(preset, Live.Device.Device):
				#debug('view device:', preset)
				self.song().view.select_device(preset)
				self._device_component.set_device(preset)
			self.update()
	

	def scan_all(self):
		debug('scan all--------------------------------')
		self._device_registry = [None for index in range(len(self._buttons))]
		prefix = str(self._prefix)+':'
		offset = self._offset
		preset = None
		for track in self.song().tracks:
			for device in self.enumerate_track_device(track):
				for index, entry in enumerate(self._device_registry):
					key = str(prefix + str(index + 1 + offset))
					if device.name.startswith(key+' ') or device.name == key:
						self._device_registry[index] = device
					elif (device.name.startswith('*' +key+' ') or device.name == ('*' +key)) and device.can_have_chains and len(device.chains) and len(device.chains[0].devices):
						self._device_registry[index] = device.chains[0].devices[0]
		for return_track in self.song().return_tracks:
			for device in self.enumerate_track_device(return_track):
				for index, entry in enumerate(self._device_registry):
					key = str(prefix + str(index + 1 + offset))
					if device.name.startswith(key+' ') or device.name == key:
						self._device_registry[index] = device
					elif (device.name.startswith('*' +key+' ') or device.name == ('*' +key))  and device.can_have_chains and len(device.chains) and len(device.chains[0].devices):
						self._device_registry[index] = device.chains[0].devices[0]
		for device in self.enumerate_track_device(self.song().master_track):
			for index, entry in enumerate(self._device_registry):
				key = str(prefix + str(index + 1 + offset))
				if device.name.startswith(key+' ') or device.name == key:
					self._device_registry[index] = device
				elif (device.name.startswith('*' +key+' ') or device.name == ('*' +key))  and device.can_have_chains and len(device.chains) and len(device.chains[0].devices):
					self._device_registry[index] = device.chains[0].devices[0]
		self.update()
		#debug('device registry: ' + str(self._device_registry))
	

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
	

	@subject_slot('appointed_device')
	def _device_listener(self, *a, **k):
		#debug('device_listener')
		self._on_name_changed.subject = self.song().appointed_device
		self._watched_device = self.song().appointed_device
		if self.is_enabled():
			self.update()
	

	@subject_slot('name')
	def _on_name_changed(self):
		#debug('on name changed')
		if self._watched_device == self.song().appointed_device:
			self.scan_all()
	

	def on_enabled_changed(self):
		if self.is_enabled():
			self.update()
	

	def update(self):
		if self.is_enabled():
			if len(self._device_registry) != len(self._buttons):
				self.scan_all()
			name = 'None'
			dev = self._device_component._device if self._device_component else None
			offset = self._offset
			if self._buttons:
				for index in range(len(self._buttons)):
					preset = self._device_registry[index]
					button = self._buttons[index]
					if isinstance(button, ButtonElement):
						#if isinstance(preset, Live.Device.Device) and hasattr(preset, 'name'):
						#	name = preset.name
						#	dev_type = preset.type
						#	dev_class = preset.class_name
						#	val = (dev_class in self._device_colors and self._device_colors[dev_class]) or (dev_type in self._device_colors and self._device_colors[dev_type]) or 7
						#	selected_shift = (dev == preset)*self._selected_colorshift
						if dev == None:
							button.turn_off()
						elif preset == dev:
							button.turn_on()
						else:
							button.turn_off()
	


class ModDeviceSelector(PO10DeviceSelectorComponent):


	def select_device(self, index):
		if self.is_enabled():
			preset = None
			if index < len(self._device_registry):
				preset = self._device_registry[index]
			if not preset is None and isinstance(preset, Live.Device.Device):
				self.song().view.select_device(preset)
				track = get_track(preset)
				if track:
					self.song().view.selected_track = track
				self._device_component.set_device(preset)
			self.update()
	

	def update(self):
		super(ModDeviceSelector, self).update()
		self._script._update_modswitcher()
	


class PO10M4LInterfaceComponent(ControlSurfaceComponent, ControlElementClient):
	"""
	Simplified API for interaction from M4L as a high priority layer
	superposed on top of any functionality.
	"""


	def __init__(self, controls = None, component_guard = None, priority = 1, *a, **k):
		super(PO10M4LInterfaceComponent, self).__init__(self, *a, **k)
		self._priority = priority
		self._controls = dict(map(lambda x: (x.name, x), controls))
		self._grabbed_controls = []
		self._component_guard = component_guard
	

	def disconnect(self):
		for control in self._grabbed_controls[:]:
			self.release_control(control)
		super(PO10M4LInterfaceComponent, self).disconnect()
	

	def set_control_element(self, control, grabbed):
		if hasattr(control, 'release_parameter'):
			control.release_parameter()
		control.reset()
	

	def get_control_names(self):
		return self._controls.keys()
	

	def get_control(self, control_name):
		return self._controls[control_name] if control_name in self._controls else None
	

	def grab_control(self, control):
		assert(control in self._controls.values())
		with self._component_guard():
			if control not in self._grabbed_controls:
				control.resource.grab(self, priority=self._priority)
				self._grabbed_controls.append(control)
	

	def release_control(self, control):
		assert(control in self._controls.values())
		with self._component_guard():
			if control in self._grabbed_controls:
				self._grabbed_controls.remove(control)
				control.resource.release(self)
	


class HotKnobComponent(ControlSurfaceComponent):


	def __init__(self, *a, **k):
		super(HotKnobComponent, self).__init__(*a, **k)
	

	def set_button(self, button):
		self._on_button_value.subject = button
	

	@subject_slot('value')
	def _on_button_value(self, value):
		if value:
			pass
	

	def set_encoder(self, encoder):
		if self._encoder:
			release_control(self._encoder)
		self._encoder = encoder
		self._encoder.connect_to(self._parameter)
	

	def set_parameter(self, parameter):
		self._parameter = parameter
	


class PO10(OptimizedControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for PO10 "


	def __init__(self, *a, **k):
		super(PO10, self).__init__(*a, **k)
		self._po10_version_check = '1.0'
		self._po10_linked_script = None
		self._initialized = False
		self._connected = False
		self._version_check = 'b996'
		self._host_name = 'PO10'
		self._color_type = 'Monochrome'
		self._client = [None for index in range(4)]
		self._active_client = None
		self._rgb = 0
		self._timer = 0
		self._touched = 0
		self.flash_status = 1
		self._skin = Skin(PO10Colors)
		self._device_selection_follows_track_selection = FOLLOW
		self.modhandler = None
		self._main_modes = None
		with self.component_guard():
			self._setup_mod()
		#self._on_device_changed.subject = self.song()
		#self.set_feedback_channels(range(14, 15))
		#self._main_modes.selected_mode = 'MixMode'
		self.schedule_message(1, self._open_log)
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _initialize_hardware(self):
		#self._main_modes.selected_mode = 'MixMode'
		pass
	

	def _check_connection(self):
		#if not self._connected:
		#	self._livid_settings.query_surface()
		#	self.schedule_message(100, self._check_connection)
		if self._main_modes:
			self._main_modes.selected_mode = 'Main'
	

	def port_settings_changed(self):
		debug('port settings changed!')
		self._connected = False
		#self._main_modes.selected_mode = 'disabled'
		self._check_connection()
		super(PO10, self).port_settings_changed()
		#for control in self.controls:
		#	if isinstance(control, MonoButtonElement):
		#		control.set_light('DefaultButton.On')
		#	elif isinstance(control, CodecEncoderElement):
		#		control.send_value(127, True)
	

	def _initialize_functionality(self):
		if not self._po10_linked_script is None:
			if self.is_valid():
				with self.component_guard():
					self._setup_monobridge()
					self._setup_controls()
					self._define_sysex()
					self._setup_session()
					self._setup_main_device_control()
					self._setup_device_control()
					self._setup_main_device_selector()
					self._setup_device_selector()
					self._setup_kills()
					#self._setup_translations()
					self._setup_modhandler()
					self._setup_modes() 
					self._setup_m4l_interface()
				self._initialized = True
				self._main_device_selector.select_device(DEFAULT_MASTER_DEVICE_INDEX)
				self._device_selector.select_device(DEFAULT_DEVICE_INDEX)
				self.schedule_message(3, self._check_connection)
				self.schedule_message(10, self._select_hex_mod)
			else:
				debug('No PO10b script linked....aborting initialization')
	

	def is_valid(self):
		#cur_date = time.strftime("%x").split('/')
		#valid = int(cur_date[0]) < 9 and int(cur_date[1]) < 7 and int(cur_date[2]) < 16
		#return valid
		return True
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _with_shift(self, button):
		return ComboElement(button, modifiers=[self._shift_button])
	

	def _setup_controls(self):
		is_momentary = True 
		self._grid = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, PO10_GRID[index], name = 'Grid_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP) for index in range(16)]
		self._button = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, PO10_BUTTONS[index], name = 'Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP) for index in range(30)]
		self._key = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, PO10_KEYS[index], name = 'Key_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP) for index in range(32)]
		#self._po10_encoders = [CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, PO10_ENCODERS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index+13), PO10_ENCODERS[index], self) for index in range(5)] 
		#self._encoders = [CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, PO10b_ENCODERS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index), PO10_ENCODERS[index], self) for index in range(13)] 
		#self._encoder_button = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, PO10_ENCODER_BUTTONS[index], name = 'Encoder_Button_' + str(index), script = self, skin = self._skin) for index in range(18)]	
		self._encoder_feedback = [CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, PO10_ENCODERS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index), PO10_ENCODERS[index], self) for index in range(5)] 
		self._encoder = self._po10_linked_script._po10b_encoders
		self._encoder_button = self._po10_linked_script._po10b_encoder_buttons

		self._shift_button = self._button[21]

		self._matrix = ButtonMatrixElement(name = 'Matrix', rows = [self._grid[index*4:(index*4)+4] for index in range(4)])
		self._key_matrix = ButtonMatrixElement(name = 'Key_Matrix', rows = [self._key[0:16], self._key[16:32]])
		self._encoder_matrix = ButtonMatrixElement(name = 'Encoder_Matrix', rows = [self._encoder[0:4], self._encoder[4:8]])
		self._encoder_button_matrix = ButtonMatrixElement(name = 'Encoder_Button_Matrix', rows = [self._encoder_button[0:4], self._encoder_button[4:8]])
		self._main_encoder_matrix = ButtonMatrixElement(name = 'Main_Encoder_Matrix', rows = [self._encoder[8:13]])
		self._device_encoder_matrix = ButtonMatrixElement(name = 'Device_Encoder_Matrix', rows = [self._encoder[:6]])
		self._send_encoder_feedback_matrix = ButtonMatrixElement(name = 'Send_Encoder_Feedback_Matrix', rows = [self._encoder_feedback])
		self._send_encoder_matrix = ButtonMatrixElement(name = 'Send_Encoder_Matrix', rows = [self._encoder[13:]])
		self._main_encoder_button_matrix = ButtonMatrixElement(name = 'Main_Encoder_Button_Matrix', rows = [self._encoder_button[8:13]])
		self._device_encoder_button_matrix = ButtonMatrixElement(name = 'Device_Encoder_Button_Matrix', rows = [self._encoder_button[:6]])
		self._send_encoder_button_matrix = ButtonMatrixElement(name = 'Send_Encoder_Button_Matrix', rows = [self._encoder_button[13:]])
		self._main_button_matrix = ButtonMatrixElement(name = 'Main_Matrix', rows = [self._button[22:]])
		self._device_button_matrix = ButtonMatrixElement(name = 'Device_Matrix', rows = [self._button[:7] + self._button[8:13] + self._button[16:17]])
	

	def _define_sysex(self):
		self._livid_settings = LividSettings(model = 9, control_surface = self)
		#self.encoder_navigation_on = SendLividSysexMode(livid_settings = self._livid_settings, call = 'set_encoder_encosion_mode', message = [13, 0, 0, 0]) 
	

	def _setup_session(self):
		self._session = SessionComponent(name = 'Session_Component', num_tracks = 20, num_scenes = 1)
		self._session._scenes[0].layer = Layer(priority = 6, launch_button = self._button[28])
		self._session.unshift_layer = AddLayerMode(self._session, Layer(priority = 6, scene_bank_down_button = self._button[29]))
		self._session.shift_layer = AddLayerMode(self._session, Layer(priority = 6, scene_bank_up_button = self._button[29]))
		self.set_highlighting_session_component(self._session)
		self._session.set_show_highlight(True)
		self._session.set_enabled(False)
	

	def _setup_main_device_control(self):
		self._main_device = PO10DeviceComponent()
		self._main_device.layer = Layer(priority = 6, parameter_controls = self._main_encoder_matrix,
											parameter_buttons = self._main_encoder_button_matrix)
		self._main_device.set_enabled(True)
	

	def _setup_device_control(self):
		self._device = PO10DeviceComponent()
		self._device.layer = Layer(priority = 6, parameter_controls = self._device_encoder_matrix, 
											parameter_buttons = self._device_encoder_button_matrix,
											send_controls = self._send_encoder_matrix,
											send_buttons = self._send_encoder_button_matrix,
											send_feedback = self._send_encoder_feedback_matrix)
		self._device.set_enabled(True)
	

	def _setup_main_device_selector(self):
		self._main_device_selector = PO10DeviceSelectorComponent(self, self._main_device, prefix = '@m')
		self._main_device_selector.layer = Layer(priority = 6, matrix = self._main_button_matrix)
		self._main_device_selector.set_enabled(True)
	

	def _setup_device_selector(self):
		self._device_selector = ModDeviceSelector(self, self._device, prefix = '@d')
		self._device_selector.layer = Layer(priority = 6, matrix = self._device_button_matrix)
		self._device_selector.set_enabled(True)
	

	def _setup_kills(self):
		self._hardkill_component = HKDefaultsComponent(self, '@hk')
		self._hardkill_component.set_enabled(True)
		self._hardkill_component.set_button(self._button[27])

		self._softkill_component = DefaultsComponent(self, '@sk')
		self._softkill_component.set_enabled(True)
		self._softkill_component.set_button(self._button[26])
		
		self._sendreset_component = ResetSendsComponent(self)
		self._sendreset_component.set_enabled(True)
		self._sendreset_component.set_button(self._button[7])
	

	def _setup_track_mutes(self):
		pass
	

	def _setup_translations(self):
		self._translations = TranslationComponent(self._translated_controls, user_channel_offset = 4, channel = 4)	# is_enabled = False)
		self._translations.name = 'TranslationComponent'
		self._translations.layer = Layer(priority = 10,)
		self._translations.selector_layer = AddLayerMode(self._translations, Layer(priority = 10, channel_selector_buttons = self._dial_button_matrix))
		self._translations.set_enabled(False)

		self._optional_translations = CompoundMode(TranslationComponent(controls = self._fader, user_channel_offset = 4, channel = 4, name = 'FaderTranslation', is_enabled = False, layer = Layer(priority = 10)) if FADER_BANKING else None, 
														TranslationComponent(controls = self._knobs, user_channel_offset = 4, channel = 4, name = 'DialTranslation', is_enabled = False, layer = Layer(priority = 10)) if DIAL_BANKING else None)
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = PO10ModHandler(self) # is_enabled = False)
	

	def _setup_modhandler(self):
		self.modhandler.name = 'ModHandler' 
		self.modhandler.layer = Layer(priority = 8, po10_grid = self._matrix, po10_keys = self._key_matrix)
		self.modhandler.partial_layer = AddLayerMode(self.modhandler, Layer(priority = 7, po10_encoder_grid = self._encoder_matrix, po10_encoder_button_grid = self._encoder_button_matrix))
		self.modhandler.set_enabled(True)
	

	def _select_hex_mod(self):
		for mod in self.monomodular._mods:
			if mod._param_component._type is 'hex':
				if self.modhandler.active_mod() != mod:
					self.modhandler.select_mod(mod)
					debug('hex mod found!')
					break
	

	def _setup_modes(self):
		self._modswitcher = ModesComponent(name = 'ModSwitcher')  # is_enabled = False)
		self._modswitcher.add_mode('mod', [self.modhandler])
		self._modswitcher.add_mode('modplus', [self.modhandler, self.modhandler.partial_layer])
		#self._modswitcher.add_mode('instrument', [self._instrument, self._instrument.shift_button_layer, main_buttons, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer]) #self._instrument.shift_button_layer, self._optional_translations])
		self._modswitcher.selected_mode = 'mod'
		self._modswitcher.set_enabled(True)

		self._main_modes = ModesComponent(name = 'MainModes')
		self._main_modes.add_mode('disabled', None)
		self._main_modes.add_mode('Main', [self._session, self._session.unshift_layer])
		self._main_modes.add_mode('Shifted', [self._session, self._session.shift_layer], behaviour = CancellableBehaviourWithRelease())
		self._main_modes.layer = Layer(priority = 6, Shifted_button = self._shift_button)
		self._main_modes.selected_mode = 'disabled'

		#self._main_modes = ModesComponent(name = 'MainModes')
		#self._main_modes.add_mode('disabled', None)
		#self._main_modes.add_mode('MixMode', [self._instrument, self._instrument.shift_button_layer, main_faders, self._mixer.main_knobs_layer, self._device.main_layer, self._device_navigator.main_layer,])	 # self._session.dial_nav_layer, self._mixer.dial_nav_layer, ])
		#self._main_modes.add_mode('ModSwitcher', [main_faders, main_dials, self._mixer.main_knobs_layer, self._session.select_dial_layer, self._mixer.select_dial_layer, self._device_navigator.select_dial_layer, self.encoder_navigation_on, self._modswitcher, DelayMode(self._update_modswitcher)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		#self._main_modes.add_mode('MainMode', [self.modhandler.partial_layer, DelayMode(self._update_modswitcher, delay = .1)], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled')), 
		#self._main_modes.add_mode('ModMode', [self.modhandler, DelayMode(self._update_modswitcher, delay = .1)], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.ModSwitcher', off_color = 'ModeButtons.ModSwitcherDisabled'))
		#self._main_modes.add_mode('Translations', [main_faders, main_dials, self._mixer.main_knobs_layer, self._translations, DelayMode(self._translations.selector_layer, delay = .1)], behaviour = DefaultedBehaviour(default_mode = 'MixMode', color = 'ModeButtons.Translations', off_color = 'ModeButtons.TranslationsDisabled'))
		#self._main_modes.add_mode('DeviceSelector', [DelayMode(self._device_selector, delay = .1), DelayMode(self.modhandler.lock_layer, delay = .1), DelayMode(self._device_selector.assign_layer, delay = .2), main_buttons, main_dials, main_faders, self._mixer.main_knobs_layer, self._device, self._device.main_layer, self._device_navigator], behaviour = ColoredCancellableBehaviourWithRelease(color = 'ModeButtons.DeviceSelector', off_color = 'ModeButtons.DeviceSelectorDisabled'))
		#self._main_modes.layer = Layer(priority = 4, ModMode_button = self._button[0], MainMode_button = self._button[1]) #, 
	

	def _setup_m4l_interface(self):
		self._m4l_interface = MonoM4LInterfaceComponent(controls=self.controls, component_guard=self.component_guard, priority = 10)
		self._m4l_interface.name = "M4LInterface"
		self.get_control_names = self._m4l_interface.get_control_names
		self.get_control = self._m4l_interface.get_control
		self.grab_control = self._m4l_interface.grab_control
		self.release_control = self._m4l_interface.release_control
	

	def update_display(self):
		super(PO10, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.modhandler and self.modhandler.send_ring_leds()
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)		
	

	def _update_modswitcher(self):
		if self._initialized:
			debug('update modswitcher', self.modhandler.active_mod())
			if self.modhandler.active_mod() and self._device._device == self.modhandler.active_mod().device:
				self._modswitcher.selected_mode = 'modplus'
				debug('switching to modplus...')
			else:
				self._modswitcher.selected_mode = 'mod'
				debug('switching to mod....')
	

	@subject_slot('appointed_device')
	def _on_device_changed(self):
		debug('appointed device changed, script')
		#self._main_modes.selected_mode is 'ModSwitcher' and self.schedule_message(2, self._update_modswitcher)
	

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
		super(PO10, self).disconnect()
		if not self._po10_linked_script is None:
			self._po10_linked_script._po10_linked_script = None
	

	def restart_monomodular(self):
		#debug('restart monomodular')
		self.modhandler.disconnect()
		with self.component_guard():
			self._setup_mod()
	

	def handle_sysex(self, midi_bytes):
		#debug('sysex: ', str(midi_bytes))
		if len(midi_bytes) > 14:
			if midi_bytes[3:10] == tuple([6, 2, 0, 1, 97, 1, 0]):
				if not self._connected:
					self._connected = True
					#self._livid_settings.set_model(midi_bytes[11])
					self._initialize_hardware()
	

	def connect_script_instances(self, instanciated_scripts):
		self._po10_linked_script = None
		for s in instanciated_scripts:
			if '_po10_version' in dir(s):
				if s._po10_version == self._po10_version_check:
					self._po10_linked_script = s
					debug('PO10 linked script is:', self._po10_linked_script)
					break
		if not self._po10_linked_script is None and not self._initialized:
			self._po10_linked_script._setup_controls()
			self._po10_linked_script.touched = self.touched
			self._po10_linked_script.check_touch = self.check_touch
			self._po10_linked_script.notification_to_bridge = self.notification_to_bridge
			self._initialize_functionality()
			
	

	def _send_midi(self, midi_event_bytes, optimized = True):
		super(PO10, self)._send_midi(midi_event_bytes, optimized)
		if not self._po10_linked_script is None:
			if midi_event_bytes[0] == 144 and midi_event_bytes[1] in range(78, 95):
				self._po10_linked_script._send_midi(midi_event_bytes, optimized)
	

	def softkill(self):
		self._softkill_component.set_defaults()
	

	def hardkill(self):
		self._hardkill_component.set_defaults()
	

	def forward_midi(self, *a, **k):
		bytes = [int(byte) for byte in a]
		self._send_midi(a)
	


class PO10b(OptimizedControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for PO10 "


	def __init__(self, c_instance, *a, **k):
		super(PO10b, self).__init__(c_instance, *a, **k)
		self.__c_instance = c_instance
		self._host_name = 'PO10b'
		self._po10_version = '1.0'
		self._po10_linked_script = None
		self._color_type = 'Monochrome'
		self._client = [None for index in range(4)]
		self._active_client = None
		self._rgb = 0
		self._timer = 0
		self._touched = 0
		self.flash_status = 1
		self._skin = Skin(PO10Colors)
		self.schedule_message(1, self._open_log)
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._po10_version) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def port_settings_changed(self):
		debug('port settings changed!')
		super(PO10b, self).port_settings_changed()
	

	def handle(self):
		return self.__c_instance.handle()
	

	def build_midi_map(self, midi_map_handle):
		super(PO10b, self).build_midi_map(midi_map_handle)
		#for encoder in PO10b_ENCODERS:
		#	Live.MidiMap.forward_midi_note(self.handle(), midi_map_handle, 0, encoder)
	

	def _setup_controls(self):
		with self.component_guard():
			is_momentary = True 
			self._po10b_encoders = [CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, PO10b_ENCODERS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index), PO10b_ENCODERS[index], self) for index in range(18)] 
			self._po10b_encoder_buttons = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, PO10b_ENCODER_BUTTONS[index], name = 'Encoder_Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP) for index in range(18)]	
	

	def connect_script_instances(self, instanciated_scripts):
		self._po10_linked_script = None
		for s in instanciated_scripts:
			if '_po10_version_check' in dir(s):
				if s._po10_version_check == self._po10_version:
					self._po10_linked_script = s
					debug('PO10b linked script is:', self._po10_linked_script)
					break
		if not self._po10_linked_script is None:
			self.touched = self.pass_function
			self.check_touch = self.pass_function
			self.notification_to_bridge = self.pass_function
	

	def pass_function(self, *a, **k):
		pass
	

	def disconnect(self):
		super(PO10b, self).disconnect()
		if not self._po10_linked_script is None:
			self._po10_linked_script._po10_linked_script = None
	


class PO10ModHandler(ModHandler):


	def __init__(self, *a, **k):
		self._local = True
		self._last_sent_leds = 1
		self._po10_grid = None
		self._po10_encoder_grid = None
		self._po10_encoder_button_grid = None
		self._po10_keys = None
		self._alt_device_banks = MOD_TYPES
		addresses = {'po10_grid': {'obj':Grid('po10_grid', 4, 4), 'method':self._receive_po10_grid},
					'po10_encoder_grid': {'obj':RingedGrid('po10_encoder_grid', 4, 2), 'method':self._receive_po10_encoder_grid},
					'po10_encoder_button_grid': {'obj':Grid('po10_encoder_button_grid', 4, 2), 'method':self._receive_po10_encoder_button_grid},
					'po10_key': {'obj':  Grid('po10_key', 16, 2), 'method': self._receive_po10_key}}
		super(PO10ModHandler, self).__init__(addresses = addresses, *a, **k)
		self._color_type = 'Monochrome'
		self.nav_box = self.register_component(NavigationBox(self, 16, 16, 4, 4, self.set_offset))
	

	def _receive_po10_grid(self, x, y, value = -1, *a, **k):
		#debug('_receive_po10_grid:', x, y, value)
		if self.is_enabled() and self._active_mod and not self._active_mod.legacy and not self._po10_grid is None and x < 4 and y < 4:
			value > -1 and self._po10_grid.send_value(x, y, self._colors[value], True)
	

	def _receive_po10_encoder_grid(self, x, y, value = -1, mode = None, green = None, custom = None, local = None, relative = None, *a, **K):
		#debug('_receive_po10_encoder_grid:', x, y, value, mode, green, custom, local, relative)
		if self.is_enabled() and self._active_mod and self._po10_encoder_grid and x < 4 and y < 2:
			if value > -1:
				if self._local:
					self._po10_encoder_grid.send_value(x, y, value, True)
				else:
					self._po10_encoder_grid.get_button(x, y)._ring_value = value
			button = self._po10_encoder_grid.get_button(x, y)
			if button:
				mode and button.set_mode(mode)
				green and button.set_green(green)
				custom and button.set_custom(custom)
			not local is None and self._receive_po10_encoder_grid_local(local)
			not relative is None and self._receive_po10_encoder_grid_relative(relative)
	

	def _receive_po10_encoder_button_grid(self, x, y, value, *a, **k):
		if self.is_enabled() and self._active_mod:
			if not self._po10_encoder_button_grid is None:
				self._po10_encoder_button_grid.send_value(x, y, self._colors[value], True)
	

	def _receive_po10_encoder_grid_relative(self, value, *a):
		#debug('_receive_po10_encoder_grid_relative:', value)
		if self.is_enabled() and self._active_mod:
			value and self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 127, 127, 127, 127, 247])) or self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 15, 0, 0, 0, 247]))
	

	def _receive_po10_encoder_grid_local(self, value, *a):
		#debug('_receive_po10_encoder_grid_local:', value)
		if self.is_enabled() and self._active_mod:
			self.clear_rings()
			self._local = value
			value and self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 72, 247])) or self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 64, 247]))
	

	def _receive_po10_key(self, x, y=0, value=0, *a):
		#debug('_receive_po10_key:', x, y, value)
		if self.is_enabled() and self._active_mod and not self._active_mod.legacy:
			if not self._po10_keys is None:
				self._po10_keys.send_value(x, y, self._colors[value], True)
	

	def _receive_grid(self, x, y, value = -1, *a, **k):
		if self.is_enabled() and self._active_mod and self._active_mod.legacy:
			if not self._po10_grid is None:
				if (x - self.x_offset) in range(4) and (y - self.y_offset) in range(4):
					self._po10_grid.send_value(x - self.x_offset, y - self.y_offset, self._colors[value], True)
	


	def set_po10_grid(self, grid):
		self._po10_grid = grid
		self._po10_grid_value.subject = self._po10_grid
	

	def set_po10_encoder_grid(self, grid):
		self._po10_encoder_grid = grid
		#self._po10_encoder_grid_value.subject = self._po10_encoder_grid
		self.set_parameter_controls(grid)
		#self.log_message('parameter controls are: ' + str(self._parameter_controls))
	

	def set_po10_encoder_button_grid(self, buttons):
		self._po10_encoder_button_grid = buttons
		self._po10_encoder_button_grid_value.subject = self._po10_encoder_button_grid
	

	def set_po10_keys(self, keys):
		self._po10_keys = keys
		if keys:
			for key, _ in keys.iterbuttons():
				key and key.set_darkened_value(0)
		self._po10_keys_value.subject = self._po10_keys
	


	@subject_slot('value')
	def _po10_keys_value(self, value, x, y, *a, **k):
		#debug('_po10_keys_value:', x, y, value)
		if self._active_mod:
			self._active_mod.send('po10_key', x, y, value)
	

	@subject_slot('value')
	def _po10_grid_value(self, value, x, y, *a, **k):
		#debug('_po10_grid_value:', x, y, value)
		if self._active_mod:
			if self._active_mod.legacy:
				self._active_mod.send('grid', x + self.x_offset, y + self.y_offset, value)
			else:
				self._active_mod.send('po10_grid', x, y, value)
	

	@subject_slot('value')
	def _po10_encoder_grid_value(self, value, x, y, *a, **k):
		#debug('_po10_encoder_grid_value:', x, y, value)
		if self._active_mod:
			self._active_mod.send('po10_encoder_grid', x, y, value)
	

	@subject_slot('value')
	def _po10_encoder_button_grid_value(self, value, x, y, *a, **k):
		#debug('_po10_encoder_button_grid_value:', x, y, value)
		if self._active_mod:
			self._active_mod.send('po10_encoder_button_grid', x, y, value)
	


	@subject_slot('appointed_device')
	def _on_device_changed(self):
		#super(PO10ModHandler, self)._on_device_changed()
		#self._script._on_device_changed()
		#self._script._select_hex_mod()
		pass
	

	def select_appointed_device(self, *a):
		debug('select_appointed_device' + str(a))
		track = self.song().view.selected_track
		device_to_select = track.view.selected_device
		if device_to_select == None and len(track.devices) > 0:
			device_to_select = track.devices[0]
		if self.modrouter.is_mod(device_to_select):
			self.select_mod(self.modrouter.is_mod(device_to_select))
	

	def on_selected_track_changed(self):
		pass
	

	def update(self, *a, **k):
		mod = self.active_mod()
		#debug('modhandler update:', mod)
		if self.is_enabled() and not mod is None:
			mod.restore()
		else:
			#debug('disabling modhandler')
			#self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 247]))
			self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 72, 247]))
			if not self._po10_grid_value.subject is None:
				self._po10_grid_value.subject.reset()
			if not self._po10_encoder_grid_value.subject is None:
				self._po10_encoder_grid_value.subject.reset()
			if not self._po10_encoder_button_grid_value.subject is None:
				self._po10_encoder_button_grid_value.subject.reset()
			if not self._po10_keys_value.subject is None:
				self._po10_keys_value.subject.reset()
		if not self._on_lock_value.subject is None:
			self._on_lock_value.subject.send_value((not mod is None) + ((not mod is None) and self.is_locked() * 4))
	

	def send_ring_leds(self):
		if self.is_enabled() and self._active_mod and not self._local and self._po10_encoder_grid:
			leds = [240, 0, 1, 97, 8, 31, 0, 0, 0, 0, 0, 0, 0, 0]
			for encoder, coords in self._po10_encoder_grid.iterbuttons():
				bytes = encoder._get_ring()
				leds.append(bytes[0])
				leds.append(int(bytes[1]) + int(bytes[2]))
			leds.append(247)
			if not leds==self._last_sent_leds:
				self._script._send_midi(tuple(leds))
				self._last_sent_leds = leds
	

	def clear_rings(self):
		self._last_sent_leds = 1
	





#	a