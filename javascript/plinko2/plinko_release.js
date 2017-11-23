autowatch = 1;

outlets = 2;
inlets = 1;

var script = this;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');

var SHOW_STORAGE = false;
var VIEW_DICT = false;
var INITIAL_DIR = 64;
var PRS_DLY = 300;
var REBUILD_DATA = true;

var finder;
var mod;
var found_mod;
var mod_finder;
var Mod = ModComponent.bind(script);
var ModProxy = ModProxyComponent.bind(script);

var PALETTE = ROLI.PALETTE;

var unique = jsarguments[1];
var Alive=false;
var node = [];
var part = [];
var coordMath = [-17, -16, -15, -1, 1, 15, 16, 17];
var activeNodes = [];
var activeParticles = [];
var displayedParticles = [];
var shifted = false;
var alted = false;
var trigger_mode = false;
var preset = 1;
var slotlist = [];
var channel = 0;
var offsets = [0, 0];
var speed = [0, 0, 0, 0];
var display;
var node;
//var dict = new Dict('plinko_data');
var pads = [];
var miraPads = [];
var miraKeys = [];
var miraShift, miraAlt;
var viewer_matrix;

var colors = {NODE_SELECTED:1, NODE_START: 16, NODE_ON_WH: 3, NODE_ON: 6, NODE_WH: 7, NODE_NOTE: 2, 
				DIRECTION_OFF:3, DIRECTION_ON:7, WORMHOLE_START:1, WORMHOLE_END:7, NODE_WORMHOLE:7,
	 			PARTICLE_OFF:1, PARTICLE_ON:5, VOICE_FADER:1, NOTE_FADER:2, PLANE_FADER:3,
				OFF:0, WHITE:1, YELLOW:2, CYAN:3, MAGENTA:4, RED:5, GREEN:6, BLUE:7};

var bgcolors = {'OFF': [0, 0, 0, 0], 'WHITE':[1, 1, 1, 1], 'YELLOW':[1, 1, 0, 1], 'CYAN':[0, 1, 1, 1],
				'MAGENTA':[1, 0, 1, 1], 'RED':[1, 0, 0, 1], 'GREEN':[0, 1, 0, 1], 'BLUE':[0, 0, 1, 1],
				'INVISIBLE':[0, 0, 0, 0]};


var Vars = ['plinko_editor', 'start_node_coll', 'data_viewer_window', 'data_viewer_pcontrol', 'plinko_data_pattr', 'plinko_data', 'Storage', 'storage_defer', 'timingmultiplier', 'program_window', 'restart', 'length', 'midi', 'viewer',
 			'bank_var', 'voice_var', 'plane_var', 'part_poly', 'mira_grid'];

var EditorVars = ['multidial0', 'multidial1', 'multidial2', 'multidial3', 'multidial4', 'multidial5', 'multidial6', 'multidial7', 'selector'];


var Objs = {'voice':{'Name':'voice', 'Type':'list', 'pattr':'voice'}, 
			'note':{'Name':'note', 'Type':'list', 'pattr':'note'},
			'velocity':{'Name':'velocity', 'Type':'list', 'pattr':'velocity'},
			'duration':{'Name':'duration', 'Type':'list', 'pattr':'duration'},
			'wormhole':{'Name':'wormhole', 'Type':'list', 'pattr':'wormhole'},
			'direction':{'Name':'direction', 'Type':'list', 'pattr':'direction'},
			'start_node':{'Name':'start_node', 'Type':'int', 'pattr':'start_node'},
			};


var PartObjs = {}

var labels = new Labels('Labels', 'push_name_display', 8);


function ParticleComponent(name, num, poly)
{
	var self = this;
	this._num = num+1;
	this._poly = poly;
	this._location = -1;
	this._status = false;
	this.obj = {};
	this._current_node = undefined;
	for(var item in PartObjs)
	{
		if(PartObjs[item].Type === 'list')
		{
			this[item] = [0, 0, 0, 0, 0, 0, 0, 0];
			this.obj[item] = poly.getnamed(item);
		}
		else if(PartObjs[item].Type === 'int')
		{
			this[item] = 0;
			this.obj[item] = poly.getnamed(item);
		}
	}
	this.add_bound_properties(this, ['_num', '_poly', '_location', '_status', 'obj', '_current_node', 'light_node']);
	ParticleComponent.super_.call(this, name, {});
}

inherits(ParticleComponent, Bindable)

ParticleComponent.prototype.light_node = function(node)
{
	if(this._current_node!=node)
	{
		if(this._current_node)
		{
			Grid.mask(this._current_node._x, this._current_node._y, -1);
		}
	}
	this._current_node = node;
	if(this._current_node)
	{
		Grid.mask(this._current_node._x, this._current_node._y, this._status ? colors.PARTICLE_ON : colors.PARTICLE_OFF);
	}
}



var DATA_BANKS = ['voice', 'note', 'velocity', 'duration', 'direction', 'wormhole', 'start_node'];

DictModule = function(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['hasKey', 'get', 'set', 'getNumberSafely', 'keys', '_dict', 'initialize']);
	DictModule.super_.call(this, name, args);
	this._dict = new Dict(this._dict_name);
	//this._testDict = new Dict('testing');
	this._dict.quiet = this._quiet ? this._quiet : false;
	this._initialize();
	//this._finder_dict = new Dict();
}

inherits(DictModule, Bindable);

DictModule.prototype._initialize = function() 
{
	//debug('names:', this._dict.getnames());
	//debug('size:', this._dict.getsize());

	if(REBUILD_DATA)
	{
		this._dict.clear();
	}
	
		//var DATA_BANKS = ['voice', 'note', 'velocity', 'duration', 'direction', 'wormhole'];
		/*for(var i=0;i<6;i++)
		{
			debug('making', DATA_BANKS[i]);
			this._dict.replace(DATA_BANKS[i], new Dict(DATA_BANKS[i]));
		
			for(var n=0;n<256;n++)
			{
				this.set(DATA_BANKS[i]+'::'+(n+1), [0, 0, 0, 0, 0, 0, 0, 0]);
			}
		}
		debug('making start_node');
		this._dict.replace('start_node', new Dict('start_node'));
		for(var n=0;n<256;n++)
		{
			this.set('start_node::'+(n+1), 0);
		}*/
		//var DEFAULT_DATA = new Dict();
		//DEFAULT_DATA = ({ "voice" : [0, 0, 0, 0, 0, 0, 0, 0],
		//						"note" : [0, 0, 0, 0, 0, 0, 0, 0],
		//						"velocity" : [0, 0, 0, 0, 0, 0, 0, 0],
		//						"duration" : [0, 0, 0, 0, 0, 0, 0, 0],
		//						"direction" : [0, 0, 0, 0, 0, 0, 0, 0],
		//						"wormhole" : [0, 0, 0, 0, 0, 0, 0, 0], 
		//						"start_node" : 0 });
		//var DEFAULT_DATA = jsobj_to_dict(DEFAULT_DATA);
		//debug('made DEFAULT_DATA');
		//for(var i=0;i<256;i++)
		//{
		//	this._dict.replace('Node_'+i, new Dict('Node_'+i));
		//	this._dict.replace('Node_'+i, DEFAULT_DATA);
			//this._dict.set('Node_'+(i+1), new Dict('Node_'+(i+1)));
			//this._dict.set('Node_'+(i+1)+'::voice', [0, 0, 0, 0, 0, 0, 0, 0]);
			//this._dict.set('Node_'+(i+1)+'::velocity', [0, 0, 0, 0, 0, 0, 0, 0]);
			//this._dict.set('Node_'+(i+1)+'::duration', [0, 0, 0, 0, 0, 0, 0, 0]);
			//this._dict.set('Node_'+(i+1)+'::direction', [0, 0, 0, 0, 0, 0, 0, 0]);
			//this._dict.set('Node_'+(i+1)+'::wormhole', [0, 0, 0, 0, 0, 0, 0, 0]);
			//this._dict.set('Node_'+(i+1)+'::start', 0);
		//}
		//this._keys = this._dict.getkeys();
		//debug('new_keys:', this._keys);
		//this.refresh_window();
		
	//}
}

DictModule.prototype.set = function(address, value)
{
	try
	{
		this._dict.replace(address, value);
		this.refresh_window();
		Presets.dirtyStorage();
		return true;
	}
	catch(err)
	{
		return false;
	}
}

DictModule.prototype.get = function(address)
{
	var value = this._dict.get(address);
	return value;
}

DictModule.prototype.getNumberSafely = function(address)
{
	var value = this._dict.get(address);
	if(isNaN(parseInt(value)))
	{
		value = 0;
	}
	return value;
}

DictModule.prototype.hasKey = function(address)
{
	return this._dict.contains(address);
}

DictModule.prototype.refresh_window = function()
{
	VIEW_DICT&&this._obj.message('wclose');
	VIEW_DICT&&this._obj.message('edit');
}

DictModule.prototype.update_coll = function(parameter, node)
{
	//debug('sending out:', parameter, node, this._dict.getnames());
	
	//this._finder_dict.name = parameter;
	//debug('name:', this._dict.name);
	//var keys = this._dict.getkeys();
	//debug('length:', keys.length);
	//for(var i in keys)
	//{
	//	debug('item:', i, keys[i]);
	//}
	//this._dict.get(parameter).push_to_coll(unique+''+parameter);
	//this._testDict.pull_from_coll(''+parameter);
}

DictModule.prototype.restore_to_colls = function()
{
	/*for(var i in DATA_BANKS)
	{
		var bank = DATA_BANKS[i];
		debug('retrieving:', bank);
		if(this.hasKey(bank))
		{
			this.update_coll(bank);
		}
	}*/
}



function NodeComponent(name, num, poly)
{
	var self = this;
	this._name = name;
	this._num = num+1;
	//this._poly = poly;
	this._x = num%16;
	this._y = Math.floor(num/16);
	this._edit_plane = 7;
	this._edit_range = [7, 7];
	this._status;
	this.obj = {};
	for(var item in Objs)
	{
		if(Objs[item].Type === 'list')
		{
			this[item] = [0, 0, 0, 0, 0, 0, 0, 0];
			//this.obj[item] = poly.getnamed(item);
		}
		else if(Objs[item].Type === 'int')
		{
			this[item] = 0;
			//this.obj[item] = poly.getnamed(item);
		}
	}
	this.add_bound_properties(this, ['initialize_data', '_num', '_poly', '_x', '_y', '_edit_plane', '_edit_range', '_status', 'obj', 'trigger', 'get', 'set', 'get_single', 'set_single',
									'set_single_replace', 'set_single_fill', 'toggle_direction_single', 'toggle_direction_replace', 'toggle_direction_fill', 'toggle_start',
									'change_plane', 'update']);
	NodeComponent.super_.call(this, name, {});
	this.initialize_data();
}

inherits(NodeComponent, Bindable);

