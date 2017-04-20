autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;

script._name = 'ROLI_skin';

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);

notifiers = require('notifiers');

var SHOW_STORAGE = false;
var DISPLAY_POLY = false;

var finder;
var mod;
var mod_finder;
var Mod = ModComponent.bind(script);

var unique = jsarguments[1];
var ctrlr_type = jsarguments[2];
var shifted = false;
var alted = false;
var cells = [];
var pads = [];
var KEYCOLORS = [];  //[0., 0., 0.], [1., 0., 0.], [0., 1., 0.], [0.,0., 1.], [1., 1., 0.], [0., 1., 1.], [1., 0., 1.], [1., 1., 1.]];
var current_edit = 1;
var current_pset = 1;
var assign_mode = false;
var follow_mode = false;
var mod_assign_mode = false;

var PALETTE = [];   //[0., 0., 0.], [1., 0., 0.], [0., 1., 0.], [0.,0., 1.], [1., 1., 0.], [0., 1., 1.], [1., 0., 1.], [1., 1., 1.]];

/*RGB_COLOR_TABLE = [0,1973790,8355711,16777215,16731212,16711680,5832704,1638400,16760172,16733184,5840128,2562816,16777036,16776960,5855488,1644800,8978252,5570304,1923328,1321728,5046092,65280,22784,6400,5046110,65305,22797,
					6402,5046152,6536,522813,7954,5046199,65433,22837,6418,5030911,43519,16722,4121,5015807,22015,7513,2073,5000447,255,89,25,8867071,5505279,1638500,983088,16731391,16711935,5832793,1638425,16731271,16711764,
					5832733,2228243,16717056,10040576,7950592,4416512,211200,22325,21631,255,17743,2425036,8355711,2105376,16711680,12451629,11529478,6618889,1084160,65415,43519,11007,4129023,7995647,11672189,4202752,16730624,
					8970502,7536405,65280,3931942,5898097,3735500,5999359,3232198,8880105,13835775,16711773,16744192,12169216,9502464,8609031,3746560,1330192,872504,1381674,1450074,6896668,11010058,14569789,14182940,16769318,
					10412335,6796559,1973808,14483307,8454077,10131967,9332479,4210752,7697781,14745599,10485760,3473408,1757184,475648,12169216,4141312,11755264,4920578];
*/

