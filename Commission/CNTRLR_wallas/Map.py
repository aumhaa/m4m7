# by amounra 0416 : http://www.aumhaa.com
# written against Live 9.61 release on 042916


from ableton.v2.control_surface.elements.color import Color
from aumhaa.v2.livid.colors import *

"""
Cntrlr_Map.py

Created by amounra on 2010-10-05.
Copyright (c) 2010 __aumhaa__. All rights reserved.
http://www.aumhaa.com

This file allows the reassignment of the controls from their default arrangement.  The order is from left to right; 
Buttons are Note #'s and Faders/Rotaries are Controller #'s
"""

CHANNEL = 0		#main channel (0 - 15)

CNTRLR_BUTTONS = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47]  #there are 16x2 of these

CNTRLR_GRID = [0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15]	#there are 4x4 of these

CNTRLR_FADERS = [4, 8, 12, 16, 20, 24, 28, 32]		#there are 8 of these

CNTRLR_KNOBS_LEFT = [1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15]	#there are 12 of these

CNTRLR_KNOBS_RIGHT = [17, 21, 25, 29, 18, 22, 26, 30, 19, 23, 27, 31]		#there are 12 of these

CNTRLR_DIALS = [48, 51, 54, 57, 49, 52, 55, 58, 50, 53, 56, 59]		#there are 12 of these

CNTRLR_DIAL_BUTTONS = [48, 51, 54, 57, 49, 52, 55, 58, 50, 53, 56, 59]		#there are 12 of these

FOLLOW = True		#this sets whether or not the last selected device on a track is selected for editing when you select a new track

COLOR_MAP = [2, 64, 4, 8, 16, 127, 32]



class CntrlrColors:


	ResetSendsColor = LividRGB.MAGENTA

	class ModeButtons:
		ModSwitcher = LividRGB.BlinkMedium.CYAN
		ModSwitcherDisabled = LividRGB.CYAN
		Translations = LividRGB.BlinkMedium.MAGENTA
		TranslationsDisabled = LividRGB.MAGENTA
		DeviceSelector = LividRGB.BlinkMedium.YELLOW
		DeviceSelectorDisabled = LividRGB.YELLOW
	

	class ShiftButtons:
		SessionOn = LividRGB.YELLOW
		SessionOff = LividRGB.OFF
	

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
		ClipEmpty = LividRGB.OFF
		ClipStopped = LividRGB.WHITE
		ClipStarted = LividRGB.GREEN
		ClipRecording = LividRGB.RED
		NavigationButtonOn = LividRGB.CYAN
		NavigationButtonOff = LividRGB.YELLOW
		PageNavigationButtonOn = LividRGB.BLUE
		PageNavigationButtonOff = LividRGB.OFF
		ZoomOn = LividRGB.BlinkFast.WHITE
		ZoomOff = LividRGB.WHITE
	

	class Zooming:
		Selected = LividRGB.BlinkFast.YELLOW
		Stopped = LividRGB.WHITE
		Playing = LividRGB.GREEN
		Empty = LividRGB.OFF
	


	class LoopSelector:
		Playhead = LividRGB.YELLOW
		OutsideLoop = LividRGB.BLUE
		InsideLoopStartBar = LividRGB.CYAN
		SelectedPage = LividRGB.WHITE
		InsideLoop = LividRGB.CYAN
		PlayheadRecord = LividRGB.RED
	

	class Transport:
		PlayOn = LividRGB.BlinkMedium.GREEN
		PlayOff = LividRGB.GREEN
		StopOn = LividRGB.BLUE
		StopOff = LividRGB.BLUE
		RecordOn = LividRGB.BlinkMedium.RED
		RecordOff = LividRGB.RED
		OverdubOn = LividRGB.BlinkFast.RED
		OverdubOff = LividRGB.RED
		NudgeOn = LividRGB.BlinkFast.WHITE
		NudgeOff = LividRGB.WHITE
		TapTempoOn = LividRGB.BLUE
		LoopOn = LividRGB.GREEN
		LoopOff = LividRGB.OFF
	

	class Mixer:
		SoloOn = LividRGB.CYAN
		SoloOff = LividRGB.OFF
		MuteOn = LividRGB.YELLOW
		MuteOff = LividRGB.OFF
		ArmSelected = LividRGB.BiColor.WHITE.RED
		ArmSelectedImplicit = LividRGB.MAGENTA
		ArmUnselected = LividRGB.RED
		ArmOff = LividRGB.OFF
		StopClip = LividRGB.RED
		SelectedOn = LividRGB.BLUE
		SelectedOff = LividRGB.OFF
	

	class Recording:
		On = LividRGB.RED
		Off = LividRGB.MAGENTA
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
	

	class Automation:
		On = LividRGB.BlinkMedium.CYAN
		Off = LividRGB.CYAN
	

	class Device:
		NavOn = LividRGB.MAGENTA
		NavOff = LividRGB.OFF
		BankOn = LividRGB.YELLOW
		BankOff = LividRGB.OFF
		ChainNavOn = LividRGB.RED
		ChainNavOff = LividRGB.OFF
		ContainNavOn = LividRGB.CYAN
		ContainNavOff = LividRGB.OFF
	



## a  http://www.aumhaa.com

