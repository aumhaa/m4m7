autowatch = 1;


aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = false;
aumhaa.init(this);
var script = this;

var unique = jsarguments[1];

var finder;
var chain_selector_macro;
var param_min;
var param_max;
var param_range;
var program_number;

function init()
{
	debug('chainSelector init');

	if(!finder)
	{
		script['finder'] = new LiveAPI(function(){}, 'this_device');
	}
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
		finder.goto('parameters', 1);
		debug('target is:', target_id, 'path:', finder.path);
		param_min = finder.get('min');
		param_max = finder.get('max');
		param_range = param_max - param_min;
	}
	else
	{
		debug('target device not found');
	}
	program_number = this.patcher.getnamed('program_number');
	deprivatize_script_functions(this);
	Alive = true;
}

function program_change(val)
{
	if(finder.id != 0)
	{
		val = Math.min(127, Math.max(0, val)); ///param_range)+param_min;
		debug('program_change:', val);
		debug('setting first Macro parameter to value of:', val);
		//finder.value = Math.floor(val);
		finder.set('value', val);
	}
	else
	{
		debug('No device, program_change:', val);
	}
}

function anything()
{
	var args = arrayfromargs(messagename, arguments);
	debug('anything:', args);
}


forceload(this);