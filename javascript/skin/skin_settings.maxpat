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
		"rect" : [ 121.0, 78.0, 1286.0, 801.0 ],
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
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 998.730042, 696.0, 113.0, 22.0 ],
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
					"id" : "obj-38",
					"maxclass" : "number",
					"maximum" : 16,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 771.944214, 649.0, 36.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 476.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "chordC_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "number",
					"maximum" : 16,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 643.53949, 554.0, 36.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 414.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "chordB_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "number",
					"maximum" : 16,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 515.134705, 466.0, 36.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 352.0, 50.0, 22.0 ],
					"style" : "",
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
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 857.547424, 649.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 502.0, 357.0, 34.0 ],
					"range" : 88,
					"style" : "",
					"varname" : "chord_modC_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 814.74585, 649.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 476.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "chord_modC_enable"
				}

			}
, 			{
				"box" : 				{
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 729.142639, 554.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 440.0, 357.0, 34.0 ],
					"range" : 88,
					"style" : "",
					"varname" : "chord_modB_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 686.341064, 554.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 414.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "chord_modB_enable"
				}

			}
, 			{
				"box" : 				{
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 600.737915, 466.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 378.0, 357.0, 34.0 ],
					"range" : 88,
					"style" : "",
					"varname" : "chord_modA_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 557.93634, 466.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 352.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "chord_modA_enable"
				}

			}
, 			{
				"box" : 				{
					"hkeycolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 472.33313, 357.0, 357.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 316.0, 357.0, 34.0 ],
					"range" : 88,
					"style" : "",
					"varname" : "chord_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 429.531616, 357.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 290.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "chord_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "number",
					"maximum" : 16,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 386.72998, 357.0, 36.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 290.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "chord_channel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 20,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 386.72998, 733.0, 832.230103, 22.0 ],
					"style" : "",
					"text" : "funnel 20 25"
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
					"id" : "obj-53",
					"maxclass" : "function",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 124.999969, 364.0, 147.0, 55.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 191.0, 357.0, 97.0 ],
					"style" : "",
					"varname" : "breakpoint_obj"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 694.999756, 242.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 353.0, 94.0, 21.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "number",
					"maximum" : 64,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 642.166504, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 230.0, 62.0, 36.0, 22.0 ],
					"style" : "",
					"varname" : "mod_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"items" : [ "None", ",", "A", ",", "B", ",", "C" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 589.333252, 243.0, 58.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 271.0, 62.0, 56.0, 22.0 ],
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
					"id" : "obj-24",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 325.166595, 243.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 141.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "cc_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 114.833374, 242.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 91.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "remote_enable"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-20",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 536.499878, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.0, 167.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "cc_scale_exp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 483.666504, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 74.0, 167.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "cc_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "number",
					"maximum" : 126,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 430.833252, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 167.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "cc_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 397.833221, 133.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 155.0, 61.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "modC_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 292.166595, 133.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 109.0, 61.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "modB_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 186.499969, 133.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 61.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "modA_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 80.833344, 133.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 61.0, 24.0, 24.0 ],
					"style" : "",
					"varname" : "note_enable"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-7",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 271.833221, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.0, 117.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "remote_scale_exp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 219.166656, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 74.0, 117.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "remote_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "number",
					"maximum" : 126,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 167.166595, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 17.0, 117.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "remote_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "number",
					"maximum" : 127,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 377.999908, 243.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 74.0, 142.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "cc_id"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 61.000031, 213.0, 247.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 94.0, 288.0, 21.0 ],
					"style" : "",
					"text" : "",
					"texton" : "",
					"varname" : "remote_name"
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
					"presentation_rect" : [ 237.0, 10.0, 44.0, 47.0 ],
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
					"id" : "obj-13",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 28.000031, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 10.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 3,
							"parameter_linknames" : 1,
							"parameter_longname" : "note",
							"parameter_shortname" : "note",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 3
						}

					}
,
					"varname" : "note"
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
					"id" : "obj-58",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 344.999908, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.0, 10.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 6,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_C",
							"parameter_shortname" : "mod_C",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 6
						}

					}
,
					"varname" : "mod_C"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 239.333282, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 10.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 5,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_B",
							"parameter_shortname" : "mod_B",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 5
						}

					}
,
					"varname" : "mod_B"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 133.666656, 110.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 53.0, 10.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 4,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_A",
							"parameter_shortname" : "mod_A",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 4
						}

					}
,
					"varname" : "mod_A"
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
					"presentation_rect" : [ 191.0, 10.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 7,
							"parameter_linknames" : 1,
							"parameter_longname" : "Mask",
							"parameter_shortname" : "Mask Time",
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
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-13", 0 ]
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
					"midpoints" : [ 396.22998, 767.0, 321.5, 767.0, 321.5, 473.0, 70.500061, 473.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 3 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 5 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 7 ],
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
					"destination" : [ "obj-25", 3 ],
					"source" : [ "obj-4", 0 ]
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
					"midpoints" : [ 1076.642639, 594.5, 829.24585, 594.5 ],
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
					"destination" : [ "obj-59", 2 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 4 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 6 ],
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
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-6", 0 ]
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
					"destination" : [ "obj-15", 12 ],
					"midpoints" : [ 1008.230042, 725.0, 909.848993, 725.0 ],
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
			"obj-57" : [ "mod_B", "mod_B", 5 ],
			"obj-29" : [ "color", "color", 2 ],
			"obj-9" : [ "Mask", "Mask Time", 7 ],
			"obj-58" : [ "mod_C", "mod_C", 6 ],
			"obj-56" : [ "mod_A", "mod_A", 4 ],
			"obj-12" : [ "selected", "selected", 1 ],
			"obj-13" : [ "note", "note", 3 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
