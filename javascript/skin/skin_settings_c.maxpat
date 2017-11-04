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
		"rect" : [ 123.0, 78.0, 825.0, 897.0 ],
		"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
		"editing_bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
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
					"activebgcolor" : [ 0.466667, 0.254902, 0.607843, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.277361, 0.326007, 0.306195, 1.0 ],
					"bgoncolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "live.tab",
					"num_lines_patching" : 0,
					"num_lines_presentation" : 4,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 126.0, 692.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 448.63736, 89.0, 32.0, 246.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "selected_layer_tab",
							"parameter_shortname" : "selected_layer_tab",
							"parameter_type" : 2,
							"parameter_enum" : [ "Main", "A", "B", "C" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_unitstyle" : 0,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"spacing_x" : 3.0,
					"spacing_y" : 3.0,
					"varname" : "selected_layer_tab"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-64",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 61.000031, 242.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 337.0, 22.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "capture2",
							"parameter_shortname" : "capture2",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : ">",
					"texton" : "clear",
					"varname" : "capture2"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-17",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1200.547363, 910.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 63.0, 22.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "capture",
							"parameter_shortname" : "capture",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : ">",
					"texton" : "clear",
					"varname" : "capture"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 287.981232, 701.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.0, 275.0, 69.753784, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modC_clear",
							"parameter_shortname" : "modC_clear",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Clear",
					"varname" : "modC_clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 255.555344, 673.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.0, 213.0, 69.753784, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modB_clear",
							"parameter_shortname" : "modB_clear",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Clear",
					"varname" : "modB_clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 223.129456, 645.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.0, 151.0, 69.753784, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modA_clear",
							"parameter_shortname" : "modA_clear",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Clear",
					"varname" : "modA_clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 190.703568, 617.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.0, 89.0, 69.753784, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "main_clear",
							"parameter_shortname" : "main_clear",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Clear",
					"varname" : "main_clear"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 18.0,
					"id" : "obj-63",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 568.333252, 13.0, 100.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 5,
							"parameter_linknames" : 1,
							"parameter_longname" : "selected_scale_old",
							"parameter_shortname" : "scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "Chromatic", "Major", "Minor", "Dorian", "Mixolydian", "Lydian", "Phrygian", "Locrian", "Diminished", "Whole-half", "WholeTone", "MinorBlues", "MinorPentatonic", "MajorPentatonic", "HarmonicMinor", "MelodicMinor", "DominantSus", "SuperLocrian", "NeopolitanMinor", "NeopolitanMajor", "EnigmaticMinor", "Enigmatic", "Composite", "BebopLocrian", "BebopDominant", "BebopMajor", "Bhairav", "HungarianMinor", "MinorGypsy", "Persian", "Hirojoshi", "In-Sen", "Iwato", "Kumoi", "Pelog", "Spanish" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_steps" : 36,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "selected_scale_old"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-62",
					"items" : [ "Chromatic", ",", "Major", ",", "Minor", ",", "Dorian", ",", "Mixolydian", ",", "Lydian", ",", "Phrygian", ",", "Locrian", ",", "Diminished", ",", "Whole-half", ",", "Whole", "Tone", ",", "Minor", "Blues", ",", "Minor", "Pentatonic", ",", "Major", "Pentatonic", ",", "Harmonic", "Minor", ",", "Melodic", "Minor", ",", "Dominant", "Sus", ",", "Super", "Locrian", ",", "Neopolitan", "Minor", ",", "Neopolitan", "Major", ",", "Enigmatic", "Minor", ",", "Enigmatic", ",", "Composite", ",", "Bebop", "Locrian", ",", "Bebop", "Dominant", ",", "Bebop", "Major", ",", "Bhairav", ",", "Hungarian", "Minor", ",", "Minor", "Gypsy", ",", "Persian", ",", "Hirojoshi", ",", "In-Sen", ",", "Iwato", ",", "Kumoi", ",", "Pelog", ",", "Spanish" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 344.999908, 69.0, 100.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 275.0, 35.0, 143.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "selected_scale",
							"parameter_shortname" : "selected_scale",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "selected_scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 61.000031, 738.0, 245.981201, 22.0 ],
					"style" : "",
					"text" : "funnel 8 46"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 158.277695, 701.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 239.753784, 275.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modC_mono",
							"parameter_shortname" : "modC_mono",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Mono",
					"texton" : "Poly",
					"varname" : "modC_mono"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 125.851799, 673.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 239.753784, 213.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modB_mono",
							"parameter_shortname" : "modB_mono",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Mono",
					"texton" : "Poly",
					"varname" : "modB_mono"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 93.425919, 645.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 239.753784, 151.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modA_mono",
							"parameter_shortname" : "main_mono",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Mono",
					"texton" : "Poly",
					"varname" : "modA_mono"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 61.000031, 617.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 239.753784, 89.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "main_mono",
							"parameter_shortname" : "main_mono",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Mono",
					"texton" : "Poly",
					"varname" : "main_mono"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Clear Target Device Assignment",
					"id" : "obj-54",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1243.348877, 945.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 421.0, 63.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "target_device_reset"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Assign a Target Device",
					"id" : "obj-48",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 677.000061, 39.0, 247.0, 21.0 ],
					"style" : "",
					"text" : "",
					"texton" : "",
					"varname" : "target_device_old"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"hint" : "Modifier Press Sustain Time",
					"id" : "obj-44",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 395.666534, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 229.0, 12.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 6,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_sustain",
							"parameter_shortname" : "mod sustain",
							"parameter_type" : 0,
							"parameter_mmax" : 2000.0,
							"parameter_modmax" : 150.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_unitstyle" : 2,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 7
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "mod_sustain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1157.745728, 870.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 275.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modC_port",
							"parameter_shortname" : "modC_port",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Device_Output",
					"texton" : "Port_Output",
					"varname" : "modC_port"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1114.944214, 844.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 213.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modB_port",
							"parameter_shortname" : "modB_port",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Device_Output",
					"texton" : "Port_Output",
					"varname" : "modB_port"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1072.142578, 818.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 151.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modA_port",
							"parameter_shortname" : "modA_port",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Device_Output",
					"texton" : "Port_Output",
					"varname" : "modA_port"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1028.753784, 792.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 89.0, 100.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "main_port",
							"parameter_shortname" : "main_port",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Device_Output",
					"texton" : "Port_Output",
					"varname" : "main_port"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 80.833344, 26.0, 126.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_defer" : 1,
							"parameter_initial" : [ 40, 40, 430, 590 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "settings_position",
							"parameter_shortname" : "settings_position",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"initial" : [ 40, 40, 430, 590 ],
						"parameter_enable" : 1
					}
,
					"style" : "",
					"text" : "pattr settings_position",
					"varname" : "settings_position"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 985.952209, 761.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher",
					"varname" : "settings_thispatcher"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "toggle",
					"id" : "obj-35",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 900.348999, 726.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 421.0, 35.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "toggle_note",
							"parameter_shortname" : "toggle_note",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "toggle_note"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 943.150635, 726.0, 113.0, 22.0 ],
					"style" : "",
					"text" : "r extChordAssigner"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 857.547424, 614.0, 167.0, 22.0 ],
					"style" : "",
					"text" : "r ---chord_modC_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 729.142639, 521.0, 166.0, 22.0 ],
					"style" : "",
					"text" : "r ---chord_modB_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.737915, 432.0, 166.0, 22.0 ],
					"style" : "",
					"text" : "r ---chord_modA_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 472.33313, 324.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "r ---chord_assignment"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-38",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 771.944214, 649.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 275.0, 48.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chordC_channel",
							"parameter_shortname" : "chordC_channel",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 1
						}

					}
