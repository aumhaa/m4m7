autowatch = 1;


inlets = 1;
outlets = 1;

var script = this;
var finder;
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