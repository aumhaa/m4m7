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
var api_xfader;
var decks;
var Alive = false;
var defer;
var scene_data = {};
var next_scPset = [0, 0];
var next_dcPset = [0, 0];
var lastTempo = undefined;
var nextTempo = 100;
var TEMPO_FADE = 1500;  //ms
var xFaderValue = 0;
var device_ids = [0, 0, 0, 0, 0, 0, 0, 0, 0];


var mod_finder;

var Mod = ModComponent.bind(script);

var SETLIST_BANKS = {'NoDevice':[['CustomParameter_0', 'CustomParameter_1', 'CustomParameter_2', 'CustomParameter_3', 'CustomParameter_4', 'CustomParameter_5', 'CustomParameter_6', 'CustomParameter_7', 'CustomParameter_8']],
					'Other':[['CustomParameter_0', 'CustomParameter_1', 'CustomParameter_2', 'CustomParameter_3', 'CustomParameter_4', 'CustomParameter_5', 'CustomParameter_6', 'CustomParameter_7', 'CustomParameter_8']]};



function init()
{
	debug('setListDevice init');

	defer = this.patcher.getnamed('defer');
	if(!finder)
	{
		script['finder'] = new LiveAPI(function(){}, 'live_set');
	}
	finder.goto('live_set', 'tracks', 0);

	if(!api_song)
	{
		script['api_song'] = new LiveAPI(tempo_callback, 'live_set');
		api_song.property = 'tempo';
		//nextTempo = this.api_song.get('tempo');
	}

	if(!api_xfader)
	{
		script['api_xfader'] = new LiveAPI(xfader_cb, 'live_set', 'master_track', 'mixer_device', 'crossfader');
		//xFaderValue = api_xfader.get('value');
		api_xfader.property = 'value';
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

function xfader_cb(args)
{
	debug('xfader_cb', args);
	if(args[0]=='value')
	{
		xFaderValue = Math.floor(args[1]);
		for(var i in xFades)
		{
			xFades[i].update_control();
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
	script['ShiftButton'] = new ButtonClass(0, 'Shift', make_send_func('shift', 'value', 0));
	script['_shift'] = function(val){ShiftButton.receive(val);}
	script['AltButton'] = new ButtonClass(0, 'Alt', make_send_func('alt', 'value', 0));
	script['_alt'] = function(val){AltButton.receive(val);}
}

function setup_patcher()
{
}

function setup_device()
{
	mod.Send('receive_device', 'set_mod_device_type', 'setListDevice');
	mod.Send( 'receive_device', 'set_number_params', 16);
	mod.Send( 'receive_device', 'set_number_custom', 16);
	for(var dev_type in SETLIST_BANKS)
	{
		for(var bank_num in SETLIST_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, SETLIST_BANKS[dev_type][bank_num]);
		}
		mod.Send('receive_device_proxy', 'update_parameters');
	}
	finder.path = 'live_set';
	var tracks = parse_ids(finder.get('tracks'));
	debug('parsed ids:', tracks);
	for(var id in tracks)
	{
		//debug('track:', id, 'id:', tracks[id]);
		finder.id = Math.floor(tracks[id]);
		var devices = parse_ids(finder.get('devices'));
		//debug('devices:', devices, 'length:', devices.length);
		if(devices.length>0)
		{
			finder.id = Math.floor(devices[0]);
			//debug('finder path is now:', finder.path);
			if(finder.get('name')=='DECK_FX_A')
			{
				debug('found DECK_FX_A');
				var params = parse_ids(finder.get('parameters'));
				device_ids[0] =params[1];
				device_ids[1] = params[2];
				finder.goto('canonical_parent', 'mixer_device', 'sends', 0);
				device_ids[2] = finder.id;
			}
			else if(finder.get('name')=='DECK_FX_B')
			{
				debug('found DECK_FX_B');
				var params = parse_ids(finder.get('parameters'));
				device_ids[3] = params[1];
				device_ids[4] = params[2];
				finder.goto('canonical_parent', 'mixer_device', 'sends', 0);
				device_ids[5] = finder.id;
			}
			if(finder.get('name')=='DECK_FX_ACAP')
			{
				debug('found DECK_FX_ACAP');
				var params = parse_ids(finder.get('parameters'));
				device_ids[6] =params[1];
				device_ids[7] = params[2];
				finder.goto('canonical_parent', 'mixer_device', 'sends', 0);
				device_ids[8] = finder.id;
			}
		}
	}
	debug('device ids:', device_ids);
	for(var i=0;i<8;i++)
	{
		mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', i, 'id', device_ids[i] ? device_ids[i] : 0);
	}
}

function setup_decks()
{
	decks = new DecksComponent('Decks');
}

function setup_notifiers()
{
	var send_dcPset = function(){debug('send_dcPset');outlet(0, 'dc_pset', 1, next_dcPset[0] + 1);}
	var send_scPset1 = function(){outlet(0, 'sc_pset', 1, next_scPset[0]);}
	var send_scPset2 = function(){outlet(0, 'sc_pset', 2, next_scPset[1]);}
	var set_xFadeA = function(){api_xfader.set('value', -1);};
	var set_xFadeB = function(){api_xfader.set('value', 1);};
	var set_xFadeC = function(){api_xfader.set('value', 0);};

	tempoChange = new MomentaryParameter('TempoChange', {'onValue':1, 'offValue':2, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&fade_tempo(nextTempo);}});
	soundChange = new MomentaryParameter('soundChange', {'onValue':1, 'offValue':2, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&send_dcPset();}});
	SC1soundChange = new MomentaryParameter('SC1soundChange', {'onValue':1, 'offValue':2, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&send_scPset1();}});
	SC2soundChange = new MomentaryParameter('SC2soundChange', {'onValue':1, 'offValue':2, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&send_scPset2();}});

	xFadeA = new MomentaryParameter('xFadeA', {'onValue':1, 'offValue':3, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&set_xFadeA();}});
	xFadeA.update_control = function(){if(this._control){this._control.send(Math.floor(xFaderValue==-1)+1);}}
	xFadeB = new MomentaryParameter('xFadeB', {'onValue':1, 'offValue':3, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&set_xFadeB();}});
	xFadeB.update_control = function(){if(this._control){this._control.send(Math.floor(xFaderValue==1)+1);}}
	xFadeC = new MomentaryParameter('xFadeC', {'onValue':1, 'offValue':3, 'value':0, 'initial':0, 'callback':function(obj){obj._value&&set_xFadeC();}});
	xFadeC.update_control = function(){if(this._control){this._control.send(Math.floor(xFaderValue==0)+1);}}
	xFades = [xFadeA, xFadeB, xFadeC];
}

