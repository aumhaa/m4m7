# by amounra 0815 : http://www.aumhaa.com

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
from _Framework.ChannelStripComponent import ChannelStripComponent
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

from PO10.PO10 import PO10DeviceComponent as BaseDeviceComponent
from PO10.PO10 import PO10DeviceSelectorComponent as BaseDeviceSelectorComponent
from PO10.PO10 import DefaultsComponent, HKDefaultsComponent


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
	



class FaderfoxDeviceSelectorComponent(BaseDeviceSelectorComponent):


	def scan_all(self):
		debug('scan all Faderfox--------------------------------')
		self._device_registry = [None, None]
		for slot in range(2):
			offset = 0
			prefix = DEVICE_KEYS[slot]
			preset = None
			for track in self.song().tracks:
				for device in self.enumerate_track_device(track):
					key = prefix
					if device.name.startswith(key+' ') or device.name == key:
						self._device_registry[slot] = device
			for return_track in self.song().return_tracks:
				for device in self.enumerate_track_device(return_track):
					key = prefix
					if device.name.startswith(key+' ') or device.name == key:
						self._device_registry[slot] = device
			for device in self.enumerate_track_device(self.song().master_track):
				key = prefix
				if device.name.startswith(key+' ') or device.name == key:
					self._device_registry[slot] = device
	

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
	


class Faderfox(OptimizedControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for PO10 "


	def __init__(self, *a, **k):
		super(Faderfox, self).__init__(*a, **k)
		self._version_check = '1.0'
		self._host_name = 'Faderfox'
		self._color_type = 'Monochrome'
		self._rgb = 0
		self._timer = 0
		self._touched = 0
		self.flash_status = 1
		self._skin = Skin(FaderfoxColors)
		self._main_modes = None
		with self.component_guard():
			self._setup_monobridge()
			self._setup_controls()
			self._setup_session()
			self._setup_device_control()
			self._setup_device_selector()
			self._setup_modes() 
		self._device_selector.select_device(DEFAULT_DEVICE_INDEX)
		self._on_device_changed.subject = self.song()
		self.set_feedback_channels(range(14, 15))
		#self._main_modes.selected_mode = 'MixMode'
		self.schedule_message(1, self._open_log)
		self._session.set_enabled(True)
		
	

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True 
		self._button = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, FADERFOX_BUTTONS[index], name = 'Button_' + str(index), script = self, skin = self._skin, color_map = COLOR_MAP) for index in range(4)]
		self._encoder = [CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, FADERFOX_ENCODERS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index), FADERFOX_ENCODERS[index], self) for index in range(4)] 

		self._encoder_matrix = ButtonMatrixElement(name = 'Encoder_Matrix', rows = [self._encoder])
		self._button_matrix = ButtonMatrixElement(name = 'Button_Matrix', rows = [self._button[2:]])
	

	def _setup_session(self):
		self._session = SessionComponent(name = 'Session_Component', num_tracks = 20, num_scenes = 1)
		self._session._scenes[0].layer = Layer(priority = 6, launch_button = self._button[1])
		self._session.layer = Layer(priority = 6, scene_bank_down_button = self._button[0])
		self.set_highlighting_session_component(self._session)
		self._session.set_show_highlight(True)
		self._session.set_enabled(False)
		self._session._link()
	

	def _setup_device_control(self):
		self._device = BaseDeviceComponent()
		self._device.layer = Layer(priority = 6, parameter_controls = self._encoder_matrix)
		self._device.set_enabled(True)
	

	def _setup_device_selector(self):
		self._device_selector = FaderfoxDeviceSelectorComponent(self, self._device, prefix = '@d')
		self._device_selector.layer = Layer(priority = 6, matrix = self._button_matrix)
		self._device_selector.set_enabled(True)
	

	def _setup_modes(self):
		pass
	

	def update_display(self):
		super(Faderfox, self).update_display()
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
	

	def disconnect(self):
		self._session._unlink()
		self.log_message("<<<<<<<<<<<<<<<<<<<<<<<<< " + str(self._host_name) + " log closed >>>>>>>>>>>>>>>>>>>>>>>>>")
		super(Faderfox, self).disconnect()
	




#	a