,
					"varname" : "chordC_channel"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-37",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 643.53949, 554.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 213.0, 48.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chordB_channel",
							"parameter_shortname" : "chordB_channel",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "chordB_channel"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-36",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 515.134705, 466.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 151.0, 48.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chordA_channel",
							"parameter_shortname" : "chordA_channel",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "chordA_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 857.547424, 696.0, 105.0, 22.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 729.142639, 602.0, 109.60321, 22.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.737915, 511.0, 109.603149, 22.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 472.33313, 405.0, 109.60321, 22.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"hint" : "modC chord assignment",
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 857.547424, 649.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 301.0, 357.0, 34.0 ],
					"range" : 88,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modC_assignment",
							"parameter_shortname" : "chord_modC_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "chord_modC_assignment"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "modC chord output enable",
					"id" : "obj-52",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 814.74585, 649.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 275.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modC_enable",
							"parameter_shortname" : "chord_modC_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "chord_modC_enable"
				}

			}
, 			{
				"box" : 				{
					"hint" : "modB chord assignment",
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 729.142639, 554.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 239.0, 357.0, 34.0 ],
					"range" : 88,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modB_assignment",
							"parameter_shortname" : "chord_modB_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "chord_modB_assignment"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "modB chord output enable",
					"id" : "obj-50",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 686.341064, 554.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 213.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modB_enable",
							"parameter_shortname" : "chord_modB_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "chord_modB_enable"
				}

			}
