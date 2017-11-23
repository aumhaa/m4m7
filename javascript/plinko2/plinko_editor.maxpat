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
		"rect" : [ 245.0, 78.0, 236.0, 787.0 ],
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
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 81.0, 490.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "prepend selector"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "tab",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 81.0, 452.0, 200.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.0, 41.0, 63.0, 654.0 ],
					"style" : "",
					"tabs" : [ "bank", "note", "velocity", "duration" ],
					"varname" : "function_selector"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 52.0, 279.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 13.0, 124.0, 20.0 ],
					"style" : "",
					"varname" : "node_id"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 416.0, 77.0, 22.0 ],
					"style" : "",
					"text" : "prepend dial"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 52.0, 381.0, 313.0, 22.0 ],
					"style" : "",
					"text" : "funnel 8"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-22",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 346.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 615.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial7"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-21",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 304.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 533.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial6"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-20",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 262.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 451.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial5"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-19",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 220.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 369.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial4"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-18",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 178.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 287.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial3"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-17",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 136.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 205.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial2"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-16",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 94.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 123.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial1"
				}

			}
, 			{
				"box" : 				{
					"degrees" : 360,
					"id" : "obj-12",
					"jspainterfile" : "dial_override.js",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 52.0, 325.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 41.0, 80.0, 80.0 ],
					"style" : "",
					"thickness" : 100.0,
					"varname" : "multidial0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 701.0, 142.0, 22.0 ],
					"style" : "",
					"text" : "prepend plinko_editor_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 67.0, 651.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "prepend position"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 67.0, 617.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher",
					"varname" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 103.0, 43.0, 126.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 100.0, 100.0, 500.0, 500.0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "window_position",
							"parameter_shortname" : "window_position",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"initial" : [ 100.0, 100.0, 500.0, 500.0 ],
						"parameter_enable" : 1
					}
,
					"style" : "",
					"text" : "pattr window_position",
					"varname" : "window_position"
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
					"patching_rect" : [ 51.0, 751.0, 30.0, 30.0 ],
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
					"patching_rect" : [ 30.0, 43.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 554.0, 59.0, 48.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 7.0, 145.0, 32.0 ],
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 2 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 3 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 4 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 5 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 6 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 7 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 90.5, 523.0, 61.5, 523.0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3" : [ "window_position", "window_position", 0 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
