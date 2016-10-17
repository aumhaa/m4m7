 
#from __future__ import absolute_import, print_function
from functools import partial
from ableton.v2.control_surface import Skin
from ableton.v2.control_surface.elements import SelectedTrackColorFactory, SelectedClipColorFactory
from pushbase.colors import Blink, FallbackColor, Pulse
from Push2.skin_default import Colors as ColorsBase
from Push2.colors import Basic, determine_shaded_color_index, Rgb, translate_color_index


class Colors(ColorsBase):


	class Mod:

		ShiftOn = Basic.ON
		ShiftOff = Basic.HALF
		AltOn = Basic.ON
		AltOff = Basic.HALF
		LockOn = Basic.FULL_BLINK_SLOW
		LockOff = Basic.ON

		class Nav:
			OnValue = Rgb.RED
			OffValue = Rgb.WHITE
		
	

	class MonoInstrument:

		PressFlash = Rgb.WHITE
		OffsetOnValue = Rgb.GREEN
		ScaleOffsetOnValue = Rgb.RED
		SplitModeOnValue = Rgb.WHITE
		SequencerModeOnValue = Rgb.SKY
		DrumOffsetOnValue = Rgb.RED_SHADE
		VerticalOffsetOnValue = Rgb.BLUE

		class Keys:
			SelectedNote = Rgb.GREEN
			RootWhiteValue = Rgb.RED
			RootBlackValue = Rgb.RED_SHADE
			WhiteValue = Rgb.SKY
			BlackValue = Rgb.BLUE
	

		class Drums:
			SelectedNote = Rgb.BLUE
			EvenValue = Rgb.GREEN
			OddValue = Rgb.RED_SHADE

def make_default_skin():
	return Skin(Colors)


def make_drum_pad_coloring_skin():
	return Skin(ColorsWithDrumPadColoring)