, 			{
				"box" : 				{
					"hint" : "modA chord assignment",
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 600.737915, 466.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 177.0, 357.0, 34.0 ],
					"range" : 88,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modA_assignment",
							"parameter_shortname" : "chord_modA_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "chord_modA_assignment"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "modA chord output enable",
					"id" : "obj-47",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 557.93634, 466.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 151.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_modA_enable",
							"parameter_shortname" : "chord_modA_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "chord_modA_enable"
				}

			}
, 			{
				"box" : 				{
					"hint" : "main chord assignment",
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 472.33313, 357.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 115.0, 357.0, 34.0 ],
					"range" : 88,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_assignment",
							"parameter_shortname" : "chord_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "chord_assignment"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "main chord output enable",
					"id" : "obj-32",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 429.531616, 357.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 89.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "chord_enable",
							"parameter_shortname" : "chord_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "chord_enable"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-31",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 386.72998, 357.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 89.0, 48.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chord_channel",
							"parameter_shortname" : "chord_channel",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "chord_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 21,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 387.31723, 980.0, 875.031677, 22.0 ],
					"style" : "",
					"text" : "funnel 21 25"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 87.499969, 332.0, 94.0, 22.0 ],
					"restore" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 0.0, 1000.0, 1.0, 0, 0.0, "curve" ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr breakpoint",
					"varname" : "breakpoint"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 252.999969, 434.0, 114.0, 22.0 ],
					"style" : "",
					"text" : "prepend breakpoint"
				}

			}
, 			{
				"box" : 				{
					"addpoints_with_curve" : [ 0.0, 0.0, 0, 0.0, 1000.0, 1.0, 0, 0.0 ],
					"hint" : "remap cc/pressure output",
					"id" : "obj-53",
					"maxclass" : "function",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 124.999969, 364.0, 147.0, 55.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 413.0, 357.0, 97.0 ],
					"style" : "",
					"varname" : "breakpoint_obj"
				}

			}
, 			{
				"box" : 				{
					"hint" : "clear pressure assignment",
					"id" : "obj-14",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 694.999756, 242.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 421.0, 337.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"hint" : "modifier target",
					"id" : "obj-11",
					"maxclass" : "number",
					"maximum" : 64,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 642.166504, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 347.5, 12.0, 36.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "mod_target",
							"parameter_shortname" : "mod_target",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "mod_target"
				}

			}
, 			{
				"box" : 				{
					"hint" : "modifier assignment",
					"id" : "obj-5",
					"items" : [ "None", ",", "A", ",", "B", ",", "C" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 589.333252, 243.0, 58.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 385.5, 12.0, 59.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "mod_target_assignment",
							"parameter_shortname" : "mod_target_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "mod_target_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 13,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 61.000031, 279.0, 652.999756, 22.0 ],
					"style" : "",
					"text" : "funnel 13 11"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "cc output enable",
					"id" : "obj-24",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 325.166595, 243.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 387.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "cc_enable",
							"parameter_shortname" : "cc_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "cc_enable"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"checkedcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "pressure to parameter enable",
					"id" : "obj-23",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 114.833374, 242.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 337.0, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "remote_enable",
							"parameter_shortname" : "remote_enable",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"uncheckedcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"varname" : "remote_enable"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"hint" : "cc output scale exponent",
					"id" : "obj-20",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 536.499878, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 285.0, 387.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "cc_scale_exp",
							"parameter_shortname" : "cc_scale_exp",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "cc_scale_exp"
				}

			}