function setup_modes()
{

	var main_Page = new Page('Main');
	main_Page.enter_mode = function()
	{
		tempoChange.set_control(KeyButtons[7]);
		soundChange.set_control(KeyButtons[6]);
		SC1soundChange.set_control(KeyButtons[4]);
		SC2soundChange.set_control(KeyButtons[5]);
		decks.override.set_control(KeyButtons[1]);
		xFadeA.set_control(GridButtons[0][2]);
		xFadeB.set_control(GridButtons[2][2]);
		xFadeC.set_control(GridButtons[1][2]);
		decks.set_browser_controls(KeyButtons[5], KeyButtons[6], KeyButtons[7]);
		decks.set_subCrate_controls(Key2Grid);
		decks.deck_a.nextSong.set_control(GridButtons[0][0]);
		decks.deck_b.nextSong.set_control(GridButtons[2][0]);
		decks.deck_a.stopSong.set_control(GridButtons[0][1]);
		decks.deck_b.stopSong.set_control(GridButtons[2][1]);
		decks.deck_a.retrigSong.set_control(GridButtons[0][3]);
		decks.deck_b.retrigSong.set_control(GridButtons[2][3]);
		decks.deck_a.resetParams.set_control(KeyButtons[0]);
		decks.deck_b.resetParams.set_control(KeyButtons[2]);
		decks.acap_nextSong.set_control(GridButtons[3][0]);
		decks.acap_stopSong.set_control(GridButtons[3][1]);
	}
	main_Page.exit_mode = function()
	{
		tempoChange.set_control();
		soundChange.set_control();
		SC1soundChange.set_control();
		SC2soundChange.set_control();
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
	debug('path:', finder.path);
	finder.set('start_marker', val);
}

function sc_pset(num, val)
{
	debug('send sc_pset, button', num, val?'pressed':'not pressed');
	//messnamed('sc_pset', num, next_scPset[num]);
	outlet(0, 'sc_pset', num+1, next_scPset[num]);
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


function tempo_time(val)
{
	TEMPO_FADE = val;
}

function set_tempo(val)
{
	//debug('set_tempo:', val);
	api_song.set('tempo', val);
}

function fade_tempo(newTempo)
{
	patcher.getnamed('tempo_line').message('int', lastTempo);
	patcher.getnamed('tempo_line').message('list', newTempo, TEMPO_FADE);
}

function tempo_callback(args)
{
	//debug('tempo_callback', args);
	if(args[0]=='tempo')
	{
		lastTempo = args[1];
	}
}



function DecksComponent(name, name, args)
{
	this.add_bound_properties(this, ['currentSlot_callback', 'fire_scene', 'other_deck', 'update_decks', 'set_browser_controls', 'set_subCrate_controls', 'override_callback', 'enable_browser', 'acap_play_next_song', 'acap_stop_song']);
	DecksComponent.super_.call(this, name, args);
	this._slotPointer = 0;
	this._nextAcap = 0;
	this._nextAcapQ = 0;
	this._browser_mode = false;
	this._upButton = undefined;
	this._downButton = undefined;
	this._loadButton = undefined;
	this._subCrateButtons = undefined;
	this._browserFocus = undefined;
	this.override = new ToggledParameter('Override', {'onValue':1, 'offValue':2, 'value':0, 'callback':this.override_callback.bind(this)});
	this.currentSlot = new ParameterClass('currentSlot', {'apiProperty':'playing_slot_index', 'callback':this.currentSlot_callback.bind(this)} );
	this.acap_currentSlot = new ParameterClass('acap_currentSlot', {'apiProperty':'playing_slot_index'} );

	this.deck_a = new DeckLoaderComponent('DeckALoader', {'deckID':0, 'group_track_index':1, 'parent':this});
	this.deck_b = new DeckLoaderComponent('DeckBLoader', {'deckID':1, 'group_track_index':7, 'parent':this});
	this.decks = [this.deck_a, this.deck_b];
	this._last_deck = -1;
	this.acappella = new LiveAPI(this.acap_currentSlot._apiCallback, 'live_set', 'tracks', 13);

	this.acap_nextSong = new MomentaryParameter(this._name + 'acap_nextSong', {'onValue':4, 'offValue':6, 'callback':this.acap_play_next_song.bind(this)});
	this.acap_nextSong.update_control = function(){if(this.acap_nextSong._control){this.acap_nextSong._control.send(((this.acap_currentSlot._value > -1)+1)*6);}}.bind(this);
	this.acap_stopSong = new MomentaryParameter(this._name + 'stopSong', {'onValue':3, 'offValue':2, 'callback':this.acap_stop_song.bind(this)});
	this.acap_stopSong.update_control = function(){if(this.acap_stopSong._control){this.acap_stopSong._control.send((this.acap_currentSlot._value > -1)*5);}}.bind(this);

	this.api_current_slot = new LiveAPI(this.currentSlot._apiCallback, 'live_set', 'tracks', 0);
	this.api_current_slot.property = 'playing_slot_index';
	this.acappella.property = 'playing_slot_index';
	var callback = function()
	{
		this.acap_nextSong.update_control();
		this.acap_stopSong.update_control();
	}
	this.acap_currentSlot.set_target(callback.bind(this));
}

inherits(DecksComponent, Bindable);

DecksComponent.prototype.acap_play_next_song = function(obj)
{
	if(obj._value)
	{
		this.acappella.call('stop_all_clips');
		debug('firing acappella clip...', this._nextAcap);
		finder.id = this._nextAcap;
		if(this._nextAcapQ > -1)
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
}

DecksComponent.prototype.acap_stop_song = function(obj)
{
	if(obj._value)
	{
		this.acappella.call('stop_all_clips');
		debug('stopping acappella clip...');
	}
}

DecksComponent.prototype.currentSlot_callback = function(obj)
{
	if(Alive&&obj._value>-1)
	{
		this._slotPointer = obj._value > this._slotPointer ? obj._value : this._slotPointer;
		finder.goto('live_set', 'tracks', 0, 'clip_slots', obj._value, 'clip');
		var id = Math.floor(finder.id);
		var data = data_for_name(finder.get('name'));
		this.fire_scene(data, id);
		debug('currentSlot:', id, this.deck_a._api_next_clip.id, this.deck_b._api_next_clip.id, id==Math.floor(this.deck_a._api_next_clip.id), id==Math.floor(this.deck_b._api_next_clip.id));
		id==Math.floor(this.deck_a._api_next_clip.id)&&this.deck_a.set_current_clip_data(data.n);
		id==Math.floor(this.deck_b._api_next_clip.id)&&this.deck_b.set_current_clip_data(data.n);
		this.update_decks(id);
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
			//active_deck.group.call('stop_all_clips');
			finder.id = Math.floor(active_deck.decks[data.bpm-1].id);
			finder.goto('clip_slots', Math.floor(data.s-1));
			finder.call('stop')

			//cues
			finder.goto('clip');
			if(data.q!=undefined)
			{
				var nameData = finder.get('name').toString().split(' ');
				for(var i in nameData)
				{
					if(startsWith(nameData[i], 'q:'))
					{
						var cueData = nameData[i].split('q:')[1].split(',');
						if(cueData[data.q-1])
						{
							debug('firing q:', data.q-1, cueData[data.q-1]);
							tasks.addTask(set_start_marker, [Math.floor(finder.id), Math.floor(4 * cueData[data.q-1])], 2, false, 'song');
							//set_start_marker(Math.floor(finder.id), Math.floor(4 * cueData[data.q-1]));
						}
						break;
					}
				}
			}
			
			//active_deck.set_current_clip_data(data.n);
			finder.call('fire');

			//acappella
			this._nextAcap = 0;
			if(data.a!=undefined)
			{
				finder.id = Math.floor(this.acappella.id);
				finder.goto('clip_slots', Math.floor(data.a-1));
				finder.call('stop');
				finder.goto('clip');
				this._nextAcapQ =  data.aq ? data.aq : -1;
				this._nextAcap = Math.floor(finder.id);
				//finder.call('fire');
			}
			if(data.sc1!=undefined)
			{
				next_scPset[0] = data.sc1;
			}
			if(data.sc2!=undefined)
			{
				next_scPset[1] = data.sc2;
			}
			if(data.dc1!=undefined)
			{
				next_dcPset[0] = data.dc1;
			}
			if(data.dc2!=undefined)
			{
				next_dcPset[1] = data.dc2;
			}
			debug('scPsets:', next_scPset, 'dcPsets:', next_dcPset);
		}
	}
}

DecksComponent.prototype.other_deck = function(deck)
{
	return deck == this.deck_a ? this.deck_b : this.deck_a;
}

DecksComponent.prototype.update_decks = function(current_playing_id)
{
	for(var i in this.decks)
	{
		this.decks[i].update_deck(current_playing_id);
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
		this.deck_a.nextSong.update_control();
		this.deck_b.nextSong.update_control();
		this.deck_a.stopSong.update_control();
		this.deck_b.stopSong.update_control();
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
		this.deck_a.nextSong.update_control();
		this.deck_b.nextSong.update_control();
		this.deck_a.stopSong.update_control();
		this.deck_b.stopSong.update_control();
	}
}


function DeckLoaderComponent(name, args)
{
	this.add_bound_properties(this, ['play_next_song', 'stop_song', 'load_next_clip', 'override_clip', 'playing_slot_index_callback', 'set_current_clip_data', 'set_next_clip_data', 'update_display', 'update_browser_data']);
	this.current_slot = -1;
	this.currentMainSlot = -1;
	this._isPlaying = false;
	this._nextClip = undefined;
	this._current_playing_clip_name = '';
	this._next_playing_clip_name = '';
	this._browser_data = new Array(127);
	this._browser_data[0] = ['NoData'];
	this._browser_data_ids = new Array(127);
	DeckLoaderComponent.super_.call(this, name, args);
	this._subCrate = new RadioComponent(this._name + '_subCrate', 0, 7, 0, undefined, 1, 6, {'onValue':1, 'offValue':2, 'initial':0, 'callback':this.update_browser_data.bind(this)});
	this._browserOffset = new OffsetComponent(this._name + '_browserOffset', 0, 127, 0, this.update_display.bind(this), 64, 0);
	this._loadSong = new MomentaryParameter(this._name + '_loadSong', {'onValue':1, 'offValue':1, 'callback':this.loadSong_callback.bind(this)});
	this.nextSong = new MomentaryParameter(this._name + 'nextSong', {'onValue':4, 'offValue':6, 'callback':this.play_next_song.bind(this)});
	this.nextSong.update_control = function(){if(this.nextSong._control){this.nextSong._control.send((this._parent.override._value ? 12 : Math.floor(this._isPlaying)+1)*6);}}.bind(this);
	this.stopSong = new MomentaryParameter(this._name + 'stopSong', {'onValue':3, 'offValue':2, 'callback':this.stop_song.bind(this)});
	this.stopSong.update_control = function(){if(this.stopSong._control){this.stopSong._control.send(this._parent.override._value ? 13 : Math.floor(this._isPlaying)*5);}}.bind(this);
	this.retrigSong = new MomentaryParameter(this._name + 'retrigSong', {'onValue':3, 'offValue':2, 'callback':this.retrig_song.bind(this)});
	this.retrigSong.update_control = function(){if(this.retrigSong._control){this.retrigSong._control.send(this._parent.override._value ? 14 : Math.floor(this._isPlaying)*15);}}.bind(this);
	this.resetParams = new MomentaryParameter(this._name + 'resetParams', {'value':0, 'onValue':13, 'offValue':10, 'callback':this.reset_params.bind(this)});

	this.group = new LiveAPI(function(){}, 'live_set', 'tracks', this._group_track_index);
	this.decks = [];
	this.deck_playing_slot_indexes = [];
	this._subCrate_names = [];
	this._api_next_clip = new LiveAPI(function(){}, 'live_set', 'tracks', 0, 'clip_slots', this._deckID, 'clip');
	var make_slot_index_callback = function(index)
	{
		return function(args){this.playing_slot_index_callback(index, args);}
	}
	for(var i=0;i<5;i++)
	{
		var callback = make_slot_index_callback(i).bind(this);
		this.decks[i] = new LiveAPI(callback, 'live_set', 'tracks', this._group_track_index+1+i);
		this._subCrate_names[i] = this.decks[i].get('name');
		this.decks[i].property = 'playing_slot_index';
	}
	//this.load_next_clip(this._api_next_clip.id, this._deckID);
	this.load_next_clip();
	this.set_current_clip_data('None');
	this._isPlaying = false;
}

inherits(DeckLoaderComponent, Bindable);

DeckLoaderComponent.prototype.reset_params = function(obj)
{
	debug('reset params');
	if(obj._value)
	{
		for(var i=0;i<3;i++)
		{
			//debug('set_custom_parameter_value', i+(this._id*3), 0);
			mod.Send('send_explicit', 'receive_device_proxy', 'set_custom_parameter_value', i+(this._deckID*3), 0);
		}
	}
}

DeckLoaderComponent.prototype.play_next_song = function(obj)
{
	if(obj._value)
	{
		if(this._parent.override._value)
		{
			this._parent.enable_browser(false);
			this.load_next_clip();
			
		}
		else
		{
			this.group.call('stop_all_clips');
			this._retrig_clip_id = Math.floor(this._api_next_clip.id);
			this._api_next_clip.call('fire');
		}
	}
}

DeckLoaderComponent.prototype.stop_song = function(obj)
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
			if(ShiftButton.pressed())
			{
				this.group.call('stop_all_clips');
			}
		}
	}
}

