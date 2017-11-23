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
		"rect" : [ 141.0, 709.0, 468.0, 124.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1176.0, 774.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1020.0, 768.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 871.0, 747.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 716.0, 747.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 565.0, 747.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 743.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 275.0, 743.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 125.0, 738.0, 58.0, 19.0 ],
					"style" : "",
					"text" : "prepend set"
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
					"patching_rect" : [ 81.599998, 133.0, 85.0, 19.0 ],
					"style" : "",
					"text" : "unpack 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-148",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 90.0, 424.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-169",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 76.5, 452.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
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
					"patching_rect" : [ 694.0, 143.0, 55.0, 19.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1125.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 972.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 820.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 516.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 364.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 60.0, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1142.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 989.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 837.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 684.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 533.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 229.0, 845.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 127.25, 827.0, 54.0, 20.0 ],
					"style" : "",
					"text" : "append 0"
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
					"patching_rect" : [ 60.0, 886.0, 56.0, 19.0 ],
					"style" : "",
					"text" : "s ---midiout"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1125.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1125.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1125.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 972.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 972.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 972.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 820.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 820.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 820.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 667.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 667.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 667.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 516.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 516.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 516.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 364.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 364.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 364.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 212.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 212.0, 734.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 212.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 60.0, 754.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 60.0, 728.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "< 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 60.0, 774.0, 36.0, 19.0 ],
					"style" : "",
					"text" : "gate 2"
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
					"patching_rect" : [ 81.599998, 81.0, 25.0, 25.0 ],
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
					"patching_rect" : [ 694.0, 103.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1110.0, 436.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 56"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 957.0, 437.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 48"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 805.0, 439.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 40"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 652.0, 437.0, 31.5, 19.0 ],
					"style" : "",
					"text" : "+ 32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 501.0, 434.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 24"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 349.0, 435.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 197.0, 434.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-270",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1110.0, 254.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-269",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 957.0, 256.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-268",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 805.0, 257.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-267",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 652.0, 257.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-266",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 501.0, 260.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-265",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 349.0, 257.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-264",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 197.0, 257.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-263",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 45.0, 256.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+ 1"
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
					"patching_rect" : [ 1143.0, 165.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 150.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 131.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 115.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 99.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 81.0, 49.0, 17.0 ],
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
					"patching_rect" : [ 1143.0, 182.0, 48.0, 17.0 ],
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
					"patching_rect" : [ 1209.0, 580.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 1176.0, 599.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 1167.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-238",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 1110.0, 495.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 1110.0, 231.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 48,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_mode",
							"parameter_shortname" : "bank8_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-240",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 1110.0, 273.0, 83.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-242",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1188.0, 559.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-243",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1142.0, 580.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-244",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1142.0, 537.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-245",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1156.0, 428.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-246",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1142.0, 449.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-247",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 1142.0, 473.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 1188.0, 540.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 1165.0, 519.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 1156.0, 407.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 372.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 29,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank8_scale",
							"parameter_shortname" : "bank8_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-251",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1142.0, 679.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-252",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1176.0, 636.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-254",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1142.0, 657.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 1056.0, 581.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 1023.0, 600.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 1014.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-217",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 957.0, 496.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 957.0, 232.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 47,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_mode",
							"parameter_shortname" : "bank7_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ]
						}

					}
