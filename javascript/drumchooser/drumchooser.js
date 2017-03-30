autowatch = 1;

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = false;
aumhaa.init(this);
var script = this;

var finder;
var mod;
var mod_finder;

var Mod = ModComponent.bind(script);

var unique = jsarguments[1];

var drumMatrix;
var main_modes;
var trackView;
var pset_id = 0;
var name_listener;
var device_name = '';
var NOTE_DURATION = '8n';
var PreInitVars = {'dc_pset':undefined, 'pgm':undefined};

var DRUMCHOOSER_BANKS = {'MultiSampler':[['Transpose', 'Mod_Chain_Vol', 'Filter Freq', 'Filter Res', 'Shaper Amt', 'Filter Type', 'Ve Release', undefined]]};
									//['Mod_Chain_Vol_0', 'Mod_Chain_Vol_1', 'Mod_Chain_Vol_2', 'Mod_Chain_Vol_3']]};


if (!Array.prototype.indexOf) {
  Array.prototype.indexOf = function (obj, fromIndex) {
    if (fromIndex == null) {
        fromIndex = 0;
    } else if (fromIndex < 0) {
        fromIndex = Math.max(0, this.length + fromIndex);
    }
    for (var i = fromIndex, j = this.length; i < j; i++) {
        if (this[i] === obj)
            return i;
    }
    return -1;
  };
}

function inArray(arr,obj) {
    return (arr.indexOf(obj) != -1);
}


function init()
{
	debug('drumchooser init');

	if(precheck())
	{
		mod = new Mod(script, 'drumchooser', unique, false);
		//mod.debug = debug;
		mod_finder = new LiveAPI(mod_callback, 'this_device');
		mod.assign_api(mod_finder);
	}
}

function precheck()
{
	var READY = true;
	var TRANS = [48, 49, 50, 51, 44, 45, 46, 47, 40, 41, 42, 43, 36, 37, 38, 39]
	if((!finder)||(!finder.id))
	{
		finder = new LiveAPI(callback, 'this_device');
		debug('this set id is', finder.id);
	}
	try
	{
		if(finder.id!==0)
		{
			finder.goto('this_device');
			var this_device_id = Math.floor(finder.id);
			finder.goto('canonical_parent');
			//finder.goto('view');
			debug('devices:', finder.get('devices'));
			var device_ids = finder.get('devices').filter(function(element){return element !== 'id';})
			var this_device_index = device_ids.indexOf(this_device_id);
			if((this_device_index>-1)&&(device_ids[this_device_index+1]))
			{
				var drumpads = [];
				debug('found drumrack....');
				finder.goto('devices', this_device_index+1);
				var root_id = Math.floor(finder.id);
				//debug('id is:', finder.id);
				for(var i=0;i<16;i++)
				{
					//drumPadCheck(TRANS[i], finder.id, {'index':i});
					var pad_num = TRANS[i];
					debug('checking drumpad:', i, pad_num);
					finder.id = Math.floor(root_id);
					finder.goto('drum_pads', pad_num);
					if(finder.id == 0)
					{
						post('drumpad', pad_num, 'cannot be found in adjacent device, aborting...');
						READY = false;
						break;
					}
					finder.id = Math.floor(root_id);
					finder.goto('chains', 0, 'devices', 0);
					var device_id = Math.floor(finder.id);
					if(finder.id == 0)
					{
						post('Cannot find device for drumpad', pad_num, ', aborting...');
						READY = false;
						break;
					}
					finder.goto('view');
					if(finder.id == 0)
					{
						post('Cannot find device.view for drumpad', pad_num, ', aborting...');
						READY = false;
						break;
					}
					else
					{
						//debug('children:', finder.children);
						var children = finder.children;
						if(!inArray(children, 'selected_chain'))
						{
							post('Drumpad', pad_num, 'cannot lock to the selected_chain property, aborting...');
							READY = false;
							break;
						}
						finder.id = device_id;
						if(finder.get('parameters').filter(function(element){return element !== 'id';}).length<2)
						{
							post('Drumpad', pad_num, ' device is missing a suitable parameter to lock to for changing voices, aborting...');
							READY = false;
						}
					}
				}
			}
			else
			{
				post('No Adjacent DrumRack found.');
			}
		}
	}
	catch(error)
	{
		READY = false;
	}
	return READY;
}
	
