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
		"rect" : [ 127.0, 79.0, 943.0, 933.0 ],
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
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-74",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 574.166382, 762.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 390.5, 165.0, 35.5, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "thru",
							"parameter_shortname" : "thru",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "X",
					"texton" : ">",
					"varname" : "thru"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 16.0,
					"id" : "obj-10",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 376.999939, 209.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 324.0, 524.0, 40.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_id",
							"parameter_shortname" : "cc_id",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "cc_id"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 312.0, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 291.0, 526.0, 42.0, 20.0 ],
					"style" : "",
					"text" : "CC ID",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-73",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 922.5, 18.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 290.8125, 525.0, 76.8125, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 16.0,
					"id" : "obj-21",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 482.666534, 209.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 245.4375, 524.0, 40.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_scale_hi",
							"parameter_shortname" : "cc_scale_hi",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "cc_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 16.0,
					"id" : "obj-22",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 429.833282, 209.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 130.625, 524.0, 40.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_scale_lo",
							"parameter_shortname" : "cc_scale_lo",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "cc_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-68",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 206.5, 49.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 179.5, 525.0, 72.0, 20.0 ],
					"style" : "",
					"text" : "Scale High",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-71",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 765.499939, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 177.5, 525.0, 108.8125, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-63",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 277.0, 49.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 71.8125, 525.0, 72.0, 20.0 ],
					"style" : "",
					"text" : "Scale Low",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 883.5, 18.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 525.0, 105.8125, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.01 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 16.0,
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 219.166687, 209.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 244.4375, 482.0, 40.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "remote_scale_hi",
							"parameter_shortname" : "remote_scale_hi",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "remote_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-57",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 173.5, 49.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 181.5, 482.0, 72.0, 20.0 ],
					"style" : "",
					"text" : "Scale High",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 179.5, 482.0, 108.8125, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-56",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 804.5, 242.0, 49.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 71.8125, 482.0, 72.0, 20.0 ],
					"style" : "",
					"text" : "Scale Low",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 16.0,
					"id" : "obj-3",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.444473, 208.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.625, 481.0, 39.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "remote_scale_lo",
							"parameter_shortname" : "remote_scale_lo",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "remote_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-55",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 843.5, 18.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 482.0, 105.8125, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-48",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 522.33313, 762.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 371.0, 525.0, 54.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_port",
							"parameter_shortname" : "cc_port",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Device",
					"texton" : "Port",
					"varname" : "cc_port"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"ignoreclick" : 1,
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 342.0, 446.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 388.5, 268.5, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "kslider_offset_display",
							"parameter_shortname" : "kslider_offset_display",
							"parameter_type" : 0,
							"parameter_unitstyle" : 8,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "kslider_offset_display"
				}

			}
