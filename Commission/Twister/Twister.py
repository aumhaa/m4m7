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


from pushbase.auto_arm_component import AutoArmComponent
from pushbase.grid_resolution import GridResolution
from pushbase.playhead_element import PlayheadElement
from pushbase.percussion_instrument_finder_component import PercussionInstrumentFinderComponent, find_drum_group_device
from pushbase.drum_group_component import DrumGroupComponent

debug = initialize_debug()


"""Custom files, overrides, and files from other scripts"""
from _Generic.Devices import *
from .Map import *


def xstr(s):
	if s is None:
		return ''
	else:
		return str(s)


def special_number_of_parameter_banks(device, device_dict = DEVICE_DICT):
	""" Determine the amount of parameter banks the given device has """
	if device != None:
		if device.class_name in device_dict.keys():
			device_bank = device_dict[device.class_name]
			return len(device_bank)/2 + (1 if len(device_bank)%2 else 0)
		else:
			if device.class_name in MAX_DEVICES:
				try:
					banks = device.get_bank_count()
				except:
					banks = 0
				if banks != 0:
					return banks
			param_count = len(device.parameters[1:])
			return param_count / 16 + (1 if param_count % 16 else 0)
	return 0


def special_parameter_bank_names(device, bank_name_dict = BANK_NAME_DICT):
	if device != None:
		if device.class_name in bank_name_dict.keys():
			ret = group(bank_name_dict[device.class_name], 2)
			ret1 = [[i for i in bank_names if not i is None] for bank_names in ret]
			return [' - '.join(i) for i in ret1]
		banks = special_number_of_parameter_banks(device)
		def _default_bank_name(bank_index):
			return 'Bank ' + str(bank_index + 1)
		
		if device.class_name in MAX_DEVICES and banks != 0:
			def _is_ascii(c):
				return ord(c) < 128
			
			def _bank_name(bank_index):
				try:
					name = device.get_bank_name(bank_index)
				except:
					name = None
				if name:
					return str(filter(_is_ascii, name))
				else:
					return _default_bank_name(bank_index)
			
			return map(_bank_name, range(0, banks))
		else:
			return map(_default_bank_name, range(0, banks))
	return []


def special_parameter_banks(device, device_dict = DEVICE_DICT):
	""" Determine the parameters to use for a device """
	if device != None:
		if device.class_name is 'LegacyModDeviceProxy':
			return group(device_parameters_to_map(device), 16)
		elif device.class_name in device_dict.keys():
			def names_to_params(bank):
				return map(partial(get_parameter_by_name, device), bank)
			
			return group([i for i in flatten(map(names_to_params, device_dict[device.class_name]))], 16)
		else:
			if device.class_name in MAX_DEVICES:
				try:
					banks = device.get_bank_count()
				except:
					banks = 0
				if banks != 0:
					def _bank_parameters(bank_index):
						try:
							parameter_indices = device.get_bank_parameters(bank_index)
						except:
							parameter_indices = []
						if len(parameter_indices) != 32:
							return [ None for i in range(0, 32) ]
						else:
							return [ (device.parameters[i] if i != -1 else None) for i in parameter_indices ]
					
					return map(_bank_parameters, range(0, banks))
			return group(device_parameters_to_map(device), 16)
	return []



class SpecialDeviceComponent(DeviceComponent):


	def __init__(self, script, *a, **k):
		self._script = script
		super(SpecialDeviceComponent, self).__init__(*a, **k)
	

	def display_device(self):
		track = self.find_track(livedevice(self._get_device()))
		if (self.song.view.selected_track is not track):
			self.song.view.selected_track = track
		self.song.view.select_device(livedevice(self._get_device()))
		if ((not self.application().view.is_view_visible('Detail')) or (not self.application().view.is_view_visible('Detail/DeviceChain'))):
			self.application().view.show_view('Detail')
			self.application().view.show_view('Detail/DeviceChain')
	

	def find_track(self, obj):
		if obj != None:
			if(type(obj.canonical_parent)==type(None)) or (type(obj.canonical_parent)==type(self.song)):
				return None
			elif(type(obj.canonical_parent) == type(self.song.tracks[0])):
				return obj.canonical_parent
			else:
				return self.find_track(obj.canonical_parent)
		else:
			return None
	

	def update(self):
		super(SpecialDeviceComponent, self).update()
	

	def _current_bank_details(self):
		bank_name = self._bank_name
		bank = []
		best_of = self._best_of_parameter_bank()
		banks = self._parameter_banks()
		if banks:
			if self._bank_index != None and self._is_banking_enabled() or not best_of:
				index = self._bank_index if self._bank_index != None else 0
				bank = banks[index]
				#debug('bank is:', bank)
				bank_name = self._parameter_bank_names()[index]
			else:
				bank = best_of
				bank_name = 'Best of Parameters'
		#debug('current_bank_details:', bank_name, bank)
		return (bank_name, bank)
	

	def _parameter_banks(self):
		return special_parameter_banks(self._get_device())
	

	def _parameter_bank_names(self):
		return special_parameter_bank_names(self._get_device())
	

	def _number_of_parameter_banks(self):
		return special_number_of_parameter_banks(self._get_device())
	

	def _release_parameters(self, controls):
		if controls != None:
			for control in controls:
				if control != None:
					control.release_parameter()
					control.reset()
	