, 			{
				"box" : 				{
					"hint" : "cc output scale high value",
					"id" : "obj-21",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 483.666504, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 228.0, 387.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "cc_scale_hi",
							"parameter_shortname" : "cc_scale_hi",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "cc_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"hint" : "cc output scale low value",
					"id" : "obj-22",
					"maxclass" : "number",
					"maximum" : 126,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 430.833252, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 171.0, 387.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "cc_scale_lo",
							"parameter_shortname" : "cc_scale_lo",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "cc_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"hint" : "pressure remote scale exponent",
					"id" : "obj-7",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 271.833221, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 285.0, 363.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "remote_scale_exp",
							"parameter_shortname" : "remote_scale_exp",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "remote_scale_exp"
				}

			}
, 			{
				"box" : 				{
					"hint" : "pressure remote scale high value",
					"id" : "obj-4",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 219.166656, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 228.0, 363.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "remote_scale_hi",
							"parameter_shortname" : "remote_scale_hi",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "remote_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"hint" : "pressure remote scale low value",
					"id" : "obj-3",
					"maxclass" : "number",
					"maximum" : 126,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 167.166595, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 171.0, 363.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "remote_scale_lo",
							"parameter_shortname" : "remote_scale_lo",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "remote_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"hint" : "cc output id",
					"id" : "obj-10",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 377.999908, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 114.0, 387.0, 50.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "cc_id",
							"parameter_shortname" : "cc_id",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"varname" : "cc_id"
				}

			}
, 			{
				"box" : 				{
					"hint" : "pressure assignment",
					"id" : "obj-6",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 677.000061, 14.5, 247.0, 21.0 ],
					"style" : "",
					"text" : "",
					"texton" : "",
					"varname" : "remote_name_old"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 556.33313, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.0, 12.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 2,
							"parameter_linknames" : 1,
							"parameter_longname" : "color",
							"parameter_shortname" : "color",
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 2
						}

					}
,
					"varname" : "color"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 503.499847, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 12.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "selected",
							"parameter_shortname" : "selected",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 64.0,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 64,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 1
						}

					}