,
					"varname" : "bank7_mode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-219",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 957.0, 274.0, 82.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-221",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1035.0, 560.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-222",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 989.0, 581.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-223",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 989.0, 538.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-224",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1003.0, 429.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-225",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 989.0, 450.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-226",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 989.0, 474.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 1035.0, 541.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 1012.0, 520.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 1003.0, 408.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 319.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 28,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank7_scale",
							"parameter_shortname" : "bank7_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-230",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 989.0, 680.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-231",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1023.0, 637.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-233",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 989.0, 658.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 904.0, 582.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 871.0, 601.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 862.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-196",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 805.0, 497.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 805.0, 233.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 46,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_mode",
							"parameter_shortname" : "bank6_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-198",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 805.0, 275.0, 82.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-200",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 883.0, 561.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-201",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 837.0, 582.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-202",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 837.0, 539.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-203",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 851.0, 430.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-204",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 837.0, 451.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-205",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 837.0, 475.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 883.0, 542.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 860.5, 522.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 851.0, 409.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 266.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 27,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank6_scale",
							"parameter_shortname" : "bank6_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-209",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 837.0, 681.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-210",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 871.0, 638.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-212",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 837.0, 659.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 751.0, 583.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 718.0, 602.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 709.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-175",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 652.0, 498.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 652.0, 234.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 45,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_mode",
							"parameter_shortname" : "bank5_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-177",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 652.0, 276.0, 83.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-179",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 730.0, 562.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-180",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 684.0, 583.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-181",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 684.0, 540.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-182",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 698.0, 431.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-183",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 684.0, 452.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-184",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 684.0, 476.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 730.0, 543.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 707.0, 522.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 698.0, 410.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 26,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank5_scale",
							"parameter_shortname" : "bank5_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-188",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 684.0, 682.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-189",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 718.0, 639.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-191",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 684.0, 660.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 600.0, 583.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 567.0, 602.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 558.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 501.0, 498.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 501.0, 234.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 44,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_mode",
							"parameter_shortname" : "bank4_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-156",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 501.0, 276.0, 83.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-158",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 579.0, 562.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-159",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 533.0, 583.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-160",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 533.0, 540.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 547.0, 431.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-162",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 533.0, 452.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-163",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 533.0, 476.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 579.0, 543.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 556.0, 522.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 547.0, 410.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 25,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank4_scale",
							"parameter_shortname" : "bank4_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 533.0, 682.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-168",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 567.0, 639.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-170",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 533.0, 660.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 448.0, 583.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 415.0, 602.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 406.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 349.0, 498.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 349.0, 234.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 43,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_mode",
							"parameter_shortname" : "bank3_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-135",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 349.0, 276.0, 83.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 427.0, 562.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-138",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 381.0, 583.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-139",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 381.0, 540.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-140",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 395.0, 431.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-141",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 381.0, 452.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 381.0, 476.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 427.0, 543.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 404.0, 522.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 395.0, 410.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 24,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank3_scale",
							"parameter_shortname" : "bank3_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 682.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 415.0, 639.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 381.0, 660.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 296.0, 583.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 263.0, 602.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 254.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 197.0, 498.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 197.0, 234.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 42,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_mode",
							"parameter_shortname" : "bank2_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-114",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 197.0, 276.0, 82.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 275.0, 562.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 229.0, 583.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 229.0, 540.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 243.0, 431.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 229.0, 452.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 229.0, 476.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 275.0, 543.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 252.0, 522.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 243.0, 410.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 54.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 23,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank2_scale",
							"parameter_shortname" : "bank2_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 229.0, 682.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 263.0, 639.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 229.0, 660.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
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
					"patching_rect" : [ 144.0, 582.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 111.0, 601.0, 50.0, 15.0 ],
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
					"patching_rect" : [ 102.0, 708.0, 48.0, 15.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 45.0, 497.0, 87.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"style" : "",
					"text" : "coll ---custom_map"
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
					"patching_rect" : [ 45.0, 232.0, 49.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 1.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 41,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_mode",
							"parameter_shortname" : "bank1_mode",
							"parameter_type" : 2,
							"parameter_enum" : [ "custom", "scale", "script" ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 45.0, 275.0, 82.0, 19.0 ],
					"style" : "",
					"text" : "gate 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 123.0, 561.0, 32.5, 19.0 ],
					"style" : "",
					"text" : "* 12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 77.0, 582.0, 64.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 77.0, 539.0, 42.5, 19.0 ],
					"style" : "",
					"text" : "+"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 56,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 4 ]
							}
, 							{
								"key" : 4,
								"value" : [ 5 ]
							}
, 							{
								"key" : 5,
								"value" : [ 7 ]
							}
, 							{
								"key" : 6,
								"value" : [ 9 ]
							}
, 							{
								"key" : 7,
								"value" : [ 11 ]
							}
, 							{
								"key" : 8,
								"value" : [ 12 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 2 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7 ]
							}
, 							{
								"key" : 16,
								"value" : [ 9 ]
							}
, 							{
								"key" : 17,
								"value" : [ 10 ]
							}
, 							{
								"key" : 18,
								"value" : [ 12 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1 ]
							}
, 							{
								"key" : 23,
								"value" : [ 3 ]
							}