, 			{
				"box" : 				{
					"align" : 1,
					"arrow" : 0,
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-26",
					"items" : [ "OFF", ",", "A", ",", "B", ",", "C" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 470.499847, 758.0, 40.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 343.75, 112.5, 60.0, 24.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "modify_target"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 791.5, 486.0, 62.0, 22.0 ],
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
					"patching_rect" : [ 791.5, 452.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "r ---mira_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 791.5, 666.0, 221.0, 22.0 ],
					"style" : "",
					"text" : "script delete frame, script delete frame2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"linecount" : 5,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 813.0, 524.0, 470.0, 76.0 ],
					"style" : "",
					"text" : "script newdefault frame mira.frame @presentation 1 @tabname Skin:Zone @taborder 2 @draw_tab_name 0 @aspect 1 @presentation_rect -27.160208 12.747253 502.320415 298.252747, script newdefault frame2 mira.frame @presentation 1 @tabname Skin:Control @taborder 3 @draw_tab_name 0 @aspect 1 @presentation_rect -1.210526 316. 452.421053 268.625"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 419.833282, 758.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 228.5, 109.0, 84.375, 31.0 ],
					"rounded" : 20.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 4,
							"parameter_linknames" : 1,
							"parameter_longname" : "modify_mode",
							"parameter_shortname" : "modify",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial_enable" : 1,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Modify",
					"texton" : "Modify",
					"varname" : "modify_mode"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 366.833282, 758.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 127.625, 109.0, 84.375, 31.0 ],
					"rounded" : 20.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 4,
							"parameter_linknames" : 1,
							"parameter_longname" : "follow_mode",
							"parameter_shortname" : "follow",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial_enable" : 1,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Follow",
					"texton" : "Follow",
					"varname" : "follow_mode"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 315.0, 758.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.0, 109.0, 85.5, 31.0 ],
					"rounded" : 20.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 4,
							"parameter_linknames" : 1,
							"parameter_longname" : "assign_mode",
							"parameter_shortname" : "assign_zone",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial_enable" : 1,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Assign",
					"texton" : "Assign",
					"varname" : "assign_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 315.0, 807.0, 278.166412, 22.0 ],
					"style" : "",
					"text" : "funnel 6 38"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 24.0,
					"id" : "obj-29",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 348.126709, 122.0, 45.174744, 30.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 26.5, 20.5, 53.5, 30.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "selected",
							"parameter_shortname" : "zone",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 64.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_unitstyle" : 0,
							"parameter_steps" : 64,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "selected"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 10,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 461.0, 687.0, 258.143066, 22.0 ],
					"style" : "",
					"text" : "funnel 10 28"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-19",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 176.92041, 323.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 165.0, 39.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chord_enable",
							"parameter_shortname" : "chord_enable",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Off",
					"texton" : "On",
					"varname" : "chord_enable"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-64",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 61.000061, 208.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.000002, 455.0, 22.0, 19.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-14",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 693.666565, 209.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 396.5, 455.0, 22.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "target_parameter_reset",
							"parameter_shortname" : "target_device_reset",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "X",
					"texton" : "clear",
					"varname" : "target_parameter_reset"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.011765, 0.396078, 0.752941, 0.0 ],
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 620.428589, 357.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 60.0, 455.375, 331.0, 20.0 ],
					"style" : "",
					"varname" : "remote_name"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-13",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 531.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.000002, 452.375, 403.0, 26.25 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-120",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 647.0, 599.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 406.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[7]",
							"parameter_shortname" : "param_menu[7]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[7]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-121",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 620.428589, 576.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 382.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[6]",
							"parameter_shortname" : "param_menu[6]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[6]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-122",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 593.857178, 552.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 358.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[5]",
							"parameter_shortname" : "param_menu[5]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[5]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-123",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 567.285645, 528.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 334.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[4]",
							"parameter_shortname" : "param_menu[4]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[4]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-117",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.6875, 154.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 203.8125, 72.5, 20.1875, 20.0 ],
					"style" : "",
					"text" : ":",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-116",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 133.666656, 137.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.0, 66.0, 58.375, 32.5 ],
					"rounded" : 20.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 4,
							"parameter_linknames" : 1,
							"parameter_longname" : "toggle_note",
							"parameter_shortname" : "toggle_note",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial_enable" : 1,
							"parameter_defer" : 1
						}

					}
,
					"text" : "Toggle",
					"texton" : "Toggled",
					"varname" : "toggle_note"
				}

			}
