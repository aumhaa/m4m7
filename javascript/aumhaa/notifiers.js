autowatch = 1;

var util = require('util');

for(var i in util)
{
	this[i] = util[i];
}


DEBUG = true;
debug = DEBUG && Debug ? Debug : function(){}

NOTE_TYPE = 'NOTE_TYPE';
CC_TYPE = 'CC_TYPE';
NONE_TYPE = 'NONE_TYPE';
CHANNEL = 0;
NONE = 'NONE';
colors = {OFF : 0, WHITE : 1, YELLOW : 2, CYAN : 3, MAGENTA : 4, RED : 5, GREEN : 6, BLUE : 7};
LividColors = {OFF : 0, WHITE : 1, CYAN : 5, MAGENTA : 9, RED : 17, BLUE : 33, YELLOW : 65, GREEN : 127};
//PushColors = {OFF : 0, WHITE : 120, CYAN : 30, MAGENTA : 12, RED : 20, BLUE : 65, YELLOW : 11, GREEN : 125};
PushColors = {OFF : 0, WHITE : 1, YELLOW : 2, CYAN : 3, MAGENTA : 4, RED : 5, GREEN : 6, BLUE : 7};

exports.consts = {NOTE_TYPE:NOTE_TYPE, CC_TYPE:CC_TYPE, NONE_TYPE:NONE_TYPE, CHANNEL:CHANNEL, NONE:NONE, colors:colors, PushColors:PushColors, LividColors:LividColors}

Scales = function(parameters)
{
	var self = this;
	this.colors = {OFF : 0, WHITE : 1, CYAN : 5, MAGENTA : 9, RED : 17, BLUE : 33, YELLOW : 65, GREEN : 127};
	this._grid = undefined;
	this._grid_function = function(){}
	this.width = function(){return  !this._grid ? 0 : this._grid.width();}
	this.height = function(){return !this._grid ? 0 : this._grid.height();}
	this._NOTENAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'];
	this.NOTENAMES = [];
	for(var i=0;i<128;i++)
	{
		this.NOTENAMES[i]=(_NOTENAMES[i%12] + ' ' + (Math.floor(i/12)-2) );
	}
	this.WHITEKEYS = {0:0, 2:2, 4:4, 5:5, 7:7, 9:9, 11:11, 12:12};
	this.NOTES = [24, 25, 26, 27, 28, 29, 30, 31, 16, 17, 18, 19, 20, 21, 22, 23, 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7];
	this.DRUMNOTES = [12, 13, 14, 15, 28, 29, 30, 31, 8, 9, 10, 11, 24, 25, 26, 27, 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 16, 17, 18, 19];
	this.SCALENOTES = [36, 38, 40, 41, 43, 45, 47, 48, 24, 26, 28, 29, 31, 33, 35, 36, 12, 14, 16, 17, 19, 21, 23, 24, 0, 2, 4, 5, 7, 9, 11, 12];
	this.KEYCOLORS = [this.colors.BLUE, this.colors.CYAN, this.colors.MAGENTA, this.colors.RED, this.colors.GREEN, this.colors.GREEN, this.colors.GREEN, this.colors.GREEN];
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
	this.DEFAULT_SCALE = 'Major';
	this.SPLIT_SCALES = {}; //{'DrumPad':1, 'Major':1};
	for(var param in parameters)
	{
		self[param] = parameters[param];
	}
	this._update = function()
	{
		self._update_request = false;
		self._noteMap = [];
		for(var i=0;i<128;i++)
		{
			self._noteMap[i] = [];
		}
		if(self._grid instanceof Grid)
		{
			var keyoffset = -1;
			var notes_in_step = self.notes_in_step();
			var selected = self._stepsequencer && self._select._value ? self._stepsequencer.key_offset._value : -1;
			var select_only = self._select_only._value;
			var width = self.width();
			var height = self.height();
			var offset = self._noteOffset._value;
			var vertoffset = self._vertOffset._value;
			var scale = SCALENAMES[self._scaleOffset._value];
			self._current_scale = scale;
			var scale_len = SCALES[scale].length;
			for(var column=0;column<width;column++)
			{
				for(var row=0;row<height;row++)
				{
					var note_pos = column + (Math.abs((height-1)-row))*parseInt(vertoffset);
					var note = offset + SCALES[scale][note_pos%scale_len] + (12*Math.floor(note_pos/scale_len));
					var button = self._grid.get_button(column, row);
					if(!select_only){button.set_translation(note%127);}
					else{button._translation = note%127}  //you slimy bastard....
					self._noteMap[note%127].push(button);
					//debug('note', note, 'keyoffset', keyoffset, note == keyoffset, note === keyoffset);
					button.scale_color = notes_in_step[note%127] ? this.colors.GREEN : note == selected ? this.colors.WHITE : KEYCOLORS[((note%12) in WHITEKEYS) + (((note_pos%scale_len)==0)*2)];// + ((notes_in_step[note%127])*4)];
					button.send(button.scale_color);
				}
			}
		}
	}
}

Scales.prototype.set_grid_function = function(func){self.grid_function = func;}


/////////////////////////////////////////////////////////////////////////
//Base Class that allows automatic binding of prototypal properties based on
//the _bound_properties array.  


Bindable = function(name, args)
{
	var self = this;
	this._name = name;
	this.instance = function(){return self;}
	for(var i in args)
	{
		this['_'+i] = args[i];
	}
	this.add_bound_properties(this, this._mixin_bound_properties);
	this.add_bound_properties(this, ['super_']);
	//gubed('making bindable:', name, 'args:', args, 'bound_props:', this._bound_properties);
	this.bind_properties(this);
}

