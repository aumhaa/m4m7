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
		"rect" : [ 214.0, 439.0, 315.0, 170.0 ],
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
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 199.5, 350.0, 62.0, 22.0 ],
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
					"patching_rect" : [ 199.5, 316.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "r ---mira_enable"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 199.5, 440.0, 109.0, 22.0 ],
					"style" : "",
					"text" : "script delete frame"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 221.0, 388.0, 475.0, 35.0 ],
					"style" : "",
					"text" : "script newdefault frame mira.frame @presentation 1 @tabname Skin:Grid @taborder 1 @draw_tab_name 0 @aspect 1 @presentation_rect 1.538994 4.75 307.4 154."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 221.0, 492.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 406.780243, 164.0, 141.0, 22.0 ],
					"style" : "",
					"text" : "prepend miraShiftOutput"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 357.780243, 212.0, 131.0, 22.0 ],
					"style" : "",
					"text" : "prepend miraAltOutput"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 305.780212, 251.0, 138.0, 22.0 ],
					"style" : "",
					"text" : "prepend miraKeyOutput"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"id" : "obj-67",
					"local_circles" : 0,
					"maxclass" : "mira.multitouch",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 477.780243, 131.5, 32.0, 15.0 ],
					"pinch_enabled" : 0,
					"presentation" : 1,
					"presentation_rect" : [ 21.5, 88.0, 32.0, 61.000015 ],
					"remote_circles" : 0,
					"remote_gestures" : 0,
					"rotate_enabled" : 0,
					"swipe_enabled" : 0,
					"swipe_touch_count" : 0,
					"tap_enabled" : 0,
					"tap_tap_count" : 0,
					"tap_touch_count" : 0
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"id" : "obj-6",
					"local_circles" : 0,
					"maxclass" : "mira.multitouch",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 255.0, 179.5, 32.0, 15.0 ],
					"pinch_enabled" : 0,
					"presentation" : 1,
					"presentation_rect" : [ 21.5, 15.0, 32.0, 62.0 ],
					"remote_circles" : 0,
					"remote_gestures" : 0,
					"rotate_enabled" : 0,
					"swipe_enabled" : 0,
					"swipe_touch_count" : 0,
					"tap_enabled" : 0,
					"tap_tap_count" : 0,
					"tap_touch_count" : 0
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"id" : "obj-5",
					"local_circles" : 0,
					"maxclass" : "mira.multitouch",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 305.780212, 13.0, 32.0, 133.5 ],
					"pinch_enabled" : 0,
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 15.0, 32.000031, 133.5 ],
					"remote_circles" : 0,
					"remote_gestures" : 0,
					"rotate_enabled" : 0,
					"swipe_enabled" : 0,
					"swipe_touch_count" : 0,
					"tap_enabled" : 0,
					"tap_tap_count" : 0,
					"tap_touch_count" : 0,
					"vsegments" : 8
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-88",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 357.780243, 131.5, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 21.5, 88.0, 32.0, 61.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "alt"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-87",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 406.780243, 131.5, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 21.5, 15.0, 32.0, 61.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "shift"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 0.772549, 0.086275, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-86",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 131.5, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 134.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[7]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0, 0, 0, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-85",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 114.5, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 117.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[6]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0, 0, 0, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-84",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 98.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 100.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[5]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.0, 0.0, 1, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 81.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 83.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[4]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0, 0, 0, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-82",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 64.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 66.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[3]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0, 0, 0, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-81",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 47.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 49.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[2]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0, 0, 0, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-80",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 30.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 32.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[1]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 1 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.780212, 13.0, 32.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.9776, 15.0, 32.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "key[0]"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.0, 356.0, 30.0, 30.0 ],
					"presentation_rect" : [ 170.0, 242.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.0, 198.0, 140.0, 22.0 ],
					"presentation_rect" : [ 7.0, 198.0, 140.0, 22.0 ],
					"style" : "",
					"text" : "prepend miraGridOutput"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 7.0, 315.0, 30.0, 30.0 ],
					"presentation_rect" : [ 7.0, 242.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.74902, 0.74902, 0.74902, 0.0 ],
					"hsegments" : 8,
					"id" : "obj-69",
					"local_circles" : 0,
					"maxclass" : "mira.multitouch",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.0, 38.75, 134.0, 133.5 ],
					"pinch_enabled" : 0,
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 15.0, 134.0, 133.5 ],
					"remote_circles" : 0,
					"remote_gestures" : 0,
					"rotate_enabled" : 0,
					"swipe_enabled" : 0,
					"swipe_touch_count" : 0,
					"tap_enabled" : 0,
					"tap_tap_count" : 0,
					"tap_touch_count" : 0,
					"vsegments" : 8
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.376471, 0.031373, 0.0, 0.732283 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[63]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.376471, 0.031373, 0.0, 0.732283 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-65",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[62]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-64",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[61]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-63",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[60]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-62",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[59]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[58]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-60",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[57]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-59",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 131.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 134.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[56]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.376471, 0.031373, 0.0, 0.732283 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[55]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.376471, 0.031373, 0.0, 0.732283 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-57",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[54]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[53]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-55",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[52]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[51]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-53",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[50]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-52",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[49]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 114.5, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 117.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[48]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[47]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[46]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.160784, 0.490196, 0.32549, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-48",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[45]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.160784, 0.490196, 0.32549, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[44]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[43]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[42]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[41]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 98.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 100.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[40]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-42",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[39]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.341176, 0.133333, 1, 0.314961 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-41",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[38]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.160784, 0.490196, 0.32549, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[37]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.160784, 0.490196, 0.32549, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[36]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[35]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-37",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[34]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-36",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[33]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.564706, 0.509804, 0.121569, 0.472441 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 81.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 83.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[32]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-34",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[31]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[30]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-32",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[29]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-31",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[28]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-30",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[27]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-29",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[26]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[25]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-27",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 64.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 66.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[24]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[23]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[22]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[21]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-23",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[20]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-22",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[19]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[18]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[17]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-19",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 47.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 49.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[16]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[15]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[14]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[13]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[12]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-14",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[11]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-13",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[10]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-12",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[9]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-11",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 30.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 32.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[8]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-10",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 207.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[7]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[6]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-8",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 238.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 173.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[5]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 1, 1, 1, 0.976378 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 156.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[4]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-74",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[3]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-75",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[2]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-76",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 105.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[1]"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.192157, 0.678431, 1, 0.3 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-77",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 13.0, 15.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.2388, 15.0, 15.0, 15.0 ],
					"proportion" : 0.39,
					"style" : "",
					"varname" : "cell[0]"
				}

			}
, 			{
				"box" : 				{
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-73",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 147.5, 7.5, 146.0, 139.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.2388, 10.25, 146.0, 144.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-78",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 536.73877, 81.0, 82.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.2388, 10.25, 45.0, 144.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"border" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-79",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 536.73877, 109.25, 82.0, 20.25 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 10.25, 45.0, 144.0 ],
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
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
					"destination" : [ "obj-123", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-125", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "mira.multitouch.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