NodeComponent.prototype.initialize_data = function()
{
	if(!Data.hasKey(this._name))
	{
		var DEFAULT_DATA = new Dict();
		DEFAULT_DATA = ({ "voice" : [0, 0, 0, 0, 0, 0, 0, 0],
								"note" : [0, 0, 0, 0, 0, 0, 0, 0],
								"velocity" : [0, 0, 0, 0, 0, 0, 0, 0],
								"duration" : [0, 0, 0, 0, 0, 0, 0, 0],
								"direction" : [0, 0, 0, 0, 0, 0, 0, 0],
								"wormhole" : [0, 0, 0, 0, 0, 0, 0, 0], 
								"start_node" : 0 });
		var DEFAULT_DATA = jsobj_to_dict(DEFAULT_DATA);
		Data._dict.replace(this._name, new Dict(this._name));
		Data._dict.replace(this._name, DEFAULT_DATA);
	}
}

NodeComponent.prototype.trigger = function()
{
	patcher.getnamed('poly').message('target', num+1);patcher.getnamed('poly').message(7);
}

NodeComponent.prototype.get = function(parameter)
{
	if(parameter in this)
	{
		//this[parameter] = this.obj[parameter].getvalueof();
		return this[parameter];
	}
}

NodeComponent.prototype.set = function(parameter, val)
{
	if(parameter in this)
	{
		this[parameter] = val;
		//this.obj[parameter].setvalueof(this[parameter]);
		//plinko2.setstoredvalue('poly.'+(this._num)+'::'+parameter, preset, this[parameter]);
		//Data.set(parameter+'::'+this._num, this[parameter]);
		Data.set(this._name+'::'+parameter, this[parameter]);
		//Data.update_coll(parameter, this._num);
	}
}

NodeComponent.prototype.get_single = function(parameter, num)
{
	if(parameter in this)
	{
		num = num||this._edit_plane;
		return this[parameter][num];
	}
}

NodeComponent.prototype.set_single = function(parameter, val, num)
{
	if(parameter in this)
	{
		num = num||this._edit_plane;
		this[parameter][num] = val;
		//this.obj[parameter].setvalueof(this[parameter]);
		//plinko2.setstoredvalue('poly.'+(this._num)+'::'+parameter, preset, this[parameter]);
		//Data.set(parameter+'::'+this._num, this[parameter]);
		Data.set(this._name+'::'+parameter, this[parameter]);
		//Data.update_coll(parameter, this._num);
	}
}

NodeComponent.prototype.set_single_replace = function(parameter, val, num)
{
	//debug('replace', parameter, num, val);
	if(parameter in this)
	{
		num = num||this._edit_plane;
		var last = this[parameter][num];
		var i=num;do{
			if(this[parameter][i]==last){this[parameter][i] = val;}
			else{i=0;}
		}while(i--);
		//this.obj[parameter].setvalueof(this[parameter]);
		//plinko2.setstoredvalue('poly.'+(this._num)+'::'+parameter, preset, this[parameter]);
		//Data.set(parameter+'::'+this._num, this[parameter]);
		Data.set(this._name+'::'+parameter, this[parameter]);
		//Data.update_coll(parameter, this._num);
	}
}

NodeComponent.prototype.set_single_fill = function(parameter, val, num)
{
	if(parameter in this)
	{
		num = num||this._edit_plane;
		var i=num;do{
			this[parameter][i] = val;
		}while(i--);
		//this.obj[parameter].setvalueof(this[parameter]);
		//plinko2.setstoredvalue('poly.'+(num)+'::'+parameter, preset, this[parameter]);
		//Data.set(parameter+'::'+this._num, this[parameter]);
		Data.set(this._name+'::'+parameter, this[parameter]);
		//Data.update_coll(parameter, this._num);
	}
}

NodeComponent.prototype.toggle_direction_single = function(dir, num)
{
	num = num||this._edit_plane;
	this.direction[num] = this.direction[num] ^= (1 << dir);
	//this.obj.direction.setvalueof(this.direction);
	//plinko2.setstoredvalue('poly.'+(this._num)+'::direction', preset, this.direction);
	//Data.set('direction::'+this._num, this.direction);
	Data.set(this._name+'::direction', this.direction);
	//Data.update_coll('direction', this._num);
	//Data._dict.get(parameter).push_to_coll('direction');
}

NodeComponent.prototype.toggle_direction_replace = function(dir, num)
{
	num = num||this._edit_plane;
	var last_bit = this.direction[num]&(1<<dir);
	var i=num;do{
		if(last_bit==(this.direction[i]&(1<<dir))){this.direction[i] ^= 1 << dir;}
		else{i=0;}
	}while(i--);
	//this.obj.direction.setvalueof(this.direction);
	//plinko2.setstoredvalue('poly.'+(this._num)+'::direction', preset, this.direction);
	//Data.set('direction::'+this._num, this.direction);
	Data.set(this._name+'::direction', this.direction);
	//Data.update_coll('direction', this._num);
}

NodeComponent.prototype.toggle_direction_fill = function(dir, num)
{
	num = num||this._edit_plane;
	var bit = this.direction[num]&(1<<dir);
	var i=num;do{
		this.direction[i] |= 1 << dir;
	}while(i--);
	//this.obj.direction.setvalueof(this.direction);
	//plinko2.setstoredvalue('poly.'+(this._num)+'::direction', preset, this.direction);
	//Data.set(parameter+'::'+this._num, this.direction);
	Data.set(this._name+'::direction', this.direction);
	//Data.update_coll('direction', this._num);
}

NodeComponent.prototype.toggle_start = function()
{
	//debug('name', this._name, 'start_node:', this.start_node);
	this.start_node = Math.abs(this.start_node-1);
	//debug('and start_node:', this.start_node);
	//this.obj.start.setvalueof(this.start_node);
	//plinko2.setstoredvalue('poly.'+(this._num)+'::start_node', preset, this.start_node);
	//Data.set('start_node::'+this._num, this.start_node);
	Data.set(this._name+'::start_node', this.start_node);
	//Data.update_coll('start_node', this._num);
	start_node_coll.message(this._num, this.start_node);
	//start_node_coll.edit();
}

NodeComponent.prototype.change_plane = function(plane)
{
	this._edit_plane = Math.max(Math.min(8, plane), 0);
}

NodeComponent.prototype.update = function()
{
	//debug('value:', Data.get('Node_'+this._num));
	for(var item in Objs)
	{
		//debug('update:', this._name, item);
		//this[item] = this.obj[item].getvalueof();
		//this[item] = Data.get(item+'::'+this._num);
		this[item] = Data.get(this._name+'::'+item);
		//this[item] = Data._dict.get('Node_'+(this._num)+'::'+item
	}
	start_node_coll.message(this._num, this.start_node);
	
}



function Labels(name, call, width)
{
	var self = this;
	this._name = name;
	this.width = function(){return width;}
	this.Label = [];
	for(var x=0;x<width;x++)
	{
		this.Label[x] = new Label(name + '_Cell_'+x, call,  x, this);
	}
	this.send = function(val)
	{
		mod.Send( call, 'all', val);
		for(var i in self.Label)
		{
			self.Label[i]._value = val;
		}
	}
}

function Label(name, call, x, parent)
{
	var self = this;
	this._name = name;
	this._parent = parent;
	this._value = 0;
	this._x = x;
	this._num = x;
	this.pressed = false;
	this.send = function(val, force)
	{
		if(force||(val!=self._val))
		{
			mod.Send( call, 'value', self._x, val);
			self._value = val;
		}
	}

}

function Display()
{
	var self = this;
	this.panel = [];
	this.dial = [];
	this.button = [];
	this._name = [];
	this._value = [];
	this.layer = 'Main';

	this.layers={	'Main':     {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[6, 6, 6, 6, 6, 6, 6, 6, 30]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'button': 	{'outlinecolor':[bgcolors.YELLOW, bgcolors.OFF, bgcolors.BLUE, bgcolors.OFF, bgcolors.RED, bgcolors.OFF, bgcolors.GREEN, bgcolors.OFF, bgcolors.WHITE],
												'bgcolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE],
												'outlinecolor':[bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE],
												'hidden':[1, 1, 1, 1, 1, 1, 1, 1, 1],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Voices':   {	'_name': 	{'set': ['voices', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'button': 	{'outlinecolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bgcolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE],
												'outlinecolor':[bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE],
												'hidden':[1, 1, 1, 1, 1, 1, 1, 1, 1],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Storage':  {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'button': 	{'outlinecolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bgcolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[0, 0, 0, 0, 0, 0, 0, 0, 0],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Routing':  {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'button': 	{'outlinecolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bgcolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[0, 0, 0, 0, 0, 0, 0, 0, 0],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								}
					};

	for(var i=0;i<9;i++)
	{
		//this.panel[i] = patcher.getnamed('panel['+i+']');
		this.dial[i] = patcher.getnamed('dial['+i+']');
		this.button[i] = patcher.getnamed('button['+i+']');
		this._name[i] = patcher.getnamed('_name['+i+']');
		this._value[i] = patcher.getnamed('_value['+i+']');
	}
	this._update = function()
	{
		for(var i=0;i<9;i++)
		{
			for(var obj in this.layers[this.layer])
			{
				//debug('obj', obj, '\n');
				var object = this.layers[this.layer][obj];
				for(var prop in object)
				{
					this[obj][i].message(prop, object[prop][i]);
				}
			}
		}	
	}
	this._update();
}



function anything()
{
	switch(inlet)
	{
		case 0:
			var args = arrayfromargs(messagename, arguments);
			debug('anything:', args);
			break;
	}
}

function init()
{
	mod = new ModProxy(script, ['Send', 'SendDirect', 'restart']);
	found_mod = new Mod(script, 'plinko', unique, false);
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	found_mod.assign_api(mod_finder);

	debug('plinko init');
	setup_tasks();
	setup_translations();
	setup_colors();
	setup_patchers();
	setup_controls();
	setup_dict();
	setup_nodes();
	setup_particles();
	setup_program_window();
	setup_device();
	setup_parameter_controls();
	setup_scales();
	setup_gameboard();
	setup_editor();
	setup_tree();
	setup_presets();
	setup_viewer();
	setup_speeds();
	setup_modes();
	setup_tests();
	deprivatize_script_functions(script);
	display = new Display();
	Alive = 1;
	_clear_surface();
	Presets._storage.message('recall', 1);
	Presets._storage.message('getslotlist');
	mod.Send( 'set_report_offset', 1);
	if(SHOW_STORAGE)
	{
		this.patcher.getnamed('plinko2').message('clientwindow');
		this.patcher.getnamed('plinko2').message('storagewindow');
	}
	post("plinko initialized.\n");
	lock();
	MainModes.push_mode(0);
	MainModes.change_mode(0);
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

function initialize(val)
{
	mod = found_mod;
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 150);
}