function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//debug('mod callback:', args);
		if(args[1] in script)
		{
			//debug(script[args[1]]);
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
	Alive = val>0;
	initialize(val);
}

function initialize(val)
{
	if(val>0)
	{
		debug('drumchooser initialize\n');
		setup_tasks();
		setup_translations();
		setup_colors();
		setup_patcher();
		setup_controls();
		setup_device();
		setup_notifiers();
		setup_modes();
		setup_pset_id();
		test_stuff();
		deprivatize_script_functions(this);
		load_PreInitVars();
	}
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 300);
}

function setup_translations(){}

function setup_colors()
{
	mod.Send( 'set_color_map', 'RGB', 0, 8, 16, 24, 32, 40, 48, 56, 64, 72);
}

function setup_controls()
{
	//debug('setup controls!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
	GridControlRegistry = new ControlRegistry('GridRegistry');
	GridButtons = [];
	Grid = new GridClass(8, 8, 'Grid');
	for(var x=0;x<8;x++)
	{
		GridButtons[x] = [];
		for(var y=0;y<8;y++)
		{
			var id = x+(y*8);
			GridButtons[x][y] = new ButtonClass(id, 'Button_'+id, make_send_func('grid', 'value', x, y));
			GridControlRegistry.register_control(id, GridButtons[x][y]);
			Grid.add_control(x, y, GridButtons[x][y]);
		}
	}
	KeyControlRegistry = new ControlRegistry('KeyRegistry');
	KeyButtons = [];
	for(var id=0;id<8;id++)
	{
		KeyButtons[id] = new ButtonClass(id, 'Key_'+id, make_send_func('key', 'value', id));
		KeyControlRegistry.register_control(id, KeyButtons[id]);
	}
	Key2ControlRegistry = new ControlRegistry('Key2Registry');
	Key2Buttons = [];
	for(var id=0;id<8;id++)
	{
		Key2Buttons[id] = new ButtonClass(id, 'Key2_'+id, make_send_func('key2', 'value', id));
		Key2ControlRegistry.register_control(id, Key2Buttons[id]);
	}
	DialControlRegistry = new ControlRegistry('DialRegistry')
	DetentDial = new ControlClass(0, 'DetentDial', make_send_func('detent_dial', 'value'));
	DialControlRegistry.register_control(0, DetentDial);
	script['_grid'] = function(x, y, val)
	{
		GridControlRegistry.receive(x+(y*8), val);
	}
	script['_key'] = function(x, val)
	{
		KeyControlRegistry.receive(x, val);
	}
	script['_key2'] = function(x, val)
	{
		Key2ControlRegistry.receive(x, val);
	}
	script['_detent_dial'] = function(val)
	{
		DialControlRegistry.receive(0, val);
	}
	
}

function setup_patcher()
{
	script['makenote'] = this.patcher.getnamed('makenote');
	script['storage'] = this.patcher.getnamed('drumchooser_storage');
	script['pad_pattrs'] = new Array(16);
	for(var i=0;i<16;i++)
	{
		pad_pattrs[i] = this.patcher.getnamed('pad['+i+']');
	}
}

function setup_device()
{
	mod.Send('receive_device', 'set_mod_device_type', 'DrumChooser');
	mod.Send( 'receive_device', 'set_number_params', 8);
	detect_adjacent_drumrack();
	for(var dev_type in DRUMCHOOSER_BANKS)
	{
		for(var bank_num in DRUMCHOOSER_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, DRUMCHOOSER_BANKS[dev_type][bank_num]);
		}
		//mod.Send('receive_device_proxy', 'update_parameters');
	}
}

function setup_notifiers()
{
}

