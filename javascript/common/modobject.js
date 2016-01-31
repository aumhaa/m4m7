autowatch = 1;

inlets = 2;
outlets = 1;


var FORCELOAD = false;
var forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

var DEBUG = true;
var debug = (DEBUG&&Debug) ? Debug : function(){};

var script = this;
var finder;
var mod;
var mod_finder;

var unique = jsarguments[1];
var type = jsarguments[2];

var initialize_instance = function(){}

var Translations = require(type+"Translations");
//include(type+'Translations');
var Colors = require(type+"Colors");
//include(type+'Colors');
include(type+'Functions', this);

var Mod = ModComponent.bind(script);

function init()
{
	debug('modobject init');
	mod = new Mod(script, type, unique, false);
	mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);
}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		debug('mod callback:', args);
		if(args[1] in script)
		{
			debug('args[1] is in script', script[args[1]]);
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
	if(val>0)
	{
		debug(type, 'initializing...');
		setup_translations();
		setup_colors();

		deprivatize_script_functions(script);
		
		Alive = 1;
		
		//mod.Send('receive_device', 'set_mod_device_type', 'Hex');
		//mod.Send( 'receive_device', 'set_number_params', 16);

		initialize_instance();

		for(var i in script)
		{
			debug('item in script:', i, '\n');
		}
		post(type, "initialized.\n");

	}
	else
	{
		_dissolve();
	}
}

function setup_translations()
{
	debug('setup trasnlations');
	for(var i in Translations)
	{
		debug('sending translation for:', i);
		Translations[i](mod);
	}
}

function setup_colors()
{
	debug('setup colors');
	for(var i in Colors)
	{
		debug('sending colors for:', i);
		Colors[i](mod);
	}
}

function anything()
{
	var args = arrayfromargs(arguments);
	debug('anything', type+':', args);
}


forceload(this);
