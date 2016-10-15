autowatch = 1;


function Grid(name, call, width, height)
{
	var self = this;
	this._name = name;
	this.width = function(){return width;}
	this.height = function(){return height;}
	this.button = [];
	this.controls = [];
	for(var x=0;x<width;x++)
	{
		this.button[x] = [];
		for(var y=0;y<height;y++)
		{
			this.button[x][y] = new Button(name + '_Cell_'+x+'_'+y, call, x, y, this);
			this.controls.unshift(this.button[x][y]);
		}
	}
	this.send = function(val)
	{
		mod.Send( call, 'all', val);
		//viewer_matrix.message('clear');
		for(var i in self.controls)
		{
			self.controls[i]._value = val;
			self.controls[i]._mask = val;
		}
		
	}
	this.mask = function(val)
	{
		mod.Send( call, 'mask', 'all', val);
		//viewer_matrix.message('clear');
		for(var i in self.button)
		{
			self.button[i]._mask = val;
		}
	}

}

function Button(name, call, x, y, parent)
{
	var self = this;
	this._name = name;
	this._parent = parent;
	this._value = 0;
	this._mask = 0;
	this._x = x;
	this._y = y;
	this._num = x + (y*16) + 1;
	this.pressed = false;
	this.send = function(val, force)
	{
		if(force||(val!=self._val)||(val!=self._mask))
		{
			mod.Send( call, 'value', self._x, self._y, val);
			//viewer_matrix.message(self._x, self._y, val);
			self._mask = val;
			self._value = val;
		}
	}
	this.mask = function(val, force)
	{
		if(force||(val != self._mask))
		{
			mod.Send( call, 'mask', self._x, self._y, val);
			var v = val==-1 ? self._value : val;
			//viewer_matrix.message(self._x, self._y, v);
			self._mask = val;
		}
	}	

}

function Keys(name, call, width)
{
	var self = this;
	this._name = name;
	this.width = function(){return width;}
	this.button = [];
	for(var x=0;x<width;x++)
	{
		this.button[x] = new Key(name + '_Cell_'+x, call,  x, this);
	}
	this.send = function(val)
	{
		mod.Send( call, 'all', val);
		for(var i in self.button)
		{
			self.button[i]._value = val;
			self.button[i]._mask = val;
		}
	}
	this.mask = function(val)
	{
		mod.Send( call, 'mask', 'all', val);
		for(var i in self.button)
		{
			self.button[i]._mask = val;
		}
	}

}

function Key(name, call, x, parent)
{
	var self = this;
	this._name = name;
	this._parent = parent;
	this._value = 0;
	this._mask = 0;
	this._x = x;
	this._num = x;
	this.pressed = false;
	this.send = function(val, force)
	{
		if(force||(val!=self._val)||(val!=self._mask))
		{
			mod.Send( call, 'value', self._x, val);
			self._mask = val;
			self._value = val;
		}
	}
	this.mask = function(val)
	{
		if(force||(val != self._mask))
		{
			mod.Send( 'key', 'mask', self._x, val);
			self._mask = val;
		}
	}	

}

var storage;
var s_offset = [0, 0];
var alted = false;
var rotated = false;
var preset = 1;
var slotlist = [];
var matrix;
var keys;
var WIKI = 'boinngg';

function initialize_instance()
{
	matrix = new Grid('Grid', 'grid', 16, 16);
	keys = new Keys('Keys', 'key', 8);
	mod.Send('set_legacy', 1);
	storage = this.patcher.getnamed('boinngg');
	storage.message('recall', 1);
	storage.message('getslotlist');
	output = rotated ? rotate_out : normal_out;
}

function _alt(v)
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

function _grid(x, y, val)
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

function _key(x, val)
{
	debug('key in', x, val);
	messnamed(unique+'key', x, val>0);
}

function _key_output(x, val)
{
	keys.button[x].send(val);
}

function _output(x, y, val)
{
	debug('output:', x, y, val);
}

function _normal_out(x, y, val)
{
	!alted && matrix.button[x][y].send(val);
}

function _rotate_out(x, y, val)
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

function _grid_out(x, y, val)
{
	debug('_grid_out', x, y, val);
	mod.Send('grid', 'value', x, y, val);
}

function _key_out(x, val)
{
	//debug('_key_out', x, val):
	mod.Send('key', 'value', x, val);
}

//output = rotated ? rotate_out : normal_out;


