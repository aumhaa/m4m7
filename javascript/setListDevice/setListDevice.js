autowatch = 1;

outlets = 2;

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);
var script = this;

var unique = jsarguments[1];

var finder;
var api_song;
var decks;
var Alive = false;
var defer;
var scene_data = {};
var next_scPset = [0, 0];
var tempo_value = undefined;
var TEMPO_FADE = 1500;  //ms

var mod_finder;

var Mod = ModComponent.bind(script);


function startsWith(str, search)
{
	return str.lastIndexOf(search, 0) === 0;
}

function init()
{
	debug('setListDevice init');

	defer = this.patcher.getnamed('defer');
	if(!finder)
	{
		finder = new LiveAPI(function(){}, 'live_set');
	}
	finder.goto('live_set', 'tracks', 0);

	if(!api_song)
	{
		api_song = new LiveAPI(tempo_callback, 'live_set');
		api_song.property = 'tempo';
	}

	mod = new Mod(script, 'setlistdevice', unique, false);
	//mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);

	deprivatize_script_functions(this);
	Alive = true;
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
	initialize(val);
}

function initialize(val)
{
	if(val>0)
	{
		debug('setListDevice initialize\n');
		setup_tasks();
		setup_translations();
		setup_colors();
		setup_patcher();
		setup_controls();
		setup_device();
		setup_decks();
		setup_notifiers();
		setup_modes();
	}
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 175);
}

function setup_translations(){}

function setup_colors()
{
	//mod.Send( 'set_color_map', 'RGB', 1, 2, 3, 4, 5, 6, 7);
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
	Key2Grid = new GridClass(8, 1, 'Key2Grid');
	for(var id=0;id<8;id++)
	{
		Key2Buttons[id] = new ButtonClass(id, 'Key2_'+id, make_send_func('key2', 'value', id));
		Key2ControlRegistry.register_control(id, Key2Buttons[id]);
		Key2Grid.add_control(id, 0, Key2Buttons[id]);
	}
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

}

function setup_patcher()
{
}

function setup_device()
{
	mod.Send('receive_device', 'set_mod_device_type', 'setListDevice');
	mod.Send( 'receive_device', 'set_number_params', 8);
	//detect_adjacent_drumrack();
	/*for(var dev_type in DRUMCHOOSER_BANKS)
	{
		for(var bank_num in DRUMCHOOSER_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, DRUMCHOOSER_BANKS[dev_type][bank_num]);
		}
		//mod.Send('receive_device_proxy', 'update_parameters');
	}*/
}

function setup_decks()
{
	decks = new DecksComponent('Decks');
}

function setup_notifiers()
{
	//Grid.add_listener(rcvGrid);
}

