autowatch = 1;


inlets = 1;
outlets = 1;

var script = this;
var finder;
var scene_fire;
var scenes;
var scene_offset;
var m4lcomp = 0;
var PO10=new RegExp(/(PO10)/);
var control_names = [];
var controls = {};
var excluded = ['control', 'control_names', 'done'];
var control_surface_type = 'PO10';

var DEBUG = false;
var debug = (DEBUG&&Debug) ? Debug : function(){};

var FORCELOAD = false;
var forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

function endsWith(str, suffix) 
{
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function init()
{
	debug('kills init');
	finder = new LiveAPI(callback, 'control_surfaces');
	var number_children = parseInt(finder.children[0]);
	debug('control_surfaces length:', number_children);
	for(var i=0;i<number_children;i++)
	{
		debug('Checking control surface #:', i);
		finder.goto('control_surfaces', i);
		debug('type is:', finder.type);
		if(finder.type == control_surface_type)
		{
			debug('found PO10.');
			scene_offset = new LiveAPI(null_callback, 'control_surfaces', i, 'components', 0);
			scenes = new LiveAPI(null_callback, 'live_set');
			scene_fire = new LiveAPI(scene_fire_callback, 'control_surfaces', i);
			num_controls = parseInt(finder.getcount('controls'));
			for(var j=0;j<num_controls;j++)
			{
				scene_fire.goto('controls', j);
				debug('control name:', scene_fire.get('name'));
				var name = scene_fire.get('name');
				if(name == 'Button_28')
				{
					scene_fire.property = 'value';
					break;
				}
				else
				{
					scene_fire.path = 'control_surfaces '+i;
				}
			}
			for(var i in script)
			{
				if((/^_/).test(i))
				{
					//debug('replacing', i, '\n');
					script[i.replace('_', "")] = script[i];
				}
			}
			break;
		}
	}
}

function null_callback(){}

function scene_fire_callback(args)
{
	debug('scene_fire_callback', args);
	if((args[0]=='value')&&(args[1]>0))
	{
		var scene_index = scene_offset.call('scene_offset');
		scenes.goto('scenes', scene_index);
		var name = scenes.get('name')[0];
		if(endsWith(name, '@HK'))
		{
			debug('banging out to HK...');
			outlet(0, 'bang');
		}
		scenes.path = 'live_set';
	}

}

function _Softkill()
{
	if(finder.id)
	{
		debug('softkill');
		finder.call('softkill');
	}
}

function _Hardkill()
{
	if(finder.id)
	{
		debug('hardkill');
		finder.call('hardkill');
	}
}

function anything(){}

function _L1(val)
{
	finder.call('forward_midi', 144, 96, (val>0)*127);
}

function _L2(val)
{
	finder.call('forward_midi', 144, 97, (val>0)*127);
}

function _L3(val)
{
	finder.call('forward_midi', 144, 98, (val>0)*127);
}

function _L4(val)
{
	finder.call('forward_midi', 144, 99, (val>0)*127);
}

function _L5(val)
{
	finder.call('forward_midi', 144, 100, (val>0)*127);
}

function _forward_midi(arguments)
{
	//var args = arrayfromargs(arguments);
	debug('forward_midi', arguments);
	finder.call('forward_midi', arguments);
}

function callback(args){}

forceload(this);