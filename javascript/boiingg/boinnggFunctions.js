autowatch = 1;

var storage;
var s_offset = [0, 0];
var alted = false;
var rotated = false;
var preset = 1;
var slotlist = [];
var matrix = new Grid('Grid', 'grid', 16, 16);
var keys = new Keys('Keys', 'key', 8);
var WIKI = 'boinngg';


var DEBUG = true;
var debug = (DEBUG&&Debug) ? Debug : function(){};

function initialize_instance()
{
	mod.Send('set_legacy', 1);
	storage = this.patcher.getnamed('boinngg');
	storage.message('recall', 1);
	storage.message('getslotlist');
}

function alt(v)
{
	debug('alt:', value)
	alted = value>0;
	_clear_surface();
	//value && storage.message('getslotlist');
	value && display_presets();
}

function surface_offset(x, y)
{
	debug('boinngg offset', x, y, '\n');
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
	debug('key in', x, val);
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

function _rotate(val)
{
	clear_surface();
	rotated = val>0;
	output = rotated ? rotate_out : normal_out;
}

function from_storage()
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

function _clear_surface()
{
	debug('clear_surface');
	mod.Send('grid', 'clear');
}

output = rotated ? rotate_out : normal_out;


function _grid_out(x, y, val)
{
	debug('_grid_out', x, y, val);
	mod.Send('grid', 'value', x, y, val);
}

function _key_out(x, val)
{
	debug('_key_out', x, y, val):
	mod.Send('key', 'value', x, val);
}
