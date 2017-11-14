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
		"rect" : [ 126.0, 79.0, 931.0, 919.0 ],
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
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.000031, 137.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "prepend position"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-91",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 567.285461, 787.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 364.25, 176.0, 17.75, 9.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "dec",
							"parameter_shortname" : "dec",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "v",
					"texton" : "G",
					"varname" : "dec"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 8.0,
					"id" : "obj-75",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 540.713928, 787.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 364.25, 165.0, 17.75, 9.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "inc",
							"parameter_shortname" : "inc",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "^",
					"texton" : "G",
					"varname" : "inc"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 514.142517, 731.0, 205.000046, 22.0 ],
					"style" : "",
					"text" : "funnel 8"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-89",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 700.142578, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 406.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[7]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[7]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-88",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 673.571106, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 382.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[6]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[6]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-86",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 646.999695, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 358.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[5]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[5]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-83",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 620.428284, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 334.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[4]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[4]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-82",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 593.856812, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 406.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[3]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[3]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-80",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 567.2854, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 382.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[2]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[2]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-78",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 540.713928, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 358.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0[1]",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"bgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"fontsize" : 8.0,
					"id" : "obj-77",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 514.142517, 700.0, 21.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 334.0, 15.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "global0",
							"parameter_shortname" : "global0",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "G",
					"texton" : "G",
					"varname" : "global0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 85.0, 159.0, 88.0, 22.0 ],
									"style" : "",
									"text" : "prepend mode"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 100.0, 71.0, 22.0 ],
									"style" : "",
									"text" : "route mode"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-75",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 50.0, 131.0, 89.0, 22.0 ],
									"style" : "",
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-80",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-82",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 44.0, 241.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-83",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 79.0, 241.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"source" : [ "obj-75", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"source" : [ "obj-75", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"source" : [ "obj-77", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-80", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 219.722031, 330.0, 80.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p mode_filter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 219.722031, 537.0, 54.0, 22.0 ],
					"style" : "",
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.011765, 0.396078, 0.752941, 0.0 ],
					"fontsize" : 10.0,
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 562.666504, 179.0, 150.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 239.25, 433.0, 179.25, 18.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "primary_drumrack"
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 843.5, 39.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.0, 433.0, 194.0, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 23,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 487.571075, 670.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.0, 433.0, 194.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "main_clear[1]",
							"parameter_shortname" : "main_clear",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"text" : "Select Primary DrumRack",
					"varname" : "main_clear[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 460.999939, 628.0, 205.000046, 22.0 ],
					"style" : "",
					"text" : "funnel 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.5, 385.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "r ---device_menu"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 14.0,
					"id" : "obj-36",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1096.655029, 729.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 351.875, 552.0, 23.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "cc_channel",
							"parameter_shortname" : "cc_channel",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 16.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_steps" : 128,
							"parameter_defer" : 1,
							"parameter_invisible" : 2
						}

					}