function setup_modes()
{
	if(drumMatrix!=undefined)
	{
		var main_Page = new Page('Main');
		main_Page.enter_mode = function()
		{
			drumMatrix.set_layer_buttons([Key2Buttons[4], Key2Buttons[5], Key2Buttons[6], Key2Buttons[7]]);
			drumMatrix.set_page_button(Key2Buttons[1]);
			drumMatrix.set_grid(Grid);
			drumMatrix.set_solo_button(Key2Buttons[2]);
			drumMatrix.set_mute_button(Key2Buttons[3]);
			drumMatrix._audition.set_control(Key2Buttons[0]);
		}
		main_Page.exit_mode = function()
		{
			drumMatrix.set_layer_buttons([undefined, undefined, undefined, undefined]);
			drumMatrix.set_page_button();
			drumMatrix.set_grid();
			drumMatrix.set_solo_button();
			drumMatrix._audition.set_control();
			main_Page.set_shift_button();
		}
		main_Page.update_mode = function()
		{
			debug('main_Page updated');
			if(main_Page._shift_button&&main_Page._shift_button.pressed())
			{
			}
			else
			{
			}
		}
		main_Page._shiftValue = function(obj)
		{
			main_Page.update_mode();
		}


		main_modes = new PageStack(1, 'MainModes');
		main_modes.add_mode(0, main_Page);
		main_modes.change_mode(0, true);
	}
}

function callback(){}

function make_send_func()
{
	var args = arrayfromargs(arguments);
	if(args.length == 4)
	{
		var func = function(value)
		{
			//debug('value:', args, value);
			//debug('args:', args, args instanceof Array);
			mod.Send(args[0], args[1], args[2], args[3], value);
		}
	}
	else
	{
		var func = function(value)
		{
			debug('value:', args, value);
			mod.Send(args[0], args[1], args[2], value);
		}
	}
	return func;
}

function make_gui_send_function(patcher_object, message_header)
{
	if(message_header.length == 2)
	{
		var func = function(value)
		{
			//value = value==undefined ? 0 : value;
			//var message = message_header.push(value);
			//debug('sending gui button:', 'header is:', message_header, 'value is:', value, 'message is:', [message_header[0], message_header[1], value]);
			//#message = message_header.concat([value]);
			patcher_object.message.apply(patcher_object, [message_header[0], message_header[1], value]);
		}
	}
	return func;
}

function test_stuff()
{
	//DetentDial.add_listener(function(obj){debug('detent_dial value:', obj._value);});
}

function detect_adjacent_drumrack()
{
	var TRANS = [48, 49, 50, 51, 44, 45, 46, 47, 40, 41, 42, 43, 36, 37, 38, 39]
	if((!finder)||(!finder.id))
	{
		finder = new LiveAPI(callback, 'this_device');
		debug('this set id is', finder.id);
	}
	if(finder.id!==0)
	{
		finder.goto('this_device');
		this_device_id = Math.floor(finder.id);
		finder.goto('canonical_parent');
		trackView = new LiveAPI(viewCallback, 'live_set');
		trackView.id = Math.floor(finder.id);
		trackView.goto('view');
		//debug('devices:', finder.get('devices'));
		var device_ids = finder.get('devices').filter(function(element){return element !== 'id';})
		var this_device_index = device_ids.indexOf(this_device_id);
		if((this_device_index>-1)&&(device_ids[this_device_index+1]))
		{
			var drumpads = [];
			//debug('found drumrack....');
			finder.goto('devices', this_device_index+1);
			//debug('id is:', finder.id);
			for(var i=0;i<16;i++)
			{
				try
				{
					drumpads[i] = new DrumPad(TRANS[i], finder.id, {'index':i});
				}
				catch(error)
				{
					debug(error, ', couldnt make DrumPad', i, TRANS[i]);
					//debug('drumpad id is:',  drumpads[i]._apiDrumpad.id);
				}
			}
			drumMatrix = new DrumMatrix(finder.id, drumpads);
		}
		else
		{
			post('No Adjacent DrumRack found.');
		}
	}
}

function setup_pset_id()
{
	if((!name_listener)||(!name_listener.id))
	{
		name_listener = new LiveAPI(name_callback, 'live_set', 'this_device');
		debug('this set id is', name_listener.id);
		name_listener.property = 'name';
	}
	device_name = name_listener.get('name').toString().split(' ');
	for(var i in device_name)
	{
		if(startsWith(device_name[i], '@id:'))
		{
			pset_id = device_name[i].split('@id:')[1];
			debug('________pset_id is:', pset_id);
			break;
		}
	}
}