RGB_COLOR_TABLE = [[0, 0, 0],
 [1, 15865344, 2],
 [2, 16728114, 4],
 [3, 16541952, 6],
 [4, 9331486, 8],
 [5, 16440379, 10],
 [6, 16762134, 12],
 [7, 11992846, 14],
 [8, 7995160, 16],
 [9, 3457558, 18],
 [10, 5212676, 20],
 [11, 6487893, 22],
 [12, 2719059, 24],
 [13, 2843699, 26],
 [14, 3255807, 28],
 [15, 3564540, 30],
 [16, 1717503, 32],
 [17, 1391001, 34],
 [18, 1838310, 36],
 [19, 3749887, 38],
 [20, 5710591, 40],
 [21, 9907199, 42],
 [22, 8724856, 44],
 [23, 16715826, 46],
 [24, 11022396, 48],
 [25, 16722900, 50],
 [26, 15427065, 52],
 [27, 10892321, 54],
 [28, 10049064, 56],
 [29, 8873728, 58],
 [30, 9470495, 60],
 [31, 4884224, 62],
 [32, 32530, 64],
 [33, 1594290, 66],
 [34, 6441901, 68],
 [35, 7551591, 70],
 [36, 16301231, 72],
 [37, 16751478, 74],
 [38, 16760671, 76],
 [39, 14266225, 78],
 [40, 16774272, 80],
 [41, 12565097, 80],
 [42, 12373128, 81],
 [43, 11468697, 81],
 [44, 8183199, 82],
 [45, 9024637, 82],
 [46, 8451071, 83],
 [47, 8048380, 83],
 [48, 6857171, 84],
 [49, 8753090, 85],
 [50, 12298994, 85],
 [51, 13482980, 86],
 [52, 15698864, 86],
 [53, 8756620, 87],
 [54, 7042414, 87],
 [55, 8687771, 88],
 [56, 6975605, 88],
 [57, 8947101, 89],
 [58, 7105141, 90],
 [59, 10323356, 90],
 [60, 7629428, 91],
 [61, 10263941, 91],
 [62, 7632234, 92],
 [63, 10323076, 92],
 [64, 7694954, 93],
 [65, 6293504, 93],
 [66, 2032128, 94],
 [67, 6691092, 94],
 [68, 2164742, 95],
 [69, 6564352, 96],
 [70, 2100480, 96],
 [71, 4665615, 97],
 [72, 1839878, 97],
 [73, 6576151, 98],
 [74, 2104327, 98],
 [75, 6704648, 99],
 [76, 2169090, 99],
 [77, 4744709, 100],
 [78, 1515777, 101],
 [79, 3171849, 101],
 [80, 991491, 102],
 [81, 1330440, 102],
 [82, 399618, 103],
 [83, 2045697, 103],
 [84, 659712, 104],
 [85, 2582050, 104],
 [86, 794891, 105],
 [87, 1326633, 106],
 [88, 530704, 106],
 [89, 1389081, 107],
 [90, 529418, 107],
 [91, 1262950, 108],
 [92, 398881, 108],
 [93, 1386340, 109],
 [94, 461856, 109],
 [95, 660582, 110],
 [96, 198177, 110],
 [97, 662604, 111],
 [98, 264990, 112],
 [99, 722012, 112],
 [100, 196893, 113],
 [101, 1447526, 113],
 [102, 460577, 114],
 [103, 2231654, 114],
 [104, 721953, 115],
 [105, 3936614, 115],
 [106, 1246497, 116],
 [107, 3476784, 117],
 [108, 1115151, 117],
 [109, 6686228, 118],
 [110, 2163206, 118],
 [111, 4395800, 119],
 [112, 1377799, 119],
 [113, 6689108, 120],
 [114, 2163995, 120],
 [115, 6170723, 121],
 [116, 1969440, 122],
 [117, 0, 122],
 [118, 5855577, 123],
 [119, 1710618, 123],
 [120, 16777215, 124],
 [121, 5855577, 124],
 [122, 13421772, 125],
 [123, 4210752, 125],
 [124, 1315860, 126],
 [125, 255, 126],
 [126, 65280, 127],
 [127, 16711680, 127]];

for(var i in RGB_COLOR_TABLE)
{
	PALETTE[i] = make_rgb(RGB_COLOR_TABLE[i]);
}

function make_rgb(raw)
{
	
	//debug('raw:', raw);
	var r = (raw[1] >> 16)/255;
	var g = (raw[1] >> 8 & 255)/255;
	var b = (raw[1] & 255)/255;
	var a = raw[2]/127;
	debug('rgb:', r, g, b, a);
	return [r, g, b, a];
}

debug('pallete is:', PALETTE);

var this_device_id = -1;
var current_device;

var Vars = ['assignments', 'matrix', 'push_notes', 'storage', 'poly', 'note', 'mod_A', 'mod_B', 'mod_C', 'selected', 'Mask', 'color', 'midiInputGate', 'info_pcontrol', 'info_patcher'];

var PolyVars = ['note_id', 'modA_id', 'modB_id', 'modC_id', 'note_gate', 'modA_gate', 'modB_gate', 'modC_gate', 'color', 'mask', 'modifier_assignments'];

var glob = new Global('skin_global');
if(!glob.instances)
{
	glob.instances = [];
}
var found = false;
for(var i in glob.instances)
{
	if(glob.instances[i]==this)
	{
		found = true;
	}
}
if(!found){glob.instances.push(this);}


CellClass = function(x, y, identifier, name, _send, args)
{
	this.add_bound_properties(this, ['_num', 'group', '_push_note', 'update_color']);
	this._num = (x + (y*8));
	this._x_off = (x*.2);
	this._y_off = (y*.2);
	this.group = 0;
	this._push_note = (Math.abs(y-4)*5)+(x+36);
	CellClass.super_.call(this, identifier, name, _send, args);
}