,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "cc_channel"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 334.0, 44.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 329.0, 554.0, 28.0, 18.0 ],
					"style" : "",
					"text" : "CH",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 115.721105,
					"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 883.5, 39.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 322.460938, 551.0, 61.539062, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"automation" : "Off",
					"automationon" : "On",
					"id" : "obj-74",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1043.821289, 729.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 390.5, 165.0, 35.5, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "thru",
							"parameter_shortname" : "thru",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "Off", "On" ],
							"parameter_defer" : 1
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
					"fontsize" : 14.0,
					"id" : "obj-10",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 376.999939, 209.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 281.0, 552.0, 36.0, 19.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "cc_id"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 312.0, 44.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.8125, 554.0, 37.0, 18.0 ],
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
					"presentation_rect" : [ 249.8125, 551.0, 67.1875, 21.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-21",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 482.666534, 209.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.90625, 552.0, 36.0, 19.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "cc_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.65098, 0.666667, 0.662745, 0.0 ],
					"bordercolor" : [ 0.196078, 0.196078, 0.196078, 0.0 ],
					"focusbordercolor" : [ 0.0, 0.019608, 0.078431, 0.0 ],
					"fontsize" : 14.0,
					"id" : "obj-22",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 429.833282, 209.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.625, 552.0, 37.0, 19.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "cc_scale_lo"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-68",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 206.5, 43.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 157.5, 553.0, 62.0, 18.0 ],
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
					"presentation_rect" : [ 157.625, 551.0, 87.0, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-63",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 277.0, 43.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.8125, 553.0, 62.0, 18.0 ],
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
					"presentation_rect" : [ 67.0, 551.0, 87.0, 21.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 219.166687, 209.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.90625, 507.0, 38.0, 19.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "remote_scale_hi"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-57",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 173.5, 43.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.5, 509.0, 62.0, 18.0 ],
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
					"presentation_rect" : [ 157.625, 507.0, 87.0, 21.0 ],
					"proportion" : 0.39,
					"rounded" : 19,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-56",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 808.5, 242.0, 43.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 71.8125, 509.0, 62.0, 18.0 ],
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
					"fontsize" : 14.0,
					"id" : "obj-3",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.444473, 208.0, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 118.625, 507.0, 36.0, 19.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"presentation_rect" : [ 69.0, 507.0, 85.0, 21.0 ],
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
					"patching_rect" : [ 991.988098, 729.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 386.5, 551.0, 36.5, 21.0 ],
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
					"patching_rect" : [ 377.000061, 423.0, 36.0, 15.0 ],
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
					"parameter_enable" : 1,
					"patching_rect" : [ 940.154785, 725.0, 40.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 343.75, 112.5, 60.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "modify_target",
							"parameter_shortname" : "modify_target",
							"parameter_type" : 2,
							"parameter_mmax" : 3.0,
							"parameter_enum" : [ "Off", "A", "B", "C" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_steps" : 4,
							"parameter_defer" : 1
						}

					}
,
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"text" : "script newdefault frame mira.frame @presentation 1 @tabname Skin:Zone @taborder 2 @draw_tab_name 0 @aspect 1 @presentation_rect 14.5 7.5 421.274775 281.398376, script newdefault frame2 mira.frame @presentation 1 @tabname Skin:Control @taborder 3 @draw_tab_name 0 @aspect 1 @presentation_rect 14.5 298. 419.485393 280.203125"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"activebgoncolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 889.488281, 725.0, 40.0, 20.0 ],
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
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 836.488281, 725.0, 40.0, 20.0 ],
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
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"automation" : "off",
					"automationon" : "on",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 784.654968, 725.0, 40.0, 20.0 ],
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
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 784.654968, 774.0, 381.832977, 22.0 ],
					"style" : "",
					"text" : "funnel 8 38"
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"patching_rect" : [ 460.999634, 819.0, 258.143066, 22.0 ],
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
					"patching_rect" : [ 176.92041, 563.0, 40.0, 20.0 ],
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
					"presentation_rect" : [ 27.000002, 480.0, 22.0, 19.0 ],
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
					"presentation_rect" : [ 396.5, 480.0, 22.0, 19.0 ],
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
					"patching_rect" : [ 562.666504, 145.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 60.0, 480.375, 331.0, 20.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"presentation_rect" : [ 22.000002, 477.375, 403.0, 26.25 ],
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
					"presentation_rect" : [ 249.8125, 406.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 249.8125, 382.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 249.8125, 358.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 249.8125, 334.0, 175.1875, 22.0 ],
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
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"automation" : "Off",
					"automationon" : "On",
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
							"parameter_shortname" : "toggle",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "Off", "On" ],
							"parameter_initial_enable" : 1,
							"parameter_defer" : 1
						}

					}