Bindable.prototype._mixin_bound_properties = [];

Bindable.prototype.add_bound_properties = function(instance, properties)
{
	//debug('adding bound properties to:', instance._name, '\n original props:', instance._bound_properties, '\nnew props:', properties);
	var old_props = instance._bound_properties ? instance._bound_properties : [];
	instance._bound_properties = old_props.concat(properties);
}

Bindable.prototype.bind_properties = function(instance)
{
	//debug('binding properties for:', instance._name, '\nprops are:', instance._bound_properties)
	//bind_properties(instance, instance._bound_properties);
	if(instance._bound_properties)
	{
		prop_list = instance._bound_properties;
		for(var index in prop_list)
		{
			var prop = prop_list[index];
			if(instance.constructor.prototype[prop])
			{
				//debug('has prop:', prop);
				instance[prop] = instance.constructor.prototype[prop].bind(instance);
			}
		}
	}
}

exports.Bindable = Bindable;


/////////////////////////////////////////////////////////////////////////
//This is the root object to be used for all controls, or objects that 
//will serve as notifiers to other objects.  It maintains a list of listeners as well as a
//"target_stack" that can be used to push/pop targets to be notified when its value changes 
//(only the first target in the stack is notified).  Notifier is "subclassed" by many other prototypes.

NotifierClass = function(name, args)
{
	this.add_bound_properties(this, ['add_listener', 'remove_listener', 'set_target', 'get_target', 'clear_targets', 'remove_target', 'notify', 'set_enabled']);
	//debug('making notifier:', name, this._bound_properties);
	this._value = -1;
	this._listeners = [];
	this._target_heap = [];
	this._enabled = true;
	this._display_value = false;
	this._is_setting = false;
	NotifierClass.super_.call(this, name, args);
}

inherits(NotifierClass, Bindable);

NotifierClass.prototype.get_target = function(){return this._target_heap[0];}

NotifierClass.prototype.set_target = function(target)
{
	if (target)
	{
		if (target in this._target_heap)
		{
			//debug('target was present for' + this._name, 'placing at front');
			this._target_heap.unshift(this._target_heap.splice(this._target_heap.indexOf(target), 1));
		}
		else
		{
			this._target_heap.unshift(target);
			//debug('target added to heap for ' + this._name);
		}
	}
	else
	{
		this.remove_target();
	}
}

NotifierClass.prototype.remove_target = function(target)
{
	if (target)
	{
		for(var item in this._target_heap)
		{
			if(target === this._target_heap[item])
			{
				this._target_heap.splice(item, 1);
				break;
			}
		}
	}
	else
	{
		this._target_heap.shift();
	}
}

NotifierClass.prototype.clear_targets = function()
{
	this._target_heap = [];
}

NotifierClass.prototype.add_listener = function(callback)
{
	//if(!(callback in this._listeners))
	//{
	//	this._listeners.unshift(callback);
	//}
	//debug('add listener:', this, this._name);
	var add = true;
	if (callback)
	{
		for(var item in this._listeners)
		{
			if(callback == this._listeners[item])
			{
				add = false;
				break;
			}
		}
	}
	if(add)
	{
		this._listeners.unshift(callback);
	}
}

NotifierClass.prototype.remove_listener = function(callback)
{
	//if(callback in this._listeners){this._listeners.slice(this._listeners.indexOf(callback), 1);}
	if (callback)
	{
		for(var item in this._listeners)
		{
			if(callback === this._listeners[item])
			{
				this._listeners.splice(callback, 1);
			}
		}
	}
}

NotifierClass.prototype.notify = function(obj)
{
	if(!obj)
	{
		var obj = this;
	}
	//debug('notify', this._name, obj._name);
	if(this._target_heap[0])
	{
		var cb = this._target_heap[0];
		try
		{
			cb(obj);
		}
		catch(err)
		{
			debug('target callback exception:', err.message, err.name);
			//for(var i in err)
			//{
			//	debug('err:', i);
			//}
			debug('-> for', this._name,' : ',cb);
		}
	}
	for (var i in this._listeners)
	{
		var cb = this._listeners[i];
		try
		{
			cb(obj);
		}
		catch(err)
		{
			debug('listener callback exception:', err);
			debug('-> for', this._name,' : ',cb);
		}
	}
	if(this._display_value>0)
	{
		displayMessage(this._name + ' : ' + this._value);
	}
	if(this._is_setting>0)
	{
	}
}

NotifierClass.prototype.set_enabled = function(val)
{
	this._enabled = (val>0);
}

exports.NotifierClass = NotifierClass;


GUI_Element = function(name)
{
	this._grid = {};
	this.add_bound_properties(this, ['receive', 'receive_notifier', '_x', '_y']);
	ControlClass.super_.call(this, name, args);
}

inherits(GUI_Element, NotifierClass);

GUI_Element.prototype.receive = function(value)
{
	//debug('receive:', self._name, value);
	if(this._enabled)
	{
		this._value = value;
		this.notify();
	}
}

GUI_Element.prototype.receive_notifier = function(notification)
{
	if(this._enabled){this.send(notification._value);}
}

GUI_Element.prototype._x = function(grid){if(this._grid[grid._name]!=undefined){return(this._grid[grid._name].x)}}

GUI_Element.prototype._y = function(grid){if(this._grid[grid._name]!=undefined){return(this._grid[grid._name].y)}}

