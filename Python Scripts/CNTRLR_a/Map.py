# by amounra 0513 : http://www.aumhaa.com

"""
Cntrlr_Map.py

Created by amounra on 2010-10-05.
Copyright (c) 2010 __aumhaa__. All rights reserved.
http://www.aumhaa.com

This file allows the reassignment of the controls from their default arrangement.  The order is from left to right; 
Buttons are Note #'s and Faders/Rotaries are Controller #'s
"""

CHANNEL = 0		#main channel (0 - 15)

FADER_BANKING = True

DIAL_BANKING = True

CNTRLR_BUTTONS = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47]  #there are 16x2 of these

CNTRLR_GRID = [0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15]	#there are 4x4 of these

CNTRLR_FADERS = [4, 8, 12, 16, 20, 24, 28, 32]		#there are 8 of these

CNTRLR_KNOBS_LEFT = [1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15]	#there are 12 of these

CNTRLR_KNOBS_RIGHT = [17, 21, 25, 29, 18, 22, 26, 30, 19, 23, 27, 31]		#there are 12 of these

CNTRLR_DIALS = [48, 51, 54, 57, 49, 52, 55, 58, 50, 53, 56, 59]		#there are 12 of these

CNTRLR_DIAL_BUTTONS = [48, 51, 54, 57, 49, 52, 55, 58, 50, 53, 56, 59]		#there are 12 of these

FOLLOW = True		#this sets whether or not the last selected device on a track is selected for editing when you select a new track

COLOR_MAP = [2, 64, 4, 8, 16, 127, 32]

###	 the first number is Livid(OhmModes) standard, the second is Monomdular standard, the third is Monochrome
"""MUTE = [2, 2, 127]
SOLO = [3, 9, 127]
ARM = [5, 5, 8]
SEND_RESET = [1, 7, 7]
STOP_CLIPS = [127, 1, 1]
STOP_CLIPS_OFF = [127, 127, 127]
SELECT = [127, 127, 127]
SCENE_LAUNCH = [7, 3, 17]
USER1_COLOR = [4, 4, 29]
USER2_COLOR = [5, 5, 29]
USER3_COLOR = [6, 6, 29]
CROSSFADE_TOGGLE = [4, 4, 127]
TRACK_STOP = [127, 127, 127]
DEVICE_SELECT = [1, 1, 8]
BANK_BUTTONS = [1, 1, 1]
STOP_ALL = [127, 127, 15]
SESSION_NAV = [2, 2, 32]
SESSION_NAV_OFF = [3, 3, 33]
OVERDUB = [4, 4, 127]
LOOP = [3, 3, 127]
STOP = [127, 127, 127]
STOP_OFF = [127, 127, 127]
RECORD = [5, 5, 15]
RECORD_ON = [11, 11, 15]
PLAY = [6, 6, 127]
PLAY_ON = [18, 18, 127]
DEVICE_BANK = [127, 127, 127]
DEVICE_NAV = [1, 1, 127]
DEVICE_ON = [127, 127, 127]
DEVICE_LOCK = [4, 4, 127]
CLIP_RECORDING = [5, 11, 8] 
CLIP_STARTED = [6, 6, 32]
CLIP_STOP = [1, 127, 127]
CLIP_TRG_REC = [11, 4, 8]
CLIP_TRG_PLAY = [12, 2, 15]
ZOOM_STOPPED = [1, 127, 127]
ZOOM_PLAYING = [6, 6, 15]
ZOOM_SELECTED = [8, 1, 8]
STOP_CLIP = [127, 127, 2]"""

from _Framework.ButtonElement import Color
from _Mono_Framework.LividColors import *

class CntrlrColors:


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
		ArmSelected = LividRGB.RED
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
	

	class Mod:
		
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