,
					"text" : "OneShot",
					"texton" : "Toggle",
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"presentation_rect" : [ 40.8125, 406.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 40.8125, 382.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 40.8125, 358.0, 175.1875, 22.0 ],
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
					"presentation_rect" : [ 40.8125, 334.0, 175.1875, 22.0 ],
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
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"patching_rect" : [ 620.428589, 323.0, 150.0, 54.0 ],
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
					"patching_rect" : [ 281.301514, 381.0, 70.920563, 24.0 ],
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
					"patching_rect" : [ 281.301514, 416.0, 87.0, 22.0 ],
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
					"patching_rect" : [ 91.317169, 529.0, 100.0, 20.0 ],
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
					"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"presentation_rect" : [ 308.0, 165.0, 49.0, 21.0 ],
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
					"patching_rect" : [ 219.722031, 298.0, 128.0, 22.0 ],
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
					"patching_rect" : [ 254.722031, 504.0, 147.0, 22.0 ],
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
					"patching_rect" : [ 254.722031, 457.0, 147.0, 34.0 ],
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
					"patching_rect" : [ 134.11879, 563.0, 48.0, 21.0 ],
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
							"parameter_defer" : 1
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
					"presentation_rect" : [ 23.000002, 597.875, 403.0, 69.0 ],
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
					"presentation_rect" : [ 22.000002, 551.0, 39.0, 21.0 ],
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
					"presentation_rect" : [ 22.000002, 507.0, 39.0, 21.0 ],
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
					"numinlets" : 7,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 80.833344, 168.5, 335.999878, 22.0 ],
					"style" : "",
					"text" : "funnel 7 1"
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
					"patching_rect" : [ 562.666504, 110.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 60.0, 309.0, 331.0, 20.0 ],
					"style" : "",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
					"presentation_rect" : [ 14.5, 156.0, 419.0, 136.0 ],
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
					"presentation_rect" : [ 14.5, 467.875, 419.0, 68.0 ],
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
					"presentation_rect" : [ 14.5, 298.0, 419.0, 164.0 ],
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
					"presentation_rect" : [ 14.5, 587.875, 419.0, 89.0 ],
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
					"presentation_rect" : [ 13.5, 7.5, 419.0, 142.5 ],
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
					"presentation_rect" : [ 14.5, 542.875, 419.0, 38.0 ],
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
					"destination" : [ "obj-59", 1 ],
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
					"destination" : [ "obj-47", 7 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 6 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 5 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 4 ],
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
					"destination" : [ "obj-59", 5 ],
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
					"midpoints" : [ 470.499634, 903.0, 196.499847, 903.0, 196.499847, 735.0, 70.500061, 735.0 ],
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
					"midpoints" : [ 392.222031, 497.5, 392.222031, 497.5 ],
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
					"destination" : [ "obj-6", 6 ],
					"source" : [ "obj-36", 0 ]
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
					"destination" : [ "obj-92", 0 ],
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
					"destination" : [ "obj-59", 3 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"order" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"order" : 1,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"order" : 2,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"order" : 3,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"order" : 7,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"order" : 6,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"order" : 5,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"order" : 4,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-47", 0 ]
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
					"destination" : [ "obj-30", 1 ],
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
					"midpoints" : [ 90.333344, 734.5, 70.500061, 734.5 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 794.154968, 903.0, 197.500031, 903.0, 197.500031, 735.0, 70.500061, 735.0 ],
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
					"destination" : [ "obj-59", 2 ],
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
					"destination" : [ "obj-15", 3 ],
					"source" : [ "obj-67", 0 ]
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
					"destination" : [ "obj-84", 0 ],
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
					"destination" : [ "obj-30", 3 ],
					"source" : [ "obj-75", 0 ]
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
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 1 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 290.801514, 412.5, 386.500061, 412.5 ],
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
					"destination" : [ "obj-67", 1 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 2 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 3 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 4 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 290.222031, 360.5, 264.222031, 360.5 ],
					"source" : [ "obj-84", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 5 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 6 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 6 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 7 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 4 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 2 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 4 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 37.500031, 734.0, 70.500061, 734.0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 1 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 2 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 3 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-98" : [ "param_menu[2]", "param_menu[2]", 0 ],
			"obj-122" : [ "param_menu[5]", "param_menu[5]", 0 ],
			"obj-89" : [ "global0[7]", "global0", 0 ],
			"obj-33" : [ "chord_assignment", "chord_assignment", 0 ],
			"obj-42" : [ "kslider_offset_display", "kslider_offset_display", 0 ],
			"obj-88" : [ "global0[6]", "global0", 0 ],
			"obj-31" : [ "chord_channel", "chord_channel", 0 ],
			"obj-34" : [ "modify_mode", "modify", 4 ],
			"obj-22" : [ "cc_scale_lo", "cc_scale_lo", 0 ],
			"obj-54" : [ "target_device_reset", "target_device_reset", 0 ],
			"obj-69" : [ "main_clear", "main_clear", 0 ],
			"obj-78" : [ "global0[1]", "global0", 0 ],
			"obj-87" : [ "color", "color", 2 ],
			"obj-116" : [ "toggle_note", "toggle", 4 ],
			"obj-96" : [ "param_menu[0]", "param_menu[0]", 0 ],
			"obj-77" : [ "global0", "global0", 0 ],
			"obj-64" : [ "capture2", "capture2", 0 ],
			"obj-24" : [ "cc_enable", "cc_enable", 0 ],
			"obj-41" : [ "settings_position", "settings_position", 0 ],
			"obj-113" : [ "mod_target", "mod_target", 0 ],
			"obj-83" : [ "global0[4]", "global0", 0 ],
			"obj-81" : [ "multislider", "multislider", 0 ],
			"obj-121" : [ "param_menu[6]", "param_menu[6]", 0 ],
			"obj-99" : [ "param_menu[3]", "param_menu[3]", 0 ],
			"obj-75" : [ "inc", "inc", 0 ],
			"obj-10" : [ "cc_id", "cc_id", 0 ],
			"obj-79" : [ "slider", "slider", 0 ],
			"obj-74" : [ "thru", "thru", 0 ],
			"obj-21" : [ "cc_scale_hi", "cc_scale_hi", 0 ],
			"obj-4" : [ "remote_scale_hi", "remote_scale_hi", 0 ],
			"obj-32" : [ "follow_mode", "follow", 4 ],
			"obj-80" : [ "global0[2]", "global0", 0 ],
			"obj-3" : [ "remote_scale_lo", "remote_scale_lo", 0 ],
			"obj-12" : [ "assign_mode", "assign_zone", 4 ],
			"obj-48" : [ "cc_port", "cc_port", 0 ],
			"obj-97" : [ "param_menu[1]", "param_menu[1]", 0 ],
			"obj-123" : [ "param_menu[4]", "param_menu[4]", 0 ],
			"obj-19" : [ "chord_enable", "chord_enable", 0 ],
			"obj-5" : [ "mod_target_assignment", "mod_target_assignment", 0 ],
			"obj-86" : [ "global0[5]", "global0", 0 ],
			"obj-62" : [ "selected_scale", "selected_scale", 3 ],
			"obj-17" : [ "capture", "capture", 0 ],
			"obj-58" : [ "main_mono", "main_mono", 0 ],
			"obj-120" : [ "param_menu[7]", "param_menu[7]", 0 ],
			"obj-36" : [ "cc_channel", "cc_channel", 0 ],
			"obj-44" : [ "mod_sustain", "sustain", 6 ],
			"obj-26" : [ "modify_target", "modify_target", 0 ],
			"obj-18" : [ "main_port", "main_port", 0 ],
			"obj-43" : [ "selected_layer_tab", "selected_layer_tab", 0 ],
			"obj-14" : [ "target_parameter_reset", "target_device_reset", 0 ],
			"obj-23" : [ "remote_enable", "remote_enable", 0 ],
			"obj-20" : [ "cc_scale_exp", "cc_scale_exp", 0 ],
			"obj-7" : [ "remote_scale_exp", "remote_scale_exp", 0 ],
			"obj-49" : [ "main_clear[1]", "main_clear", 0 ],
			"obj-82" : [ "global0[3]", "global0", 0 ],
			"obj-29" : [ "selected", "zone", 1 ],
			"obj-91" : [ "dec", "dec", 0 ],
			"obj-9" : [ "Mask", "mask", 7 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"patchlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ]
	}

}
