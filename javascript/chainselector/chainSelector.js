autowatch = 1;


aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = false;
var PSET_WINDOWS = false;
aumhaa.init(this);
var script = this;

var unique = jsarguments[1];

function Param(id)
{
	this._original_id = id;
	this.min=0;
	this.max=1;
	this.range=1;
	this._value = 0;
	this.api_obj = new LiveAPI(this.callback, 'live_set');
	this.api_obj.id = Math.floor(id);
	if(this.api_obj instanceof LiveAPI)
	{
		debug('building Param object defs.');
		this.min = this.api_obj.get('min');
		this.max = this.api_obj.get('max');
		this.range = this.max-this.min;
		this._value = this.api_obj.get('value');
		this._name = this.api_obj.get('name');
		//this.property = 'value';
		debug('props:', this._name, this._value, this.min, this.max, this.range);
	}
}

Param.prototype.callback = function(args)
{
	debug(this._original_id, 'callback:', args);
}

Param.prototype.get_value = function()
{
	debug('get_value:', this._name);
	var value = this.api_obj.get('value');
	return parseFloat(value);
}

Param.prototype.set_value = function(val)
{
	debug('set_value:', this._name, val);
	this.api_obj.set('value', val);
}


var storage;
var macros;
var finder;
var chain_selector_macro;
var params = [];
var param_min;
var param_max;
var param_range;
var program_number;
var current_pset = 1;

function init()
{
	debug('chainSelector init');

	storage = this.patcher.getnamed('storage');
	macros = this.patcher.getnamed('macros');
	program_number = this.patcher.getnamed('program_number');
	current_preset = program_number.getvalueof();
	debug('current_preset = ', current_preset);
	script['finder'] = new LiveAPI(function(){}, 'this_device');
	debug('finder id is:', finder.id);
	this_device_id = Math.floor(finder.id);
	finder.goto('canonical_parent');
	debug('finder path is now:', finder.path);
	var device_ids = finder.get('devices').filter(function(element){return element !== 'id';});
	var this_device_index = device_ids.indexOf(this_device_id);
	debug('device_ids:', device_ids, 'this_device_index:', this_device_index);
	var target_id = device_ids[this_device_index] ? device_ids[this_device_index + 1]: 0;
	debug('target_id:', target_id);
	if(target_id)
	{
		finder.id = target_id;
		chain_selector_macro = new LiveAPI(function(){}, 'this_device');
		chain_selector_macro.id = target_id;
		chain_selector_macro.goto('parameters', 1);
		debug('target is:', target_id, 'path:', chain_selector_macro.path);
		param_min = chain_selector_macro.get('min');
		param_max = chain_selector_macro.get('max');
		param_range = param_max - param_min;
		var parameter_ids = finder.get('parameters').filter(function(element){return element !== 'id';});
		debug('parameter_ids', parameter_ids);
		for(var i=0;i<7;i++)
		{
			var id = parameter_ids[i+2] ? parameter_ids[i+2] : 0;
			params[i] = new Param(id);
		}
		deprivatize_script_functions(this);
	}
	else
	{
		debug('target device not found');
	}
	Alive = true;
	PSET_WINDOWS&&storage.message('clientwindow');
	PSET_WINDOWS&&storage.message('storagewindow');
}

function program_change(val)
{
	if(finder.id != 0)
	{
		val = Math.min(127, Math.max(0, val)); ///param_range)+param_min;
		debug('program_change:', val);
		debug('setting first Macro parameter to value of:', val);
		//finder.value = Math.floor(val);
		chain_selector_macro.set('value', val);
		current_preset = val+1;
		storage.message('recall', current_preset);
		load();
	}
	else
	{
		debug('No device, program_change:', val);
	}
}

function _store()
{
	var new_preset = [];
	for(var i=0;i<7;i++)
	{
		new_preset[i] = params[i].get_value();
	}
	debug('new_preset:', new_preset);
	storage.message('store', current_preset);
	storage.setstoredvalue('macros', current_preset, new_preset);
	
}

function _load()
{
	storage.getstoredvalue('macros', current_preset);
	debug('load_pset');
}

function _preset_in()
{
	var args = arrayfromargs(arguments);
	debug('preset_in:', args);
	if(args[0]=='macros')
	{
		load_preset = args.slice(1,8);
		debug('load_preset:', load_preset);
		for(var i=0;i<7;i++)
		{
			params[i].set_value(load_preset[i]);
		}
	}
}

function _init_pset()
{
	storage.message('delete', current_preset);
}

function anything()
{
	var args = arrayfromargs(messagename, arguments);
	debug('anything:', args);
}


forceload(this);