, 			{
				"box" : 				{
					"align" : 1,
					"arrow" : 0,
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontface" : 1,
					"fontsize" : 14.0,
					"hint" : "modifier assignment",
					"id" : "obj-5",
					"items" : [ "None", ",", "A", ",", "B", ",", "C" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 588.333252, 209.0, 48.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.125, 70.5, 59.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "mod_target_assignment",
							"parameter_shortname" : "mod_target_assignment",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "mod_target_assignment"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-115",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.6875, 68.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.625, 72.5, 48.375, 20.0 ],
					"style" : "",
					"text" : "Target",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"align" : 1,
					"allowdrag" : 0,
					"arrow" : 0,
					"bgcolor" : [ 0.011765, 0.396078, 0.752941, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.011765, 0.396078, 0.752941, 0.0 ],
					"bgfillcolor_color1" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"bgfillcolor_color2" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-113",
					"items" : [ 1, ",", 2, ",", 3, ",", 4, ",", 5, ",", 6, ",", 7, ",", 8, ",", 9, ",", 10, ",", 11, ",", 12, ",", 13, ",", 14, ",", 15, ",", 16, ",", 17, ",", 18, ",", 19, ",", 20, ",", 21, ",", 22, ",", 23, ",", 24, ",", 25, ",", 26, ",", 27, ",", 28, ",", 29, ",", 30, ",", 31, ",", 32, ",", 33, ",", 34, ",", 35, ",", 36, ",", 37, ",", 38, ",", 39, ",", 40, ",", 41, ",", 42, ",", 43, ",", 44, ",", 45, ",", 46, ",", 47, ",", 48, ",", 49, ",", 50, ",", 51, ",", 52, ",", 53, ",", 54, ",", 55, ",", 56, ",", 57, ",", 58, ",", 59, ",", 60, ",", 61, ",", 62, ",", 63, ",", 64 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 640.944336, 209.0, 49.285522, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 172.5, 70.5, 52.5, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_target",
							"parameter_shortname" : "mod_target",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "mod_target"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-114",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 687.499939, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.625, 66.0, 130.5, 32.5 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-112",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.6875, 112.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 140.0, 26.0, 42.0, 20.0 ],
					"style" : "",
					"text" : "Scale",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"align" : 1,
					"arrow" : 0,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 0.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 16.0,
					"id" : "obj-62",
					"items" : [ "Chromatic", ",", "Major", ",", "Minor", ",", "Dorian", ",", "Mixolydian", ",", "Lydian", ",", "Phrygian", ",", "Locrian", ",", "Diminished", ",", "Whole-half", ",", "Whole", "Tone", ",", "Minor", "Blues", ",", "Minor", "Pentatonic", ",", "Major", "Pentatonic", ",", "Harmonic", "Minor", ",", "Melodic", "Minor", ",", "Dominant", "Sus", ",", "Super", "Locrian", ",", "Neopolitan", "Minor", ",", "Neopolitan", "Major", ",", "Enigmatic", "Minor", ",", "Enigmatic", ",", "Composite", ",", "Bebop", "Locrian", ",", "Bebop", "Dominant", ",", "Bebop", "Major", ",", "Bhairav", ",", "Hungarian", "Minor", ",", "Minor", "Gypsy", ",", "Persian", ",", "Hirojoshi", ",", "In-Sen", ",", "Iwato", ",", "Kumoi", ",", "Pelog", ",", "Spanish" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 186.499969, 45.0, 100.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.0, 23.0, 143.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 3,
							"parameter_longname" : "selected_scale",
							"parameter_shortname" : "selected_scale",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1,
					"varname" : "selected_scale"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-111",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 648.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 131.625, 18.5, 193.75, 35.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-107",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.6875, 90.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.0, 72.5, 42.0, 20.0 ],
					"style" : "",
					"text" : "Color",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-106",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 809.6875, 132.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.0, 26.0, 47.0, 20.0 ],
					"style" : "",
					"text" : "Zone",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-99",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 540.714355, 504.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 406.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[3]",
							"parameter_shortname" : "param_menu[3]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[3]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-98",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 514.142822, 480.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 382.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[2]",
							"parameter_shortname" : "param_menu[2]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[2]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-97",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 487.571411, 455.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 358.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[1]",
							"parameter_shortname" : "param_menu[1]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[1]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0,
					"bgfillcolor_color" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"id" : "obj-96",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 461.0, 432.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 334.0, 194.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "param_menu[0]",
							"parameter_shortname" : "param_menu[0]",
							"parameter_type" : 3,
							"parameter_invisible" : 2
						}

					}
,
					"style" : "",
					"varname" : "param_menu[0]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 24.0,
					"id" : "obj-87",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 397.833221, 122.0, 46.0, 30.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.0, 67.5, 53.0, 30.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 2,
							"parameter_linknames" : 1,
							"parameter_longname" : "color",
							"parameter_shortname" : "color",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "color"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 620.428589, 392.0, 150.0, 54.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "multislider",
							"parameter_shortname" : "multislider",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 128,
					"style" : "",
					"varname" : "multislider"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"id" : "obj-79",
					"knobcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 246.301453, 404.0, 147.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 270.0, 322.0, 12.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "slider",
							"parameter_shortname" : "slider",
							"parameter_type" : 3,
							"parameter_invisible" : 1
						}

					}