inherits(CellClass, ButtonClass);

CellClass.prototype.update_color = function()
{
	this.send(this.group);
	//outlet(1, 'rectangle', this._x_off, this._y_off, '0.2 0.2, setcolor', 0.9 0.9 0.7, '1, fill, repaint');
}

//CellClass.prototype.Send = function(



function Pad(num, patcher)
{
	var self = this;
	this._patcher = patcher;
	for(var i in Vars)
	{
		this['_'+PolyVars[i]] = this._patcher.getnamed(PolyVars[i]);
	}
	this._mod_assigns = [];
	this.update_mod_assignments();
}

Pad.prototype.update_mod_assignments = function()
{
	this._mod_assigns = [];
	var assgn = this._modifier_assignments.getvalueof()
	while(assgn.length)
	{
		var x = assgn.shift();
		var y = assgn.shift();
		this._mod_assigns.push(assgn.shift());
	}
}



function init()
{
	debug('init Roli_skin!');
	//mod = new Mod(script, 'hex', unique, false);
	//mod.debug = debug;
	//mod_finder = new LiveAPI(mod_callback, 'this_device');
	//mod.assign_api(mod_finder);
	//alive(1);
	initialize();
}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//debug('mod callback:', args);
		if(args[1] in script)
		{
			script[args[1]].apply(script, args.slice(2));
		}
		if(args[1]=='disconnect')
		{
			mod.restart.schedule(3000);
		}
	}
}

function alive(val)
{
	initialize(val);
}

function initialize()
{
	debug('skin init.');
	setup_translations();
	setup_colors();
	setup_patchers();
	setup_controls();
	//init_device();
	deprivatize_script_functions(this);

	if(SHOW_STORAGE)
	{
		storage.message('clientwindow');
		storage.message('storagewindow');
	}

	set_input_gate(0);
	Grid.set_target(_ggrid);
	Keys.set_target(_kkey);
	get_assignment_grid();
	update_assignment_grid();
	update_grid();
	update_keys();
}

function setup_translations(){}

function setup_colors(){}

function setup_patchers()
{
	for(var i in Vars)
	{
		script[Vars[i]] = this.patcher.getnamed(Vars[i]);
	}
	pads = [];
	for(var i = 0;i < 64;i++)
	{
		pads[i] = new Pad(i+1, this.patcher.getnamed('poly').subpatcher(i));
	}
	for(var i=0;i<64;i++)
	{
		KEYCOLORS[i] = pads[i]._color.getvalueof();
	}
}
	
function setup_controls()
{
	script['GridControlRegistry'] = new ControlRegistry('GridRegistry');
	script['KeysControlRegistry'] = new ControlRegistry('KeysRegistry');
	script['cells'] = [];
	script['KeyButtons'] = [];
	script['Grid'] = new GridClass(8, 8, 'Grid');
	script['Keys'] = new GridClass(8, 1, 'Keys');
	for(var x=0;x<8;x++)
	{
		cells[x] = [];
		for(var y=0;y<8;y++)
		{
			var id = x+(y*8);
			cells[x][y] = new CellClass(x, y, id, 'Cell_'+id, make_send_func(x, y));
			GridControlRegistry.register_control(id, cells[x][y]);
			Grid.add_control(x, y, cells[x][y]);
		}
	}
	for(var id=0;id<8;id++)
	{
		KeyButtons[id] = new ButtonClass(id, 'Key_'+id, make_send_func(id));
		KeysControlRegistry.register_control(id, KeyButtons[id]);
		Keys.add_control(id, 0, KeyButtons[id]);
	}
}