GUI_Element.prototype._send = function(value){}//this should be overridden by subclass

GUI_Element.prototype.send = function(value)
{
	//midiBuffer[this._type][this._id] = [this, value];
	this._last_sent_value = value;
	this._send(value);
}

GUI_Element.prototype.reset = function()
{
	this.send(0);
}

exports.GUI_Element = GUI_Element;


//////////////////////////////////////////////////////////////////////////
//A Notifier representing a physical control that can send and receive MIDI 

ControlClass = function(identifier, name, args)
{
	this.add_bound_properties(this, ['receive', 'receive_notifier', '_x', '_y', '_send', 'send']);
	//debug('making control:', name, this._bound_properties);
	this._type = NONE_TYPE;
	this._id = identifier;
	this._channel = CHANNEL;
	this._grid = {};
	this._last_sent_value = 0;
	ControlClass.super_.call(this, name, args);
}

inherits(ControlClass, NotifierClass);

ControlClass.prototype.receive = function(value)
{
	//debug('receive:', self._name, value);
	if(this._enabled)
	{
		this._value = value;
		this.notify();
	}
}

ControlClass.prototype.receive_notifier = function(notification)
{
	if(this._enabled){this.send(notification._value);}
}

ControlClass.prototype._x = function(grid){if(this._grid[grid._name]!=undefined){return(this._grid[grid._name].x)}}

ControlClass.prototype._y = function(grid){if(this._grid[grid._name]!=undefined){return(this._grid[grid._name].y)}}

ControlClass.prototype.identifier = function(){return this._id;}

ControlClass.prototype._send = function(value){}//this should be overridden by subclass

ControlClass.prototype.send = function(value)
{
	this._last_sent_value = value;
	this._send(value);
}

ControlClass.prototype.reset = function()
{
	this.send(0);
}

exports.ControlClass = ControlClass;


ButtonClass = function(identifier, name, _send, args)
{
	//debug('making buton:', name, this._bound_properties);
	this._type = NOTE_TYPE;
	this._onValue = 127;
	this._offValue = 0;
	this._translation = -1;
	this._flash = false;
	this._grid = [];
	ButtonClass.super_.call(this, identifier, name, args);
	this._send = !_send ? function(){debug('No _send function assigned for:', self._name);} : _send;
	//register_control(this);
}

inherits(ButtonClass, ControlClass);

ButtonClass.prototype.set_send_function = function(func)
{
	this._send = func;
}

ButtonClass.prototype.pressed = function()
{
	return this._value > 0;
}

ButtonClass.prototype.send = function(value, flash)
{
	//midiBuffer[this._type][this._id] = [this, value];
	this.flash(flash);
	this._last_sent_value = value;
	this._send(value);
}

ButtonClass.prototype.turn_on = function()
{
	this.send(this._onValue);
}

ButtonClass.prototype.turn_off = function()
{
	this.send(this._offValue);
}

ButtonClass.prototype.set_on_off_values = function(onValue, offValue)
{
	this._onValue = onValue||127;
	this._offValue = offValue||0;
}

ButtonClass.prototype.set_translation = function(newID)
{
	//debug(this._name, 'set translation', this._id, newID);
	this._translation = newID;
	//Note_Translation_Table[this._id] = this._translation;
	//recalculate_translation_map = true;
}

ButtonClass.prototype.flash = function(val)
{
	if(val!=this._flash)
	{
		this._flash = val;
		//if(!val)
		//{
		//	flash.remove(this);
		//}
		//else
		//{
		//	flash.add(this);
		//}
	}
}

ButtonClass.prototype.get_coords= function(grid)
{
	if(grid instanceof Grid && this._grid[grid._name])
	{
		return([this._grid[grid._name].x, this._grid[grid._name].y]);
	}
}

exports.ButtonClass = ButtonClass;


GUIButton = function(name, args)
{
	this._type = NOTE_TYPE;
	this._onValue = 1;
	this._offValue = 0;
	this._flash = false;
	this._grid = {};
	GUIButton.super_.call(this, 0, name, args);
	//var self = this;

}

inherits(GUIButton, ControlClass);

GUIButton.prototype.set_send_function = function(func)
{
	this._send = func;
}

GUIButton.prototype.pressed = function()
{
	return this._value > 0;
}

GUIButton.prototype.send = function(value, flash)
{
	this._last_sent_value = value;
	this._send(value);
}

GUIButton.prototype._send = function(value){debug('Haven\'t defined _send for GUIButton:', this._name)}

GUIButton.prototype.turn_on = function()
{
	this.send(this._onValue);
}

GUIButton.prototype.turn_off = function()
{
	this.send(this._offValue);
}

GUIButton.prototype.set_on_off_values = function(onValue, offValue)
{
	this._onValue = onValue||127;
	this._offValue = offValue||0;
}

GUIButton.prototype.set_translation = function(newID)
{
	//debug(this._name, 'set translation', this._id, newID);
	this._translation = newID;
	//Note_Translation_Table[this._id] = this._translation;
	//recalculate_translation_map = true;
}

GUIButton.prototype.flash = function(val)
{
	if(val!=this._flash)
	{
		this._flash = val;
		//if(!val)
		//{
		//	flash.remove(this);
		//}
		//else
		//{
		//	flash.add(this);
		//}
	}
}

GUIButton.prototype.get_coords= function(grid)
{
	if(grid instanceof Grid && this._grid[grid._name])
	{
		return([this._grid[grid._name].x, this._grid[grid._name].y]);
	}
}