, 							{
								"key" : 24,
								"value" : [ 5 ]
							}
, 							{
								"key" : 25,
								"value" : [ 7 ]
							}
, 							{
								"key" : 26,
								"value" : [ 8 ]
							}
, 							{
								"key" : 27,
								"value" : [ 10 ]
							}
, 							{
								"key" : 28,
								"value" : [ 12 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0 ]
							}
, 							{
								"key" : 32,
								"value" : [ 2 ]
							}
, 							{
								"key" : 33,
								"value" : [ 4 ]
							}
, 							{
								"key" : 34,
								"value" : [ 6 ]
							}
, 							{
								"key" : 35,
								"value" : [ 7 ]
							}
, 							{
								"key" : 36,
								"value" : [ 9 ]
							}
, 							{
								"key" : 37,
								"value" : [ 11 ]
							}
, 							{
								"key" : 38,
								"value" : [ 12 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0 ]
							}
, 							{
								"key" : 42,
								"value" : [ 2 ]
							}
, 							{
								"key" : 43,
								"value" : [ 4 ]
							}
, 							{
								"key" : 44,
								"value" : [ 5 ]
							}
, 							{
								"key" : 45,
								"value" : [ 7 ]
							}
, 							{
								"key" : 46,
								"value" : [ 9 ]
							}
, 							{
								"key" : 47,
								"value" : [ 10 ]
							}
, 							{
								"key" : 48,
								"value" : [ 12 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0 ]
							}
, 							{
								"key" : 52,
								"value" : [ 2 ]
							}
, 							{
								"key" : 53,
								"value" : [ 3 ]
							}
, 							{
								"key" : 54,
								"value" : [ 5 ]
							}
, 							{
								"key" : 55,
								"value" : [ 7 ]
							}
, 							{
								"key" : 56,
								"value" : [ 8 ]
							}
, 							{
								"key" : 57,
								"value" : [ 10 ]
							}
, 							{
								"key" : 58,
								"value" : [ 12 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0 ]
							}
, 							{
								"key" : 62,
								"value" : [ 1 ]
							}
, 							{
								"key" : 63,
								"value" : [ 3 ]
							}
, 							{
								"key" : 64,
								"value" : [ 5 ]
							}
, 							{
								"key" : 65,
								"value" : [ 6 ]
							}
, 							{
								"key" : 66,
								"value" : [ 8 ]
							}
, 							{
								"key" : 67,
								"value" : [ 10 ]
							}