function name_callback(args)
{
	debug('name_listener cb:', args[0], args[1]);
	if((args[0]=='name')&&(args[1]!=device_name))
	{
		setup_pset_id();
	}
}

function viewCallback(){}

function _recall()
{
	debug('recall_preset');
	for(var i in drumMatrix._drumpads)
	{
		drumMatrix._drumpads[i].load_preset_data();
	}	
}

function _dc_pset(num, pset)
{
	debug('receive dc_pset', num, pset);
	if(num==pset_id)
	{
		debug('updating preset to:', pset);
		script.patcher.getnamed('preset_number').message(Math.floor(pset));
	}

}

function _pgm_in(val)
{
	debug('updating preset to:', val+1, 'via pgm_in');
	script.patcher.getnamed('preset_number').message(Math.floor(val+1));
}

function anything()
{
	var args = arrayfromargs(messagename, arguments);
	switch(args[0])
	{
		case 'dc_pset':
			PreInitVars.dc_pset = [args[1], args[2]];
			break;
		case 'pgm_in':
			PreInitVars.pgm = args[1];
			break;
	}
}

function load_PreInitVars()
{
	if(PreInitVars.dc_pset!=undefined)
	{
		_dc_pset(PreInitVars.dc_pset[0], PreInitVars.dc_pset[1]);
	}
	if(PreInitVars.pgm!=undefined)
	{
		_pgm_in(PreInitVars.pgm);
	}
}


function DrumMatrix(drumrack_id, drumpads, args)
{
	this.add_bound_properties(this, ['set_grid', 'update', 'grid_press', 'select_pad', 'set_layer_buttons', 'set_page_button', 'update_solo']);
	var self = this;
	this._drumpads = drumpads;
	this._drumgrid = new GridClass(4, 4, 'DrumGrid');
	this._layergrid = new GridClass(4, 1, 'LayerGrid');
	this._grid = undefined;
	this._layer_buttons = undefined;
	this._page_button = undefined;
	this._selected_pad = this._drumpads[12];
	DrumMatrix.super_.call(this, 'DrumMatrix', args);
	this._DrumRack_id = drumrack_id;
	this._apiDrumRack = new LiveAPI(this._apiDrumRackCallback.bind(this), 'live_set');
	this._apiDrumRack.id = Math.floor(drumrack_id);
	this._apiDrumRack.goto('view');
	this._audition = new ToggledParameter(this._name+'_AuditionButton', {'onValue':5, 'offValue':6, 'value':0});
	this._audition.set_target(this.update);
	this._mute = new ToggledParameter(this._name+'_MuteButton', {'onValue':10, 'offValue':11, 'value':0});
	this._mute.set_target(this.update);
	this._solo_button = undefined;
	this.select_pad(this._selected_pad);
	this._apiDrumRack.property = 'selected_drum_pad';
}

inherits(DrumMatrix, Bindable);

DrumMatrix.prototype._apiDrumRackCallback = function(args)
{
	debug('_apiDrumRackCallback:', args);
	if(args[0] == 'selected_drum_pad')
	{
		debug('selected_drum_pad is:', args[1]);
	}
}

DrumMatrix.prototype.set_grid = function(grid)
{
	debug('DrumMatrix.set_grid:', grid);
	this._grid = grid;

	this.update();
}