function setup_translations()
{
	//Base stuff:
	for(var i = 0;i < 16;i++)
	{
		mod.Send( 'add_translation', 'pads_'+i, 'base_grid', 'base_pads', i%8, Math.floor(i/8));
		mod.Send( 'add_translation', 'keys_'+i, 'base_grid', 'base_keys', i%8, Math.floor(i/8));
		mod.Send( 'add_translation', 'keys2_'+i, 'base_grid', 'base_keys2', i%8, Math.floor(i/8)+2);
	}
	mod.Send( 'add_translation', 'pads_batch', 'base_grid', 'base_pads', 0);
	mod.Send( 'add_translation', 'keys_batch', 'base_grid', 'base_keys', 0);
	mod.Send( 'add_translation', 'keys2_batch', 'base_grid', 'base_keys2', 2); 
	mod.Send( 'enable_translation_group', 'base_keys', 0);

	for(var i=0;i<8;i++)
	{
		mod.Send( 'add_translation', 'buttons_'+i, 'base_grid', 'base_buttons', i, 2);
		mod.Send( 'add_translation', 'extras_'+i, 'base_grid', 'base_extras', i, 3);
	}
	mod.Send( 'add_translation', 'buttons_batch', 'base_grid', 'base_buttons', 2);
	mod.Send( 'add_translation', 'extras_batch', 'base_grid', 'base_extras', 3);
	mod.Send( 'enable_translation_group', 'base_buttons', 0);
	mod.Send( 'enable_translation_group', 'base_extras',  0);

	//Push stuff:
	for(var i = 0;i < 16;i++)
	{
		mod.Send( 'add_translation', 'pads_'+i, 'push_grid', 'push_pads', i%8, Math.floor(i/8));
		mod.Send( 'add_translation', 'keys_'+i, 'push_grid', 'push_keys', i%8, Math.floor(i/8)+2);
		mod.Send( 'add_translation', 'keys2_'+i, 'push_grid', 'push_keys2', i%8, Math.floor(i/8)+4);
	}
	for(var i=0;i<8;i++)
	{
		mod.Send( 'add_translation', 'buttons_'+i, 'push_grid', 'push_buttons', i, 6);
		mod.Send( 'add_translation', 'extras_'+i, 'push_grid', 'push_extras', i, 7);
	}
}

function setup_colors()
{
	PALETTE[0] = PALETTE[0];
	PALETTE[1] = PALETTE[120];
	PALETTE[2] = PALETTE[30];
	PALETTE[3] = PALETTE[12];
	PALETTE[4] = PALETTE[20]
	PALETTE[5] = PALETTE[65];
	PALETTE[7] = PALETTE[11];
	PALETTE[8] = PALETTE[125];
	PALETTE[127] = PALETTE[125];
}

function setup_patchers()
{
	for(var i in Vars)
	{
		script[Vars[i]] = this.patcher.getnamed(Vars[i]);
	}
	viewer_matrix = viewer.subpatcher().getnamed('matrix');
	for(var i in EditorVars)
	{
		script[EditorVars[i]] = this.patcher.getnamed('plinko_editor').subpatcher().getnamed(EditorVars[i]);
	}

}

function setup_controls()
{

	script['GridControlRegistry'] = new ControlRegistry('GridRegistry');
	script['KeysControlRegistry'] = new ControlRegistry('KeysRegistry');
	script['cells'] = [];
	script['raw_cells'] = [];
	script['KeyButtons'] = [];
	script['Grid'] = new GridClass(16, 16, 'Grid');
	script['Keys'] = new GridClass(8, 1, 'Keys');
	script['ShiftButton'] = new ButtonClass('shift', 'Shift', function(){});
	script['AltButton'] = new ButtonClass('alt', 'Alt', function(){});

	script['miraGrid'] = new MiraGridComponent('miraGrid', {'cells':miraPads, 'keys':miraKeys, 'shift':miraShift, 'alt':miraAlt});
	script['miraGridOutput'] = miraGrid._button_press;
	script['miraKeyOutput'] = miraGrid._key_press;
	script['miraShiftOutput'] = miraGrid._shift_press;
	script['miraAltOutput'] = miraGrid._alt_press;

	var make_send_func = function()
	{
		var args = arrayfromargs(arguments);
		if(args.length == 4)
		{
			var func = function(value, suppress_block)
			{
				//debug('send:', value, suppress_block, !suppress_block);
				//debug('sending:', args[0], args[1], args[2], args[3], value);
				mod.Send(args[0], args[1], args[2], args[3], value);
				var COLOR = PALETTE[value<0?0:value];
				/*if(!suppress_block)
				{
					outlet(1, "rectangle", pos_fix[args[2]], pos_fix[args[3]], .1, .1);
					outlet(1, "setcolor", 0, 0, 0, 1);
					outlet(1, "setcolor", COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .3));
					outlet(1, "fill");
					outlet(1, "append");
				}*/
				//debug('miraPad:', args[2] + (args[3]*8), 'bgcolor', COLOR[0], COLOR[1], COLOR[2], COLOR[3]);
				//miraPads[args[2] + (args[3]*8)].message('bgcolor', COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .3));
			}
		}
		else
		{
			var func = function(value)
			{
				//debug('value:', args, value);
				mod.Send(args[0], args[1], args[2], value);
				var COLOR = PALETTE[value<0?0:value];
				//debug('color:', (value<0)||(value>8)?0:value, COLOR)
				//miraKeys[args[2]].message('bgcolor', COLOR[0], COLOR[1], COLOR[2], 1);
			}
		}
		return func;
	}

	for(var x=0;x<16;x++)
	{
		cells[x] = [];
		for(var y=0;y<16;y++)
		{
			var id = x+(y*16);
			cells[x][y] = new ButtonClass(id, 'Cell_'+id, make_send_func('grid', 'value', x, y), {'mask':make_send_func('grid', 'mask', x, y)});
			raw_cells.push(cells[x][y]);
			GridControlRegistry.register_control(id, cells[x][y]);
			Grid.add_control(x, y, cells[x][y]);
		}
	}

	for(var id=0;id<8;id++)
	{
		KeyButtons[id] = new ButtonClass(id, 'Key_'+id, make_send_func('key', 'value', id), {'mask':make_send_func('key', 'mask', id)});
		KeysControlRegistry.register_control(id, KeyButtons[id]);
		Keys.add_control(id, 0, KeyButtons[id]);
	}

	script['_grid'] = function(x, y, val){GridControlRegistry.receive(x+(y*16), val);}
 	script['_key'] = function(num, val){KeysControlRegistry.receive(num, val);}
	script['_shift'] = function(val){ShiftButton.receive(val);}
	script['_alt'] = function(val){AltButton.receive(val);}
	
	script['TopSub'] = new GridClass(8, 1, 'TopSubGrid');
	//this._mid_sub = new GridClass(8, 2, this._name+('_mid_sub'));
	script['BottomSub'] = new GridClass(8, 7, 'BottomSubGrid');
}

function setup_dict()
{
	script['Data'] = new DictModule(this._name + '_Data', {'dict_name':'plinko_data', 'obj':plinko_data});
}

function setup_nodes()
{
	script['node'] = [];
	for(var i = 0; i < 256; i++)
	{
		var polynum = i;
		node[i] = new NodeComponent('Node_'+(i+1), i); //this.patcher.getnamed('poly').subpatcher(polynum));
	}
}

function setup_particles()
{
	part = [];
	for(var i = 0; i<64; i++)
	{
		var partnum = i;
		part[i] = new ParticleComponent('Particle_'+i, i, this.patcher.getnamed('part_poly').subpatcher(partnum));
	}
}

function setup_program_window()
{
	var subpatcher = this.patcher.getnamed('program_window').subpatcher();
	var names = get_patcher_script_names(subpatcher);
	var objs = {};
	for(var i in names)
	{
		objs[names[i]] = subpatcher.getnamed(names[i]);
	}
	script['ProgramWindow'] = new ProgramWindowComponent('ProgramWindow', {'obj':subpatcher, 'objs':objs});
	script['program_window_in'] = ProgramWindow.program_window_in;
	ProgramWindow.open();
	//ProgramWindow.unlock();
}

function setup_device()
{
	script['Device'] = new DeviceModule('DeviceComponent', {'finder':new LiveAPI(function(){}, 'this_device')});
}

function setup_parameter_controls()
{
	//debug('making parameters');
	var obj = this.patcher.getnamed('parameter_controls');
	//var pcontrol = this.patcher.getnamed('parameter_controls_pcontrol');
	var thispatcher = obj.subpatcher().getnamed('parameter_controls_thispatcher');
	var window_position = obj.subpatcher().getnamed('window_position');
	window_position = window_position.length ? window_position : [0, 0, 200, 200];
	script['Parameters'] = new ParameterControlModule('ParameterControls', {'window_position':window_position, 'thispatcher':thispatcher, 'obj':obj, 'sizeX':450, 'sizeY':700, 'nominimize':true, 'nozoom':false, 'noclose':true, 'nogrow':true, 'notitle':false, 'float':true});
	script['paramControl_in'] = Parameters.receive;
	script['_lcd'] = Parameters._lcd;
	Parameters.lock();
}

function setup_scales()
{
	script['Scales'] = new ScalesModule();
}

function setup_gameboard()
{
	script['Gameboard'] = new GameboardComponent('Gameboard', {});
	script['_particle'] = Gameboard._particle;
	script['_offset'] = Gameboard._offset;
}

function setup_editor()
{
	script['Editor'] = new EditorComponent('Editor', {'sizeX':170, 'sizeY':700, 'obj':plinko_editor, 'thispatcher':plinko_editor.subpatcher().getnamed('thispatcher'), 
								'window_position':plinko_editor.subpatcher().getnamed('window_postion'),
								'nominimize':true, 'noclose':true, 'nozoom':true, 'nogrow':true, 'notitle':false, 'float':true});
	script['_plinko_editor_in'] = Editor.editor_in;
}

function setup_tree()
{
	script['Tree'] = new TreeComponent('Tree', {});
}

function setup_presets()
{
	script['Presets'] = new PresetComponent(this._name + '_Presets', {'storage':this.patcher.getnamed('Storage')});
	script['_storage'] = Presets.receive_from_storage;
	tasks.addTask(Presets.update_preset, [], 2, true, 'update_preset');
}

function setup_viewer()
{
	var toggle_viewer = function(obj)
	{
		debug('toggle_viewer:', obj._value);
		/*if(AltKey.pressed())
		{
			unlock();
		}*/
		if(obj._value)
		{
			viewer.front();
			data_viewer_window.front();
		}
		else
		{
			viewer.wclose();
			data_viewer_window.wclose();
		}
	}
	script['Viewer'] = new ToggledParameter('Plinko_Viewer', {'onValue':17, 'offValue':colors.WHITE, 'value':0, 'callback':toggle_viewer.bind(this)});
}

function setup_speeds()
{
	script['SpeedChooser'] = new RadioComponent(this._name + '_SpeedChooser', 0, 2, 0, function(){}, colors.BLUE, colors.RED, {'value':0});
	script['Triplet'] = new ToggledParameter(this._name + '_Triplet', {'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':0});
}

