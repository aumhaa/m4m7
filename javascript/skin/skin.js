autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;

script._name = 'skin';

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');

var SHOW_STORAGE = false;
var DISPLAY_POLY = false;

var finder;
var mod;
var mod_finder;
var Mod = ModComponent.bind(script);

var unique = jsarguments[1];
var ctrlr_type = jsarguments[2];
var topDict = new Dict('topology');
var topKeys = [];
var topology = {};
var shifted = false;
var alted = false;
var cells = [];
var pads = [];
var KEYCOLORS = [];
var PALETTE = ROLI.PALETTE;
var current_edit = 1;
var current_pset = 1;
var assign_mode = false;
var follow_mode = false;
var mod_assign_mode = false;
var blocks_page_visible = false;

var this_device_id = -1;
var current_device;

var Vars = ['assignments', 'matrix', 'push_notes', 'storage', 'poly', 'note', 'mod_A', 'mod_B', 'mod_C', 'selected', 'Mask', 'color', 'midiInputGate', 'info_pcontrol', 'info_patcher', 'blocks_pad', 'blocks_patcher', 'blocks_pcontrol'];

var PolyVars = ['note_id', 'modA_id', 'modB_id', 'modC_id', 'note_gate', 'modA_gate', 'modB_gate', 'modC_gate', 'color', 'mask', 'modifier_assignments'];


CellClass = function(x, y, identifier, name, _send, args)
{
	this.add_bound_properties(this, ['_num', 'group', '_push_note', 'update_color']);
	this._num = (x + (y*8));
	this.group = 0;
	this._push_note = (Math.abs(y-7)*8)+(x+36);
	CellClass.super_.call(this, identifier, name, _send, args);
}

inherits(CellClass, ButtonClass);

CellClass.prototype.update_color = function()
{
	this.send(KEYCOLORS[this.group]);
}



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


function anything(){}

function init()
{
	mod = new Mod(script, 'hex', unique, false);
	//mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);
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
	outlet(1, 'clear');
	outlet(1, 'repaint');
	setup_tasks();
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
	blocks_patcher_lock();
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
	tasks.addTask(_update_topology, [], 4);
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
			cells[x][y] = new CellClass(x, y, id, 'Cell_'+id, make_send_func('grid', 'value', x, y));
			GridControlRegistry.register_control(id, cells[x][y]);
			Grid.add_control(x, y, cells[x][y]);
		}
	}
	for(var id=0;id<8;id++)
	{
		KeyButtons[id] = new ButtonClass(id, 'Key_'+id, make_send_func('key', 'value', id));
		KeysControlRegistry.register_control(id, KeyButtons[id]);
		Keys.add_control(id, 0, KeyButtons[id]);
	}
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 300);
}