DrumMatrix.prototype.update = function()
{
	for(var i in this._drumpads)
	{
		this._drumpads[i].set_control();
	}
	this._drumgrid.clear_buttons();
	this._layergrid.clear_buttons();
	this._selected_pad.set_sample_select_buttons();
	this._selected_pad._selectedLayer.set_controls();
	this._selected_pad.set_layer_mute_buttons();
	this._selected_pad.set_layer_select_buttons();
	this._selected_pad.set_page_button();
	this._selected_pad.set_solo_button();
	if(this._audition._value)
	{
		//debug('setting sample select buttons', this._grid);
		//this._solo.set_value(0);
		//this.update_solo();
		this._selected_pad.set_solo_button(this._solo_button);
		this._selected_pad.set_sample_select_buttons(this._grid);
		this._selected_pad.set_page_button(this._page_button);
		this._layergrid.add_control(0, 0, this._layer_buttons[0]);
		this._layergrid.add_control(1, 0, this._layer_buttons[1]);
		this._layergrid.add_control(2, 0, this._layer_buttons[2]);
		this._layergrid.add_control(3, 0, this._layer_buttons[3]);
		if(!this._mute._value)
		{
			this._selected_pad._selectedLayer.set_controls(this._layergrid);
		}
		else
		{
			this._selected_pad.set_layer_mute_buttons(this._layer_buttons);
		}
	}
	else
	{
		//this._solo.set_value(0);
		//this.update_solo()
		debug('setting drumgrid controls', this._drumgrid);
		if(this._grid)
		{
			this._drumgrid.sub_grid(this._grid, 0, 4, 4, 8);
			this._drumgrid.add_listener(this.grid_press);
		}
		var buttons = this._drumgrid.controls();
		for(var i in buttons)
		{
			this._drumpads[i].set_control(buttons[i]);
		}
		if(this._mute._value)
		{
			this._selected_pad.set_layer_mute_buttons(this._layer_buttons);
		}
		else
		{
			this._selected_pad.set_layer_select_buttons(this._layer_buttons);
		}
	}
}

DrumMatrix.prototype.grid_press = function(obj)
{
	debug('grid_press:', obj._name, obj._value);
	//if(obj._value){this.select_pad(obj);}
	if(obj._value)
	{
		var coords = this._drumgrid.button_coords(obj);
		debug('coords are:', coords);
		this.select_pad(this._drumpads[coords[0] + (coords[1]*4)]);
		this.update();
	}
}

DrumMatrix.prototype.select_pad = function(obj)
{
	//this._selected_pad._selectedLayer.remove_listener(this.
	debug('select_pad', obj._name);
	this._selected_pad = obj;
	for(var i in this._drumpads)
	{
		this._drumpads[i]._selected = obj == this._drumpads[i];
		this._drumpads[i].update_control();
		this._drumpads[i].update();
	}
	this._apiDrumRack.set('selected_drum_pad', 'id', Math.floor(this._selected_pad._apiDrumpad.id));

}

DrumMatrix.prototype.set_layer_buttons = function(buttons)
{
	this._layer_buttons = buttons;
}

DrumMatrix.prototype.set_page_button = function(button)
{
	this._page_button = button;
}

DrumMatrix.prototype.update_solo = function()
{
	debug('update_solo', this._solo._value);
	for(var i in this._drumpads)
	{
		//this._drumpads[i]._solo_state = Math.floor(this._solo._value);
		this._drumpads[i].update_solo();
	}
}

DrumMatrix.prototype.set_solo_button = function(button)
{
	//this._solo.set_value(0);
	//this._selected_pad.solo_selected_layer(false);
	//this._solo.set_control(button);
	this._solo_button = button;
}

DrumMatrix.prototype.set_mute_button = function(button)
{
	this._mute.set_control(button);
}

DrumMatrix.prototype.set_mute_buttons = function(buttons)
{
	
}

DrumMatrix.prototype.set_select_buttons = function(buttons)
{

}