function setup_modes()
{
	//Page 1:  mainPage
	script['mainPage'] = new ModeSwitchablePage('mainPage');
	mainPage.enter_mode = function()
	{
		debug('mainPage entered');
		mod.Send( 'set_legacy', 1);
		Gameboard.assign_grid(Grid);
		Gameboard._start_key.set_control(KeyButtons[0]);
		Gameboard._note_key.set_control(KeyButtons[1]);
		Gameboard._wormhole_key.set_control(KeyButtons[2]);
		//Viewer.set_control(KeyButtons[5]);
		//Gameboard._poly_key.set_control(KeyButtons[6]);
		Editor._toggle.set_control(KeyButtons[5]);
		Gameboard._trigger_mode.set_control(KeyButtons[6]);
		mainPage.set_shift_button(ShiftButton);
		mainPage.set_alt_button(AltButton);
	}
	mainPage.exit_mode = function()
	{
		SpeedChooser.set_controls();
		Triplet.set_control();
		Presets.assign_grid();
		Viewer.set_control();
		Gameboard.assign_grid();
		Gameboard._start_key.set_control();
		Gameboard._note_key.set_control();
		Gameboard._wormhole_key.set_control();
		//Gameboard._poly_key.set_control();
		Editor._toggle.set_control();
		mainPage.set_shift_button();
		mainPage.set_alt_button();
		debug('mainPage exited');
	}
	mainPage.update_mode = function()
	{
		debug('mainPage updated');
		
		if(mainPage._shifted)
		{
			debug('mainPage._shifted');
			Gameboard._start_key.set_control();
			Gameboard._note_key.set_control();
			Gameboard._wormhole_key.set_control();
			Viewer.set_control();
			//Gameboard._poly_key.set_control();
			Editor._toggle.set_control();
			Gameboard._trigger_mode.set_control();
			SpeedChooser.set_controls([KeyButtons[4], KeyButtons[5], KeyButtons[6]]);
			Triplet.set_control(KeyButtons[7]);
		}
		else if(mainPage._alted)
		{
			debug('mainPage._alted');
			Gameboard.assign_grid();
			Presets.assign_grid(Grid);
			
		}
		else if(mainPage._moded)
		{
			debug('mainPage is moded');
		}
		else
		{
			SpeedChooser.set_controls();
			Triplet.set_control();
			Presets.assign_grid();
			Gameboard.assign_grid(Grid);
			Gameboard._start_key.set_control(KeyButtons[0]);
			Gameboard._note_key.set_control(KeyButtons[1]);
			Gameboard._wormhole_key.set_control(KeyButtons[2]);
			//Viewer.set_control(KeyButtons[5]);
			//Gameboard._poly_key.set_control(KeyButtons[6]);
			Editor._toggle.set_control(KeyButtons[5]);
			Gameboard._trigger_mode.set_control(KeyButtons[6]);
		}
	}

	//Page 2:  
	script['bankPage'] = new ModeSwitchablePage('bankPage');
	bankPage.enter_mode = function()
	{
		debug('bankPage entered');
		mod.Send( 'set_legacy', 0);
		TopSub.sub_grid(Grid, 0, 8, 0, 1);
		Device._bank_chooser.set_controls(TopSub);
		BottomSub.sub_grid(Grid, 0, 8, 1, 8);
		Scales.assign_grid(BottomSub);
		Device.update();
		
	}
	bankPage.exit_mode = function()
	{
		Scales.assign_grid();
		Device._bank_chooser.set_controls();
		//TopSub.clear_buttons();
		//BottomSub.clear_buttons();
		debug('bankPage exited');
	}
	bankPage.update_mode = function()
	{
		debug('bankPage updated');
		
		if(bankPage._shifted)
		{
			debug('bankPage._shifted');
		}
		else if(bankPage._alted)
		{
			debug('bankPage._alted');
		}
		else if(bankPage._moded)
		{
			debug('bankPage is moded');
		}
		else
		{
			
		}
	}

	script["MainModes"] = new PageStack(2, 'Main Modes', {'mode_colors':[colors.BLUE, colors.CYAN], 'behaviour':CyclePageStackBehaviour});
	MainModes.add_mode(0, mainPage);
	MainModes.add_mode(1, bankPage);
	MainModes.set_mode_cycle_button(KeyButtons[7]);
}

function setup_tests()
{
}



function _clear_surface()
{
	//mod.Send( 'push_grid', 'all', 0);
	//matrix.send(0);
}

function _channel(num)
{
	debug('channel', num);
	mod.Send( 'channel', 'value', num);
	messnamed(unique+'channel', num);
}

function _speed(key, num, val)
{
	debug('speed', num, val);
	speed[num-4] = val;
	//display_keys();
}

function _pulse(){}

function dectobin(arg)
{
	var dec = [];
	for(var i=0;i<8;i++)
	{
		dec.push(arg&1);
		arg = arg>>>1;
	}
	return dec;
}

function inRange(val, low, high)
{
	return ((val>=low)&&(val<high));
}

function packFader(val, color)
{
	var ret = [];
	var i=7;do{
		ret[Math.abs(i-7)]=(i<=val)*color;
	}while(i--);
	return ret;
}

function packDial(val, color)
{
	var ret = [];
	var i=7;do{
		ret[Math.abs(i-7)]=(i==val)*color;
	}while(i--);
	return ret;
}

function unlock()
{
	viewer.window('size', 100, 100, 520, 520);
	viewer.window('flags', 'minimize');
	viewer.window('flags', 'zoom');
	viewer.window('flags', 'close');
	viewer.window('flags', 'grow');
	viewer.window('flags', 'title');
	viewer.window('flags', 'nofloat');
	viewer.window('exec');
}

function lock()
{
	viewer.window('size', 100, 100, 520, 520);
	viewer.window('flags', 'nominimize');
	viewer.window('flags', 'nozoom');
	viewer.window('flags', 'noclose');
	viewer.window('flags', 'nogrow');
	viewer.window('flags', 'notitle');
	viewer.window('flags', 'float');
	viewer.window('exec');
}

function _dial_input(num, val)
{
	//debug('dial input', num, val);
	if(Gameboard._pressed > -1)
	{
		var func = mainPage._alted ? 'set_single_fill' : mainPage._shifted ? 'set_single' : 'set_single_replace';
		switch(num)
		{
			case 0:
				node[Gameboard._pressed][func]('voice', val);
				break;
			case 1:
				node[Gameboard._pressed][func]('note', val-1);
				break;
			case 2:
				node[Gameboard._pressed].change_plane(val-1);
				break;
		}
		Gameboard.display_node(Gameboard._pressed);
	}
}

function dial_input(){}



function GameboardComponent(name, args)
{
	var self = this;
	this._grid;
	this._pressed = -1;
	this._offsets = [0, 0];
	//this._trigger_mode = false;

	this._start_key = new MomentaryParameter(this._name + '_StartKey', {'onValue':colors.WHITE, 'offValue':colors.NODE_START, 'value':0, 'callback':this.start_key_callback.bind(this)});
	this._note_key = new MomentaryParameter(this._name + '_NoteKey', {'onValue':colors.WHITE, 'offValue':colors.NODE_NOTE, 'value':0, 'callback':this._update.bind(this)});
	this._wormhole_key = new MomentaryParameter(this._name + '_WormholeKey', {'onValue':colors.WHITE, 'offValue':colors.NODE_WH, 'value':0, 'callback':this.wormhole_key_callback.bind(this)});
	this._poly_key = new MomentaryParameter(this._name + '_PolyKey', {'onValue':colors.WHITE, 'offValue':colors.MAGENTA, 'value':0, 'callback':this._update.bind(this)});
	this._trigger_mode = new ToggledParameter(this._name + '_TriggerMode', {'onValue':colors.RED, 'offValue':colors.GREEN, 'value':0});

	this.add_bound_properties(this, ['held_node_index', '_pressed', 'wormhole_key_callback', '_particle', '_start_key', '_note_key', '_wormhole_key', '_copy_key', '_wormhole_key', '_trigger_mode', 'clear_surface', '_grid', '_update', 'assign_grid', '_button_press', 'display_node', 'display_gameboard', 'display_keys', 'display_wormhole', 'display_presets']);
	GameboardComponent.super_.call(this, name, args);

}

inherits(GameboardComponent, Bindable);

GameboardComponent.prototype._update = function()
{
	mod.SendDirect('receive_device_proxy', 'set_mod_device_bank', 0);
	this.display_gameboard();
}

GameboardComponent.prototype.assign_grid = function(grid)
{
	debug('GameboardComponent assign grid', grid, grid instanceof GridClass);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
		this._update();
	}
}

GameboardComponent.prototype._button_press = function(obj)
{
	var coords = this._grid.button_coords(obj);
	var x = coords[0];
	var y = coords[1];
	var val = obj._value ? 1 : 0;
	//debug('Gameboard._button_press', x, y, val);
	if((this._pressed<0)&&(val))								//new press, nothing held
	{
		if(this._trigger_mode._value)
		{
			//node[x+(y*16)].trigger();
			part_poly.message('note', (x+(y*16))+1, INITIAL_DIR, 'new');
		}
		else if(this._poly_key._value)
		{
			patcher.getnamed('poly').message('open', x+(y*16)+1);
		}
		else
		{
			this._pressed = x+(y*16);
			this.display_node(this._pressed);
		}
	}
	else if((this._pressed>-1)&&(val))						//new press, something held
	{
		if(this._wormhole_key._value)						//create wormhole
		{
			var func = alted ? 'set_single_fill' : shifted ? 'set_single' : 'set_single_replace';
			var wh = node[this._pressed].get_single('wormhole')===(x+(y*16)+1) ? 0 : (x+(y*16)+1);
			node[this._pressed][func]('wormhole', wh);
			this.display_wormhole();
		}
		else
		{
			var num = (x + (y*16));
			var dir = coordMath.indexOf(num - this._pressed);
			//debug('dir is:', dir);
			var x_offset = ((x-offsets[0])<4)*4;
			if(dir > -1)									//press is surrounding node
			{
				var func = alted ? 'toggle_direction_fill' : shifted ? 'toggle_direction_single' : 'toggle_direction_replace';
				node[this._pressed][func](dir);
				this.display_node(this._pressed);
			}
			else if(((!x_offset)&&((x-offsets[0])>4))||((x_offset)&&((x-offsets[0])<3)))	//press is in fader strip
			{
				var x = (x-offsets[0])%5;
				var func = alted ? 'set_single_fill' : shifted ? 'set_single' : 'set_single_replace';
				switch(x)
				{
					case 0:
						node[this._pressed][func]('voice', Math.abs((y-offsets[1])-7));
						break;
					case 1:
						node[this._pressed][func]('note', Math.abs((y-offsets[1])-7));
						break;
					case 2:
						node[this._pressed].change_plane(Math.abs((y-offsets[1])-7));
						break;
				}
				this.display_node(this._pressed);
			}
		}
	}
	else if((this._pressed==(x+(y*16)))&&(!val))
	{
		this._pressed = -1;
		this.display_gameboard();
	}
	else
	{
	}
}