function make_send_func()
{
	var args = arrayfromargs(arguments);
	var pos_fix = [0, .13333, .26666, .4, .5, .63333, .76666, .9];
	if(args.length == 4)
	{
		var func = function(value)
		{
			mod.Send(args[0], args[1], args[2], args[3], value);
			var COLOR = PALETTE[value<0?0:value];
			outlet(1, "rectangle", pos_fix[args[2]], pos_fix[args[3]], .1, .1);
			outlet(1, "setcolor", 0, 0, 0, 1);
			outlet(1, "setcolor", COLOR[0], COLOR[1], COLOR[2], COLOR[3]);
			outlet(1, "fill");
			outlet(1, "append");
		}
	}
	else
	{
		var func = function(value)
		{
			debug('value:', args, value);
			mod.Send(args[0], args[1], args[2], value);
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

function _update_topology()
{
	debug('update_topology');
	topology = dict_to_jsobj(topDict);
	if(blocks_patcher)
	{
		var a = blocks_patcher.subpatcher().getnamed('block1_scene').getvalueof();
		var b = blocks_patcher.subpatcher().getnamed('block2_scene').getvalueof();
		var c = blocks_patcher.subpatcher().getnamed('block3_scene').getvalueof();
		var d = blocks_patcher.subpatcher().getnamed('block4_scene').getvalueof();
		blocks_patcher.subpatcher().getnamed('blocks_pad').message('scene', a, 1, b, 2, c, 3, d, 4);
		debug('sending scene:', a, 1, b, 2, c, 3, d, 4);
	}
	else
	{
		tasks.addTask(_update_topology, [], 4);
	}
}


function dict_to_jsobj(dict) {
	if (dict == null) return null;
	var o = new Object();
	var keys = dict.getkeys();
	if (keys == null || keys.length == 0) return null;
	if (keys instanceof Array) {
		for (var i = 0; i < keys.length; i++)
		{
			var value = dict.get(keys[i]);
			
			if (value && value instanceof Dict) {
				value = dict_to_jsobj(value);
			}
			o[keys[i]] = value;
		}		
	} else {
		var value = dict.get(keys);
		
		if (value && value instanceof Dict) {
			value = dict_to_jsobj(value);
		}
		o[keys] = value;
	}
	return o;
}

function anything()
{
	//post('anything', arrayfromargs(messagename, arguments));
}

function _blockNote(note, val)
{
	var args = arrayfromargs(arguments);
	//debug('BlockNote', (note-36)%8, Math.abs(Math.floor((note-36)/8)-7), val);
	//var x = (note-36)%8, y = (note-36)/8;
	_grid((note-36)%8, Math.abs(Math.floor((note-36)/8)-7), val);
}

function _blockMode(val)
{
	if(val)
	{
		if(blocks_page_visible)
		{
			blocks_pcontrol.message('close');
			blocks_page_visible = false;
			//blocks_patcher.wclose();
		}
		else
		{
			blocks_pcontrol.message('open');
			blocks_page_visible = true;
			//blocks_patcher.open();
		}
	}
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
				//cells[x][y].send(KEYCOLORS[current_edit-1]);
				update_grid();
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
	debug('_kkey', num, val, '\n');
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
	/*for(var i in glob.instances)
	{
		//debug('name:', glob.instances[i]._name);
		if(glob.instances[i]!=script)
		{
			//debug('not this:', script._name);
			glob.instances[i]._kkey(obj);
		}
	}*/
}

function shift(val)
{
	//debug('shift', val);
	shifted = val>0;
	/*for(var i in glob.instances)
	{
		if(glob.instances[i]!=script)
		{
			glob.instances[i].shift(val);
		}
	}*/
}

function alt(val)
{
	//debug('alt', val);
	alted = val>0;
	/*for(var i in glob.instances)
	{
		if(glob.instances[i]!=script)
		{
			glob.instances[i].alt(val);
		}
	}*/
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
		outlet(1, 'clear');
		outlet(1, 'repaint');
		pads[current_edit-1].update_mod_assignments();
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				cells[i][j].send(pads[current_edit-1]._mod_assigns[i+(j*8)]);
			}
		}
	}
	else
	{
		outlet(1, 'clear');
		outlet(1, 'repaint');
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				cells[i][j].send(KEYCOLORS[cells[i][j].group-1]);
			}
		}
	}
}

function update_keys()
{
	mod.Send('key', 'value', 0, pads[current_edit-1]._note_gate.getvalueof());
	mod.Send('key', 'value', 1, pads[current_edit-1]._modA_gate.getvalueof());
	mod.Send('key', 'value', 2, pads[current_edit-1]._modB_gate.getvalueof());
	mod.Send('key', 'value', 3, pads[current_edit-1]._modC_gate.getvalueof());
	mod.Send('key', 'value', 5, mod_assign_mode?3:0);
	mod.Send('key', 'value', 6, follow_mode?2:0);
	mod.Send('key', 'value', 7, assign_mode?5:6);
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
		//debug('this is fucking line 450');
		if(selected){selected.message('set', num);}
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
	/*for(var i in glob.instances)
	{
		if(glob.instances[i]!=script)
		{
			glob.instances[i].select_voice(num);
		}
	}*/
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


function blocks_patcher_unlock()
{
	blocks_patcher.window('size', 0, 400, 1190, 800);
	blocks_patcher.window('flags', 'minimize');
	blocks_patcher.window('flags', 'zoom');
	blocks_patcher.window('flags', 'close');
	blocks_patcher.window('flags', 'grow');
	blocks_patcher.window('flags', 'title');
	blocks_patcher.window('flags', 'nofloat');
	blocks_patcher.window('exec');
}

function blocks_patcher_lock()
{
	blocks_patcher.window('size', 80, 80, 375, 400);
	blocks_patcher.window('flags', 'nominimize');
	//blocks_patcher.window('flags', 'nozoom');
	blocks_patcher.window('flags', 'noclose');
	blocks_patcher.window('flags', 'nogrow');
	//blocks_patcher.window('flags', 'notitle');
	blocks_patcher.window('flags', 'float');
	blocks_patcher.window('exec');
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