function DrumPad(num, root_id, args)
{
	//debug('making drumpad:', num, root_id);
	this.add_bound_properties(this, ['_listener', '_callback', '_Callback', 'update_control', 'set_sample_select_buttons', 'set_layer_mute_buttons', 'update_sample_select_buttons', 
								'_selectors', '_mutes', 'audition_selected_sample', 'set_page_button', 'update_page_button', '_solo', 'set_solo_button',
								'update_preset_data', 'load_preset_data']);
	this._selected = false;
	this._selectedValue = 20;
	this._name = 'Drumpad'+num;
	this._note = num;
	this._solo_state = false;
	this._apiDrumpad = new LiveAPI(this._callback.bind(this), 'live_set');
	this._apiDrumpad.id = Math.floor(root_id);
	this._apiDrumpad.goto('drum_pads', num);
	this._apiView = new LiveAPI(this._view_callback.bind(this), 'live_set');
	this._apiView.id = Math.floor(root_id)
	this._apiView.goto('chains', 0, 'devices', 0, 'view');
	this._apiView.property = 'selected_chain';
	this._sample_select_buttons = undefined;
	this._page_button = undefined;

	this._selectedLayer = new RadioComponent(this._name+'_SelectedLayer', 0, 3, 0, this.update.bind(this), 1, 127);
	
	this._solo = new ToggledParameter(this._name+'_SoloButton', {'onValue':7, 'offValue':3, 'value':0});
	this._solo.set_target(this.update_solo.bind(this));

	this._selectors = [];
	for(var i=0;i<4;i++)
	{
		this._selectors[i] = new PagedRadioComponent(this._name+'_Layer'+i+'_SampleSelector', 0, 127, 0, undefined, 35, 40, {'onValue2':4, 'offValue2':50, 'play_callback':this.audition_selected_sample.bind(this)});
		//this._selectors[i].set_target(this.audition_selected_sample.bind(this));
		this._selectors[i]._apiObj = new LiveAPI(function(args){if(args[0] == 'value'){this.set_value(args[1]);}}.bind(this._selectors[i]), 'live_set');
		this._selectors[i]._apiObj.id = Math.floor(this._apiDrumpad.id);
		this._selectors[i]._apiObj.goto('chains', 0, 'devices', 0, 'parameters', i+1);
		this._selectors[i]._apiObj.property = 'value';
	}
	this._mutes = [];
	for(var i=0;i<4;i++)
	{
		this._mutes[i] = new ToggledParameter(this._name+'_Layer'+i+'_Mute', {'onValue':1, 'offValue':2, 'apiAction':'mute'});
		this._mutes[i]._apiObj = new LiveAPI(function(args){if(args[0] == 'mute'){debug('mute val:', args);this.receive(args[1]);}}.bind(this._mutes[i]), 'live_set');
		this._mutes[i]._apiObj.id = Math.floor(this._apiDrumpad.id);
		this._mutes[i]._apiObj.goto('chains', 0, 'devices', 0, 'chains', i);
		this._mutes[i]._value = this._mutes[i]._apiObj.get('mute');
		this._mutes[i]._apiObj.property = 'mute';
	}
	this._solos = [];
	for(var i=0;i<4;i++)
	{
		this._solos[i] = new ToggledParameter(this._name+'_Layer'+i+'_Solo', {'onValue':1, 'offValue':2, 'apiAction':'solo'});
		this._solos[i]._apiObj = new LiveAPI(function(args){if(args[0] == 'solo'){this.receive(args[1]);}}.bind(this._solos[i]), 'live_set');
		this._solos[i]._apiObj.id = Math.floor(this._apiDrumpad.id);
		this._solos[i]._apiObj.goto('chains', 0, 'devices', 0, 'chains', i);
		this._solos[i]._value = this._solos[i]._apiObj.get('solo');
		this._solos[i]._apiObj.property = 'solo';
	}
	this._devices = [];
	for(var i=0;i<4;i++)
	{
		this._devices[i] = new LiveAPI(function(){}.bind(this), 'live_set');
		this._devices[i].id = Math.floor(this._apiDrumpad.id);
		this._devices[i].goto('chains', 0, 'devices', 0, 'chains', i, 'devices', 0);
	}
	args.onValue = 1;
	args.offValue = 127;
	args.value = 0;
	DrumPad.super_.call(this, this._name, args);

	this._preset = script.patcher.getnamed('pad['+this._index+']');
	for(var i=0;i<4;i++)
	{
		this._selectors[i].add_listener(this.update_preset_data.bind(this));
		this._mutes[i].add_listener(this.update_preset_data.bind(this));
	}
	this.load_preset_data();
	
}

inherits(DrumPad, MomentaryParameter);

DrumPad.prototype.load_preset_data = function()
{
	var data = this._preset.getvalueof();
	//debug('index is:', this._index);
	//var data = script.patcher.getnamed('pad['+this._index+']').getvalueof();
	debug(this._name, 'load_preset_data:', data);
	if(data.length == 8)
	{
		for(var i=0;i<4;i++)
		{
			//this._selectors[i].receive(data[i*2]);
			this._selectors[i]._apiObj.set('value', data[i*2]);
			//this._mutes[i].receive(data[(i*2)+1]);
			//debug('setting mute[',i,']:', Math.floor(data[(i*2)+1]));
			this._mutes[i]._apiObj.set('mute', Math.floor(data[(i*2)+1]));
		}
	}
}