exports.GUIButton = GUIButton;


/////////////////////////////////////////////////////////////////////////////
//A notifier that collects a grid of buttons

GridClass = function(width, height, name, args)
{
	this.add_bound_properties(this, ['add_control', 'controls', 'receive', 'get_button', 'reset', 'clear_buttons', 'sub_grid', 'clear_translations']);
	//debug('making GridClass:', width, height, name, args, this._bound_properties);
	//this._bound_properties = ['receive'];
	var contents = [];
	for(var i = 0; i < width; i++)
	{
		contents[i] = [];
		for(var j = 0; j < height; j++)
		{
			contents[i][j] = undefined;
		}
	}
	this._grid = contents;
	this.width = function(){return width;}
	this.height = function(){return height;}
	this.size = function(){return width * height;}
	GridClass.super_.call(this, name, args);
}

inherits(GridClass, NotifierClass);

GridClass.prototype.receive = function(button){this.notify(button);}

GridClass.prototype.controls = function()
{
	var buttons = [];
	for(var y=0;y<this.height();y++)
	{
		for(var x=0;x<this.width();x++)
		{
			if(this._grid[x][y] instanceof NotifierClass)
			{
				buttons.push(this._grid[x][y]);
			}
		}
	}
	return buttons;
}

GridClass.prototype.add_control = function(x, y, button)
{
	if(x < this.width())
	{
		if(y < this.height())
		{
			if(button instanceof NotifierClass)
			{
				this._grid[x][y] = button;
				button._grid[this._name] = {x:x, y:y, obj:this};
				button.add_listener(this.receive);
			}
		}
	}
}
	
GridClass.prototype.send = function(x, y, value)
{
	this._grid[x][y].send(value);
}

GridClass.prototype.get_button = function(x, y)
{
	var button = undefined;
	if(this._grid[x])
	{
		if(this._grid[x][y])
		{
			button = this._grid[x][y];
		}
	}
	return button;
}

GridClass.prototype.reset = function()
{
	var buttons = this.controls();
	for (index in buttons)
	{
		if(buttons[index] instanceof NotifierClass)
		{
			buttons[index].reset();
		}
	}
}

GridClass.prototype.clear_buttons = function()
{
	var buttons = this.controls();
	for (var i in buttons)
	{
		if(buttons[i] instanceof NotifierClass)
		{
			buttons[i].remove_listener(this.receive);
			delete buttons[i]._grid[this._name];
		}
	}
	var contents = [];
	for(var i = 0; i < this.width(); i++)
	{
		contents[i] = [];
		for(var j = 0; j < this.height(); j++)
		{
			contents[i][j] = undefined;
		}
	}
	this._grid = contents;
}

GridClass.prototype.sub_grid = function(subject, x_start, x_end, y_start, y_end)
{
	for(var x=0;x<(x_end-x_start);x++)
	{
		for(var y=0;y<(y_end-y_start);y++)
		{
			var button = subject.get_button(x+x_start, y+y_start);
			//debug('adding button', button._name);
			this.add_control(x, y, button);
		}
	}
	return this;
}

GridClass.prototype.clear_translations = function()
{
	var buttons = this.controls();
	for(var index in buttons)
	{
		if(buttons[index])
		{
			buttons[index].set_translation(-1);
		}
	}
}

exports.GridClass = GridClass;


/////////////////////////////////////////////////////////////////////////////
//Mode is a notifier that automatically updates buttons when its state changes

ModeClass = function(number_of_modes, name, args)
{
	this.add_bound_properties(this, ['mode_cycle_value', 'mode_value', 'toggle_value', 'change_mode', 'update', 'add_mode', 'set_mode_buttons', 'set_mode_cycle_button', 'current_mode']);
	this._value = 0;
	this._mode_callbacks = new Array(number_of_modes);
	this.mode_buttons = [];
	this.mode_cycle_button = undefined;
	ModeClass.super_.call(this, name, args);
	this.mode_toggle = new ToggledParameter(this._name + '_Mode_Toggle', {'onValue':colors.BLUE, 'offValue':colors.CYAN, 'value':0});
	this.mode_toggle.add_listener(this.toggle_value);
}

inherits(ModeClass, NotifierClass);

ModeClass.prototype.mode_cycle_value = function(button)
{
	if(button.pressed())
	{
		this.change_mode((this._value + 1) % this._mode_callbacks.length)
		this.notify();
	}
}

ModeClass.prototype.mode_value = function(button)
{
	debug('mode value', this._name, ':', button, button.pressed());
	if(button.pressed())
	{
		this.change_mode(this.mode_buttons.indexOf(button));
		this.notify();
	}
}

ModeClass.prototype.toggle_value = function(button)
{
	this.change_mode(button._value);
	this.notify();
}

ModeClass.prototype.change_mode = function(value, force)
{
	if (value < (this._mode_callbacks.length))
	{
		if((this._value != value)||(force))
		{
			this._value = value;
			this.update();
		}
	}
}

ModeClass.prototype.update = function()
{
	var callback = this._mode_callbacks[this._value];
	if(callback)
	{
		try
		{
			callback();
		}
		catch(err)
		{
			debug('callback error:', err, 'for mode index', this._value,'for', this._name, 'mode component');
		}
	}
	for(var i in this.mode_buttons)
	{
		if (i == this._value)
		{
			
			this.mode_buttons[i].turn_on();
		}
		else
		{
			this.mode_buttons[i].turn_off();
		}
	}
}
		