GameboardComponent.prototype.held_node_index = function()
{
	return this._pressed;
}

GameboardComponent.prototype.display_node = function(num)
{
	Editor._selected_node.receive(this._pressed+1);
	//debug('display_node', num);
	this._offsets = mod.finder.call('get_handler_offsets');
	debug('new offsets are:', this._offsets);
	var x = node[num]._x;
	var y = node[num]._y;
	var dirs = dectobin(node[num].get_single('direction'));
	var voice = packDial(node[num].get_single('voice'), colors.VOICE_FADER);
	var note = packDial(node[num].get_single('note'), colors.NOTE_FADER);
	var plane = packFader(node[num]._edit_plane, colors.PLANE_FADER);
	var x_offset = ((x-this._offsets[0])<4)*5;
	//var y_offset = offsets[1];
	this.clear_surface();
	this._grid.send(x, y, node[num].start_node > 0 ? colors.NODE_START : colors.NODE_SELECTED);
	var i=7;do{
		var adj = num+coordMath[i];
		if(inRange(adj, 0, 256))
		{
			//debug('dirs:', dirs);
			this._grid.send(adj%16, Math.floor(adj/16), dirs[i] ? colors.DIRECTION_ON : colors.DIRECTION_OFF);
		}
		this._grid.mask(x_offset+this._offsets[0], i + this._offsets[1], voice[i]);
		this._grid.mask(x_offset+1+this._offsets[0], i + this._offsets[1], note[i]);
		this._grid.mask(x_offset+2+this._offsets[0], i + this._offsets[1], plane[i]);
		
	}while(i--);

	bank_var.message('set', node[num].get_single('voice'));
	voice_var.message('set', (node[num].get_single('note') + 1));
	plane_var.message('set', (node[num]._edit_plane + 1));
}

GameboardComponent.prototype.display_gameboard = function()
{
	//debug('display_gameboard');
	//mod.Send('grid', 'value', 8, 8, 1);
	if((this._grid)&&(this._pressed<0))
	{
		this.clear_surface();
		for(var i in node)
		{
			var dir = Math.floor(node[i].direction.join('')>0);
			var wh = Math.floor(node[i].wormhole.join('')>0);
			//debug('dir:', dir, 'wh:', wh);
			if(dir||wh)
			{
				//debug('node:', node[i]._x, node[i]._y, this._grid.get_button(node[i]._x, node[i]._y)._name);
				this._grid.send(node[i]._x, node[i]._y, dir&&wh ? colors.NODE_ON_WH : dir ? colors.NODE_ON : colors.NODE_WH);
			}
			if(this._start_key._value)
			{
				if (node[i].start_node>0)
				{
					this._grid.send(node[i]._x, node[i]._y, colors.NODE_START);
				}
			}
			if(this._note_key._value)
			{
				if (Math.floor(node[i].voice.join('')>0))
				{
					this._grid.send(node[i]._x, node[i]._y, colors.NODE_NOTE);
				}
			}
			if(this._wormhole_key._value)
			{
				if (Math.floor(node[i].wormhole.join('')>0))
				{
					this._grid.send(node[i]._x, node[i]._y, colors.NODE_WORMHOLE);
				}
			}
		}
		for(var i in displayedParticles)
		{
			var this_node = displayedParticles[i];
			this._grid.mask(this_node._x, this_node._y, this_node._status ? colors.PARTICLE_ON : colors.PARTICLE_OFF);
		}
		this._pressed = -1;
	}
	//debug('finished with display_gameboard');
}

GameboardComponent.prototype.display_wormhole = function()
{
	if(this._pressed>-1)
	{
		this.clear_surface();
		var x = node[this._pressed]._x;
		var y = node[this._pressed]._y;
		var current = node[this._pressed].get_single('wormhole');
		this._grid.send(x, y, colors.WORMHOLE_START);
		if(current>0)
		{
			this._grid.send((current-1)%16, Math.floor((current-1)/16), colors.WORMHOLE_END);
		}
	}	
}

GameboardComponent.prototype.clear_surface = function()
{
	if(this._grid!=undefined){this._grid.reset();}
}

GameboardComponent.prototype.start_key_callback = function(obj)
{
	if(obj._value)
	{
		if(this._pressed>-1)
		{
			node[this._pressed].toggle_start();
			this.display_node(this._pressed);
		}					
		else
		{
			this.display_gameboard();
		}
	}
	else
	{
		this.display_gameboard();
	}
}

GameboardComponent.prototype.wormhole_key_callback = function(obj)
{
	//debug('GameboardComponent.wormhole_key_callback:', obj._value, this.held_node_index());
	if(obj._value)
	{
		if(this.held_node_index() >-1)
		{
			this.display_wormhole();
		}
		else
		{
			this.display_gameboard();
		}
	}
	else
	{
		this.display_gameboard();
	}
}

GameboardComponent.prototype._particle = function(particle, num, voice, note, velocity, duration)
{
	//debug('display particle:', particle, num, voice, note, velocity, duration);
	if((this._grid!=undefined)&&(this._pressed==-1))
	{
		var this_node = num ? node[num-1] : undefined;
		var this_part = part[particle-1];
		this_part._status = voice>0;
		this_part.light_node(this_node);
	}
}

GameboardComponent.prototype._offset = function(x, y)
{
	this._offsets = [x, y];
}



function PresetComponent(name, args)
{
	var self = this;
	this._grid = undefined;
	this._dirty = false;
	this._current_pset = 1;
	this._slotlist = [];
	this.add_bound_properties(this, ['_current_pset', '_slotlist', '_storage', '_dirty', '_grid', 'receive_from_storage',
	 								'_update', 'assign_grid', 'display_presets', '_button_press', 'update_preset', 'dirtyStorage']);
	PresetComponent.super_.call(this, name, args);
	debug('storage is:', this._storage);
}

inherits(PresetComponent, Bindable);

PresetComponent.prototype.receive_from_storage = function()
{
	var args = arrayfromargs(arguments);
	debug('Preset.receive_from_storage:', args);
	switch(args[0])
	{
		case 'recall':
			this._current_pset = args[1];
			//var start_node = [];
			Data.restore_to_colls();
			for(var i in node)
			{
				//debug('node update:', i);
				node[i].update();
			}
			debug('finished here...');
			break;
		case 'slotlist':
			this._slotlist = args.slice();
			if(this._slotlist.length==1)
			{
				this._storage.message('store', 1);
			}
			if(this._grid instanceof GridClass){this.display_presets();}
			break;
	}
}

PresetComponent.prototype._update = function()
{
	this._storage&&this._storage.message('getslotlist');
	if(this._grid instanceof GridClass)
	{
		this.display_presets();
	}
}

PresetComponent.prototype.assign_grid = function(grid)
{
	debug('PresetComponent assign grid', grid, grid instanceof GridClass);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
		this._update();
	}
}

PresetComponent.prototype._button_press = function(obj)
{
	var coords = this._grid.button_coords(obj);
	var x = coords[0];
	var y = coords[1];
	var val = obj._value ? 1 : 0;
	//debug('PresetComponent._button_press:', x, y, val);
	debug('recalling', x+(y*16)+1);
	if(this._slotlist.indexOf(x+(y*16)+1)==-1)
	{
		//debug('copying:', preset, x+(y*16)+1);
		this._storage.message('copy', this._current_pset, x+(y*16)+1);
	}
	this._storage.message('getslotlist');
	this._storage.message('recall', x+(y*16)+1);
	this._update();
}

PresetComponent.prototype.display_presets = function()
{
	debug('display_presets');
	this._grid.reset();
	var controls = this._grid.controls();
	for(var i in controls)
	{
		var button = controls[i];
		//debug('button:', button._num, button._name, slotlist.indexOf(button._num)==-1, button._num == preset);
		button.send(this._slotlist.indexOf(button._id+1)==-1 ? 0 : (button._id + 1) == this._current_pset ? 6 : 4);
	}
}

PresetComponent.prototype.dirtyStorage = function()
{
	this._dirty = true;
	tasks.resetTask('update_preset');
	//debug('setting dirty');
}

PresetComponent.prototype.update_preset = function()
{
	//debug('update_preset');
	if(this._dirty)
	{
		debug('updating storage...');
		this._dirty = false;
		this._storage.message('store', this._current_pset);
		debug('storage updated.');
	}
}



function FloatingWindowModule(name, args)
{
	var self = this;
	this._sizeX = 700;
	this._sizeY = 700;
	this._nominimize = false;
	this._noclose = false;
	this._nozoom = false;
	this._nogrow = false;
	this._notitle = false;
	this._float = false;
	this.add_bound_properties(this, ['_toggle', '_obj', '_window_position', '_pcontrol', '_thispatcher', 'lock', 'unlock', 'open', 'close', 'store_window_position']);
	FloatingWindowModule.super_.call(this, name, args);
	this._toggle = new ToggledParameter(this._name + '_Toggle', {'onValue':colors.WHITE, 'offValue':colors.RED, 'value':0, 'callback':this.toggle_window.bind(this)});
}

inherits(FloatingWindowModule, Bindable);

FloatingWindowModule.prototype.open = function()
{
	this._obj.front();
}

FloatingWindowModule.prototype.close = function()
{
	this.store_window_position();
	this._obj.wclose();
}

FloatingWindowModule.prototype.toggle_window = function()
{
	debug('toggle window');
	if(this._toggle._value)
	{
		this.open();
	}
	else
	{
		this.close();
	}
}

FloatingWindowModule.prototype.lock = function()
{
	debug(this._name, 'lock');
	//var pos = settings_thispatcher.getsize();
	var pos = [100, 100, 500, 500];
	if(this._window_position)
	{
		var pos = this._window_position.getvalueof();
		pos[2] = pos[0] + this._sizeX;
		pos[3] = pos[1] + this._sizeY;
	}
	this._obj.window('size', pos[0], pos[1], pos[2], pos[3]);
	this._obj.window('flags', this._nominimize ? 'nominimize' : 'minimize');
	this._obj.window('flags', this._nozoom ? 'nozoom' : 'zoom');
	this._obj.window('flags', this._noclose ? 'noclose' : 'close');
	this._obj.window('flags', this._nogrow ? 'nogrow' : 'grow');
	this._obj.window('flags', this._notitle ? 'notitle' : 'title');
	this._obj.window('flags', this._float ? 'float' : 'nofloat');
	this._obj.window('exec');
}

FloatingWindowModule.prototype.unlock = function()
{
	this._obj.window('flags', 'minimize');
	this._obj.window('flags', 'zoom');
	this._obj.window('flags', 'close');
	this._obj.window('flags', 'grow');
	this._obj.window('flags', 'title');
	this._obj.window('flags', 'nofloat');
	this._obj.window('exec');
}