DrumPad.prototype.update_preset_data = function()
{
	var data = [];
	for(var i=0;i<4;i++)
	{
		data.push(this._selectors[i]._value);
		data.push(this._mutes[i]._value);
	}
	//debug(this._name, 'update_preset_data', data);
	this._preset.setvalueof(data);
}

DrumPad.prototype.audition_selected_sample = function(obj)
{
	if(obj)
	{
		debug('audition_selected_sample');
		outlet(0, this._note, obj._value);
	}
	else
	{
		makenote.message('list', this._note, 110, NOTE_DURATION);
	}
}

DrumPad.prototype._callback = function(args)
{
	//debug(this._name, 'callback:', args);
}

DrumPad.prototype._view_callback = function(args)
{
	//debug(this._name, '_view_callback', args);
}

DrumPad.prototype._Callback = function(obj)
{
	if(obj){outlet(0, this._note, obj._value);  this.receive(obj._value);}
}

DrumPad.prototype.update_control = function(){if(this._control){this._control.send(this._value ? this._onValue : this._selected ? this._selectedValue : this._offValue);}}

DrumPad.prototype.update = function(grid)
{
	this.update_sample_select_buttons();
	this.update_solo();
	if(this._selected)
	{
		this._apiView.set('selected_chain', 'id', Math.floor(this._solos[this._selectedLayer._value]._apiObj.id));
	
		//debug('id will be:', Math.floor(this._devices[this._selectedLayer._value].id));
		mod.Send( 'send_explicit', 'receive_device_proxy', 'set_mod_device_parent', 'id',  Math.floor(this._devices[this._selectedLayer._value].id));
		mod.Send( 'push_name_display', 'value', 0, 'SelLayer');
		mod.Send( 'push_value_display', 'value', 0, this._selectedLayer._value);
		mod.Send( 'push_name_display', 'value', 2, 'DeviceName');
		mod.Send( 'push_value_display', 'value', 2, this._devices[this._selectedLayer._value].get('name'));

		DetentDial.set_target(this._detent_dial_callback.bind(this));

		//if(trackView){trackView.set('selected_device', this._devices[this._selectedLayer._value]);}
		/*for(var i in this._apiView)
		{
			debug('INFO:', i);
		}
		debug('INFO:', this._apiView.info);
		*/
	}
}

DrumPad.prototype.set_sample_select_buttons = function(grid)
{
	debug('set_sample_select_buttons:', grid);
	this._sample_select_buttons = grid;
	this.update_sample_select_buttons.apply(this);
}

DrumPad.prototype.set_page_button = function(button)
{
	this._page_button = button;
	this.update_page_button.apply(this);
}

DrumPad.prototype.set_layer_mute_buttons = function(buttons)
{
	for(var i=0;i<4;i++)
	{
		this._mutes[i].set_control();
		if(buttons)
		{
			this._mutes[i].set_control(buttons[i]);
		}
	}
}

DrumPad.prototype.set_layer_select_buttons = function(buttons)
{
	this._selectedLayer.set_controls(buttons);
}

DrumPad.prototype.update_sample_select_buttons = function()
{
	for(var i=0;i<4;i++)
	{
		this._selectors[i].set_controls();
		//debug('selector:', i, this._selectors[i]);
	}
	//debug('sample select buttons:', this._sample_select_buttons);//, this._selectedLayer._value);
	this._selectors[this._selectedLayer._value].set_controls(this._sample_select_buttons);
}

DrumPad.prototype._detent_dial_callback = function(obj)
{
	debug(this._name, '_detent_dial_callback', obj._value, this._selectedLayer._value);
	if(obj._value < 64)
	{
		this._selectors[this._selectedLayer._value].increase_value();
	}
	else
	{
		this._selectors[this._selectedLayer._value].decrease_value();
	}
}

