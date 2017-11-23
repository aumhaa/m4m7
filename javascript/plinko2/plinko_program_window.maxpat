{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 168.0, 289.0, 956.0, 645.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 192.0, 126.0, 50.0, 19.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.0, 504.0, 127.0, 19.0 ],
					"style" : "",
					"text" : "prepend program_window_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 212.0, 470.0, 1349.5, 19.0 ],
					"style" : "",
					"text" : "funnel 8"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-103",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 212.0, 539.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 1386.0, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 1194.428589, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 1004.357178, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 814.285706, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 624.214294, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 434.142853, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 244.071411, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 2,
					"outlettype" : [ "", "list" ],
					"patching_rect" : [ 53.999996, 408.0, 177.0, 19.0 ],
					"style" : "",
					"text" : "voice_decode ---0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "int", "int", "int", "int", "int", "int" ],
					"patching_rect" : [ 27.599998, 79.0, 85.0, 19.0 ],
					"style" : "",
					"text" : "unpack 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 141.0, 79.0, 55.0, 19.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 54.0, 470.0, 56.0, 19.0 ],
					"style" : "",
					"text" : "s ---midiout"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-39",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.599998, 27.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-35",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 141.0, 27.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-261",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 111.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 104.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "channel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-260",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 96.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 87.0, 41.0, 17.0 ],
					"style" : "",
					"text" : "duration"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-259",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 77.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 70.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "velocity"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-258",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 61.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 53.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "octave"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-257",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 45.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 36.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "key"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-256",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 27.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 19.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "mode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-255",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1089.0, 128.0, 48.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 426.0, 1.0, 40.0, 17.0 ],
					"style" : "",
					"text" : "process"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-234",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1508.75, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 56,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_duration",
							"parameter_shortname" : "bank8_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ]
						}

					}
,
					"varname" : "bank8_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-235",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1484.75, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 72,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_velocity",
							"parameter_shortname" : "bank8_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank8_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-237",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1425.5, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 64,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_channel",
							"parameter_shortname" : "bank8_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank8_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-239",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1405.75, 217.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 48,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_mode",
							"parameter_shortname" : "bank8_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "bank8_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-248",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1504.5, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 37,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_8ve",
							"parameter_shortname" : "bank8_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 7 ]
						}

					}
,
					"varname" : "bank8_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-249",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1465.0, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 21,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_key",
							"parameter_shortname" : "bank8_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank8_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-250",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1423.75, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 29,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_scale",
							"parameter_shortname" : "bank8_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank8_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-213",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1317.178589, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 55,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_duration",
							"parameter_shortname" : "bank7_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank7_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-214",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1293.178589, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 71,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_velocity",
							"parameter_shortname" : "bank7_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank7_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-216",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1233.928589, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 63,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_channel",
							"parameter_shortname" : "bank7_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank7_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-218",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1214.178589, 217.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 47,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_mode",
							"parameter_shortname" : "bank7_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ]
						}

					}
,
					"varname" : "bank7_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-227",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1312.928589, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 36,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_8ve",
							"parameter_shortname" : "bank7_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 6 ]
						}

					}
,
					"varname" : "bank7_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-228",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1273.428589, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 20,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_key",
							"parameter_shortname" : "bank7_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank7_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-229",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1232.178589, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 28,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_scale",
							"parameter_shortname" : "bank7_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank7_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-192",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1127.107178, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 54,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_duration",
							"parameter_shortname" : "bank6_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank6_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-193",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1103.107178, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 70,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_velocity",
							"parameter_shortname" : "bank6_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank6_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-195",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1043.857178, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 62,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_channel",
							"parameter_shortname" : "bank6_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank6_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-197",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1024.107178, 217.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 46,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_mode",
							"parameter_shortname" : "bank6_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "bank6_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-206",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1122.857178, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 35,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_8ve",
							"parameter_shortname" : "bank6_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 5 ]
						}

					}