FloatingWindowModule.prototype.store_window_position = function()
{
	this._thispatcher.message('window', 'getsize');
}



function ProgramWindowComponent(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['_scale_assignments', '_octave_assignments', '_key_assignments', 'program_window_in']);
	ProgramWindowComponent.super_.call(this, name, args);
	this._scale_assignments = ['Major', 'Major', 'Major', 'Major', 'Major', 'Major', 'Major', 'Major'];
	this._octave_assignments = [0, 1, 2, 3, 4, 5, 6, 7];
	this._key_assignments = [0, 0, 0, 0, 0, 0, 0, 0];
}

inherits(ProgramWindowComponent, FloatingWindowModule);

ProgramWindowComponent.prototype.program_window_in = function()
{
	var args = arrayfromargs(arguments);
	debug(this._name + 'program_window_in:', args);
	switch(args[1])
	{
		case 2:
			this._scale_assignments[args[0]] = args.slice(2);
			Scales._update();
			break;
		case 3:
			this._key_assignments[args[0]] = args[2];
			Scales._update();
			break;
		case 5:
			this._octave_assignments[args[0]] = args[2];
			Scales._update();
			break;
	}
}



function ParameterControlModule(name, args)
{
	//debug('making parameters');
	var self = this;
	this._controlsObjs = [];
	this._nameObjs = [];
	this._valueObjs = [];
	this._defs = [];
	this.add_bound_properties(this, ['_initialize', 'receive', 'controls', '_lcd']);
	ParameterControlModule.super_.call(this, name, args);
	this._initialize();
	this.open();
}

inherits(ParameterControlModule, FloatingWindowModule);

ParameterControlModule.prototype._initialize = function()
{
	this._window_position = this._obj.subpatcher().getnamed('window_position');
	this._thispatcher = this._obj.subpatcher().getnamed('parameter_controls_thispatcher');
	var Encoders = ['Encoder_0', 'Encoder_1', 'Encoder_2', 'Encoder_3', 'Encoder_4', 'Encoder_5', 'Encoder_6', 'Encoder_7', 'Encoder_8', 'Encoder_9', 'Encoder_10', 'Encoder_11', 'Encoder_12', 'Encoder_13', 'Encoder_14', 'Encoder_15'];
	for(var i=0;i<16;i++)
	{
		this._controlsObjs[Encoders[i]] = this._obj.subpatcher().getnamed('paramDial['+i+']');
		this._nameObjs[Encoders[i]] = this._obj.subpatcher().getnamed('name['+i+']');
		this._valueObjs[Encoders[i]] = this._obj.subpatcher().getnamed('value['+i+']');
	}
	this._nameObjs.device_name = this._obj.subpatcher().getnamed('device_name');
}

ParameterControlModule.prototype.receive = function(num, val)
{
	//debug(this._name, 'receive:', num, val);
	if(num=='position')
	{
		var args = arrayfromargs(arguments);
		//debug(this._name, 'setting window position:', args.slice(1));
		this._window_position.message('set', args.slice(1));
	}
	else if(num=='goto')
	{
		Device.hilight_current_device();
	}
	else
	{
		mod.Send('receive_device_proxy', 'set_mod_parameter_value', num, val);
	}
}

ParameterControlModule.prototype._lcd = function(obj, type, val)
{
	//debug('lcd', obj, type, val, '\n');
	if((type=='lcd_name')&&(val!=undefined))
	{
		if(this._nameObjs[obj])
		{
			this._nameObjs[obj].message('set', val.replace(/_/g, ' '));
		}
	}
	else if((type == 'lcd_value')&&(val!=undefined))
	{
		if(this._valueObjs[obj])
		{
			this._valueObjs[obj].message('set', val.replace(/_/g, ' '));
		}
	}
	else if((type == 'encoder_value')&&(val!=undefined))
	{
		if(this._controlsObjs[obj])
		{
			this._controlsObjs[obj].message('set', val);
		}
	}
}



RegisteredRangedParameter = function(name, args)
{
	this._parameter = undefined;
	this.add_bound_properties(this, ['_num', '_parameter', '_polyobj', '_registry', '_update_parameter']);
	RegisteredRangedParameter.super_.call(this, name, args);
	if(this._registry)
	{
		this.register(this._registry);
	}
	//this.add_bound_properties(this, ['_Callback']);
}

inherits(RegisteredRangedParameter, RangedParameter);

RegisteredRangedParameter.prototype.register = function(registry)
{
	if(registry.indexOf(this)==-1)
	{
		registry.push(this);
	}
}

RegisteredRangedParameter.prototype.relink = function(node, parameter)
{
	this._parameter = parameter;
	debug('relink to node:', node._name, this._parameter, this._num, node.get_single(this._parameter, this._num));
	//this.set_value(node.get_single(this._parameter, this._num));
	//this._polyobj.message('set', this._value);
	var val = node.get_single(this._parameter, this._num);
	this._value = val;
	this._polyobj.message('set', this._value*16);
}

RegisteredRangedParameter.prototype._Callback = function(obj)
{
	if(obj._value!=undefined)
	{
		if(this._javaObj)
		{
			//debug('Callback', self._name, obj._value);
			this._javaObj.set(obj._value, this._range);
		}
		else
		{
			//debug('Callback', 'received:', self._name, obj._value, 'forwarding:', Math.round((obj._value/127)*this._range) );
			this.receive(Math.round((obj._value/127)*this._range));
		}
	}
}

RegisteredRangedParameter.prototype._update_parameter = function()
{
	debug(this._name + '.update_parameter:', this._parameter, this._value);
}



RegisteredRangedMultidial = function(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['_callback']);
	RegisteredRangedMultidial.super_.call(this, name, args);
}

inherits(RegisteredRangedMultidial, RegisteredRangedParameter);

RegisteredRangedMultidial.prototype._callback = function(obj)
{
	//debug(this._name + '._callback:', this._parameter, obj._value, this._num);
	Editor.current_edit().set_single(this._parameter, obj._value, this._num);
}



var PARAMETERS = ['note', 'bank', 'duration', 'velocity'];

function EditorComponent(name, args)
{
	var self = this;
	this._parameterObjs = [];
	this._selected_node = new RadioComponent(this._name + '_SelectedNode', 1, 256, 1, this.select_node.bind(this), colors.RED, colors.CYAN, {'value':1});
	this.current_edit = function(){return node[this._selected_node._value-1];}
	this.add_bound_properties(this, ['_parameter', 'select_node', 'update', '_parameterObjs', 'editor_in', '_selector', '_dial0', '_dial1', '_dial2', '_dial3', '_dial4', '_dial5', '_dial6', '_dial7']);
	EditorComponent.super_.call(this, name, args);
	this._thispatcher = plinko_editor.subpatcher().getnamed('thispatcher');
	this._window_position = plinko_editor.subpatcher().getnamed('window_position');

	
	var make_dial_callback = function(polyobj, dial)
	{
		var func = function(obj)
		{
			debug('setting:', polyobj, obj._value*16);
			debug('this:', this, 'name:', this._name);
			//polyobj.message('set', obj._value*16);
			//dial._update_parameter();
			
		}
		return func;
	}

	this._parameter = new RadioComponent(this._name + '_Parameter', 0, 3, 0, this.update, colors.WHITE, colors.MAGENTA, {'value':0});

	this._dial0 = new RegisteredRangedMultidial(this._name + '_Dial0', {'num': 0, 'parameter':'note', 'polyobj':multidial0, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial0)});
	this._dial1 = new RegisteredRangedMultidial(this._name + '_Dial1', {'num': 1, 'parameter':'note', 'polyobj':multidial1, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial1)});
	this._dial2 = new RegisteredRangedMultidial(this._name + '_Dial2', {'num': 2, 'parameter':'note', 'polyobj':multidial2, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial2)});
	this._dial3 = new RegisteredRangedMultidial(this._name + '_Dial3', {'num': 3, 'parameter':'note', 'polyobj':multidial3, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial3)});
	this._dial4 = new RegisteredRangedMultidial(this._name + '_Dial4', {'num': 4, 'parameter':'note', 'polyobj':multidial4, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial4)});
	this._dial5 = new RegisteredRangedMultidial(this._name + '_Dial5', {'num': 5, 'parameter':'note', 'polyobj':multidial5, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial5)});
	this._dial6 = new RegisteredRangedMultidial(this._name + '_Dial3', {'num': 6, 'parameter':'note', 'polyobj':multidial6, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial6)});
	this._dial7 = new RegisteredRangedMultidial(this._name + '_Dial4', {'num': 7, 'parameter':'note', 'polyobj':multidial7, 'registry':this._parameterObjs, 'range':8});// 'callback':make_dial_callback(multidial7)});
	this._dials = function(index){return [this._dial0, this._dial1, this._dial2, this._dial3, this._dial4, this._dial5, this._dial6, this._dial7][index];}

	this.lock();	
	//this.close();
}

inherits(EditorComponent, FloatingWindowModule)


EditorComponent.prototype.update = function()
{
	var node = this.current_edit();
	debug(this._name + '.update:', this._parameter._value, PARAMETERS[this._parameter._value]);
	for(var i in this._parameterObjs)
	{
		this._parameterObjs[i].relink(node, PARAMETERS[this._parameter._value]);
	}
}

EditorComponent.prototype.editor_in = function()
{
	var args = arrayfromargs(arguments);
	//debug('Editor.editor_in:', args);
	switch(args[0])
	{
		case 'position':
			this._window_position.setvalueof([args[1], args[2], args[3], args[4]]);
			break;
		case 'dial':
			//debug('dial:', args[1], args[2]);
			Alive&&this._dials(args[1])._Callback({_value:args[2]});
			break;
		case 'selector':
			Alive&&this._parameter.receive(args[1]);
			break;
		default:
			break;
	}
}

EditorComponent.prototype.select_node = function(obj)
{
	debug(this._name + '.select_node:', obj._value);
	//this._selected_node.set_value(obj._value);
	this.update();
}



var PLINKO_BANKS = {'Other':[['ModDevice_length', 'ModDevice_timing', 'ModDevice_timingmultiplier', 'ModDevice_swing', 'None', 'ModDevice_bank', 'ModDevice_voice', 'ModDevice_plane']]}
for(var i=0;i<8;i++)
{
	PLINKO_BANKS.Other.push(['ModDevice_bank'+(i+1)+'_mode', 'ModDevice_bank'+(i+1)+'_scale', 'ModDevice_bank'+(i+1)+'_8ve', 'ModDevice_bank'+(i+1)+'_key', 'ModDevice_bank'+(i+1)+'_velocity', 'ModDevice_bank'+(i+1)+'_duration', 'ModDevice_bank'+(i+1)+'_channel']);
}