function make_send_func()
{
	var args = arrayfromargs(arguments);
	if(args.length == 2)
	{
		var func = function(value)
		{
			if(value!=undefined)
			{
				if(value<0){value=0;}
				//debug('big value:', args, value);
				//debug('args:', args, args instanceof Array);
				//mod.Send(args[0], args[1], args[2], args[3], value);
				var sendColors = PALETTE[value];
				outlet(1, "rectangle", args[0]*.2, args[1]*.2, .2, .2);
				outlet(1, "setcolor", sendColors[0], sendColors[1], sendColors[2], sendColors[3]);
				debug("setcolor", sendColors[0], sendColors[1], sendColors[2], sendColors[3]);
				//outlet(1, "setcolor", KEYCOLORS[value], "1.");
				outlet(1, "fill");
				outlet(1, "append");
			}
		}
	}
	else
	{
		var func = function(value)
		{
			if(value!=undefined)
			{
				if(value<0){value=0;}
				//debug('little value:', args, value);
				//outlet(1, 'rectangle', (args[0]*.2), '1.6 0.2 0.2, setcolor', KEYCOLORS[value], '1, fill, repaint');
				//var colors = KEYCOLORS[value];
				var sendColors = PALETTE[value];
				outlet(1, "rectangle", args[0]*.2, 1.6, .2, .2);
				outlet(1, "setcolor", sendColors[0], sendColors[1], sendColors[2], sendColors[3]);
				outlet(1, "fill");
				outlet(1, "append");
			}
		}
	}
	return func;
}

function make_gui_send_function(patcher_object, message_header)
{
	if(message_header.length == 2)
	{
		var func = function(value)
		{
			//value = value==undefined ? 0 : value;
			//var message = message_header.push(value);
			//debug('sending gui button:', 'header is:', message_header, 'value is:', value, 'message is:', [message_header[0], message_header[1], value]);
			//#message = message_header.concat([value]);
			patcher_object.message.apply(patcher_object, [message_header[0], message_header[1], value]);
		}
	}
	return func;
}



function anything()
{
	//post('anything', arrayfromargs(messagename, arguments));
}

function _grid(x, y, val){GridControlRegistry.receive(x+(y*8), val);}

function _ggrid(obj)
{
	var x = obj._x(Grid);
	var y = obj._y(Grid);
	var val = obj._value;
	//debug('grid', x, y, val);
	if(mod_assign_mode)
	{
		if(val>0)
		{
			//pad[current_edit-1].update_mod_assignments();
			var pos = (x+(y*8));
			var old_val = pads[current_edit-1]._mod_assigns[pos];
			pads[current_edit-1]._modifier_assignments.message(pos, 0, (old_val+1)%4);
			for(var i in glob.instances)
			{
				if(glob.instances[i]!=this)
				{
					//glob.instances[i]._kkey(obj);
					glob.instances[i].pads[current_edit-1]._modifier_assignments.message(pos, 0, (old_val+1)%4);
				}
			}
			update_grid();
		}
	}
	else if(assign_mode)
	{
		if((val>0))
		{
			assignments.message(x, y, current_edit);
			if(cells[x][y].group!=current_edit)
			{
				_cell = cells[x][y];
				_cell.group = current_edit;
				//debug('assignment for:', x, y, 'is', current_edit);
				push_notes.message(_cell._push_note, current_edit);
				//mod.Send( 'grid', 'value', x, y, KEYCOLORS[current_edit-1]);
				cells[x][y].send(KEYCOLORS[current_edit-1]);
			}
		}
	}
	else if(alted||follow_mode)
	{
		if(val>0)
		{
			if(cells[x][y].group!=current_edit)
			{
				select_voice(cells[x][y].group);
			}
		}
	}
}

function _key(num, val){KeysControlRegistry.receive(num, val);}