,
					"varname" : "bank6_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-207",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1083.357178, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 19,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_key",
							"parameter_shortname" : "bank6_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank6_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-208",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1042.107178, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 27,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_scale",
							"parameter_shortname" : "bank6_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank6_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-171",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 937.035706, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 53,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_duration",
							"parameter_shortname" : "bank5_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank5_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-172",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 913.035706, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 69,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_velocity",
							"parameter_shortname" : "bank5_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank5_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-174",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 853.785706, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 61,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_channel",
							"parameter_shortname" : "bank5_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank5_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-176",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 834.035706, 217.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 45,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_mode",
							"parameter_shortname" : "bank5_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "bank5_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-185",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 932.785706, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 34,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_8ve",
							"parameter_shortname" : "bank5_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank5_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-186",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 893.285706, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 18,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_key",
							"parameter_shortname" : "bank5_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank5_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-187",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 852.035706, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 26,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_scale",
							"parameter_shortname" : "bank5_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank5_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-150",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 746.964294, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 52,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_duration",
							"parameter_shortname" : "bank4_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank4_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-151",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 722.964294, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 68,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_velocity",
							"parameter_shortname" : "bank4_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank4_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 663.714294, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 60,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_channel",
							"parameter_shortname" : "bank4_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank4_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-155",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 643.964294, 217.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 44,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_mode",
							"parameter_shortname" : "bank4_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "bank4_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-164",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 742.714294, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 33,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_8ve",
							"parameter_shortname" : "bank4_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 3 ]
						}

					}
,
					"varname" : "bank4_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-165",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 703.214294, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 17,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_key",
							"parameter_shortname" : "bank4_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank4_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 661.964294, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 25,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_scale",
							"parameter_shortname" : "bank4_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank4_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 556.892822, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 51,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_duration",
							"parameter_shortname" : "bank3_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank3_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 532.892822, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 67,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_velocity",
							"parameter_shortname" : "bank3_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank3_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 473.642822, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 59,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_channel",
							"parameter_shortname" : "bank3_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank3_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 453.892853, 220.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 43,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_mode",
							"parameter_shortname" : "bank3_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ]
						}

					}
,
					"varname" : "bank3_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 552.642822, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 32,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_8ve",
							"parameter_shortname" : "bank3_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank3_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-144",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 513.142822, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 16,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_key",
							"parameter_shortname" : "bank3_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank3_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 471.892853, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 24,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_scale",
							"parameter_shortname" : "bank3_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank3_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 366.821411, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 50,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_duration",
							"parameter_shortname" : "bank2_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank2_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 342.821411, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 66,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_velocity",
							"parameter_shortname" : "bank2_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank2_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 283.571411, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 104.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 58,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_channel",
							"parameter_shortname" : "bank2_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank2_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 263.821411, 220.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 42,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_mode",
							"parameter_shortname" : "bank2_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ]
						}

					}
,
					"varname" : "bank2_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 362.571411, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 31,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_8ve",
							"parameter_shortname" : "bank2_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ]
						}

					}
,
					"varname" : "bank2_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 323.071411, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 15,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_key",
							"parameter_shortname" : "bank2_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank2_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 281.821411, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 23,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_scale",
							"parameter_shortname" : "bank2_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank2_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 176.75, 378.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 87.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 49,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_duration",
							"parameter_shortname" : "bank1_duration",
							"parameter_type" : 2,
							"parameter_enum" : [ "128n", "64n", "32n", "16n", "8n", "4n", "2n", "1n" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2 ]
						}

					}
,
					"varname" : "bank1_duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 152.75, 323.0, 50.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 70.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 65,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_velocity",
							"parameter_shortname" : "bank1_velocity",
							"parameter_type" : 2,
							"parameter_enum" : [ "one", "two", "three", "four", "five", "six", "seven", "eight" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ]
						}

					}
,
					"varname" : "bank1_velocity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 93.5, 247.0, 48.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 104.0, 50.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 57,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_channel",
							"parameter_shortname" : "bank1_channel",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "plug" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 16 ]
						}

					}