ModeClass.prototype.add_mode = function(mode, callback)
{
	if (mode < this._mode_callbacks.length)
	{
		this._mode_callbacks[mode] = callback;
	}
}

ModeClass.prototype.set_mode_buttons = function(buttons)
{
	debug('set_mode_buttons:', buttons.length, this._mode_callbacks.length);
	if (((buttons == undefined)||(buttons.length == this._mode_callbacks.length))&&(buttons != this.mode_buttons))
	{
		for (var i in this.mode_buttons)
		{
			this.mode_buttons[i].remove_target(this.mode_value);
		}
		if(!buttons)
		{
			buttons = [];
		}
		this.mode_buttons = [];
		for (var i in buttons)
		{
			this.mode_buttons.push(buttons[i]);
			buttons[i].set_target(this.mode_value);
		}
		debug('mode buttons length: ' + this._name + ' ' + this.mode_buttons.length)
	}
}

ModeClass.prototype.set_mode_cycle_button = function(button)
{
	if(this.mode_cycle_button)
	{
		this.mode_cycle_button.remove_target(this.mode_cycle_value);
	}
	this.mode_cycle_button = button;
	if(button)
	{
		button.set_target(this.mode_cycle_value);
	}
}

ModeClass.prototype.current_mode = function()
{
	return(this._value)
}

exports.ModeClass = ModeClass;


/////////////////////////////////////////////////////////////////////////////
//PageStack is a Mode subclass that handles entering/leaving pages automatically

PageStack = function(number_of_modes, name, args)
{
	this.add_bound_properties(this, ['current_page', 'restore_mode']);

	debug('making pagestack', number_of_modes, name, args);
	this._pages = new Array(number_of_modes);
	PageStack.super_.call(this, number_of_modes, name, args);
}

inherits(PageStack, ModeClass);

PageStack.prototype.add_mode = function(mode, page)
{
	if ((page instanceof Page) && (mode < this._mode_callbacks.length))
	{
		this._pages[mode] = page;
		debug('adding page:', page, this._pages);
	}
	else
	{
		debug('Invalid add_mode assignment for', this._name, mode, ':', page);
	}
}

PageStack.prototype.change_mode = function(value, force)
{
	debug('change_mode:', value);
	if (-1 < value < this._mode_callbacks.length)
	{
		if((this._value != value)||(force))
		{
			debug('changing mode:', this._value, value);
			this._pages[this._value]&&this._pages[this._value].exit_mode();
			this._value = value;
			this._pages[this._value]&&this._pages[this._value].enter_mode();
			this.update();
		}
	}
}

PageStack.prototype.current_page = function()
{
	return(this._pages[this.current_mode()]);
}

PageStack.prototype.restore_mode = function()
{
	this.change_mode(this._value, true);
}

exports.PageStack = PageStack;


/////////////////////////////////////////////////////////////////////////////
//Parameter is a notifier that automatically updates its listeners when its state changes
//It can either reflect an internal state or a JavaObject's value, and can be assigned a control

ParameterClass = function(name, args)
{
	this.add_bound_properties(this, ['receive', 'set_value', 'update_control', '_Callback', 'set_control']);
	this._parameter = undefined;
	this._num = 0;
	this._value = 0;
	this._onValue = 127;
	this._offValue = 0;
	this._text_length = 10;
	this._unassigned = 'None';
	ParameterClass.super_.call(this, name, args);
}

inherits(ParameterClass, NotifierClass);

ParameterClass.prototype.receive = function(value)
{
	this._value = value;
	this.update_control();
	this.notify();
}

ParameterClass.prototype.set_value = function(value)
{
	this.receive(value);
}

ParameterClass.prototype.update_control = function(){if(this._control){this._control.send(Math.floor(this._value));}}

ParameterClass.prototype._Callback = function(obj){if(obj){this.receive(obj._value);}}

ParameterClass.prototype.set_control = function(control)
{
	if (control instanceof(NotifierClass) || !control)
	{
		if(this._control)
		{
			this._control.remove_target(this._Callback);
		}
		this._control = control;
		if(this._control)
		{
			this._control.set_target(this._Callback);
			//self.receive(self._value);
			this.update_control();
		}
	}
}

ParameterClass.prototype.set_on_off_values = function(onValue, offValue)
{
	this._onValue = onValue||127;
	this._offValue = offValue||0;
}

exports.ParameterClass = ParameterClass;


ArrayParameter = function(name, args)
{
	ArrayParameter.super_.call(this, name);
}

inherits(ArrayParameter, ParameterClass);

ArrayParameter.prototype.receive = function(value)
{
	//debug('array change', arguments, arrayfromargs(arguments));
	if(arguments.length>1)
	{
		this._value = arrayfromargs(arguments);
	}
	else
	{
		this._value = value;
	}
	this.update_control();
	this.notify();
}

exports.ArrayParameter = ArrayParameter;


ToggledParameter = function(name, args)
{
	ToggledParameter.super_.call(this, name, args);
}

inherits(ToggledParameter, ParameterClass);

ToggledParameter.prototype._Callback = function(obj)
{
	if(obj._value)
	{
		if(this._javaObj)
		{
			this._javaObj[self._action]();
		}
		else
		{
			this.receive(Math.abs(this._value - 1));
		}
	}
} 

ToggledParameter.prototype.update_control = function(value)
{
	if(this._control){this._control.send(this._value ? this._onValue : this._offValue);}
}

exports.ToggledParameter = ToggledParameter;