function _kkey(obj)
{
	var num = obj._id;
	var val = obj._value;
	//debug('_kkey', num, val, '\n');
	if(val > 0)
	{
		switch(num)
		{
			case 0:
				var old_val = pads[current_edit-1]._note_gate.getvalueof();
				var new_val= Math.abs(old_val-1);
				pads[current_edit-1]._note_gate.message(new_val);
				storage.setstoredvalue('poly.'+(current_edit)+'::note_gate', current_pset, new_val);
				break;
			case 1:
				var old_val = pads[current_edit-1]._modA_gate.getvalueof();
				var new_val= Math.abs(old_val-1);
				pads[current_edit-1]._modA_gate.message(new_val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modA_gate', current_pset, new_val);
				break;
			case 2:
				var old_val = pads[current_edit-1]._modB_gate.getvalueof();
				var new_val= Math.abs(old_val-1);
				pads[current_edit-1]._modB_gate.message(new_val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modB_gate', current_pset, new_val);
				break;
			case 3:
				var old_val = pads[current_edit-1]._modC_gate.getvalueof();
				var new_val= Math.abs(old_val-1);
				pads[current_edit-1]._modC_gate.message(new_val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modC_gate', current_pset, new_val);
				break;
			case 4:
				toggle_mod_assign();
				break;
			case 5:
				toggle_mod_assign();
				break;
			case 6:
				toggle_follow();
				break;
			case 7:
				toggle_assign();
				break;
		}
		update_keys();
	}
}

function _blockNote(note, val)
{
	var args = arrayfromargs(arguments);
	debug('BlockNote', (note-36)%5, Math.abs(Math.floor((note-36)/5)-4), val);
	//var x = (note-36)%8, y = (note-36)/8;
	_grid((note-36)%5, Math.abs(Math.floor((note-36)/5)-4), val);
}

function _blockMode(val)
{
	if(val)
	{
		toggle_assign();
	}
}

function shift(val)
{
	//debug('shift', val);
	shifted = val>0;
}

function alt(val)
{
	//debug('alt', val);
	alted = val>0;
}

function active_handlers()
{
	var args = arrayfromargs(arguments);
	debug('active_handlers:', args);
	var controlling = false;
	for(var i in args)
	{
		if((args[i]=='AumPush2ModHandler')||(args[i]=='DefaultModHandler'))
		{
			controlling = true;
		}
	}
	set_input_gate(controlling);
}



function update_grid()
{
	if(mod_assign_mode)
	{
		//var modArray = get_mod_assignments();
		pads[current_edit-1].update_mod_assignments();
		for(var i=0;i<5;i++)
		{
			for(var j=0;j<5;j++)
			{
				//mod.Send( 'grid', 'value', i, j, pads[current_edit-1]._mod_assigns[i+(j*8)]);
				cells[i][j].send(pads[current_edit-1]._mod_assigns[i+(j*8)]);
			}
		}
	}
	else
	{
		for(var i=0;i<5;i++)
		{
			for(var j=0;j<5;j++)
			{
				//mod.Send( 'grid', 'value', i, j, KEYCOLORS[cells[i][j].group-1]);
				cells[i][j].send(KEYCOLORS[cells[i][j].group-1]);
			}
		}
	}
}

function update_keys()
{
	/*
	mod.Send('key', 'value', 0, pads[current_edit-1]._note_gate.getvalueof());
	mod.Send('key', 'value', 1, pads[current_edit-1]._modA_gate.getvalueof());
	mod.Send('key', 'value', 2, pads[current_edit-1]._modB_gate.getvalueof());
	mod.Send('key', 'value', 3, pads[current_edit-1]._modC_gate.getvalueof());
	mod.Send('key', 'value', 5, mod_assign_mode?3:0);
	mod.Send('key', 'value', 6, follow_mode?2:0);
	mod.Send('key', 'value', 7, assign_mode?5:6);
	*/
	/*for(var i=0;i<8;i++)
	{
		mod.Send('key', 'value', i, parseInt((current_edit == i)*KEYS[i]));
	}*/
}

function select_voice(num)
{
	if(num != current_edit)
	{
		if(DISPLAY_POLY){poly.message('wclose');}
		current_edit = num;
		selected.message('set', num);
	}
	//post('current_edit', current_edit, '\n');

	if(DISPLAY_POLY){poly.message('open', num);}
	debug('value is:', pads[num]._note_id.getvalueof());
	note.message('set', pads[num-1]._note_id.getvalueof());
	mod_A.message('set', pads[num-1]._modA_id.getvalueof());
	mod_B.message('set', pads[num-1]._modB_id.getvalueof());
	mod_C.message('set', pads[num-1]._modC_id.getvalueof());
	color.message('set', pads[num-1]._color.getvalueof());
	Mask.message('set', pads[num-1]._mask.getvalueof());
	update_keys();
	if(mod_assign_mode)
	{
		refresh_grid();
	}
}

function toggle_mod_assign()
{
	set_mod_assign(Math.abs(mod_assign_mode-1));
}

function set_mod_assign(val)
{
	mod_assign_mode = val>0;
	set_input_gate(mod_assign_mode?0:1);
	update_grid();
	update_keys();
}


function toggle_follow()
{
	follow(Math.abs(follow_mode-1));
}

function follow(val)
{
	follow_mode = val>0;
}


function toggle_assign()
{
	assign(Math.abs(assign_mode-1));
}

function assign(val)
{
	assign_mode = val>0;
	set_input_gate(assign_mode?0:1);
}


function get_mod_assignments()
{
	
	var assgn = pads[current_edit-1]._modifier_assignments.getvalueof()
	//debug('assgn:', assgn, '\n');
	var modArray = [];
	while(assgn.length)
	{
		var x = assgn.shift();
		var y = assgn.shift();
		modArray.push(assgn.shift());
	}
	return modArray();
}

function get_assignment_grid()
{
	var assgn = assignments.getvalueof()
	//debug('assgn:', assgn, '\n');
	while(assgn.length)
	{
		cells[assgn.shift()][assgn.shift()].group = assgn.shift();
	}
	//post_assignments();
}

function update_assignment_grid()
{
	if((!shifted)&&(!alted))
	{
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				var _cell = cells[i][j];
				push_notes.message(_cell._push_note, _cell.group);
				update_grid();
			}
		}
	}
	//post_assignments();
}

function post_assignments()
{
	debug('assigns:')
	{
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				debug(i, j, cells[i][j].group, '\n');
			}
		}
	}
}