,
					"size" : 92.0,
					"style" : "",
					"varname" : "slider"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 246.301453, 439.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "prepend offset"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.277361, 0.326007, 0.306195, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 4,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 91.317169, 290.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 165.0, 42.0, 117.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-17",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 673.571289, 628.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.0, 308.75, 22.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "capture",
							"parameter_shortname" : "capture",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
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
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-69",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 305.325134, 563.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 308.0, 165.0, 77.0, 21.0 ],
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
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 262.52356, 563.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 163.5, 165.0, 51.5, 21.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-54",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 700.1427, 655.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 395.5, 309.0, 22.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "target_device_reset",
							"parameter_shortname" : "target_device_reset",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "X",
					"texton" : "clear",
					"varname" : "target_device_reset"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hint" : "Modifier Press Sustain Time",
					"id" : "obj-44",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 239.333282, 81.0, 50.0, 80.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 375.0, 18.5, 43.5, 80.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 6,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_sustain",
							"parameter_shortname" : "sustain",
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "mod_sustain"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 348.126709, 563.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 224.4375, 165.0, 78.0, 21.0 ],
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
					"text" : "Device Output",
					"texton" : "Port Output",
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
					"patching_rect" : [ 360.999939, 17.0, 126.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_defer" : 1,
							"parameter_initial" : [ 300, 40, 750, 850 ],
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
						"initial" : [ 300, 40, 750, 850 ],
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
					"patching_rect" : [ 28.000031, 81.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher",
					"varname" : "settings_thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.833344, 110.0, 113.0, 22.0 ],
					"style" : "",
					"text" : "r extChordAssigner"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.721985, 366.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "r ---chord_assignment"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.721985, 528.0, 109.60321, 22.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"hint" : "main chord assignment",
					"hkeycolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 0,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 219.721985, 480.0, 147.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 191.0, 357.0, 72.0 ],
					"range" : 36,
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
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"fontsize" : 16.0,
					"id" : "obj-31",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 134.118805, 323.0, 48.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 116.0, 165.0, 40.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "chord_channel",
							"parameter_shortname" : "chord_channel",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_steps" : 16,
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
					"numinlets" : 7,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 91.317169, 601.0, 275.809723, 22.0 ],
					"style" : "",
					"text" : "funnel 7 21"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 376.999939, 290.0, 94.0, 22.0 ],
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
					"patching_rect" : [ 414.499939, 392.0, 114.0, 22.0 ],
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
					"patching_rect" : [ 414.499939, 323.0, 147.0, 55.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.000002, 571.875, 403.0, 69.0 ],
					"style" : "",
					"varname" : "breakpoint_obj"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 13,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 61.000061, 245.0, 651.666443, 22.0 ],
					"style" : "",
					"text" : "funnel 13 8"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.611115, 209.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.000002, 525.0, 39.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_enable",
							"parameter_shortname" : "cc_enable",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Off",
					"texton" : "On",
					"varname" : "cc_enable"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-23",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 113.833405, 208.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.000002, 482.0, 39.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "remote_enable",
							"parameter_shortname" : "remote_enable",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Off",
					"texton" : "On",
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
					"patching_rect" : [ 535.499878, 209.0, 50.0, 22.0 ],
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
					"patching_rect" : [ 271.888885, 209.0, 50.0, 22.0 ],
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
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 61.000061, 762.0, 121.0, 22.0 ],
					"style" : "",
					"text" : "prepend mod_assign"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 28.000031, 166.0, 388.833191, 22.0 ],
					"style" : "",
					"text" : "funnel 8"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 292.166595, 81.0, 50.0, 80.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 329.0, 18.5, 44.0, 80.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 7,
							"parameter_linknames" : 1,
							"parameter_longname" : "Mask",
							"parameter_shortname" : "mask",
							"parameter_type" : 0,
							"parameter_mmax" : 250.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 50.0 ],
							"parameter_unitstyle" : 2,
							"parameter_steps" : 250,
							"parameter_defer" : 1
						}

					}