RangedParameter = function(name, args)
{
	this._range = this._range||128;
	RangedParameter.super_.call(this, name, args);
}

inherits(RangedParameter, ParameterClass);

RangedParameter.prototype._Callback = function(obj)
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
			this.receive(Math.floor((obj._value/127)*this._range));
		}
	}
}

RangedParameter.prototype.update_control = function(){if(this._control){this._control.send(Math.floor((this._value/this._range)*127));}}

exports.RangedParameter = RangedParameter;


RangedButtonParameter = function(name, args)
{
	this.colors = args['colors'] || [colors.OFF, colors.WHITE, colors.YELLOW, colors.CYAN, colors.MAGENTA, colors.RED, colors.GREEN, colors.BLUE];
	this._range = this._range||8;
	RangedButtonParameter.super_.call(this, name, args);
}

inherits(RangedButtonParameter, ParameterClass)

RangedButtonParameter.prototype._Callback = function(obj)
{
	if(obj._value)
	{
		if(this._javaObj)
		{
			//debug('Callback', this._name, obj._value);
			this._javaObj.set(obj._value, this._range);
		}
		else
		{
			debug('Callback', this._name, obj._value, (this._value+1)%this._range);
			this.receive(this._value+1%this._range);
		}
	}
}

RangedButtonParameter.prototype.update_control = function()
{
	if(this._control)
	{
		for(var c in this.colors)
		{
			debug(c, 'color:', this.colors[c]);
		}
		debug('update_control:', this._name, this._value, this.colors.length, this.colors[this._value%(this.colors.length)]);
		this._control.send(this.colors[this._value%(this.colors.length)]);
	}
}


exports.RangedButtonParameter = RangedButtonParameter;


DelayedRangedParameter = function(name, args)
{
	this._delay = 1;
	DelayedRangedParameter.super_.call(this, name, args);
}

inherits(DelayedRangedParameter, RangedParameter);

DelayedRangedParameter.prototype.receive = function(value)
{
	this._value = value;
	this.update_control();
	tasks.addTask(this.delayed_receive, [value], this._delay);
}

DelayedRangedParameter.prototype.delayed_receive = function(value)
{
	if(value == this._value)
	{
		this.notify();
	}
}

exports.DelayedRangedParameter = DelayedRangedParameter;


ParameterGroup= function(name, notifiers, args)
{
	var self = this;
	this.add_bound_properties(this, ['set_controls', 'set_gui_controls']);
	this._notifiers = notifiers;
	ParameterGroup.super_.call(this, name, args);
}

inherits(ParameterGroup, Bindable);

ParameterGroup.prototype.set_controls = function(controls)
{
	var controls = controls instanceof GridClass ? controls.controls() : control instanceof Array ? controls : controls instanceof NotifierClass ? [controls] : [];
	for(var i=0;i<this._notifiers.length;i++)
	{
		var control = controls[i]?controls[i]:undefined;
		this._notifiers[i].set_control(control);
	}
}

ParameterGroup.prototype.set_gui_controls = function(controls)
{
	var controls = controls instanceof GridClass ? controls.controls() : control instanceof Array ? controls : controls instanceof NotifierClass ? [controls] : [];
	for(var i=0;i<this._notifiers.length;i++)
	{
		var control = controls[i]?controls[i]:undefined;
		this._notifiers[i].set_gui_control(control);
	}
}

exports.ParameterGroup = ParameterGroup;


/////////////////////////////////////////////////////////////////////////////
//Notifier that uses two buttons to change an offset value

OffsetComponent = function(name, minimum, maximum, initial, callback, onValue, offValue, increment, args)
{
	this.add_bound_properties(this, ['receive', 'set_value', 'update_control', '_Callback', 'set_control', 'incCallback', 'decCallback']);
	this._min = minimum||0;
	this._max = maximum||127;
	this._value = initial||0;
	this._increment = increment||1;
	this._incButton;
	this._decButton;
	this._onValue = onValue||127;
	this._offValue = offValue||0;
	this._displayValues = [this._onValue, this._offValue];
	this._scroll_hold = true;
	OffsetComponent.super_.call(this, name);
	if(callback!=undefined)
	{
		this.set_target(callback);
	}
}

inherits(OffsetComponent, NotifierClass);

OffsetComponent.prototype.incCallback = function(obj)
{
	if((this._enabled)&&(obj._value>0))
	{
		this._value = Math.min(this._value + this._increment, this._max);
		this._update_buttons();
		this.notify();
		if(this._scroll_hold)
		{
			tasks.addTask(this.incCallback, [obj], 1, false, this._name+'_UpHoldKey');
		}
	}
}

OffsetComponent.prototype.decCallback = function(obj)
{
	if((this._enabled)&&(obj._value>0))
	{
		this._value = Math.max(this._value - this._increment, this._min);
		this._update_buttons();
		this.notify();
		if(this._scroll_hold)
		{
			tasks.addTask(this.decCallback, [obj], 1, false, this._name+'_DnHoldKey');
		}
	}
}

OffsetComponent.prototype.set_value = function(value)
{
	this._value = Math.max(Math.min(value, this._max), this._min);
	this._update_buttons();
	this.notify();
}

OffsetComponent.prototype._update_buttons = function()
{
	if(this._incButton)
	{
		if((this._value<this._max)&&(this._enabled))
		{
			this._incButton.send(this._onValue);
		}
		else
		{
			this._incButton.send(this._offValue);
		}
	}
	if(this._decButton)
	{
		if((this._value>this._min)&&(this._enabled))
		{
			this._decButton.send(this._onValue);
		}
		else
		{
			this._decButton.send(this._offValue);
		}
	}
}