DeckLoaderComponent.prototype.retrig_song = function(obj)
{
	if(obj._value)
	{
		if(this._parent.override._value)
		{
			//this.set_browser_buttons(this._parent._browser_buttons, this._parent._track_buttons);
			//this._parent.enable_browser(this);
		}
		else
		{
			debug('retrigger song:', this._retrig_clip_id);
			finder.id = this._retrig_clip_id;
			finder.call('fire');
		}
	}
}

DeckLoaderComponent.prototype.load_next_clip = function()
{
	debug(this._name, 'load_next_clip  slotPointer:', this._parent._slotPointer);
	var path = 'live_set tracks 0 clip_slots '+(this._parent._slotPointer)+' clip';
	finder.path = path;
	this._api_next_clip.id = Math.floor(finder.id);
	this.set_next_clip_data(this._api_next_clip.id!=0 ? data_for_name(this._api_next_clip.get('name')).n : 'NoData');
	this._parent._slotPointer += 1;
}

DeckLoaderComponent.prototype.override_next_clip = function(id, index)
{
	this._api_next_clip.id = Math.floor(id);
	this.set_next_clip_data(this._api_next_clip.id!=0 ? data_for_name(this._api_next_clip.get('name')).n : 'NoData');
}

DeckLoaderComponent.prototype.playing_slot_index_callback = function(index, args)
{
	//debug(this._name + 'slot index callback:', index, args[0], '.', args[1]);
	if(args[0] == 'playing_slot_index')
	{
		this.deck_playing_slot_indexes[index] = args[1];
		this._isPlaying = false;
		for(var i in this.deck_playing_slot_indexes)
		{
			if(this.deck_playing_slot_indexes[i]>-1)
			{
				this._isPlaying = true;
				break;
			}
		}
		this.nextSong.update_control();
		this.stopSong.update_control();
		if(args[1]>-1)
		{
			var path = 'live_set tracks '+(index + this._group_track_index + 1)+' clip_slots '+args[1]+' clip';
			finder.path = path;
			var data = data_for_name(finder.get('name'));
			if(data.bpm)
			{
				//debug('sending out tempo request:', data.bpm);
				nextTempo = data.bpm;
			}
			if(data.sc1!=undefined)
			{
				next_scPset[0] = data.sc1;
			}
			if(data.sc2!=undefined)
			{
				next_scPset[1] = data.sc2;
			}
			if(data.dc1!=undefined)
			{
				next_dcPset[0] = data.dc1;
			}
			if(data.dc2!=undefined)
			{
				next_dcPset[1] = data.dc2;
			}
			debug('scPsets:', next_scPset, 'dcPsets:', next_dcPset);
			if(Math.floor(finder.id)==Math.floor(this._api_next_clip.id))
			{
				debug(this._name, 'playing_slot_index_callback.set_current_clip_data:', data_for_name(finder.get('name')).n);
				this.set_current_clip_data(data.n);
				this.update_deck(Math.floor(finder.id));
			}
		}
	}
}