,
					"varname" : "bank1_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 73.75, 220.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 41,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_mode",
							"parameter_shortname" : "bank1_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "arpeggiator" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ]
						}

					}
,
					"varname" : "bank1_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 172.5, 349.0, 46.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 53.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 30,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_8ve",
							"parameter_shortname" : "bank1_8ve",
							"parameter_type" : 2,
							"parameter_enum" : [ "oct-3", "oct-2", "oct-1", "oct0", "oct+1", "oct+2", "oct+3", "oct+4" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0 ]
						}

					}
,
					"varname" : "bank1_8ve"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 133.0, 297.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 36.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 14,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_key",
							"parameter_shortname" : "bank1_key",
							"parameter_type" : 2,
							"parameter_enum" : [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank1_key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 91.75, 272.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 22,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_scale",
							"parameter_shortname" : "bank1_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "Whole Tone", "Minor Blues", "Minor Pentatonic", "Major Pentatonic", "Harmonic Minor", "Melodic Minor", "Dominant Sus", "Super Locrian", "Neopolitan Minor", "Neopolitan Major", "Enigmatic Minor", "Enigmatic", "Composite", "Bebop Locrian", "Bebop Dominant", "Bebop Major", "Bhairav", "Hungarian Minor", "Minor Gypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "bank1_scale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 54.0, 134.0, 64.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 8,
					"outlettype" : [ "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 53.999992, 156.0, 1349.5, 19.0 ],
					"style" : "",
					"text" : "spray 8"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 1 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 6 ],
					"source" : [ "obj-101", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 1203.928589, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 7 ],
					"source" : [ "obj-102", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 1395.5, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 2 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 5 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 7 ],
					"source" : [ "obj-107", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 7 ],
					"source" : [ "obj-108", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 5 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 4 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 2 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 1 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 6 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 4 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 3 ],
					"source" : [ "obj-124", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 7 ],
					"source" : [ "obj-129", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 5 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 2 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 1 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 6 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 4 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 3 ],
					"source" : [ "obj-145", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 6 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 7 ],
					"source" : [ "obj-150", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 5 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 2 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 1 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 6 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 4 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 3 ],
					"source" : [ "obj-166", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 7 ],
					"source" : [ "obj-171", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 5 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 2 ],
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 1 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 6 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 4 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 3 ],
					"source" : [ "obj-187", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 7 ],
					"source" : [ "obj-192", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 5 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 2 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 1 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 6 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 4 ],
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 3 ],
					"source" : [ "obj-208", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 7 ],
					"source" : [ "obj-213", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 5 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 2 ],
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 1 ],
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 6 ],
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 4 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 3 ],
					"source" : [ "obj-229", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 7 ],
					"source" : [ "obj-234", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 5 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 2 ],
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 1 ],
					"source" : [ "obj-239", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 6 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 4 ],
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 3 ],
					"source" : [ "obj-250", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-5", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-5", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-5", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-5", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-5", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 1 ],
					"order" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 1,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 3 ],
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"midpoints" : [ 76.699998, 115.5, 108.5, 115.5 ],
					"source" : [ "obj-9", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-9", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"source" : [ "obj-94", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 1 ],
					"source" : [ "obj-95", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 253.571411, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 2 ],
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 443.642853, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 3 ],
					"source" : [ "obj-97", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 633.714294, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 4 ],
					"source" : [ "obj-98", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 823.785706, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 5 ],
					"source" : [ "obj-99", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 1013.857178, 448.0, 63.5, 448.0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-123" : [ "bank2_key", "bank2_key", 15 ],
			"obj-193" : [ "bank6_velocity", "bank6_velocity", 70 ],
			"obj-228" : [ "bank7_key", "bank7_key", 20 ],
			"obj-111" : [ "bank2_channel", "bank2_channel", 58 ],
			"obj-174" : [ "bank5_channel", "bank5_channel", 61 ],
			"obj-100" : [ "bank1_mode", "bank1_mode", 41 ],
			"obj-197" : [ "bank6_mode", "bank6_mode", 46 ],
			"obj-129" : [ "bank3_duration", "bank3_duration", 51 ],
			"obj-145" : [ "bank3_scale", "bank3_scale", 24 ],
			"obj-234" : [ "bank8_duration", "bank8_duration", 56 ],
			"obj-250" : [ "bank8_scale", "bank8_scale", 29 ],
			"obj-151" : [ "bank4_velocity", "bank4_velocity", 68 ],
			"obj-186" : [ "bank5_key", "bank5_key", 18 ],
			"obj-153" : [ "bank4_channel", "bank4_channel", 60 ],
			"obj-185" : [ "bank5_8ve", "bank5_8ve", 34 ],
			"obj-237" : [ "bank8_channel", "bank8_channel", 64 ],
			"obj-155" : [ "bank4_mode", "bank4_mode", 44 ],
			"obj-107" : [ "bank1_duration", "bank1_duration", 49 ],
			"obj-8" : [ "bank1_scale", "bank1_scale", 22 ],
			"obj-192" : [ "bank6_duration", "bank6_duration", 54 ],
			"obj-208" : [ "bank6_scale", "bank6_scale", 27 ],
			"obj-109" : [ "bank2_velocity", "bank2_velocity", 66 ],
			"obj-144" : [ "bank3_key", "bank3_key", 16 ],
			"obj-214" : [ "bank7_velocity", "bank7_velocity", 71 ],
			"obj-249" : [ "bank8_key", "bank8_key", 21 ],
			"obj-143" : [ "bank3_8ve", "bank3_8ve", 32 ],
			"obj-113" : [ "bank2_mode", "bank2_mode", 42 ],
			"obj-195" : [ "bank6_channel", "bank6_channel", 62 ],
			"obj-227" : [ "bank7_8ve", "bank7_8ve", 36 ],
			"obj-218" : [ "bank7_mode", "bank7_mode", 47 ],
			"obj-150" : [ "bank4_duration", "bank4_duration", 52 ],
			"obj-166" : [ "bank4_scale", "bank4_scale", 25 ],
			"obj-106" : [ "bank1_velocity", "bank1_velocity", 65 ],
			"obj-11" : [ "bank1_key", "bank1_key", 14 ],
			"obj-172" : [ "bank5_velocity", "bank5_velocity", 69 ],
			"obj-207" : [ "bank6_key", "bank6_key", 19 ],
			"obj-104" : [ "bank1_channel", "bank1_channel", 57 ],
			"obj-122" : [ "bank2_8ve", "bank2_8ve", 31 ],
			"obj-206" : [ "bank6_8ve", "bank6_8ve", 35 ],
			"obj-176" : [ "bank5_mode", "bank5_mode", 45 ],
			"obj-108" : [ "bank2_duration", "bank2_duration", 50 ],
			"obj-124" : [ "bank2_scale", "bank2_scale", 23 ],
			"obj-213" : [ "bank7_duration", "bank7_duration", 55 ],
			"obj-229" : [ "bank7_scale", "bank7_scale", 28 ],
			"obj-130" : [ "bank3_velocity", "bank3_velocity", 67 ],
			"obj-165" : [ "bank4_key", "bank4_key", 17 ],
			"obj-235" : [ "bank8_velocity", "bank8_velocity", 72 ],
			"obj-15" : [ "bank1_8ve", "bank1_8ve", 30 ],
			"obj-132" : [ "bank3_channel", "bank3_channel", 59 ],
			"obj-164" : [ "bank4_8ve", "bank4_8ve", 33 ],
			"obj-134" : [ "bank3_mode", "bank3_mode", 43 ],
			"obj-216" : [ "bank7_channel", "bank7_channel", 63 ],
			"obj-248" : [ "bank8_8ve", "bank8_8ve", 37 ],
			"obj-239" : [ "bank8_mode", "bank8_mode", 48 ],
			"obj-171" : [ "bank5_duration", "bank5_duration", 53 ],
			"obj-187" : [ "bank5_scale", "bank5_scale", 26 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "voice_decode.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/m4m7/javascript/plinko2",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