,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"patching_rect" : [ 61.000031, 796.0, 30.0, 30.0 ],
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
					"patching_rect" : [ 28.000031, 17.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.011765, 0.396078, 0.752941, 0.0 ],
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 620.428589, 322.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 60.0, 309.0, 331.0, 20.0 ],
					"style" : "",
					"varname" : "target_device"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-94",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 492.5, 39.0, 37.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.5, 156.0, 419.0, 136.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[0]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-104",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.5, 39.0, 37.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.5, 442.875, 419.0, 68.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[2]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-109",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 609.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.0, 18.5, 102.0, 35.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-110",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 27.0, 66.0, 102.0, 33.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-118",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 492.5, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 305.875, 403.0, 26.25 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-95",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 609.5, 39.0, 37.72998, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.5, 298.0, 419.0, 139.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[3]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 648.5, 39.0, 37.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.5, 561.875, 419.0, 89.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[4]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 726.499939, 17.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 329.0, 109.5, 89.5, 30.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.720698, 0.16723, 0.080014, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-105",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 531.5, 39.0, 37.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.5, 7.5, 419.0, 142.5 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[1]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 687.499939, 39.0, 37.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.5, 516.875, 419.0, 38.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : "",
					"varname" : "panel[5]"
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
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 801.0, 700.0, 783.500016, 700.0, 783.500016, 70.0, 37.500031, 70.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 11 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 2 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 7 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 6 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 5 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 4 ],
					"source" : [ "obj-123", 0 ]
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
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-125", 1 ]
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
					"midpoints" : [ 100.817169, 735.0, 70.500061, 735.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 822.5, 610.0, 784.000016, 610.0, 784.000016, 70.0, 37.500031, 70.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 8 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 6 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 2 ],
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
					"destination" : [ "obj-6", 3 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 423.999939, 735.5, 70.500061, 735.5 ],
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
					"destination" : [ "obj-59", 6 ],
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
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 470.5, 735.0, 70.500061, 735.0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"midpoints" : [ 357.221985, 520.5, 319.825195, 520.5 ],
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
					"destination" : [ "obj-6", 2 ],
					"source" : [ "obj-34", 0 ]
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
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 4 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 4 ],
					"source" : [ "obj-48", 0 ]
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
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 551.999939, 384.0, 423.999939, 384.0 ],
					"source" : [ "obj-53", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 9 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 4 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 37.500031, 734.5, 70.500061, 734.5 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 324.5, 839.0, 197.500031, 839.0, 197.500031, 735.0, 70.500061, 735.0 ],
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
					"destination" : [ "obj-59", 3 ],
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
					"destination" : [ "obj-15", 5 ],
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
					"destination" : [ "obj-6", 5 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 255.801453, 435.5, 351.5, 435.5 ],
					"order" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"order" : 1,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 3 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 7 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 5 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 2 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 3 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-17" : [ "capture", "capture", 0 ],
			"obj-18" : [ "main_port", "main_port", 0 ],
			"obj-123" : [ "param_menu[4]", "param_menu[4]", 0 ],
			"obj-79" : [ "slider", "slider", 0 ],
			"obj-19" : [ "chord_enable", "chord_enable", 0 ],
			"obj-5" : [ "mod_target_assignment", "mod_target_assignment", 0 ],
			"obj-96" : [ "param_menu[0]", "param_menu[0]", 0 ],
			"obj-33" : [ "chord_assignment", "chord_assignment", 0 ],
			"obj-120" : [ "param_menu[7]", "param_menu[7]", 0 ],
			"obj-31" : [ "chord_channel", "chord_channel", 0 ],
			"obj-99" : [ "param_menu[3]", "param_menu[3]", 0 ],
			"obj-24" : [ "cc_enable", "cc_enable", 0 ],
			"obj-14" : [ "target_parameter_reset", "target_device_reset", 0 ],
			"obj-23" : [ "remote_enable", "remote_enable", 0 ],
			"obj-34" : [ "modify_mode", "modify", 4 ],
			"obj-20" : [ "cc_scale_exp", "cc_scale_exp", 0 ],
			"obj-41" : [ "settings_position", "settings_position", 0 ],
			"obj-42" : [ "kslider_offset_display", "kslider_offset_display", 0 ],
			"obj-21" : [ "cc_scale_hi", "cc_scale_hi", 0 ],
			"obj-122" : [ "param_menu[5]", "param_menu[5]", 0 ],
			"obj-74" : [ "thru", "thru", 0 ],
			"obj-22" : [ "cc_scale_lo", "cc_scale_lo", 0 ],
			"obj-7" : [ "remote_scale_exp", "remote_scale_exp", 0 ],
			"obj-97" : [ "param_menu[1]", "param_menu[1]", 0 ],
			"obj-4" : [ "remote_scale_hi", "remote_scale_hi", 0 ],
			"obj-54" : [ "target_device_reset", "target_device_reset", 0 ],
			"obj-3" : [ "remote_scale_lo", "remote_scale_lo", 0 ],
			"obj-43" : [ "selected_layer_tab", "selected_layer_tab", 0 ],
			"obj-29" : [ "selected", "zone", 1 ],
			"obj-10" : [ "cc_id", "cc_id", 0 ],
			"obj-9" : [ "Mask", "mask", 7 ],
			"obj-81" : [ "multislider", "multislider", 0 ],
			"obj-116" : [ "toggle_note", "toggle_note", 4 ],
			"obj-64" : [ "capture2", "capture2", 0 ],
			"obj-48" : [ "cc_port", "cc_port", 0 ],
			"obj-113" : [ "mod_target", "mod_target", 0 ],
			"obj-62" : [ "selected_scale", "selected_scale", 3 ],
			"obj-32" : [ "follow_mode", "follow", 4 ],
			"obj-121" : [ "param_menu[6]", "param_menu[6]", 0 ],
			"obj-69" : [ "main_clear", "main_clear", 0 ],
			"obj-12" : [ "assign_mode", "assign_zone", 4 ],
			"obj-58" : [ "main_mono", "main_mono", 0 ],
			"obj-98" : [ "param_menu[2]", "param_menu[2]", 0 ],
			"obj-87" : [ "color", "color", 2 ],
			"obj-44" : [ "mod_sustain", "sustain", 6 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"patchlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ]
	}

}
