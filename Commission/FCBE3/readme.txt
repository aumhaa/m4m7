This all assumes that you have the FCB1010 with Eureka3 EPROM installed, it needs to be in IO mode.

Add the MonoFCBE3 folder to your MIDI Remote Scripts (/Applications/Ableton Live 9/Contents/App Resources/MIDI Remote Scripts/).  This assumes that all of the other folders from the "Python Scripts" of m4m7 have already been installed.

Open the MonoFCBE3_Translator patch from where its at...it will launch inside MaxMSP.  Eventually we will build you a standalone of this, so it doesn't require Max, but I want to tweak a few things first.  Connect it's input and output to the physical port that your FCB1010 is connected to.

Now open Live, go to its MIDI Preferences, and add an instance of the MonoFCBE3 control surface to a slot.  Connect its input and output to the FCB3E ports, and make sure that only "Remote" is enabled for those ports.

Buttons 1-5 and the left expression give control of a LiveLooper or Jove device, up to 16 instances.  In order to be detected, each looper needs to be tagged with "@loop<n>", where <n> is the looper instance number (1-16).

Button 1:  Record
Button 2:  Overdub
Button 3:  Mute/Stop
Button 4:  Reverse
Button 5:  Clear (Jove only)

Expression Left: Feedback

Buttons 6-7 are translated to a different channel for each looper, so that it can be mapped in Live to discreet controls for each looper instance.

Button 8:  "arm" control for the selected track.
Button 9: "record" button for the selected track (same as the O button on Push).
Button 10: "new" button for the selected track (same as the New button on Push).

Expression Right: "volume" for selected track.

Up & Down buttons:  Move selected track.

Tag a track you want associated with a looper instance with "@l:<n>", where <n> is the looper instance number you'd like to control when you have that track selected.