DeviceModule = function(name, args)
{
	var self = this;
	this._device_id = 0;
	this._local_menu_items = [];
	this._menu_items = [];
	this.add_bound_properties(this, ['_assigned_device', 'update_note_assignment', '_dict', '_DrumRack_container', '_menu_items', '_local_menu_items', 'select_controlled_device', 'clear_controlled_device', 'update_device_bank_options', 'setup_banks', 'update', 'setup_device', 'select_pad_device', 'detect_drumrack', 'select_parameter', 'clear_parameter', 'parameter_name_from_id', 'update_remote_targets']);
	DeviceModule.super_.call(this, name, args);
	this._current_bank_definitions = [];
	this._bank_names = Object.keys(PLINKO_BANKS);
	this._bank_chooser = new RadioComponent(this._name + '_BankChooser', 0, 7, 0, this.update, colors.RED, colors.YELLOW, {value:0});
	this.setup_device();
}

inherits(DeviceModule, Bindable);

DeviceModule.prototype.setup_device = function()
{

	mod.Send('receive_device', 'set_mod_device_type', 'Plinko');
	mod.Send( 'receive_device', 'set_number_params', 16);
	for(var dev_type in PLINKO_BANKS)
	{
		for(var bank_num in PLINKO_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, PLINKO_BANKS[dev_type][bank_num]);
		}
	}
	
	//this._local_menu_items = ['Automatic Assignment', 'Mod_Chain_Pan', 'Mod_Chain_Vol', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3'];
	this._local_menu_items = [];
	/*var num = 0;
	for(var i in DEVICE_BANK_ENTRIES)
	{
		this._local_menu_items[num] = DEVICE_BANK_ENTRIES[i];
		num+=1;
	}*/
	this._finder.goto('this_device');
	this._this_device_id = parseInt(this._finder.id);
	var params = this._finder.get('parameters').filter(function(element){return element !== 'id';});
	for(var i in params)
	{
		this._finder.id = parseInt(params[i]);
		this._local_menu_items.push(this._finder.get('name'));
	}
	debug('local_menu_items:', this._local_menu_items);
	this.update_device_component();
	//Data.set('DeviceEntries', jsobj_to_dict(this._local_menu_items));
	//Data._obj.message('edit');
}

DeviceModule.prototype.update = function()
{
	//debug(this._name+'_update:', this._bank_chooser._value);
	mod.SendDirect('receive_device_proxy', 'set_mod_device_bank', this._bank_chooser._value+1);
	Scales._update();
}

DeviceModule.prototype._build_device_bank = function()
{
	//debug('_build_device_bank');
	for(var i in PLINKO_BANKS)
	{
		this._current_bank_definitions[i] = [];
		for(var j in PLINKO_BANKS[i][0])
		{
			var def_num = this._current_bank_device_selections[j];
			var def = (def_num == 0)||(def_num == undefined)||(def_num>this._menu_items.length) ? PLINKO_BANKS[i][0][j] : this._menu_items[def_num] != undefined ? this._menu_items[def_num] : 'undefined';
			this._current_bank_definitions[i][j] = def+'';
		}
	}
}

DeviceModule.prototype.set_device_bank_item = function(num, val)
{
	//debug('set_device_bank_item', num, val);
	this._current_bank_device_selections[num] = val;
	//this._dict.set('Zone_'+ZoneSettings._zone_index+'::Menus', this._current_bank_device_selections);
	this._build_device_bank();
	this._send_current_device_bank();
	this.update_device_component();
}

DeviceModule.prototype.update_device_component = function()
{
	//debug('update_device_component');
	if(this._this_device_id>0)
	{
		mod.Send( 'send_explicit', 'receive_device_proxy', 'set_mod_device_parent', 'id', this._this_device_id, 1);
	}
}

DeviceModule.prototype._send_current_device_bank = function()
{
	for(var dev_type in this._current_bank_definitions)
	{
		//debug('sending:', dev_type, this._current_bank_definitions[dev_type]);
		mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, 0, this._current_bank_definitions[dev_type]);
		//mod.Send('receive_device_proxy', 'update_parameters');
	}
}

DeviceModule.prototype.select_parameter = function(poly_num)
{
	this._finder.goto('live_set', 'view', 'selected_parameter');
	storageTask=true;
	this.update();
}

DeviceModule.prototype.clear_parameter = function(poly_num)
{
	this.update();
	storageTask = true;
}

DeviceModule.prototype.parameter_name_from_id = function(id)
{
	var new_name = 'None';
	this._finder.id = parseInt(id);
	if(id > 0)
	{
		var new_name = [];
		new_name.unshift(this._finder.get('name'));
		this._finder.goto('canonical_parent');
		this._finder.goto('canonical_parent');
		new_name.unshift(' || ');
		new_name.unshift(this._finder.get('name'));
		new_name = new_name.join('');
		new_name = new_name.slice(0, 25);
	}
	return new_name;
}

DeviceModule.prototype.device_name_from_id = function(id)
{
	var new_name = 'None';
	this._finder.id = parseInt(id);
	if(id > 0)
	{
		var new_name = [];
		new_name.unshift(this._finder.get('name'));
		this._finder.goto('canonical_parent');
		//this._finder.goto('canonical_parent');
		new_name.unshift(' || ');
		new_name.unshift(this._finder.get('name'));
		new_name = new_name.join('');
		new_name = new_name.slice(0, 25);
	}
	return new_name;
}

DeviceModule.prototype._DrumRack_container = function(id)
{
	var finder = this._finder;
	finder.id = id;
	var recurse = function(id)
	{
		if(id == 0)
		{
			return 0;
		}
		finder.goto('canonical_parent');
		if(finder.type=='RackDevice')
		{
			if(finder.get('can_have_drum_pads'))
			{
				return parseInt(finder.id);
			}
		}
		else if(finder.type=='Track')
		{
			return 0;
		}
		else
		{
			return recurse(id);
		}
	}
	return recurse(id);
}

DeviceModule.prototype._DrumRack_chain = function(id)
{
	//debug('..........DrumRack_chain:', id);
	var finder = this._finder;
	finder.id = id;
	var recurse = function(id)
	{
		if(id == 0)
		{
			return -1;
		}
		finder.goto('canonical_parent');
		//debug('type is:', finder.type);
		if(finder.type=='DrumChain')
		{
			var path = finder.path.split(' ');
			//debug('path:', path);
			return parseInt(path[path.length-1]);
		}
		else if(finder.type=='Track')
		{
			return -1;
		}
		else
		{
			return recurse(id);
		}
	}
	return recurse(id);
}

DeviceModule.prototype.hilight_current_device = function()
{
	this._finder.id = parseInt(mod.modClientID);
	var id = this._finder.get('assigned_device')[1];
	this._finder.id = parseInt(id);
	//debug('current device is:', this._finder.get('name'));
	this._finder.goto('live_set view');
	this._finder.call('select_device', 'id', id);
}



function TreeComponent(name, args)
{
	var self = this;
	this.add_bound_properties(this, []);
	TreeComponent.super_.call(this, name, args);
}

inherits(TreeComponent, Bindable)



LatchingToggledParameterBehaviour = function(parent_parameter_object)
{
	var self = this;
	var parent = parent_parameter_object;
	this.press_immediate = function(button)
	{
		parent.receive(Math.abs(parent._value-1));
	}
	this.press_delayed = function(button)
	{
	}
	this.release_immediate = function(button)
	{
	}
	this.release_delayed = function(button)
	{
		parent.receive(0);
	}
}


LatchingToggledParameter = function(name, args)
{
	var self = this;
	this._timered = function()
	{
		//debug('timered...', arguments[0]._name);
		button = arguments[0];
		if(button&&button.pressed())
		{
			this._behaviour.press_delayed(button);
		}
	}
	this._behaviour_timer = new Task(this._timered, this);
	this.add_bound_properties(this, ['_behaviour_timer', '_timered', ]);
	this._behaviour = this._behaviour!= undefined ? new this._behaviour(this) : new LatchingToggledParameterBehaviour(this);
	this._press_delay = this._press_delay ? this._press_delay : PRS_DLY;
	LatchingToggledParameter.super_.call(this, name, args);
}

inherits(LatchingToggledParameter, ToggledParameter);

LatchingToggledParameter.prototype._Callback = function(button)
{
	if(button.pressed())
	{
		if(this._behaviour_timer.running)
		{
			this._behaviour_timer.cancel();
		}
		this._behaviour.press_immediate(button);
		this._behaviour_timer.arguments = button;
		this._behaviour_timer.schedule(this._press_delay);
	}
	else
	{
		if(this._behaviour_timer.running)
		{
			this._behaviour_timer.cancel();
			this._behaviour.release_immediate(button);
		}
		else
		{
			this._behaviour.release_delayed(button);
		}
	}
	this.notify();
}