OffsetComponent.prototype.set_inc_dec_buttons = function(incButton, decButton)
{
	if (incButton instanceof(NotifierClass) || !incButton)
	{
		if(this._incButton)
		{
			this._incButton.remove_target(this.incCallback)
		}
		this._incButton = incButton;
		if(this._incButton)
		{
			this._incButton.set_target(this.incCallback)
		}
	}
	if (decButton instanceof(NotifierClass) || !decButton)
	{
		if(this._decButton)
		{
			this._decButton.remove_target(this.decCallback)
		}
		this._decButton = decButton;
		if(this._decButton)
		{
			this._decButton.set_target(this.decCallback)
		}
	}
	this._update_buttons();
}

OffsetComponent.prototype.set_enabled = function(val)
{
	this._enabled = (val>0);
	this._update_buttons();
}

exports.OffsetComponent = OffsetComponent;

/////////////////////////////////////////////////////////////////////////////
//Notifier that uses multiple buttons to change an offset value, displaying the current value

RadioComponent = function(name, minimum, maximum, initial, callback, onValue, offValue, args)
{
	this.add_bound_properties(this, ['receive', 'set_value', 'update_controls', '_Callback', 'set_controls']);
	this._min = minimum||0;
	this._max = maximum||1;
	this._value = initial||0;
	this._buttons = [];
	this._onValue = onValue||127;
	this._offValue = offValue||0;
	this._displayValues = [this._onValue, this._offValue];
	RadioComponent.super_.call(this, name, args);
	if(callback!=undefined)
	{
		this.set_target(callback);
	}
}

inherits(RadioComponent, NotifierClass);

RadioComponent.prototype._Callback = function(obj)
{
	if(obj._value)
	{
		var val = this._buttons.indexOf(obj);
		this.set_value(val);
	}
}

RadioComponent.prototype.receive = function(value)
{
	this.set_value(value);
}

RadioComponent.prototype.set_controls = function(control)
{
	control = (control instanceof Array)||(control instanceof GridClass) ? control : [];
	for(var i in this._buttons)
	{
		this._buttons[i].remove_target(this._Callback);
	}
	this._buttons = control instanceof GridClass ? control.controls() : control;
	if(this._buttons)
	{
		for(var i in this._buttons)
		{
			if(this._buttons[i])
			{
				//debug('assigning radio:', this._buttons[i]._name);
				this._buttons[i].set_target(this._Callback);
			}
		}
	}
	this.update_controls();
}

RadioComponent.prototype.set_value = function(value)
{
	this._value = Math.max(Math.min(value, this._max), this._min);
	this.update_controls();
	this.notify();
}

RadioComponent.prototype.update_controls = function()
{
	//debug('original update controls...');
	for(var i in this._buttons)
	{
		if(this._buttons[i])
		{
			this._buttons[i].send(this._buttons.indexOf(this._buttons[i])==this._value ? this._onValue : this._offValue);
		}
	}
}

RadioComponent.prototype.set_enabled = function(val)
{
	this._enabled = (val>0);
	this._update_controls();
}

exports.RadioComponent = RadioComponent;


/////////////////////////////////////////////////////////////////////////////
//Notifier that uses two buttons to change an offset value

DoubleSliderComponent = function(name, minimum, maximum, initial_start, initial_end, callback, onValue, offValue, args)
{
	this.add_bound_properties(this, ['receive', 'set_value', 'update_controls', '_Callback', 'set_controls', 'set_value', 'set_start_value', 'set_end_value']);
	this._min = minimum||0;
	this._max = maximum||16;
	this._start_value = initial_start||0;
	this._end_value = initial_end||16;
	this._buttons = [];
	this._onValue = onValue||127;
	this._offValue = offValue||0;
	this._displayValues = [this._onValue, this._offValue];
	DoubleSliderComponent.super_.call(this, name, args);
	if(callback!=undefined)
	{
		this.set_target(callback);
	}
}

inherits(DoubleSliderComponent, NotifierClass);

DoubleSliderComponent.prototype._Callback = function(obj)
{
	if(obj._value)
	{
		var button_pressed = false;
		for(var i in this._buttons)
		{
			if(this._buttons[i].pressed()&&(!(this._buttons[i]==obj)))
			{
				button_pressed = this._buttons[i];
				break;
			}
		}
		var val = this._buttons.indexOf(obj);
		var ref_index = button_pressed ? this._buttons.indexOf(button_pressed) : val>this._start_value ? this._start_value : this._end_value;
		var set_func = val > ref_index ? this.set_end_value : this.set_start_value;
		set_func(val);
	}
}

DoubleSliderComponent.prototype.receive = function(value)
{
	this.set_value(value);
}

DoubleSliderComponent.prototype.set_controls = function(control)
{
	control = (control instanceof Array)||(control instanceof GridClass) ? control : [];
	for(var i in this._buttons)
	{
		this._buttons[i].remove_target(this._Callback);
	}
	this._buttons = control instanceof GridClass ? control.controls() : control;
	if(this._buttons)
	{
		for(var i in this._buttons)
		{
			if(this._buttons[i])
			{
				this._buttons[i].set_target(this._Callback);
			}
		}
	}
	this.update_controls();
}

DoubleSliderComponent.prototype.set_value = function(value)
{

	this._value = Math.max(Math.min(value, this._max), this._min);
	this.update_controls();
	this.notify();
}