DrumPad.prototype.update_page_button = function()
{
	for(var i=0;i<4;i++)
	{
		this._selectors[i]._page_offset.set_control();
	}
	this._selectors[this._selectedLayer._value]._page_offset.set_control(this._page_button);
}

DrumPad.prototype.update_solo = function()
{
	debug(this._name, 'update_solo, solo state is:', Boolean(this._solo_state));
	if(this._solo._value)
	{
		if(this._selected)
		{
			//debug(this._name, 'is selected:', Boolean(this._selected));
			for(var i in this._solos)
			{
				this._solos[i]._apiObj.set('solo', Math.floor(i==this._selectedLayer._value));
			}
		}
		else
		{
			for(var i in this._solos)
			{
				this._solos[i]._apiObj.set('solo', 0);
			}
		}
	}
	else
	{
		//debug(this._name, 'is selected:', Boolean(this._selected));
		{
			for(var i in this._solos)
			{
				this._solos[i]._apiObj.set('solo', 0);
			}
		}
	}
}

DrumPad.prototype.set_solo_button = function(button)
{
	this._solo.set_value(0);
	this._solo.set_control(button);
}



function PagedRadioComponent(name, minimum, maximum, initial, callback, onValue, offValue, args)
{
	this.add_bound_properties(this, ['_Callback', 'update_controls', '_page_offset_callback', 'increase_value', 'decrease_value']);
	this._page_offset = new ToggledParameter(this._name + '_PageOffset', {'onValue':50, 'offValue':40, 'value':0})
	this._page_offset.set_target(this._page_offset_callback.bind(this));
	this._page_length = 64;
	this._play_callback = undefined;
	PagedRadioComponent.super_.call(this, name, minimum, maximum, initial, callback, onValue, offValue, args);
}

inherits(PagedRadioComponent, RadioComponent);

PagedRadioComponent.prototype._Callback = function(obj)
{
	if(this._play_callback)
	{
		this._play_callback(obj);
	}
	if(obj._value)
	{
		var val = this._buttons.indexOf(obj) + (this._page_offset._value*this._page_length);
		debug('PagedRadio:', obj, obj._value, val, this._page_offset._value, '*', this._page_length);
		//this.set_value(val);
		if(this._apiObj){this._apiObj.set('value', val);}
	}
}

PagedRadioComponent.prototype.update_controls = function()
{
	for(var i in this._buttons)
	{
		if(this._buttons[i])
		{
			this._buttons[i].send((this._buttons.indexOf(this._buttons[i])+(this._page_offset._value*this._page_length))==this._value ? this._page_offset._value ? this._onValue2 : this._onValue : this._page_offset._value ? this._offValue2 : this._offValue);
		}
	}
}

PagedRadioComponent.prototype._page_offset_callback = function(obj)
{
	this.update_controls();
}

PagedRadioComponent.prototype.increase_value = function()
{
	this.receive(this._value + 1);
	if(this._apiObj){this._apiObj.set('value', this._value);}
	if(this._play_callback)
	{
		this._play_callback();
	}
}

PagedRadioComponent.prototype.decrease_value = function()
{
	this.receive(this._value - 1);
	if(this._apiObj){this._apiObj.set('value', this._value);}
	if(this._play_callback)
	{
		this._play_callback();
	}
}


function SpecialToggledParameter(name, args)
{
	this.add_bound_properties(this, ['solo']);
	//this._pre_solo_value = true;
	SpecialToggledParameter.super_.call(this, name, args);
}

inherits(SpecialToggledParameter, ToggledParameter);

ToggledParameter.prototype.solo = function(solo_bool, layer_bool)
{
	if(solo_bool)
	{
		this._pre_solo_value = Math.floor(this._value);
		//this.receive(layer_bool*1);
		if(this._apiObj)
		{
			this._apiObj.set(this._apiAction, Math.floor(layer_bool));
		}
	}
	else
	{
		//this.receive(this._pre_solo_value);
		if(this._apiObj)
		{
			this._apiObj.set(this._apiAction, Math.floor(this._pre_solo_value));
		}
	}
}

ToggledParameter.prototype.unnsolo = function()
{
	if(this._apiObj)
	{
		this._apiObj.set(this._apiAction, Math.floor(this._pre_solo_value));
	}
}



forceload(this);