DeckLoaderComponent.prototype.set_current_clip_data = function(name)
{
	//debug(this._name, 'set_current_clip_data:', name);
	this._current_playing_clip_name = name ? name.length < 8 ? name+'       ' : name : 'no name data :(';
	this.update_display();
}

DeckLoaderComponent.prototype.set_next_clip_data = function(name)
{
	//debug(this._name, 'set_next_clip_data:', name);
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

DeckLoaderComponent.prototype.update_display = function()
{
	if(!this._parent.override._value)
	{
	
		mod.Send( 'push_name_display', 'value', this._deckID*2, this._current_playing_clip_name.slice(0,8));
		mod.Send( 'push_name_display', 'value', (this._deckID*2) + 1, this._current_playing_clip_name.slice(8));

	
		mod.Send( 'push_value_display', 'value', (this._deckID*2), this._next_playing_clip_name.slice(0,8));
		mod.Send( 'push_value_display', 'value', (this._deckID*2) + 1, this._next_playing_clip_name.slice(8));

		mod.Send( 'push_name_display', 'value', 6, 'Tempo:');
		mod.Send( 'push_name_display', 'value', 7, lastTempo);

	
		mod.Send( 'push_value_display', 'value', 6, 'NxtTempo:');
		mod.Send( 'push_value_display', 'value', 7, nextTempo);
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
	//this.load_next_clip(this._browser_data_ids[this._browserOffset._value], this.currentMainSlot);
	this.override_next_clip(this._browser_data_ids[this._browserOffset._value], this.currentMainSlot);
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

DeckLoaderComponent.prototype.update_deck = function(current_playing_id)
{
	finder.id = Math.floor(current_playing_id);
	if(finder.id == this._api_next_clip.id)
	{
		this.load_next_clip();
	}
}




forceload(this);
