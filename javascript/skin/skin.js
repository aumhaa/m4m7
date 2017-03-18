autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var SHOW_STORAGE = false;
var DISPLAY_POLY = false;

var finder;
var mod;
var mod_finder;
var Mod = ModComponent.bind(script);

var unique = jsarguments[1];
var shifted = false;
var alted = false;
var cells = [];
var pads = [];
var KEYS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
var NOTES = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
var KEYCOLORS = [];
var current_edit = 1;
var current_pset = 1;
var assign_mode = false;
var follow_mode = false;
var mod_assign_mode = false;

var this_device_id = -1;
var current_device;

var Vars = ['assignments', 'matrix', 'push_notes', 'storage', 'poly', 'note', 'mod_A', 'mod_B', 'mod_C', 'selected', 'Mask', 'color', 'midiInputGate'];

var PolyVars = ['note_id', 'modA_id', 'modB_id', 'modC_id', 'note_gate', 'modA_gate', 'modB_gate', 'modC_gate', 'color', 'mask', 'modifier_assignments'];
function Cell(x, y)
{
	var self = this;
	this._x = x;
	this._y = y;
	this._num = (x + (y*8));
	this.group = 0;
	this._push_note = (Math.abs(y-7)*8)+(x+36);
}

Cell.prototype.update_color = function()
{
	mod.Send( 'grid', 'value', this._x, this._y, KEYCOLORS[this.group]);
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
	//var this_device = new LiveAPI(callback, 'this_device');
	//var current_device = new LiveAPI(current_device_callback, 'live_set');
	//this_device_id = this_device.id;
	//debug('this_device_id:', this_device_id);
	//current_device.property = 'appointed_device';

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
	for(var i=0;i<8;i++)
	{
		//mod.Send('base_fader', 'value', i, 1);
		cells[i]=[];
		for(var j=0;j<8;j++)
		{
			cells[i][j] = new Cell(i, j);
		}
	}
	get_assignment_grid();
	update_assignment_grid();
	set_input_gate(0);
	if(SHOW_STORAGE)
	{
		storage.message('clientwindow');
		storage.message('storagewindow');
	}
	deprivatize_script_functions(script);
	update_grid();
	update_keys();
}

function callback(){}

function current_device_callback(args)
{
	//var args = arrayfromargs(messagename, arguments);
	debug('current_device_callback', args);
	/*if(args[0] == 'id')
	{
		midiInputGate.message('int', Math.floor(args[1]==this_device_id));
	}*/
}

function anything()
{
	//post('anything', arrayfromargs(messagename, arguments));
}

function key(num, val)
{
	debug('key', num, val, '\n');
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

function update_keys()
{
	mod.Send('key', 'value', 0, pads[current_edit-1]._note_gate.getvalueof());
	mod.Send('key', 'value', 1, pads[current_edit-1]._modA_gate.getvalueof());
	mod.Send('key', 'value', 2, pads[current_edit-1]._modB_gate.getvalueof());
	mod.Send('key', 'value', 3, pads[current_edit-1]._modC_gate.getvalueof());
	mod.Send('key', 'value', 5, mod_assign_mode?3:0);
	mod.Send('key', 'value', 6, follow_mode?2:0);
	mod.Send('key', 'value', 7, assign_mode?6:5);
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
}

function shift(val)
{
	debug('shift', val);
	shifted = val>0;
	//update_assignment_grid();
	//set_input_gate(shifted);
}

function alt(val)
{
	debug('alt', val);
	alted = val>0;
	//update_assignment_grid();
	//set_input_gate(alted);
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

function push_grid(x, y, val)
{
	debug('push_grid', x, y, val);
	base_grid(x, y, val);
}

function base_grid(x, y, val)
{
	debug('base_grid', x, y, val);
	grid(x, y, val);
}

function grid(x, y, val)
{
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
				mod.Send( 'grid', 'value', x, y, KEYCOLORS[current_edit-1]);
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

function update_grid()
{
	if(mod_assign_mode)
	{
		//var modArray = get_mod_assignments();
		pads[current_edit-1].update_mod_assignments();
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				mod.Send( 'grid', 'value', i, j, pads[current_edit-1]._mod_assigns[i+(j*8)]);
			}
		}
	}
	else
	{
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				mod.Send( 'grid', 'value', i, j, KEYCOLORS[cells[i][j].group-1]);
			}
		}
	}
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

function active_handlers()
{
	var args = arrayfromargs(arguments);
	debug('active_handlers:', args);
	var controlling = false;
	for(var i in args)
	{
		if(args[i]=='AumPush2ModHandler')
		{
			controlling = true;
		}
	}
	set_input_gate(controlling);
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


/*
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