, 							{
								"key" : 68,
								"value" : [ 12 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 76.5, 476.0, 63.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "",
					"text" : "coll ---modes"
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
					"patching_rect" : [ 123.0, 542.0, 46.0, 15.0 ],
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
					"patching_rect" : [ 100.0, 521.0, 32.0, 15.0 ],
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
					"patching_rect" : [ 92.25, 389.0, 62.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 19.0, 49.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 22,
							"parameter_linknames" : 1,
							"parameter_longname" : "bank1_scale",
							"parameter_shortname" : "bank1_scale",
							"parameter_type" : 2,
							"parameter_enum" : [ "ionian", "dorian", "phrygian", "lydian", "mixolydian", "aeolian", "locrian" ],
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
					"patching_rect" : [ 108.0, 188.0, 64.0, 19.0 ],
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
					"patching_rect" : [ 108.0, 209.0, 1083.5, 19.0 ],
					"style" : "",
					"text" : "spray 8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 77.0, 681.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "pack 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 111.0, 638.0, 86.5, 19.0 ],
					"style" : "",
					"text" : "scale 0 7 32 120"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 77.0, 659.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "makenote"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 1 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-263", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 390.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 542.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"order" : 1,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 2 ],
					"source" : [ "obj-107", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 2 ],
					"source" : [ "obj-108", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 1 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 846.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 0,
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"order" : 1,
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-264", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"source" : [ "obj-114", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 1 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 1 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 1 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 1 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 1 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 1 ],
					"source" : [ "obj-128", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 2 ],
					"source" : [ "obj-129", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-13", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 0,
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"order" : 1,
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-265", 0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-135", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 1 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 1 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 1 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 1 ],
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 1 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 1 ],
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 1 ],
					"source" : [ "obj-149", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 2 ],
					"source" : [ "obj-150", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 0,
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"order" : 1,
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-266", 0 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-156", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 1 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 1 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-158", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 1 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 1 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 1 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 1 ],
					"source" : [ "obj-170", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 2 ],
					"source" : [ "obj-171", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"order" : 0,
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"order" : 1,
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-267", 0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"source" : [ "obj-177", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 1 ],
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 1 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 1 ],
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 1 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 1 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 1 ],
					"source" : [ "obj-191", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"source" : [ "obj-191", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 2 ],
					"source" : [ "obj-192", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-210", 0 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 0,
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"order" : 1,
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 0 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-204", 0 ],
					"source" : [ "obj-198", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 1 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-204", 1 ],
					"source" : [ "obj-203", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 1 ],
					"source" : [ "obj-207", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 1 ],
					"source" : [ "obj-209", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 1 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 1 ],
					"source" : [ "obj-212", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 2 ],
					"source" : [ "obj-213", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-231", 0 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"order" : 0,
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"order" : 1,
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-269", 0 ],
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-225", 0 ],
					"source" : [ "obj-219", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-222", 1 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-222", 0 ],
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-225", 1 ],
					"source" : [ "obj-224", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-225", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"source" : [ "obj-226", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 1 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-224", 0 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 1 ],
					"source" : [ "obj-230", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 1 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 1 ],
					"source" : [ "obj-233", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 0 ],
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 2 ],
					"source" : [ "obj-234", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"order" : 0,
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"order" : 1,
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 0 ],
					"source" : [ "obj-238", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-270", 0 ],
					"source" : [ "obj-239", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"source" : [ "obj-240", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-240", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-243", 1 ],
					"source" : [ "obj-242", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 0 ],
					"source" : [ "obj-243", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-243", 0 ],
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 1 ],
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-247", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-244", 0 ],
					"source" : [ "obj-247", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-242", 0 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-244", 1 ],
					"source" : [ "obj-249", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 0 ],
					"source" : [ "obj-250", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 1 ],
					"source" : [ "obj-251", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 1 ],
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 1 ],
					"source" : [ "obj-254", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-251", 0 ],
					"source" : [ "obj-254", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-263", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"source" : [ "obj-264", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-265", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-266", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"source" : [ "obj-267", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 0 ],
					"source" : [ "obj-269", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 0 ],
					"source" : [ "obj-270", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-34", 0 ]
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
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-42", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 1 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 1 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 1 ],
					"source" : [ "obj-5", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 1 ],
					"source" : [ "obj-5", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 1 ],
					"source" : [ "obj-5", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 1 ],
					"source" : [ "obj-5", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 1 ],
					"source" : [ "obj-5", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 1 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 1151.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 998.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 693.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 238.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 136.75, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 829.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 676.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 525.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 373.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 221.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 1134.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-73", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"midpoints" : [ 981.5, 877.0, 69.5, 877.0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-79", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"source" : [ "obj-85", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
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
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-91", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-98", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-99", 1 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-123" : [ "bank2_key", "bank2_key", 15 ],
			"obj-193" : [ "bank6_velocity", "bank6_velocity", 70 ],
			"obj-228" : [ "bank7_key", "bank7_key", 20 ],
			"obj-111" : [ "bank2_channel", "bank2_channel", 58 ],
			"obj-100" : [ "bank1_mode", "bank1_mode", 41 ],
			"obj-174" : [ "bank5_channel", "bank5_channel", 61 ],
			"obj-197" : [ "bank6_mode", "bank6_mode", 46 ],
			"obj-129" : [ "bank3_duration", "bank3_duration", 51 ],
			"obj-145" : [ "bank3_scale", "bank3_scale", 24 ],
			"obj-234" : [ "bank8_duration", "bank8_duration", 56 ],
			"obj-250" : [ "bank8_scale", "bank8_scale", 29 ],
			"obj-151" : [ "bank4_velocity", "bank4_velocity", 68 ],
			"obj-186" : [ "bank5_key", "bank5_key", 18 ],
			"obj-153" : [ "bank4_channel", "bank4_channel", 60 ],
			"obj-185" : [ "bank5_8ve", "bank5_8ve", 34 ],
			"obj-155" : [ "bank4_mode", "bank4_mode", 44 ],
			"obj-237" : [ "bank8_channel", "bank8_channel", 64 ],
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
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