,
					"varname" : "selected"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 61.000061, 506.0, 121.0, 22.0 ],
					"style" : "",
					"text" : "prepend mod_assign"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 11,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 28.000031, 166.0, 547.33313, 22.0 ],
					"style" : "",
					"text" : "funnel 11"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 450.666534, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 180.0, 12.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 7,
							"parameter_linknames" : 1,
							"parameter_longname" : "Mask",
							"parameter_shortname" : "mask time",
							"parameter_type" : 0,
							"parameter_mmax" : 150.0,
							"parameter_modmax" : 150.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 50 ],
							"parameter_unitstyle" : 2,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 7
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mask"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-2",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 61.000031, 546.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.0, 26.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 156.981232, 771.0, 150.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.253784, 63.0, 305.746216, 24.0 ],
					"style" : "",
					"varname" : "target_device"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 156.981232, 808.0, 150.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.253784, 337.0, 279.746216, 24.0 ],
					"style" : "",
					"varname" : "remote_name"
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-16",
					"ignoreclick" : 1,
					"maxclass" : "mira.frame",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 87.499969, 771.0, 46.417584, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.588943, 12.0, 490.901111, 349.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 6 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 11 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 9 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 12 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 396.81723, 1014.0, 344.5, 1014.0, 344.5, 475.0, 70.500061, 475.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 19 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 15 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 16 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 9 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 8 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 7 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 5 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 5 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 262.499969, 474.0, 205.999939, 474.0, 205.999939, 474.0, 70.500061, 474.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 10 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 2 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 8 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"midpoints" : [ 819.83313, 397.5, 572.43634, 397.5 ],
					"source" : [ "obj-33", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 11 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 12 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 3 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 6 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 9 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 17 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 3 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 14 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 18 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 7 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 1 ],
					"midpoints" : [ 948.237915, 505.0, 700.841064, 505.0 ],
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 4 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"midpoints" : [ 1076.642639, 594.5, 829.245849, 594.5 ],
					"source" : [ "obj-49", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 10 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 7 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 1 ],
					"midpoints" : [ 1205.047424, 689.0, 953.047424, 689.0 ],
					"source" : [ "obj-51", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 10 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-53", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 20 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 3 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 2 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 1 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 37.500031, 476.5, 70.500061, 476.5 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 70.500031, 773.0, 24.376923, 773.0, 24.376923, 476.0, 70.500061, 476.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 6 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 7 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 6 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 5 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 4 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 4 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 2 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 13 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 8 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-32" : [ "chord_enable", "chord_enable", 0 ],
			"obj-4" : [ "remote_scale_hi", "remote_scale_hi", 0 ],
			"obj-58" : [ "main_mono", "main_mono", 0 ],
			"obj-64" : [ "capture2", "capture2", 0 ],
			"obj-46" : [ "chord_modA_assignment", "chord_modA_assignment", 0 ],
			"obj-21" : [ "cc_scale_hi", "cc_scale_hi", 0 ],
			"obj-29" : [ "color", "color", 2 ],
			"obj-9" : [ "Mask", "mask time", 7 ],
			"obj-37" : [ "chordB_channel", "chordB_channel", 0 ],
			"obj-51" : [ "chord_modC_assignment", "chord_modC_assignment", 0 ],
			"obj-42" : [ "modC_port", "modC_port", 0 ],
			"obj-5" : [ "mod_target_assignment", "mod_target_assignment", 0 ],
			"obj-39" : [ "modB_port", "modB_port", 0 ],
			"obj-52" : [ "chord_modC_enable", "chord_modC_enable", 0 ],
			"obj-24" : [ "cc_enable", "cc_enable", 0 ],
			"obj-67" : [ "modB_clear", "modB_clear", 0 ],
			"obj-10" : [ "cc_id", "cc_id", 0 ],
			"obj-17" : [ "capture", "capture", 0 ],
			"obj-43" : [ "selected_layer_tab", "selected_layer_tab", 0 ],
			"obj-44" : [ "mod_sustain", "mod sustain", 6 ],
			"obj-33" : [ "chord_assignment", "chord_assignment", 0 ],
			"obj-7" : [ "remote_scale_exp", "remote_scale_exp", 0 ],
			"obj-19" : [ "modA_port", "modA_port", 0 ],
			"obj-68" : [ "modA_clear", "modA_clear", 0 ],
			"obj-35" : [ "toggle_note", "toggle_note", 0 ],
			"obj-50" : [ "chord_modB_enable", "chord_modB_enable", 0 ],
			"obj-20" : [ "cc_scale_exp", "cc_scale_exp", 0 ],
			"obj-55" : [ "modC_mono", "modC_mono", 0 ],
			"obj-38" : [ "chordC_channel", "chordC_channel", 0 ],
			"obj-56" : [ "modB_mono", "modB_mono", 0 ],
			"obj-11" : [ "mod_target", "mod_target", 0 ],
			"obj-31" : [ "chord_channel", "chord_channel", 0 ],
			"obj-3" : [ "remote_scale_lo", "remote_scale_lo", 0 ],
			"obj-18" : [ "main_port", "main_port", 0 ],
			"obj-69" : [ "main_clear", "main_clear", 0 ],
			"obj-47" : [ "chord_modA_enable", "chord_modA_enable", 0 ],
			"obj-22" : [ "cc_scale_lo", "cc_scale_lo", 0 ],
			"obj-63" : [ "selected_scale_old", "scale", 5 ],
			"obj-57" : [ "modA_mono", "main_mono", 0 ],
			"obj-66" : [ "modC_clear", "modC_clear", 0 ],
			"obj-36" : [ "chordA_channel", "chordA_channel", 0 ],
			"obj-12" : [ "selected", "selected", 1 ],
			"obj-49" : [ "chord_modB_assignment", "chord_modB_assignment", 0 ],
			"obj-23" : [ "remote_enable", "remote_enable", 0 ],
			"obj-41" : [ "settings_position", "settings_position", 0 ],
			"obj-62" : [ "selected_scale", "selected_scale", 0 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