function set_input_gate(val)
{
	debug('set_input_gate', val);
	midiInputGate.message('int',  val);
}

function _mod_assign(num, val)
{
	debug('mod_assign', num, val);
	if(current_edit)
	{
		switch(num)
		{
			case 0:
				pads[current_edit-1]._note_id.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::note_id', current_pset, val);
				break;
			case 1:
				pads[current_edit-1]._modA_id.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modA_id', current_pset, val);
				break;
			case 2:
				pads[current_edit-1]._modB_id.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modB_id', current_pset, val);
				break;
			case 3:
				pads[current_edit-1]._modC_id.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::modC_id', current_pset, val);
				break;
			case 4:
				debug('Mask', val);
				pads[current_edit-1]._mask.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::mask', current_pset, val);
				break;
			case 5:
				debug('selected:', val);
				select_voice(val);
				break;
			case 6:
				debug('color:', val);
				KEYCOLORS[current_edit-1] = val;
				pads[current_edit-1]._color.message(val);
				storage.setstoredvalue('poly.'+(current_edit)+'::color', current_pset, val);
				update_grid();
				break;
		}
	}
}


INFO = "SKIN\n\n";
SETUP_INFO = "Add this device to a MIDI Track, place a DrumRack after it.  Set the input port (top menu in device) to Push's Live port.\n";
OVERVIEW_INFO = "64 Pads may be divided into 64 different zones.\n\n\n"+
			"Each zone has its own output note, in addition to three alternate output notes that may be triggered when different zone assigned to modify it is held down.\n\n"+
			"A zone has several editable parameters:\n\n"+
			"Color: the displayed color of the zone.\n"+ 
			"Note: the note that is output when the zone is played.\n"+ 
			"Mod_A - Mod_C:  the alternate note that is output when another zone is set to trigger a modified output on selected zone.\n"+
			"Mask Time: adjust to prevent double-triggering of notes within the zone.\n";