function setup_modes()
{

	var main_Page = new Page('Main');
	main_Page.enter_mode = function()
	{
		decks.override.set_control(KeyButtons[2]);
		decks.set_browser_controls(KeyButtons[5], KeyButtons[6], KeyButtons[7]);
		decks.set_subCrate_controls(Key2Grid);
		decks.deck_a.nextSong.set_control(GridButtons[0][0]);
		decks.deck_b.nextSong.set_control(GridButtons[2][0]);
		decks.deck_a.stopSong.set_control(GridButtons[0][1]);
		decks.deck_b.stopSong.set_control(GridButtons[2][1]);
	}
	main_Page.exit_mode = function()
	{
		decks.override.set_control();
		decks.set_browser_controls();
		decks.set_subCrate_controls();
		decks.deck_a.nextSong.set_control();
		decks.deck_b.nextSong.set_control();
		decks.deck_a.stopSong.set_control();
		decks.deck_b.stopSong.set_control();
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


function set_start_marker(id, val)
{
	debug('set_start_marker:', id, val);
	finder.id = id;
	finder.set('start_marker', val);
}

function set_start_marker(){}

function sc_pset(num, val)
{
	debug('send sc_pset, button', num, val?'pressed':'not pressed');
	//messnamed('sc_pset', num, next_scPset[num]);
	outlet(0, 'sc_pset', num+1, next_scPset[num]);
}

function get_crate_names(bpm)
{
}

function data_for_name(name)
{
	var raw_data = name.toString().split(' ');
	var data = {};
	for(var i in raw_data)
	{
		var items = raw_data[i].split(':');
		data[items[0]] = items[1];
	}
	return data;
}

function set_tempo(val)
{
	//debug('set_tempo:', val);
	api_song.set('tempo', val);
}

function tempo_callback(args)
{
	//debug('tempo_callback', args);
	if(args[0]=='tempo')
	{
		tempo_value = args[1];
	}
}



function DecksComponent(name, name, args)
{
	this.add_bound_properties(this, ['currentSlot_callback', 'fire_scene', 'other_deck', 'update_decks', 'set_browser_controls', 'set_subCrate_controls', 'override_callback', 'enable_browser']);
	DecksComponent.super_.call(this, name, args);
	this._browser_mode = false;
	this._upButton = undefined;
	this._downButton = undefined;
	this._loadButton = undefined;
	this._subCrateButtons = undefined;
	this._browserFocus = undefined;
	this.override = new ToggledParameter('Override', {'onValue':1, 'offValue':2, 'value':0, 'callback':this.override_callback.bind(this)});
	this.currentSlot = new ParameterClass('currentSlot', {'apiProperty':'playing_slot_index', 'callback':this.currentSlot_callback.bind(this)} );
	this.deck_a = new DeckLoaderComponent('DeckALoader', {'deckID':0, 'group_track_index':1, 'parent':this});
	this.deck_b = new DeckLoaderComponent('DeckBLoader', {'deckID':1, 'group_track_index':7, 'parent':this});
	this._last_deck = -1;
	this.acappella = new LiveAPI(function(){}, 'live_set', 'tracks', 13);
	this.api_current_slot = new LiveAPI(this.currentSlot._apiCallback, 'live_set', 'tracks', 0);
	this.api_current_slot.property = 'playing_slot_index';
}

inherits(DecksComponent, Bindable);

DecksComponent.prototype.currentSlot_callback = function(obj)
{
	if(Alive&&obj._value>-1)
	{
		finder.goto('live_set', 'tracks', 0, 'clip_slots', obj._value, 'clip');
		var id = Math.floor(finder.id);
		var data = data_for_name(finder.get('name'));
		this.fire_scene(data, id);
		this.update_decks(id);
		debug('currentSlot:', Math.floor(finder.id)==Math.floor(this.deck_a._api_next_clip.id), Math.floor(finder.id)==Math.floor(this.deck_a._api_next_clip.id));
		Math.floor(finder.id)==Math.floor(this.deck_a._api_next_clip.id)&&this.deck_a.set_current_clip_data(data.n);
		Math.floor(finder.id)==Math.floor(this.deck_b._api_next_clip.id)&&this.deck_b.set_current_clip_data(data.n);
	}
}

DecksComponent.prototype.fire_scene = function(data, clip_id)
{
	if((data.s)&&(data.bpm)&&(clip_id))
	{
		var active_deck = clip_id == this.deck_a._api_next_clip.id ? this.deck_a : clip_id == this.deck_b._api_next_clip.id ? this.deck_b : this._last_deck == -1 ? this.deck_a : this._last_deck == 0 ? this.deck_b : this.deck_a;
		if(active_deck.decks[data.bpm-1])
		{
			//song
			active_deck.group.call('stop_all_clips');
			finder.id = Math.floor(active_deck.decks[data.bpm-1].id);
			finder.goto('clip_slots', Math.floor(data.s-1));
			finder.call('stop')

			//cues
			finder.goto('clip');
			if(data.q)
			{
				var nameData = finder.get('name').toString().split(' ');
				for(var i in nameData)
				{
					if(startsWith(nameData[i], 'q:'))
					{
						var cueData = nameData[i].split('q:')[1].split(',');
						if(cueData[data.q-1])
						{
							tasks.addTask(set_start_marker, [Math.floor(finder.id), Math.floor(4 * cueData[data.q-1])], 1, false, 'song');
						}
						break;
					}
				}
			}
			
			//active_deck.set_current_clip_data(data.n);
			finder.call('fire');

			//acappella
			if(data.a)
			{
				finder.id = Math.floor(this.acappella.id);
				finder.goto('clip_slots', Math.floor(data.a-1));
				finder.call('stop');
				finder.goto('clip');
				if(data.aq)
				{
					var nameData = finder.get('name').toString().split(' ');
					for(var i in nameData)
					{
						if(startsWith(nameData[i], 'q:'))
						{
							var cueData = nameData[i].split('q:')[1].split(',');
							if(cueData[data.aq])
							{
								tasks.addTask(set_start_marker, [Math.floor(finder.id), Math.floor(4 * cueData[data.aq-1])], 1, false, 'acappella');
							}
							break;
						}
					}
				}
				finder.call('fire');
			}
			if(data.sc1)
			{
				next_scPset[0] = data.sc1;
			}
			if(data.sc2)
			{
				next_scPset[1] = data.sc2;
			}
			debug('scPsets:', next_scPset);
		}
	}
}

DecksComponent.prototype.other_deck = function(deck)
{
	return deck == this.deck_a ? this.deck_b : this.deck_a;
}

DecksComponent.prototype.update_decks = function(id)
{
	finder.id = Math.floor(id);
	if(finder.id == this.deck_a._api_next_clip.id)
	{
		//debug('DECK_A IS PLAYING ITS NEXT_CLIP, lets find another...', finder.path);
		finder.path = 'live_set tracks 0 clip_slots '+(this.currentSlot._value+1)+' clip';
		if(finder.id != this.deck_b._api_next_clip.id)
		{
			this.deck_a.select_next_clip(Math.floor(finder.id));
		}
		else
		{
			finder.path = 'live_set tracks 0 clip_slots '+(this.currentSlot._value+2)+' clip';
			this.deck_a.select_next_clip(Math.floor(finder.id));
		}
	}
	else if(finder.id == this.deck_b._api_next_clip.id)
	{
		//debug('DECK_B IS PLAYING NEXT_CLIP, lets find another...', finder.id);
		finder.path = 'live_set tracks 0 clip_slots '+(this.currentSlot._value+1)+' clip';
		if(finder.id != this.deck_a._api_next_clip.id)
		{
			this.deck_b.select_next_clip(Math.floor(finder.id));
		}
		else
		{
			finder.path = 'live_set tracks 0 clip_slots '+(this.currentSlot._value+2)+' clip';
			this.deck_b.select_next_clip(Math.floor(finder.id));
		}
	}
}

DecksComponent.prototype.set_browser_controls = function(upButton, downButton, loadButton)
{
	this._upButton = upButton;
	this._downButton = downButton;
	this._loadButton = loadButton;
}

DecksComponent.prototype.set_subCrate_controls = function(controls)
{
	this._subCrateButtons = controls;
}

DecksComponent.prototype.override_callback = function(obj)
{
	//debug(this._name, debug('override_callback', obj));
	if(obj._value)
	{
		
	}
	else
	{
		this.enable_browser(false);
	}
}

DecksComponent.prototype.enable_browser = function(focused_deck)
{
	if(focused_deck!=false)
	{
		this._browser_mode = true;
		this._browser_focus = focused_deck;
		focused_deck._browserOffset.set_inc_dec_buttons(this._downButton, this._upButton);
		focused_deck._loadSong.set_control(this._loadButton);
		focused_deck._subCrate.set_controls(this._subCrateButtons);
		focused_deck.update_browser_data();
		//focused_deck.update_display();
	}
	else
	{
		debug('disabling both browsers');
		this.override._value = 0;
		this.override.update_control();
		this._browser_mode = false;
		this._browser_focus = undefined;
		this.deck_a._browserOffset.set_inc_dec_buttons(undefined, undefined);
		this.deck_a._loadSong.set_control();
		this.deck_a._subCrate.set_controls();
		this.deck_b._browserOffset.set_inc_dec_buttons(undefined, undefined);
		this.deck_b._loadSong.set_control();
		this.deck_b._subCrate.set_controls();
		this.deck_a.update_display();
		this.deck_b.update_display();
	}
}


function DeckLoaderComponent(name, args)
{
	this.add_bound_properties(this, ['play_next_song', 'stop_song', 'select_next_clip', 'override_clip', 'playing_slot_index_callback', 'set_current_clip_data', 'set_next_clip_data', 'update_display', 'update_browser_data']);
	this.current_slot = -1;
	this._nextClip = undefined;
	this._current_playing_clip_name = '';
	this._next_playing_clip_name = '';
	this._browser_data = new Array(127);
	this._browser_data[0] = ['NoData'];
	this._browser_data_ids = new Array(127);
	DeckLoaderComponent.super_.call(this, name, args);
	this._subCrate = new RadioComponent(this._name + '_subCrate', 0, 7, 0, undefined, 1, 6, {'onValue':1, 'offValue':2, 'initial':0, 'callback':this.update_browser_data.bind(this)});
	this._browserOffset = new OffsetComponent(this._name + '_browserOffset', 0, 127, 0, this.update_display.bind(this), 1, 2);
	this._loadSong = new MomentaryParameter(this._name + '_loadSong', {'onValue':5, 'offValue':7, 'callback':this.loadSong_callback.bind(this)});
	this.nextSong = new MomentaryParameter(this._name + 'nextSong', {'onValue':4, 'offValue':6, 'callback':this.play_next_song.bind(this)});
	this.stopSong = new MomentaryParameter(this._name + 'stopSong', {'onValue':3, 'offValue':2, 'callback':this.stop_song.bind(this)});
	this.group = new LiveAPI(function(){}, 'live_set', 'tracks', this._group_track_index);
	this.decks = [];
	this._subCrate_names = [];
	this._api_next_clip = new LiveAPI(function(){}, 'live_set', 'tracks', 0, 'clip_slots', this._deckID, 'clip');
	var make_slot_index_callback = function(index)
	{
		return function(args){debug('callback:', index, args); this.playing_slot_index_callback(index, args);}
	}
	for(var i=0;i<5;i++)
	{
		var callback = make_slot_index_callback(i).bind(this);
		this.decks[i] = new LiveAPI(callback, 'live_set', 'tracks', this._group_track_index+1+i);
		this._subCrate_names[i] = this.decks[i].get('name');
		this.decks[i].property = 'playing_slot_index';
	}
	this.select_next_clip(this._api_next_clip.id);
	this.set_current_clip_data('None');
}

inherits(DeckLoaderComponent, Bindable);

DeckLoaderComponent.prototype.play_next_song = function(obj)
{
	if(obj._value)
	{
		if(this._parent.override._value)
		{
			//this.set_browser_buttons(this._parent._browser_buttons, this._parent._track_buttons);
			this._parent.enable_browser(this);
		}
		else
		{
			debug(this._name+'play_next_song');
			this._api_next_clip.call('fire');
			//tasks.addTask(this._parent.update_decks);
		}
	}
}

DeckLoaderComponent.prototype.stop_song = function(obj)
{
	obj._value&&this.group.call('stop_all_clips');
}

DeckLoaderComponent.prototype.select_next_clip = function(id)
{
	debug(this._name, 'select_next_clip:', id);
	this._api_next_clip.id = Math.floor(id);
	debug('path is:', this._api_next_clip.path);
	(this._api_next_clip.id!=0)&&(this.set_next_clip_data(data_for_name(this._api_next_clip.get('name')).n));
}

DeckLoaderComponent.prototype.override_clip = function()
{

}

DeckLoaderComponent.prototype.playing_slot_index_callback = function(index, args)
{
	debug(this._name + 'slot index callback:', index, args[0], '.', args[1]);
	if((args[0] == 'playing_slot_index')&&(args[1]>-1))
	{
		this.current_slot = args[1];
		var path = 'live_set tracks '+(index + this._group_track_index + 1)+' clip_slots '+args[1]+' clip';
		finder.path = path;
		debug(path, finder.get('name')); //Math.floor(finder.id), '==', Math.floor(this._api_next_clip.id), Math.floor(finder.id)==Math.floor(this._api_next_clip.id));
		var data = data_for_name(finder.get('name'));
		if(data.bpm)
		{
			debug('sending out tempo request:', data.bpm);
			patcher.getnamed('tempo_line').message('int', tempo_value);
			patcher.getnamed('tempo_line').message('list', data.bpm, TEMPO_FADE);
		}
		if(Math.floor(finder.id)==Math.floor(this._api_next_clip.id))
		{
			//debug('set_current_clip_data:', data_for_name(finder.get('name')).n);
			this.set_current_clip_data(data.n);
			tasks.addTask(this._parent.update_decks, [Math.floor(finder.id)]);
		}
		//this._parent.update_decks.apply(this._parent, [Math.floor(finder.id)]);
		//this._last_deck = this._deckID;
	}
}

DeckLoaderComponent.prototype.set_current_clip_data = function(name)
{
	debug(this._name, 'set_current_clip_data:', name);
	this._current_playing_clip_name = name ? name.length < 8 ? name+'       ' : name : 'no name data :(';
	this.update_display();
}

DeckLoaderComponent.prototype.set_next_clip_data = function(name)
{
	debug(this._name, 'set_next_clip_data:', name);
	this._next_playing_clip_name = name ? name.length < 8 ? name+'       ' : name : 'no name data :(';
	this.update_display();
}

DeckLoaderComponent.prototype.update_display = function()
{
	if(!this._parent.override._value)
	{
		mod.Send( 'push_name_display', 'value', this._deckID*4, this._deckID ? '  Deck B' : '  Deck A');
		mod.Send( 'push_name_display', 'value', (this._deckID*4) + 1, 'Playing:');
	
		mod.Send( 'push_value_display', 'value', this._deckID*4, this._current_playing_clip_name.slice(0,8));
		mod.Send( 'push_value_display', 'value', (this._deckID*4) + 1, this._current_playing_clip_name.slice(8));

		mod.Send( 'push_name_display', 'value', (this._deckID*4) + 2, this._deckID ? '  Deck B' : '  Deck A');
		mod.Send( 'push_name_display', 'value', (this._deckID*4) + 3, 'Next:');
	
		mod.Send( 'push_value_display', 'value', (this._deckID*4) + 2, this._next_playing_clip_name.slice(0,8));
		mod.Send( 'push_value_display', 'value', (this._deckID*4) + 3, this._next_playing_clip_name.slice(8));
	}
	else
	{
		var pointer_position = (this._browserOffset._value) % 8;
		var browser_page = Math.floor(this._browserOffset._value / 8);
		for(var i=0;i<8;i++)
		{

			mod.Send( 'push_name_display', 'value', i, i == pointer_position ? ('>' + this._browser_data[i+(browser_page*8)]) : this._browser_data[i+(browser_page*8)]);
			mod.Send( 'push_value_display', 'value', i, this._subCrate_names.length > i ? this._subCrate._value == i ? ('>' + this._subCrate_names[i]) : this._subCrate_names[i] : ' - ');
		}
		
	}
}

DeckLoaderComponent.prototype.loadSong_callback = function(obj)
{
	this.select_next_clip(this._browser_data_ids[this._browserOffset._value]);
	//tasks.add_task(this._parent.override.set_value, [0]);   ///WTF???
	this._parent.enable_browser(false);
}

DeckLoaderComponent.prototype.update_browser_data = function()
{
	this._browser_data = new Array(127);
	this._browser_data[0] = ['NoData'];
	this._browser_data_ids = new Array(127);
	var subCrate = this.decks[this._subCrate._value];
	if(subCrate)
	{
		var clipslot_ids = subCrate.get('clip_slots').filter(function(element){return element !== 'id';});
		debug('subcrate clip_slots:', clipslot_ids);
		for(var i in clipslot_ids)
		{
			finder.id = Math.floor(clipslot_ids[i]);
			if(finder.get('has_clip')==1)
			{
				finder.goto('clip');
				var clip_data = data_for_name(finder.get('name'));
				var name = clip_data.n ? clip_data.n : finder.get('name');
				this._browser_data[i] = name ? name : '<'+(i+1)+'>';
				this._browser_data_ids[i] = Math.floor(finder.id);
			}
			else
			{
				this._browser_data[i] = 'empty';
				this._browser_data_ids[i] = 0;
			}
		}
	}
	
	this.update_display();
}




//function
forceload(this);
