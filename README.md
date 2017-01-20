mod ===

monomodular b997+

How to make this work:

1) You MUST be using the most current version of Live! (as of this writing, version 9.7). You should also
install the latest version of Max (7.3).

2) Download this repository, preferably with a github client as I’m making frequent changes and it will be
easier to update for you if you find bugs that I can quickly fix. Put the “m4m7” or “m4m7-master” folder
inside Max’s packages folder, which can either be in ~/Documents/Max/packages or
/Applications/Max/packages (either path will work).

3) Copy all the FOLDERS* from inside the m4m7/Python Scripts/ folder to Live’s MIDI Remote Scripts folder.  

4) If you are using a Livid controller, you'll also want to copy all the FOLDERS* from the 
m4m7/Livid Python Scripts/ folder to Live's MIDI Remote Scripts folder.

5) If you've commissioned a script from me, it will be in the /Commission folder and I've probably
given you further specific instructions.

Notes:

Any help in testing is really awesome for me, please send me log.txt and Max window shots so I can trace
things though, and as much detail as possible about how you broke something ;)

I do plan on making an installer for this at some point, but its very time consuming so no promises about
when that might happen.

If you are using the Livid v2 scripts, I recommend turning off autoupdate in Live's preferences.  There 
is no guarantee when (or if) I will update these scripts again, and it gets messy when trying to backdate
github commits to try and find a compatible version to the last working build.  Currently, most functionality
works for the v2 scripts (including the DrumSteppr/SynthSteppr mods), but I will not be developing those 
scripts further beyond commissioned work.  

It’s a good idea to keep a separate copy of Live for the new scripts just so you don’t fubar your
working installation (if you have one). On OSX, you can do this simply by making a new copy of your Live.app
bundle and naming it something different (option + drag and drop). If that doesn't work for you, just back
up your old Mod/Livid Python scripts, _Mono_Framework folder (for pre v2 scripts) or aumhaa folder (for 
any of the newest scripts) in MIDI Remote Scripts (or simply archive the entire MIDI Remote Scripts folder somewhere).

If there are features or fixes that you need for something, I'm happy to consider making them on a commissioned
basis, drop me some mail and we can discuss.  I generally stay very busy, but often times small changes can happen
easily and quickly.  

(* Make sure you copy ALL THE FOLDERS FROM INSIDE the "Python Scripts" and "Livid Python Scripts" folders, not the "Python Scripts" or "Livid Pythons Scripts" folders themselves!)

aumhaa@gmail.com
