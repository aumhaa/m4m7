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
		"rect" : [ 118.0, 78.0, 1028.0, 731.0 ],
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
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 894.0, 509.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher",
					"varname" : "blocks_thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 845.0, 425.0, 118.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 80, 80, 375, 600 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_longname" : "blocks_position",
							"parameter_shortname" : "blocks_position",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"initial" : [ 80, 80, 375, 600 ],
						"parameter_enable" : 1
					}
,
					"style" : "",
					"text" : "pattr blocks_position",
					"varname" : "blocks_position"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 727.099976, 537.0, 84.0, 22.0 ],
					"style" : "",
					"text" : "prepend send"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 7,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 727.099976, 502.0, 82.0, 22.0 ],
					"style" : "",
					"text" : "midiformat"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-18",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 727.099976, 576.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"frozen_object_attributes" : 					{
						"lownote" : 40,
						"scale" : [ 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 ],
						"scaletype" : 0
					}
,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 810.099976, 303.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "blocks.notemap"
				}

			}
, 			{
				"box" : 				{
					"frozen_object_attributes" : 					{
						"lownote" : 36,
						"scale" : [ 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 ],
						"scaletype" : 0
					}
,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 662.099976, 303.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "blocks.notemap"
				}

			}
, 			{
				"box" : 				{
					"frozen_object_attributes" : 					{
						"lownote" : 72,
						"scale" : [ 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 ],
						"scaletype" : 0
					}
,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 513.099976, 303.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "blocks.notemap"
				}

			}
, 			{
				"box" : 				{
					"frozen_object_attributes" : 					{
						"lownote" : 68,
						"scale" : [ 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 ],
						"scaletype" : 0
					}
,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 364.099976, 303.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "blocks.notemap"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 20.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 579.0, 7.0, 26.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 215.0, 290.0, 30.0, 29.0 ],
					"style" : "",
					"text" : "4:"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 20.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 539.666626, 7.0, 32.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.0, 290.0, 30.0, 29.0 ],
					"style" : "",
					"text" : "3:"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 20.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 506.666656, 7.0, 37.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 79.0, 290.0, 30.0, 29.0 ],
					"style" : "",
					"text" : "2:"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 20.0,
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 473.0, 7.0, 31.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.0, 290.0, 30.0, 29.0 ],
					"style" : "",
					"text" : "1:"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-14",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 539.666626, 42.0, 31.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 170.0, 291.0, 32.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "block4_scene",
							"parameter_shortname" : "block4_scene",
							"parameter_type" : 1,
							"parameter_mmax" : 15.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 4 ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 1
						}

					}
,
					"varname" : "block4_scene"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-13",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 574.0, 42.0, 31.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 241.0, 291.0, 33.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "block3_scene",
							"parameter_shortname" : "block3_scene",
							"parameter_type" : 1,
							"parameter_mmax" : 15.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 5 ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 1
						}

					}
,
					"varname" : "block3_scene"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-12",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 506.666656, 41.0, 31.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 104.0, 291.0, 32.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "block2_scene",
							"parameter_shortname" : "block2_scene",
							"parameter_type" : 1,
							"parameter_mmax" : 15.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 1
						}

					}
,
					"varname" : "block2_scene"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-8",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 473.0, 41.0, 31.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 34.0, 291.0, 33.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "block1_scene",
							"parameter_shortname" : "block1_scene",
							"parameter_type" : 1,
							"parameter_mmax" : 15.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0 ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 1
						}

					}
