# by amounra 0615 : http://www.aumhaa.com

"""
Faderfox_Map.py

Created by amounra on 2015-08-01.
Copyright (c) 2015 __aumhaa__. All rights reserved.
http://www.aumhaa.com

"""

CHANNEL = 15

FADERFOX_BUTTONS = [15, 16, 81, 85]

FADERFOX_ENCODERS = [6, 4, 25, 23]

DEFAULT_MASTER_DEVICE_INDEX = 0

DEFAULT_DEVICE_INDEX = 0

DEVICE_KEYS = ['@d:8', '@m:1']

FOLLOW = True		#this sets whether or not the last selected device on a track is selected for editing when you select a new track

COLOR_MAP = [127, 127, 127, 127, 127, 127, 127]

from _Framework.ButtonElement import Color
from _Mono_Framework.LividColors import *

class FaderfoxColors:


	ResetSendsColor = LividRGB.MAGENTA

	class ModeButtons:
		ModSwitcher = LividRGB.BlinkMedium.CYAN
		ModSwitcherDisabled = LividRGB.CYAN
		Translations = LividRGB.BlinkMedium.MAGENTA
		TranslationsDisabled = LividRGB.MAGENTA
		DeviceSelector = LividRGB.BlinkMedium.YELLOW
		DeviceSelectorDisabled = LividRGB.YELLOW
	

	class DefaultButton:
		On = LividRGB.WHITE
		Off = LividRGB.OFF
		Disabled = LividRGB.OFF
		Alert = LividRGB.BlinkFast.WHITE
	

	class Session:
		StopClipTriggered = LividRGB.BlinkFast.BLUE
		StopClip = LividRGB.WHITE
		Scene = LividRGB.CYAN
		NoScene = LividRGB.OFF
		SceneTriggered = LividRGB.BlinkFast.BLUE
		ClipTriggeredPlay = LividRGB.BlinkFast.GREEN
		ClipTriggeredRecord = LividRGB.BlinkFast.RED
		RecordButton = LividRGB.OFF
		ClipStopped = LividRGB.WHITE
		ClipStarted = LividRGB.GREEN
		ClipRecording = LividRGB.RED
		NavigationButtonOn = LividRGB.CYAN
		NavigationButtonOff = LividRGB.YELLOW
		ZoomOn = LividRGB.BlinkFast.WHITE
		ZoomOff = LividRGB.WHITE
	

	class Zooming:
		Selected = LividRGB.BlinkFast.YELLOW
		Stopped = LividRGB.WHITE
		Playing = LividRGB.GREEN
		Empty = LividRGB.OFF
	

	class NoteEditor:

		class Step:
			Low = LividRGB.CYAN
			High = LividRGB.WHITE 
			Full = LividRGB.YELLOW
			Muted = LividRGB.YELLOW
			StepEmpty = LividRGB.OFF
		

		class StepEditing:
			High = LividRGB.GREEN
			Low = LividRGB.CYAN
			Full = LividRGB.YELLOW
			Muted = LividRGB.WHITE
		

		StepEmpty = LividRGB.OFF
		StepEmptyBase = LividRGB.OFF
		StepEmptyScale = LividRGB.OFF
		StepDisabled = LividRGB.OFF
		Playhead = Color(31)
		PlayheadRecord = Color(31)
		StepSelected = LividRGB.GREEN
		QuantizationSelected = LividRGB.RED
		QuantizationUnselected = LividRGB.MAGENTA
	

	class LoopSelector:
		Playhead = LividRGB.YELLOW
		OutsideLoop = LividRGB.BLUE
		InsideLoopStartBar = LividRGB.CYAN
		SelectedPage = LividRGB.WHITE
		InsideLoop = LividRGB.CYAN
		PlayheadRecord = LividRGB.RED
	

	class DrumGroup:
		PadAction = LividRGB.WHITE
		PadFilled = LividRGB.GREEN
		PadSelected = LividRGB.WHITE
		PadSelectedNotSoloed = LividRGB.WHITE
		PadEmpty = LividRGB.OFF
		PadMuted = LividRGB.YELLOW
		PadSoloed = LividRGB.CYAN
		PadMutedSelected = LividRGB.BLUE
		PadSoloedSelected = LividRGB.BLUE
		PadInvisible = LividRGB.OFF
		PadAction = LividRGB.RED
	

	class Transport:
		PlayOn = LividRGB.BlinkMedium.GREEN
		PlayOff = LividRGB.GREEN
		StopOn = LividRGB.BLUE
		RecordOn = LividRGB.BlinkMedium.RED
		RecordOff = LividRGB.RED
		OverdubOn = LividRGB.BlinkFast.RED
		OverdubOff = LividRGB.RED	
	

	class Mixer:
		SoloOn = LividRGB.CYAN
		SoloOff = LividRGB.OFF
		MuteOn = LividRGB.YELLOW
		MuteOff = LividRGB.OFF
		ArmSelected = LividRGB.BiColor.WHITE.RED
		ArmSelectedImplicit = LividRGB.MAGENTA
		ArmUnselected = LividRGB.RED
		ArmOff = LividRGB.OFF
		StopClip = LividRGB.WHITE
		SelectedOn = LividRGB.BLUE
		SelectedOff = LividRGB.OFF
	

	class Recording:
		Transition = LividRGB.BlinkFast.MAGENTA
	

	class Recorder:
		On = LividRGB.WHITE
		Off = LividRGB.BLUE
		NewOn = LividRGB.BlinkMedium.YELLOW
		NewOff = LividRGB.YELLOW
		FixedOn = LividRGB.BlinkMedium.CYAN
		FixedOff = LividRGB.CYAN
		RecordOn = LividRGB.BlinkMedium.MAGENTA
		RecordOff = LividRGB.MAGENTA
		AutomationOn = LividRGB.BlinkMedium.CYAN
		AutomationOff = LividRGB.CYAN
		FixedAssigned = LividRGB.MAGENTA
		FixedNotAssigned = LividRGB.OFF
	

	class Sequencer:
		OctaveOn = LividRGB.BlinkFast.CYAN
		OctaveOff = LividRGB.OFF
		On = LividRGB.WHITE
		Off = LividRGB.OFF
	

	class Device:
		NavOn = LividRGB.MAGENTA
		NavOff = LividRGB.OFF
		BankOn = LividRGB.YELLOW
		BankOff = LividRGB.OFF
		ChainNavOn = LividRGB.RED
		ChainNavOff = LividRGB.OFF
		ContainNavOn = LividRGB.CYAN
		ContainNavOff = LividRGB.OFF
	

	class DeviceSelector:
		AssignOn = LividRGB.BlinkFast.YELLOW
		AssignOff = LividRGB.YELLOW
	

	class Mod:
		
		AltOn = LividRGB.BlinkFast.BLUE
		AltOff = LividRGB.BLUE
		class Nav:
			OnValue = LividRGB.RED
			OffValue = LividRGB.WHITE
		
	

	class MonoInstrument:

		PressFlash = LividRGB.WHITE
		OffsetOnValue = LividRGB.GREEN
		ScaleOffsetOnValue = LividRGB.RED
		SplitModeOnValue = LividRGB.WHITE
		SequencerModeOnValue = LividRGB.CYAN
		DrumOffsetOnValue = LividRGB.MAGENTA
		VerticalOffsetOnValue = LividRGB.BLUE
		ShiftOn = LividRGB.BlinkFast.YELLOW
		ShiftOff = LividRGB.YELLOW

		class Keys:
			SelectedNote = LividRGB.GREEN
			RootWhiteValue = LividRGB.RED
			RootBlackValue = LividRGB.MAGENTA
			WhiteValue = LividRGB.CYAN
			BlackValue = LividRGB.BLUE
		

		class Drums:
			SelectedNote = LividRGB.BLUE
			EvenValue = LividRGB.GREEN
			OddValue = LividRGB.MAGENTA
		
	

	class Translation:

		class Channel_4:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_5:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_6:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_7:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_8:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_9:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_10:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

		class Channel_11:
			Grid_0 = LividRGB.OFF
			Grid_1 = LividRGB.OFF
			Grid_2 = LividRGB.OFF
			Grid_3 = LividRGB.OFF
			Grid_4 = LividRGB.OFF
			Grid_5 = LividRGB.OFF
			Grid_6 = LividRGB.OFF
			Grid_7 = LividRGB.OFF
			Grid_8 = LividRGB.OFF
			Grid_9 = LividRGB.OFF
			Grid_10 = LividRGB.OFF
			Grid_11 = LividRGB.OFF
			Grid_12 = LividRGB.OFF
			Grid_13 = LividRGB.OFF
			Grid_14 = LividRGB.OFF
			Grid_15 = LividRGB.OFF

			Button_0 = LividRGB.OFF
			Button_1 = LividRGB.OFF
			Button_2 = LividRGB.OFF
			Button_3 = LividRGB.OFF
			Button_4 = LividRGB.OFF
			Button_5 = LividRGB.OFF
			Button_6 = LividRGB.OFF
			Button_7 = LividRGB.OFF
			Button_8 = LividRGB.OFF
			Button_9 = LividRGB.OFF
			Button_10 = LividRGB.OFF
			Button_11 = LividRGB.OFF
			Button_12 = LividRGB.OFF
			Button_13 = LividRGB.OFF
			Button_14 = LividRGB.OFF
			Button_15 = LividRGB.OFF
			Button_16 = LividRGB.OFF
			Button_17 = LividRGB.OFF
			Button_18 = LividRGB.OFF
			Button_19 = LividRGB.OFF
			Button_20 = LividRGB.OFF
			Button_21 = LividRGB.OFF
			Button_22 = LividRGB.OFF
			Button_23 = LividRGB.OFF
			Button_24 = LividRGB.OFF
			Button_25 = LividRGB.OFF
			Button_26 = LividRGB.OFF
			Button_27 = LividRGB.OFF
			Button_28 = LividRGB.OFF
			Button_29 = LividRGB.OFF
			Button_30 = LividRGB.OFF
			Button_31 = LividRGB.OFF
		

	

## a  http://www.aumhaa.com