KEY_INFO = "To select a zone for editing, change the first parameter knob to the target zone.\n"+
			"To assign a grid cell to the zone, press the KEY 8 to toggle ASSIGN mode (ASSIGN mode = RED, PLAY mode = GREEN).\n"+
			"Toggle FOLLOW mode with KEY 7.  This will automatically select the zone for editing whenever a zone is triggered.\n"+
			"Toggle MODIFIER assign mode with KEY 6.\n"+
			"In MODIFIER assign mode, each cell corresponds to one of the 64 zones.  Pressing a cell cycles through four possible states for each target zone:  Off, Mod_A, Mod_B, Mod_C. \n"+
			"If any MOD source is assigned to a target zone and that zone is struck while the selected zone is being held, the target zone will trigger the corresponding MOD note instead of its original assigned note ID.\n"+
			"\n"+
			"The first four KEYS toggle output of NOTE, MOD_A, MOD_B, and MOD_C.  Make sure that MOD assignments are turned on here, or MOD targets will not trigger any note when struck.\n";

function info()
{
	debug('info...');
	info_pcontrol.message('open');
	info_patcher.subpatcher().getnamed('info_text').message('set', [INFO, SETUP_INFO, OVERVIEW_INFO, KEY_INFO]);
}


/*
function SkinModule()
{
	var self = this;
	//this.add_bound_properties(this, ['update', 'assign_grid', 'assign_keys', '_grid']);
	this._grid = undefined;
	SkinModule.super_.call(this, 'SkinModule');
}

inherits(SkinModule, Bindable);

SkinModule.prototype.update = function()
{
}

SkinModule.prototype.assign_grid = function(grid)
{
	this._grid = grid;
}


function init_device()
{
	mod.Send('receive_device', 'set_mod_device_type', 'Hex');
	mod.Send( 'receive_device', 'set_number_params', 16);
	for(var dev_type in HEX_BANKS)
	{
		for(var bank_num in HEX_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, HEX_BANKS[dev_type][bank_num]);
		}
		//mod.Send('receive_device_proxy', 'update_parameters');
	}
	//debug('current parameters:', mod.Send('receive_device_proxy', 'current_parameters'));
	mod.Send('code_encoders_to_device', 'value', 1);
	mod.Send('create_alt_device_proxy', '_codec_device_proxy');
	for(var dev_type in CODEC_HEX_BANKS)
	{
		for(var bank_num in CODEC_HEX_BANKS[dev_type])
		{
			mod.SendDirect('receive_alt_device_proxy', '_codec_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, CODEC_HEX_BANKS[dev_type][bank_num]);
		}
	}
	mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'set_number_params', 32);
	mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'set_mod_device_bank', 0);
	mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'fill_parameters_from_device');
	mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'set_params_report_change', 0);
	mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'set_params_control_prefix', 'CodecEncoder');
	//mod.Send( 'receive_alt_device_proxy', '_codec_device_proxy', 'set_mod_device', 'id', );
	//debug('parameters from client property:', mod.finder.get('parameters'));
	finder = new LiveAPI(callback, 'this_device');
	pns['device_name']=this.patcher.getnamed('device_name');
	for(var i=0;i<12;i++)
	{
		pns[Encoders[i]]=this.patcher.getnamed('pn'+(i+1));
		pns[Encoders[i]].message('text', ' ');
		mps[Encoders[i]]=this.patcher.getnamed('mp'+(i+1));
		mps[Encoders[i]].message('text', ' ');
		params[Encoders[i]]=this.patcher.getnamed(Encoders[i]);
		params[Encoders[i]].message('set', 0);
	}
	for(var i=0;i<8;i++)
	{
		params[Speeds[i]] = this.patcher.getnamed(Speeds[i]);
		params[Speeds[i+8]] = this.patcher.getnamed(Speeds[i+8]);
	}
	for(var i=0;i<9;i++)
	{
		params[Dials[i]]=this.patcher.getnamed(Dial_Mappings[i]);
		params[Dials[i]].message('set', 0);
	}
	detect_drumrack();
}
*/


forceload(this);