class TwisterButtonElement(MonoButtonElement):


	def send_value(self, value, force = False):
		if (value != None) and isinstance(value, int) and (value in range(128)):
			if (force or self._force_next_send or ((value != self._last_sent_value) and self._is_being_forwarded)):
				data_byte1 = self._original_identifier
				if value in range(1, 127):
					data_byte2 = self._color_map[(value - 1) % (self._num_colors)]
				elif value == 127:
					data_byte2 = self._color_map[self._num_colors-1]
				else:
					data_byte2 = self._darkened
				self._color = data_byte2
				status_byte = self._original_channel
				if (self._msg_type == MIDI_NOTE_TYPE):
					status_byte += MIDI_NOTE_ON_STATUS
				elif (self._msg_type == MIDI_CC_TYPE):
					status_byte += MIDI_CC_STATUS
				else:
					assert False
				self.send_midi(tuple([status_byte,
				 data_byte1,
				 data_byte2]))
				self._last_sent_message = [value]
				if self._report_output:
					is_input = True
					self._report_value(value, (not is_input))
				self._flash_state = round((value -1)/self._num_colors)
				self._force_next_value = False
		else:
			debug('Button bad send value:', value)
	


class Twister(LividControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for Livid CNTRLR "


	_sysex_id = 8
	_model_name = 'Twister'
	_host_name = 'Twister'
	_version_check = 'b996'
	monomodular = None

	device_provider_class = ModDeviceProvider

	def __init__(self, *a, **k):
		super(Twister, self).__init__(*a, **k)
		self._skin = Skin(TwisterColors)
		self._device_selection_follows_track_selection = True
		with self.component_guard():
			self._setup_monobridge()
			self._setup_controls()
			#self._define_sysex()
			self._setup_background()
			self._setup_m4l_interface()
			self._setup_mod()
			self._setup_device_control()
			#self._setup_modes()
	

	def _initialize_script(self):
		super(Twister, self)._initialize_script()
		self._connected = True
	

	def _setup_controls(self):
		is_momentary = True
		optimized = True
		resource = PrioritizedResource
		self._encoder = [CodecEncoderElement(msg_type = MIDI_CC_TYPE, channel = CHANNEL, identifier = TWISTER_DIALS[index], name = 'Encoder_' + str(index), num = TWISTER_DIALS[index], script = self, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(16)] 
		self._encoder_button = [TwisterButtonElement(is_momentary = is_momentary, msg_type = MIDI_CC_TYPE, channel = 1, identifier = TWISTER_DIAL_BUTTONS[index], name = 'Encoder_Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP, optimized_send_midi = optimized, resource_type = resource, monobridge = self._monobridge) for index in range(16)]	

		self._dial_matrix = ButtonMatrixElement(name = 'Dial_Matrix', rows = [self._encoder[index*4:(index*4)+4] for index in range(4)])
		self._dial_button_matrix = ButtonMatrixElement(name = 'Dial_Button_Matrix', rows = [self._encoder_button[index*4:(index*4)+4] for index in range(4)])
	

	def _setup_background(self):
		self._background = BackgroundComponent(name = 'Background')
		self._background.layer = Layer(priority = 3, dials = self._dial_matrix, dial_buttons = self._dial_button_matrix.submatrix[:,:])
		self._background.set_enabled(True)
	

	def _setup_m4l_interface(self):
		self._m4l_interface = M4LInterfaceComponent(controls=self.controls, component_guard=self.component_guard, priority = 10)
		self._m4l_interface.name = "M4LInterface"
		self.get_control_names = self._m4l_interface.get_control_names
		self.get_control = self._m4l_interface.get_control
		self.grab_control = self._m4l_interface.grab_control
		self.release_control = self._m4l_interface.release_control
	

	def _define_sysex(self):
		pass
	

	def _check_connection(self):
		self._connected = True
		self._initialize_hardware()
		self._initialize_script()
	

	def _setup_mixer_control(self):
		self._mixer_session_ring = SessionRingComponent(num_tracks = 4, num_scenes = 4)
		self._mixer = MonoMixerComponent(name = 'Mixer', tracks_provider = self._mixer_session_ring, track_assigner = simple_track_assigner, invert_mute_feedback = True, auto_name = True, enable_skinning = True)

		self._mixer.layer = Layer(priority = 4, 
											solo_buttons = self._dial_button_matrix.submatrix[:,0],
											stop_clip_buttons = self._dial_button_matrix.submatrix[:,1],
											track_select_buttons = self._dial_button_matrix.submatrix[:,2])
		self._mixer.set_enabled(True)
	

	def _setup_device_control(self):
		self._device = SpecialDeviceComponent(name = 'Device_Component', device_provider = self._device_provider, device_bank_registry = DeviceBankRegistry(), script = self)
		self._device.layer = Layer(priority = 4, parameter_controls = self._dial_matrix.submatrix[:,:],)
		self._device.set_enabled(True)
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = TwisterModHandler(self, device_provider = self._device_provider)
		self.modhandler.name = 'ModHandler' 
		self.modhandler.layer = Layer(priority = 8,
										twister_encoder_button_grid = self._dial_button_matrix.submatrix[:,:],)
										#twister_encoder_grid = self._dial_matrix.submatrix[:,:],)
		self.modhandler.set_enabled(True)
	


class TwisterModHandler(ModHandler):


	def __init__(self, *a, **k):
		self._twister_encoder_grid = None
		self._twister_encoder_button_grid = None
		addresses = {'twister_encoder_grid': {'obj':RingedGrid('twister_encoder_grid', 4, 4), 'method':self._receive_twister_encoder_grid},
					'twister_encoder_button_grid': {'obj':Grid('twister_encoder_button_grid', 4, 4), 'method':self._receive_twister_encoder_button_grid},}
		super(TwisterModHandler, self).__init__(addresses = addresses, *a, **k)
		self._color_type = 'RGB'
	

	def _receive_grid(self, x, y, value = -1, *a, **k):
		pass
	

	def _receive_twister_encoder_grid(self, x, y, value = -1, *a, **K):
		#debug('_receive_twister_encoder_grid:', x, y, value, mode, green, custom, local, relative)
		if self.is_enabled() and self._active_mod and self._twister_encoder_grid and x < 4 and y < 4:
			if value > -1:
				self._twister_encoder_grid.send_value(x, y, value, True)
	

	def _receive_twister_encoder_button_grid(self, x, y, value, *a, **k):
		if self.is_enabled() and self._active_mod:
			if self._twister_encoder_button_grid:
				self._twister_encoder_button_grid.send_value(x, y, self._colors[value], True)
	

	def set_twister_encoder_grid(self, grid):
		self._twister_encoder_grid = grid
		#self._twister_encoder_grid_value.subject = self._twister_encoder_grid
	

	def set_twister_encoder_button_grid(self, buttons):
		self._twister_encoder_button_grid = buttons
		self._twister_encoder_button_grid_value.subject = self._twister_encoder_button_grid
	

	@listens('value')
	def _twister_encoder_grid_value(self, value, x, y, *a, **k):
		#debug('_twister_encoder_grid_value:', x, y, value)
		if self._active_mod:
			self._active_mod.send('twister_encoder_grid', x, y, value)
	

	@listens('value')
	def _twister_encoder_button_grid_value(self, value, x, y, *a, **k):
		#debug('_twister_encoder_button_grid_value:', x, y, value)
		if self._active_mod:
			self._active_mod.send('twister_encoder_button_grid', x, y, value)
	

	def update(self, *a, **k):
		mod = self.active_mod()
		#debug('modhandler update:', mod)
		if self.is_enabled() and not mod is None:
			mod.restore()
	


#a