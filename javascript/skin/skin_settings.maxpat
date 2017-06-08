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
		"rect" : [ 585.0, 707.0, 500.0, 420.0 ],
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
					"format" : 6,
					"id" : "obj-7",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 661.999817, 139.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 558.0, 31.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "scale_exp"
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
					"patching_rect" : [ 609.166504, 139.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 499.0, 31.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "scale_hi"
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
					"patching_rect" : [ 556.333191, 139.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 444.0, 31.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "scale_lo"
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
					"patching_rect" : [ 503.499847, 139.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 358.0, 31.0, 50.0, 22.0 ],
					"style" : "",
					"varname" : "cc_out"
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
					"patching_rect" : [ 450.666534, 110.0, 247.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 358.0, 6.0, 247.0, 21.0 ],
					"style" : "",
					"text" : "",
					"texton" : "",
					"varname" : "modulation_assignment"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"disabled" : [ 0, 0 ],
					"id" : "obj-5",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : 25,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 397.833282, 110.0, 18.0, 52.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 333.0, 7.0, 18.0, 52.0 ],
					"size" : 2,
					"style" : "",
					"values" : [ 0, 0 ],
					"varname" : "remote_cc_enable"
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
					"patching_rect" : [ 345.000122, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 287.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
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
					"patching_rect" : [ 292.166748, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 241.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
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
					"patching_rect" : [ 28.0, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
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
					"patching_rect" : [ 28.0, 193.0, 121.0, 22.0 ],
					"style" : "",
					"text" : "prepend mod_assign"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 13,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 28.000031, 166.0, 652.999756, 22.0 ],
					"style" : "",
					"text" : "funnel 13"
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
					"patching_rect" : [ 186.5, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 149.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
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
					"patching_rect" : [ 132.833374, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 103.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
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
					"patching_rect" : [ 80.833344, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 57.0, 12.0, 44.0, 36.0 ],
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
					"showname" : 0,
					"varname" : "mod_A"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 239.559509, 110.0, 44.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 195.0, 12.0, 44.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 7,
							"parameter_linknames" : 1,
							"parameter_longname" : "Mask",
							"parameter_shortname" : "Mask Time",
							"parameter_type" : 0,
							"parameter_mmax" : 150.0,
							"parameter_modmode" : 4,
							"parameter_modmax" : 150.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 50 ],
							"parameter_unitstyle" : 2,
							"parameter_defer" : 1,
							"parameter_mapping_index" : 7
						}

					}
,
					"showname" : 0,
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
					"patching_rect" : [ 28.0, 430.0, 30.0, 30.0 ],
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
					"destination" : [ "obj-59", 9 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 5 ],
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
					"destination" : [ "obj-59", 6 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 10 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 11 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 7 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 2 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 3 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 8 ],
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
					"destination" : [ "obj-59", 12 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 4 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-57" : [ "mod_B", "mod_B", 5 ],
			"obj-13" : [ "note", "note", 3 ],
			"obj-9" : [ "Mask", "Mask Time", 7 ],
			"obj-58" : [ "mod_C", "mod_C", 6 ],
			"obj-12" : [ "selected", "selected", 1 ],
			"obj-56" : [ "mod_A", "mod_A", 4 ],
			"obj-29" : [ "color", "color", 2 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
