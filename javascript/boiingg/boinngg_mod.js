autowatch = 1;

inlets = 3;
outlets = 3;
setinletassist(0, 'live.this_device input');
setinletassist(1, 'slot, offset, pattrstorage, alt input');
setinletassist(2, 'grid input');
setoutletassist(0, 'preset data grid output');
setoutletassist(1, 'gate value output');
setoutletassist(2, 'main data grid output');


var script = this;


var unique = jsarguments[1];
var Alive = 0;
var storage;
var s_offset = [0, 0];
var alted = false;
var rotated = false;
var preset = 1;
var slotlist = [];
var matrix = new Grid('Grid', 'grid', 16, 16);
var keys = new Keys('Keys', 'key', 8);
var WIKI = 'boinngg';


var FORCELOAD = false;
var DEBUG = false;

var debug = (DEBUG&&Debug) ? Debug : function(){};
var forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

function setup_colors()
{
	mod.Send( 'fill_color_map', 'Monochrome', 1, 8, 1, 1, 8, 1);
}

function setup_translations()
{
	for(var x=0;x<16;x++)
	{
		for(var y=0;y<16;y++)
		{
			//mod.Send( 'add_translation', 'grid_'+x+'_'+y, 'grid', 'grid', x, y);
			//mod.Send( 'add_translation', 'grid_'+x+'_'+y, 'base_grid', 'base_grid', y, x);
		}
	}
}

var Mod = ModComponent.bind(script);

function init()
{
	mod = new Mod(script, 'boinngg', unique, false);
	//mod.debug = debug;
	//mod.wiki_addy = WIKI;
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
			//debug('in script:', args[1]);
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
	debug('alive', val);
	initialize(val);
}

function initialize(val)
{
	debug('Initialize Boinngg');
	Alive = 1;
	mod.Send('set_legacy', 1);
	storage = this.patcher.getnamed('boinngg');
	storage.message('recall', 1);
	storage.message('getslotlist');
	//preset_selector = this.patcher.getnamed('preset_selector');
}

function alt(value)
{
	debug('alt:', value)
	alted = value>0;
	clear_surface();
	//value && storage.message('getslotlist');
	value && display_presets();
}

function surface_offset(x, y)
{
	//debug('boinngg offset', x, y, '\n');
	s_offset = [x, y];
}

function grid(x, y, val)
{
	debug('grid', x, y, val);
	val = val ? 1 : 0;
	matrix.button[x][y].pressed = val>0;
	if(alted)
	{
		if(val>0)
		{
			var slot = x+(y*16)+1;
			debug('recalling', slot);
			if(slotlist.indexOf(slot)==-1)
			{
				debug('storing:', preset, slot);
				storage.message('store', slot);
			}
			storage.message('getslotlist');
			storage.message('recall', slot);
			display_presets();
		}
	}
	else
	{
		rotated ? outlet(0, y, x, val) : outlet(0, x, y, val);
	}
}

function anything()
{
	debug("anything:", arrayfromargs(messagename, arguments));
}

function key(x, val)
{
	//debug('key in', x, val);
	messnamed(unique+'key', x, val>0);
}

function key_output(x, val)
{
	keys.button[x].send(val);
}

function output(x, y, val)
{
	debug('output:', x, y, val);
}

function normal_out(x, y, val)
{
	!alted && matrix.button[x][y].send(val);
}

function rotate_out(x, y, val)
{
	!alted && matrix.button[y][x].send(val);
}

function rotate(val)
{
	clear_surface();
	rotated = val>0;
	output = rotated ? rotate_out : normal_out;
}

function _storage()
{
	var args = arrayfromargs(arguments);
	debug('recall in:', args);
	switch(args[0])
	{
		case 'recall':
			preset = args[1];
			debug('new preset is:', preset);
			break;
		case 'slotlist':
			slotlist = args.slice();
			if(slotlist.length==1)
			{
				storage.message('store', 1);
			}
			alted && display_presets();
			break;
	}
}

function display_presets()
{
	debug('display_presets', slotlist);
	//clear_surface();
	matrix.button[3][3].send(127);
	for(var i in matrix.controls)
	{
		var button = matrix.controls[i];
		button.send(slotlist.indexOf(button._num)==-1 ? 0 : button._num == preset ? 6 : 4, true);
		
	}
}

function clear_surface()
{
	mod.Send('grid', 'clear');
}

output = rotated ? rotate_out : normal_out;

forceload(this);


