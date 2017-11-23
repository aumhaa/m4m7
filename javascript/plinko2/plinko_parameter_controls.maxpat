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
		"rect" : [ 622.0, 725.0, 500.0, 226.0 ],
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
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 164.0, 469.0, 81.0, 22.0 ],
					"style" : "",
					"text" : "prepend goto"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"automation" : "goto",
					"automationon" : "goto",
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 164.0, 431.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 5.0, 57.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "goto",
							"parameter_shortname" : "goto",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "goto", "goto" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "goto",
					"varname" : "goto"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 519.0, 145.0, 22.0 ],
					"style" : "",
					"text" : "prepend paramControl_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 469.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "prepend position"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 360.999939, 15.0, 130.000061, 22.0 ],
					"restore" : [ 0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr window_position",
					"varname" : "window_position"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 180.0, 57.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 5.0, 411.0, 20.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "device_name"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-80",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 906.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[15]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-79",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 847.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[14]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-78",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 788.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[13]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-77",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 729.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[12]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-76",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 670.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[11]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-75",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 611.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[10]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-74",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 552.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[9]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 492.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 197.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[8]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 906.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[15]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 847.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[14]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-70",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 788.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[13]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 729.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[12]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-68",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 670.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[11]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 611.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[10]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-66",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 552.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[9]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 492.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 180.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[8]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-64",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 906.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[11]",
							"parameter_shortname" : "paramDial[7]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[15]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-63",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 847.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[18]",
							"parameter_shortname" : "paramDial[6]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[14]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-62",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 788.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[17]",
							"parameter_shortname" : "paramDial[5]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[13]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-61",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 729.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[10]",
							"parameter_shortname" : "paramDial[4]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[12]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-60",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 670.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[16]",
							"parameter_shortname" : "paramDial[3]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[11]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-59",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 611.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[15]",
							"parameter_shortname" : "paramDial[2]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[10]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-58",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 552.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[14]",
							"parameter_shortname" : "paramDial[1]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[9]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-57",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 493.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 121.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[9]",
							"parameter_shortname" : "paramDial[0]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[8]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 36.0, 435.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher",
					"varname" : "parameter_controls_thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 36.0, 310.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "select 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 276.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "r ---mira_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 399.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "script delete frame3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 57.5, 339.0, 459.0, 49.0 ],
					"style" : "",
					"text" : "script newdefault frame3 mira.frame @presentation 1 @tabname Skin:Parameters @taborder 4 @draw_tab_name 0 @aspect 6 @presentation_rect 0. -1. 497.672424 239.298782"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-31",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 15.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-30",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 552.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 16,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 21.0, 141.0, 904.0, 22.0 ],
					"style" : "",
					"text" : "funnel 16"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 434.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[7]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 375.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[6]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 316.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[5]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 257.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[4]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[3]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[2]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[1]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-21",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 245.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 104.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "value[0]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 434.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[7]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 375.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[6]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 316.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[5]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 257.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[4]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[3]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[2]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[1]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 228.0, 57.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 87.0, 57.0, 15.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "name[0]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-11",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 434.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[7]",
							"parameter_shortname" : "paramDial[7]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[7]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-10",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 375.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[6]",
							"parameter_shortname" : "paramDial[6]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[6]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-9",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 316.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[5]",
							"parameter_shortname" : "paramDial[5]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[5]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-8",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 257.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[4]",
							"parameter_shortname" : "paramDial[4]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[4]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-7",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 198.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[3]",
							"parameter_shortname" : "paramDial[3]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[3]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-6",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 139.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[2]",
							"parameter_shortname" : "paramDial[2]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[2]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-5",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 80.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[1]",
							"parameter_shortname" : "paramDial[1]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[1]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"degrees" : 320,
					"id" : "obj-2",
					"jspainterfile" : "System:/Users/amounra/Documents/Max 7/Packages/m4m7/javascript/jsui/dial_override.js",
					"maxclass" : "dial",
					"needlecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"outlinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 21.0, 66.0, 57.0, 57.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 28.0, 57.0, 57.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "paramDial[0]",
							"parameter_shortname" : "paramDial[0]",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"thickness" : 100.0,
					"varname" : "paramDial[0]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 549.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[16]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 512.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[15]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 475.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[14]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 438.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[13]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-48",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 401.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[12]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 364.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[11]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[10]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 443.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 121.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[9]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 549.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 427.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[8]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 512.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 368.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[7]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-42",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 475.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[6]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 438.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[5]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 401.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 191.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[4]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-37",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 364.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[3]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-36",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 73.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[2]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 419.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 28.0, 57.0, 92.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[1]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-53",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 469.0, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 5.0, 411.0, 20.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[17]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-34",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 469.0, 35.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 2.0, 485.0, 219.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "panel[0]"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 6 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 7 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-125", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 1 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 8 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 9 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 10 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 2 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 11 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 12 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 13 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 14 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 15 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 3 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 4 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 5 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-7" : [ "paramDial[3]", "paramDial[3]", 0 ],
			"obj-54" : [ "goto", "goto", 0 ],
			"obj-63" : [ "paramDial[18]", "paramDial[6]", 0 ],
			"obj-8" : [ "paramDial[4]", "paramDial[4]", 0 ],
			"obj-57" : [ "paramDial[9]", "paramDial[0]", 0 ],
			"obj-58" : [ "paramDial[14]", "paramDial[1]", 0 ],
			"obj-62" : [ "paramDial[17]", "paramDial[5]", 0 ],
			"obj-60" : [ "paramDial[16]", "paramDial[3]", 0 ],
			"obj-2" : [ "paramDial[0]", "paramDial[0]", 0 ],
			"obj-11" : [ "paramDial[7]", "paramDial[7]", 0 ],
			"obj-61" : [ "paramDial[10]", "paramDial[4]", 0 ],
			"obj-5" : [ "paramDial[1]", "paramDial[1]", 0 ],
			"obj-59" : [ "paramDial[15]", "paramDial[2]", 0 ],
			"obj-10" : [ "paramDial[6]", "paramDial[6]", 0 ],
			"obj-6" : [ "paramDial[2]", "paramDial[2]", 0 ],
			"obj-64" : [ "paramDial[11]", "paramDial[7]", 0 ],
			"obj-9" : [ "paramDial[5]", "paramDial[5]", 0 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