,
					"varname" : "block1_scene"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"color" : [ 0.803922, 0.898039, 0.909804, 0.0 ],
					"cols" : 4,
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.02 ],
					"flashcolor" : [ 0.921569, 0.917647, 0.933333, 0.0 ],
					"id" : "obj-19",
					"maxclass" : "blocks.grid",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "list", "list", "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 810.099976, 275.5, 135.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.0, 143.0, 135.0, 135.0 ],
					"rows" : 4,
					"selectioncolor" : [ 0.701961, 0.415686, 0.886275, 0.53 ],
					"style" : "",
					"togglemode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"color" : [ 0.803922, 0.898039, 0.909804, 0.0 ],
					"cols" : 4,
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.02 ],
					"flashcolor" : [ 0.921569, 0.917647, 0.933333, 0.0 ],
					"id" : "obj-16",
					"maxclass" : "blocks.grid",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "list", "list", "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 662.099976, 275.5, 135.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 143.0, 135.0, 135.0 ],
					"rows" : 4,
					"selectioncolor" : [ 0.701961, 0.415686, 0.886275, 0.53 ],
					"style" : "",
					"togglemode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"color" : [ 0.803922, 0.898039, 0.909804, 0.0 ],
					"cols" : 4,
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.02 ],
					"flashcolor" : [ 0.921569, 0.917647, 0.933333, 0.0 ],
					"id" : "obj-10",
					"maxclass" : "blocks.grid",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "list", "list", "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 513.099976, 275.5, 135.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.0, 8.0, 135.0, 135.0 ],
					"rows" : 4,
					"selectioncolor" : [ 0.701961, 0.415686, 0.886275, 0.53 ],
					"style" : "",
					"togglemode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"color" : [ 0.803922, 0.898039, 0.909804, 0.0 ],
					"cols" : 4,
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.02 ],
					"flashcolor" : [ 0.921569, 0.917647, 0.933333, 0.0 ],
					"id" : "obj-65",
					"maxclass" : "blocks.grid",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "list", "list", "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 364.099976, 275.5, 135.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 8.0, 135.0, 135.0 ],
					"rows" : 4,
					"selectioncolor" : [ 0.701961, 0.415686, 0.886275, 0.53 ],
					"style" : "",
					"togglemode" : 0
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 3,
					"bordercolor" : [ 0.0, 0.078431, 0.321569, 1.0 ],
					"grad1" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"grad2" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"id" : "obj-9",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 710.0, 7.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 142.0, 140.0, 139.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 3,
					"bordercolor" : [ 0.0, 0.078431, 0.321569, 1.0 ],
					"grad1" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"grad2" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"id" : "obj-7",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 710.0, 137.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.0, 142.0, 140.0, 139.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 3,
					"bordercolor" : [ 0.0, 0.078431, 0.321569, 1.0 ],
					"grad1" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"grad2" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"id" : "obj-6",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 7.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.0, 6.0, 140.0, 139.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 3,
					"bordercolor" : [ 0.0, 0.078431, 0.321569, 1.0 ],
					"grad1" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"grad2" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 137.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 6.0, 140.0, 139.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 473.0, 196.0, 149.0, 22.0 ],
					"style" : "",
					"text" : "scene $1 1 $2 2 $3 3 $4 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 473.0, 128.0, 119.999969, 22.0 ],
					"style" : "",
					"text" : "pak 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 98.0, 41.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 343.0, 48.0, 78.0, 22.0 ],
					"style" : "",
					"text" : "clear, repaint"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 36.0, 364.25, 147.0, 68.75 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 321.0, 280.0, 179.75 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "update_topology" ],
					"patching_rect" : [ 93.0, 303.0, 105.0, 22.0 ],
					"style" : "",
					"text" : "t update_topology"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 160.0, 243.0, 77.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "dict topology"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 10,
					"outlettype" : [ "", "", "", "", "int", "", "int", "int", "int", "" ],
					"patching_rect" : [ 364.099976, 334.0, 113.5, 22.0 ],
					"style" : "",
					"text" : "mpeparse"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 364.099976, 379.0, 109.0, 22.0 ],
					"style" : "",
					"text" : "prepend blockNote"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 222.0, 303.0, 115.0, 22.0 ],
					"style" : "",
					"text" : "prepend blockMode"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"elementcolor" : [ 0.376471, 0.384314, 0.4, 0.0 ],
					"id" : "obj-66",
					"lag" : 1,
					"maxclass" : "blocks.multitouch",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 291.0, 95.0, 144.0, 135.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 8.0, 270.0, 270.0 ],
					"showtracking" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 291.0, 576.0, 30.0, 30.0 ],
					"style" : ""
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
					"patching_rect" : [ 527.0, 576.0, 30.0, 30.0 ],
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
					"patching_rect" : [ 291.0, 14.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-67",
					"maxclass" : "blocks.pad",
					"modeadvancesscene" : 0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "dictionary", "int" ],
					"participateglobally" : 1,
					"patching_rect" : [ 98.0, 90.0, 143.0, 145.5 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 3.0, 280.0, 280.0 ],
					"style" : "",
					"varname" : "blocks_pad"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"source" : [ "obj-10", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 3 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 2 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"source" : [ "obj-16", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 1 ],
					"source" : [ "obj-19", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"order" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 522.599976, 329.0, 373.599976, 329.0 ],
					"order" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 671.599976, 329.0, 373.599976, 329.0 ],
					"order" : 1,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 819.599976, 329.0, 373.599976, 329.0 ],
					"order" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"midpoints" : [ 482.5, 235.0, 461.5, 235.0, 461.5, 79.0, 107.5, 79.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 5 ],
					"midpoints" : [ 426.099976, 360.5, 789.099976, 360.5 ],
					"source" : [ "obj-43", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 4 ],
					"midpoints" : [ 415.599976, 360.5, 778.599976, 360.5 ],
					"source" : [ "obj-43", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 2 ],
					"midpoints" : [ 394.599976, 361.5, 757.599976, 361.5 ],
					"source" : [ "obj-43", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"midpoints" : [ 169.5, 273.0, 102.5, 273.0 ],
					"order" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"midpoints" : [ 169.5, 274.25, 45.5, 274.25 ],
					"order" : 1,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 1 ],
					"source" : [ "obj-65", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-67", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 102.5, 340.5, 300.5, 340.5 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 231.5, 339.5, 300.5, 339.5 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 373.599976, 415.5, 300.5, 415.5 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-12" : [ "block2_scene", "block2_scene", 0 ],
			"obj-74" : [ "blocks_position", "blocks_position", 0 ],
			"obj-14" : [ "block4_scene", "block4_scene", 0 ],
			"obj-13" : [ "block3_scene", "block3_scene", 0 ],
			"obj-8" : [ "block1_scene", "block1_scene", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "blocks.pad.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "blocks.multitouch.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "blocks.grid.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "blocks.notemap.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