DoubleSliderComponent.prototype.set_start_value = function(value)
{
	this._start_value = Math.max(Math.min(value, this._max), this._min);
	this.update_controls();
	this.notify();
}

DoubleSliderComponent.prototype.set_end_value = function(value)
{
	this._end_value = Math.max(Math.min(value, this._max), this._min);
	this.update_controls();
	this.notify();
}

DoubleSliderComponent.prototype.update_controls = function()
{
	for(var i in this._buttons)
	{
		if(this._buttons[i])
		{
			var index = this._buttons.indexOf(this._buttons[i]);
			this._buttons[i].send(index<this._start_value ? this._offValue : index>this._end_value ? this._offValue : this._onValue);
		}
	}
}

DoubleSliderComponent.prototype.set_enabled = function(val)
{
	this._enabled = (val>0);
	this._update_controls();
}

exports.DoubleSliderComponent = DoubleSliderComponent;


/////////////////////////////////////////////////////////////////////////////
//Page holds a controls dict that can hash a control to an internal function

Page = function(name, args)
{
	this.add_bound_properties(this, ['controlInput', '_shiftValue']);
	this._controls = {};
	this.active = false;
	this._shifted = false;
	Page.super_.call(this, name, args);
}

inherits(Page, Bindable);

Page.prototype.controlInput = function(control){this.control_input(control);}

Page.prototype._shiftValue = function(obj)
{
	var new_shift = false;
	if(obj)
	{
		new_shift = obj._value > 0;
	}
	if(new_shift != this._shifted)
	{
		this._shifted = new_shift;
		this.update_mode();
	}
}

Page.prototype.enter_mode = function()
{
	debug(this._name, ' entered!');
}

Page.prototype.exit_mode = function()
{
	debug(this._name, ' exited!');
}

Page.prototype.update_mode = function()
{
	debug(this._name, ' updated!');
}

Page.prototype.refresh_mode = function()
{
	this.exit_mode();
	this.enter_mode();
}

Page.prototype.set_shift_button = function(button)
{
	if ((button != this._shift_button)&&(button instanceof(NotifierClass) || !button))
	{
		if(this._shift_button)
		{
			this._shift_button.remove_target(this._shiftValue);
			this._shifted = false;
		}
		this._shift_button = button;
		if(this._shift_button)
		{
			this._shift_button.set_target(this._shiftValue);
		}
	}
}

Page.prototype.control_input = function(control)
{
	debug('Page: ', this._name, 'recieved control input ', control._name);
	if(control in this._controls)
	{
		this._controls[control](control);
	}
}

Page.prototype.register_control = function(control, target)
{
	if (control instanceof GridClass)
	{
		var grid_controls = control.controls();
		for(index in grid_controls)
		{
			this._controls[grid_controls[index]] = target;
		}
		debug('grid added to ', this._name, 's control dict');
	}
	else if(control instanceof FaderBank)
	{
		debug('faderbank found......');
		var faderbank_controls = control.controls();
		for(index in faderbank_controls)
		{
			this._controls[faderbank_controls[index]] = target;
		}
		debug('faderbank added to ', this._name, 's control dict');
	}
	else if(control instanceof ControlClass)
	{
		this._controls[control] = target;
		debug('control: ', control._name, ' added to ', this._name, 's control dict');
	}
}

exports.Page = Page;


/////////////////////////////////////////////////////////////////////////////
//Overlay interface to host.scheduleTask that allows singlerun tasks and removable repeated tasks

TaskServer = function(script, interval)
{
	var self = this;
	this._queue = {};
	this._interval = interval || 100;
 	this._run = function()
	{
		for(var index in self._queue)
		{
			var task = self._queue[index];
			//debug('run...', index, task);
			if(task.ticks == task.interval)
			{
				if(!task.repeat)
				{
					delete self._queue[index];
				}
				task.callback.apply(script, task.arguments);
				task.ticks = 0;
			}
			else
			{
				task.ticks += 1;
			}
		}
		host.scheduleTask(self._run, null, self._interval);
	}
	this._run();
}

TaskServer.prototype.addTask = function(callback, arguments, interval, repeat, name)
{
//	debug('addTask', arguments, interval, repeat, name);
	if(typeof(callback)==='function')
	{
		interval = interval||1;
		repeat = repeat||false;
		if(!name){name = 'task_'+this._queue.length;}
		this._queue[name] = {'callback':callback, 'arguments':arguments, 'interval':interval, 'repeat':repeat, 'ticks':0};
	}
}

TaskServer.prototype.removeTask = function(callback, arguments, name)
{
	debug('removing task:', name);
	if(name)
	{
		if(this._queue[name])
		{
			delete this._queue[name];
		}
	}
	else
	{
		for(var i in this._queue)
		{
			if((this._queue[i].callback == callback)&&(this.qeue[i].arguments = arguments))
			{
				delete this._queue[i];
			}
		}
	}
}

exports.TaskServer = TaskServer;


ControlRegistry = function(name)
{
	debug('making ControlRegistry');
	var self = this;
	this._name = !name ? 'ControlRegistry' : name;
	this.registry = {};
	this.register_control = function(id, control)
	{
		//debug('register_control:', id, control);
		self.registry[id] = control;
	}
	this.receive = function(id, value)
	{
		try{self.registry[id].receive(value);}
		catch(err){debug(err, 'id:', id, 'not registerd in registry:', self._name);}
	}
	return this;
}

exports.ControlRegistry = ControlRegistry;