ScalesModule = function(parameters)
{
	var self = this;
	this.add_bound_properties(this, ['_current_scale', '_button_press', '_update', 'assign_grid', '_grid', '_pressed_color', 'width', 'height', 'colors', '_output_target', 'chord_display']);
	this.colors = PushColors;
	this._current_scale = 'Chromatic';
	this._pressed_color = this.colors.GREEN;
	this._chord_color = this.colors.RED;
	this.chord_display = -1;
	this._grid = undefined;
	this._grid_function = function(){}
	this.width = function(){return  !this._grid ? 0 : this._grid.width();}
	this.height = function(){return !this._grid ? 0 : this._grid.height();}
	this._NOTENAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'];
	this.NOTENAMES = [];
	for(var i=0;i<128;i++)
	{
		this.NOTENAMES[i]=(this._NOTENAMES[i%12] + ' ' + (Math.floor(i/12)-2) );
	}
	this.WHITEKEYS = {0:0, 2:2, 4:4, 5:5, 7:7, 9:9, 11:11, 12:12};
	//this.NOTES = [24, 25, 26, 27, 28, 29, 30, 31, 16, 17, 18, 19, 20, 21, 22, 23, 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7];
	//this.DRUMNOTES = [12, 13, 14, 15, 28, 29, 30, 31, 8, 9, 10, 11, 24, 25, 26, 27, 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 16, 17, 18, 19];
	//this.SCALENOTES = [36, 38, 40, 41, 43, 45, 47, 48, 24, 26, 28, 29, 31, 33, 35, 36, 12, 14, 16, 17, 19, 21, 23, 24, 0, 2, 4, 5, 7, 9, 11, 12];
	this.KEYCOLORS = [this.colors.OFF, this.colors.WHITE, this.colors.CYAN, this.colors.BLUE, this.colors.RED, this.colors.RED, this.colors.RED, this.colors.RED];
	this.SCALES = 	{'Chromatic':[0,1,2,3,4,5,6,7,8,9,10,11],
				'Major':[0,2,4,5,7,9,11],
				'Minor':[0,2,3,5,7,8,10],
				'Dorian':[0,2,3,5,7,9,10],
				'Mixolydian':[0,2,4,5,7,9,10],
				'Lydian':[0,2,4,6,7,9,11],
				'Phrygian':[0,1,3,5,7,8,10],
				'Locrian':[0,1,3,4,7,8,10],
				'Diminished':[0,1,3,4,6,7,9,10],
				'Whole-half':[0,2,3,5,6,8,9,11],
				'Whole Tone':[0,2,4,6,8,10],
				'Minor Blues':[0,3,5,6,7,10],
				'Minor Pentatonic':[0,3,5,7,10],
				'Major Pentatonic':[0,2,4,7,9],
				'Harmonic Minor':[0,2,3,5,7,8,11],
				'Melodic Minor':[0,2,3,5,7,9,11],
				'Dominant Sus':[0,2,5,7,9,10],
				'Super Locrian':[0,1,3,4,6,8,10],
				'Neopolitan Minor':[0,1,3,5,7,8,11],
				'Neopolitan Major':[0,1,3,5,7,9,11],
				'Enigmatic Minor':[0,1,3,6,7,10,11],
				'Enigmatic':[0,1,4,6,8,10,11],
				'Composite':[0,1,4,6,7,8,11],
				'Bebop Locrian':[0,2,3,5,6,8,10,11],
				'Bebop Dominant':[0,2,4,5,7,9,10,11],
				'Bebop Major':[0,2,4,5,7,8,9,11],
				'Bhairav':[0,1,4,5,7,8,11],
				'Hungarian Minor':[0,2,3,6,7,8,11],
				'Minor Gypsy':[0,1,4,5,7,8,10],
				'Persian':[0,1,4,5,6,8,11],
				'Hirojoshi':[0,2,3,7,8],
				'In-Sen':[0,1,5,7,10],
				'Iwato':[0,1,5,6,10],
				'Kumoi':[0,2,3,7,9],
				'Pelog':[0,1,3,4,7,8],
				'Spanish':[0,1,3,4,5,6,8,10]};
	this.SCALENAMES = [];
	var i = 0;
	for (var name in this.SCALES){this.SCALENAMES[i] = name;i++};
	this._noteMap = new Array(256);
	for(var i=0;i<256;i++)
	{
		this._noteMap[i] = [];
	}
	this.DEFAULT_SCALE = 'Chromatic';
	this.SPLIT_SCALES = {}; //{'DrumPad':1, 'Major':1};

	this._vertOffset = new OffsetComponent(this._name + '_Vertical_Offset', 0, 119, 4, self._update.bind(this), colors.MAGENTA);
	this._scaleOffset = new OffsetComponent(this._name + '_Scale_Offset', 0, self.SCALES.length, 0, self._update.bind(this), colors.BLUE);
	this._noteOffset = new OffsetComponent(this._name + '_Note_Offset', 0, 12, 0, self._update.bind(this), colors.CYAN);
	this._octaveOffset = new OffsetComponent(this._name + '_Octave_Offset', 0, 119, 0, self._update.bind(this), colors.YELLOW, colors.OFF, 12);
	this._assignMode = new LatchingToggledParameter(this._name + '_AssignMode', {'onValue':colors.MAGENTA, 'offValue':colors.WHITE, 'value':0});
	ScalesModule.super_.call(this, 'ScalesModule');
}

inherits(ScalesModule, Bindable);

ScalesModule.prototype.set_grid_function = function(func){this.grid_function = func;}

ScalesModule.prototype.assign_grid = function(grid)
{
	debug('ScalesClass assign grid', grid);
	if(this._grid instanceof GridClass)
	{
		this._grid.clear_translations();
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
		/*if(!(this._last_pressed_button instanceof ButtonClass))
		{
			this._last_pressed_button = this._grid.get_button(0, this._grid.height()-1);
		}*/
	}
	this._update();
}

ScalesModule.prototype._button_press = function(button)
{
	if(button.pressed())
	{
		messnamed(unique+''+(Device._bank_chooser._value+1)+'_decode_thru', button._translation, button._value);
		button.send(this._pressed_color);
	}
	else
	{
		messnamed(unique+''+(Device._bank_chooser._value+1)+'_decode_thru', button._translation, 0);
		button.send(button.scale_color);
	}
}

ScalesModule.prototype._update = function()
{
	//debug('Scales._update'); //\n', arguments.callee.caller.toString());//, this, Scales);
	if(this._grid instanceof GridClass)
	{
		this._update_request = false;
		this._noteMap = [];
		for(var i=0;i<128;i++)
		{
			this._noteMap[i] = [];
		}
		//debug('grid:', this._grid, this._grid instanceof GridClass);
		if(this._grid instanceof GridClass)
		{
			var width = this.width();
			var height = this.height();
			var bank = Device._bank_chooser._value;
			//var offset = this._noteOffset._value + this._octaveOffset._value;
			var offset = ProgramWindow._key_assignments[bank] + (ProgramWindow._octave_assignments[bank]*12);
			debug('width:', width, 'height:', height, 'offset:', offset);
			var vertoffset = this._vertOffset._value;
			//var scale = this.SCALENAMES[this._scaleOffset._value];
			var scale = ProgramWindow._scale_assignments[bank];
			//debug('new scale is:', scale);
			this._current_scale = scale;
			var scale_len = this.SCALES[scale].length;
			for(var column=0;column<width;column++)
			{
				for(var row=0;row<height;row++)
				{
					var note_pos = column + (Math.abs((height-1)-row))*parseInt(vertoffset);
					var note = offset + this.SCALES[scale][note_pos%scale_len] + (12*Math.floor(note_pos/scale_len));
					var button = this._grid.get_button(column, row);
					if(button)
					{
						button.set_translation(note%127);
						this._noteMap[note%127].push(button);
						//debug(button._name, 'translation:', button._translation, 'scale_color:');
						button.scale_color = this.KEYCOLORS[((note%12) in this.WHITEKEYS) + (((note_pos%scale_len)==0)*2)];
						button.send(button.scale_color, true);
					}
				}
			}
		}
	}
	//debug('ending Scale update');
}



forceload(this);






function SnapshotComponent(name, args)
{
	var self = this;
	this._grid = undefined;
	this._dirty = false;
	this._current_pset = 0;
	this._slotlist = [];
	this._snapshot = new SnapshotAPI('patcher');
	this._number_presets = this._snapshot.getnumsnapshots();
	this.add_bound_properties(this, ['_snapshot', '_number_presets', '_storage', 'dirty', '_grid', 'receive_from_storage',
	 								'_update', 'assign_grid', 'display_presets', '_button_press']);
	SnapshotComponent.super_.call(this, name, args);
	//this._snapshot_chooser = new RadioComponent(this._name + '_SnapshotChooser', 0, 8, 0, function(){}, colors.BLUE, colors.RED, {'value':0});
	debug('storage is:', this._storage);
}

inherits(SnapshotComponent, Bindable);

SnapshotComponent.prototype.receive_from_storage = function()
{

}

SnapshotComponent.prototype._update = function()
{
	this._number_presets = this._snapshot.getnumsnapshots();
	debug('number presets:', this._number_presets);
	if(this._grid instanceof GridClass)
	{
		this.display_presets();
	}
}

SnapshotComponent.prototype.assign_grid = function(grid)
{
	debug('SnapshotComponent assign grid', grid, grid instanceof GridClass);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
		this._update();
	}
}

SnapshotComponent.prototype._button_press = function(obj)
{
	var coords = this._grid.button_coords(obj);
	var x = coords[0];
	var y = coords[1];
	var val = obj._value ? 1 : 0;
	var index = x+(y*16)+1;
	if(index > this._number_presets)
	{
		debug('adding snapshot...');
		this._snapshot.snapshot();
		//this._snapshot.addsnapshot(undefined, index, undefined);
	}
	else
	{
		this._snapshot.restore(index);
	}
	this._update();
}

SnapshotComponent.prototype.display_presets = function()
{
	//debug('display_presets');
	this._grid.reset();
	var controls = this._grid.controls();
	for(var i in controls)
	{
		var button = controls[i];
		//debug('button:', button._num, button._name, slotlist.indexOf(button._num)==-1, button._num == preset);
		button.send(button._id+1 <= this.__number_presets ? 0 : (button._id + 1) == this._current_pset ? 6 : 4);
	}
}

SnapshotComponent.prototype.dirtyStorage = function()
{
	this._dirty = true;
	tasks.resetTask('update_preset');
	//debug('setting dirty');
}

SnapshotComponent.prototype.update_preset = function()
{
	//debug('update_preset');
	if(this._dirty)
	{
		//debug('updating storage...');
		dirty = false;
		this._storage.message('store', current_pset);
		//debug('storage updated.');
	}
}





/*
var SKIN_BANKS = {'InstrumentGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'DrumGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'MidiEffectGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'Other':[['None', 'None', 'None', 'None', 'None', 'None', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']],
			'Operator':[['Osc-A Level', 'Osc-B Level', 'Osc-C Level', 'Osc-D Level', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'UltraAnalog':[['AEG1 Attack', 'AEG1 Decay', 'AEG1 Sustain', 'AEG1 Rel', 'OSC1 Semi', 'F1 Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'OriginalSimpler':[['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'MultiSampler':[['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'LoungeLizard':[['M Force', 'F Release', 'F Tone Decay', 'F Tone Vol', 'Semitone', 'P Distance', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'StringStudio':[['E Pos', 'Exc ForceMassProt', 'Exc FricStiff', 'Exc Velocity', 'Semitone', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'Collision':[['Noise Attack', 'Noise Decay', 'Noise Sustain', 'Noise Release', 'Res 1 Tune', 'Res 1 Brightness', 'None', 'Mod_Chain_Vol','ModDevice_chord_channel',  'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'InstrumentImpulse':[['1 Start', '1 Envelope Decay', '1 Stretch Factor', 'Global Time', 'Global Transpose', '1 Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']], 
			'NoDevice':[['None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'ModDevice_zone',  'ModDevice_color', 'ModDevice_chord_channel',  'ModDevice_modify_target', 'ModDevice_toggle_note', 'ModDevice_thru', 'ModDevice_sustain', 'ModDevice_mask']]}
*/

/*
		"0" : "Device On",
		"1" : "length",
		"2" : "timing",
		"3" : "timingmultiplier",
		"4" : "swing",
		"5" : "bank",
		"6" : "voice",
		"7" : "plane",
*/





//Chromatic Major Minor Dorian Mixolydian Lydian Phrygian Locrian Diminished Whole-half "Whole Tone" "Minor Blues" "Minor Pentatonic" "Major Pentatonic" "Harmonic Minor" "Melodic Minor" "Dominant Sus" "Super Locrian" "Neopolitan Minor" "Neopolitan Major" "Enigmatic Minor" "Enigmatic" Composite "Bebop Locrian" "Bebop Dominant" "Bebop Major" Bhairav "Hungarian Minor" "Minor Gypsy" Persian Hirojoshi In-Sen Iwato Kumoi Pelog Spanish