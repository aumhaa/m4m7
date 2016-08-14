autowatch = 1;

outlets = 2;

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);
var script = this;

var finder;
var current_slot;
var deck_a;
var deck_b;
var acappella;
var last_deck = -1;
var Alive = false;
var defer;
var scene_data = {};
var next_scPset = [0, 0];


function startsWith(str, search)
{
	return str.lastIndexOf(search, 0) === 0;
}

function init()
{

	setup_tasks();
	defer = this.patcher.getnamed('defer');
	if(!finder)
	{
		finder = new LiveAPI(finder_cb, 'live_set');
	}
	finder.goto('live_set', 'tracks', 0);
	if(!current_slot)
	{
		current_slot = new LiveAPI(current_slot_cb, 'live_set', 'tracks', 0);
	}
	current_slot.property = 'playing_slot_index';
	if(!deck_a)
	{
		deck_a = {};
		deck_a.current_slot = -1;
		deck_a.group = new LiveAPI(cb, 'live_set', 'tracks', 1);
		deck_a.decks = [];
		for(var i=0;i<5;i++)
		{
			deck_a.decks[i] = new LiveAPI(deck_a_cb, 'live_set', 'tracks', i+2);
			deck_a.decks[i].property = 'playing_slot_index';
		}
	}
	if(!deck_b)
	{
		deck_b = {};
		deck_b.current_slot = -1;
		deck_b.group = new LiveAPI(cb, 'live_set', 'tracks', 7);
		deck_b.decks = [];
		for(var i=0;i<5;i++)
		{
			deck_b.decks[i] = new LiveAPI(deck_b_cb, 'live_set', 'tracks', i+8);
			deck_b.decks[i].property = 'playing_slot_index';
		}
	}
	if(!acappella)
	{
		acappella = new LiveAPI(cb, 'live_set', 'tracks', 13);
	}
	Alive = true;
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 300);
}

function finder_cb(args)
{
	//debug('finder_cb:', args);
}

function cb(){}

function deck_a_cb(args)
{
	//debug('deck_a_cb:', args[0], '...', args[1]);
	if((args[0] == 'playing_slot_index')&&(args[1]>-1))
	{
		deck_a.current_slot = args[1];
		last_deck = 0;
	}
}

function deck_b_cb(args)
{
	//debug('deck_b_cb:', args[0], '...', args[1]);
	if((args[0] == 'playing_slot_index')&&(args[1]>-1))
	{
		deck_b.current_slot = args[1];
		last_deck = 1;
	}
}

function current_slot_cb(args)
{
	//debug('current_slot_cb:', args[0], '...', args[1]);
	if(args[0] == 'playing_slot_index')
	{
		if(args[1]>-1)
		{
			finder.goto('live_set', 'tracks', 0, 'clip_slots', args[1], 'clip');
			var name = finder.get('name');
			//debug('clip name is:', name);
			var raw_data = name.toString().split(' ');
			var data = {};
			for(var i in raw_data)
			{
				var items = raw_data[i].split(':');
				data[items[0]] = items[1];
			}
			//tasks.addTask(fire_scene, [data]);
			//scene_data = data;
			//defer.message('fire_scene');
			fire_scene(data);
		}
	}
}

function fire_scene(data)
{
	//var data = scene_data;
	if(Alive)
	{
		//debug('fire_scene:', data);
		if((data.s)&&(data.bpm))
		{
			//debug('data.s:', data.s, 'data.bpm:', data.bpm);
			var next_deck = last_deck == -1 ? deck_a : last_deck == 0 ? deck_b : deck_a;
			if(next_deck.decks[data.bpm-1])
			{
				//song
				next_deck.group.call('stop_all_clips');
				finder.id = Math.floor(next_deck.decks[data.bpm-1].id);
				finder.goto('clip_slots', Math.floor(data.s-1));
				finder.call('stop')

				//cues
				finder.goto('clip');
				if(data.q)
				{
					var nameData = finder.get('name').toString().split(' ');
					//debug('data.q:', data.q, 'nameData:', nameData);
					for(var i in nameData)
					{
						//debug('nameData', i, nameData[i], startsWith(nameData[i], 'q:'))
						if(startsWith(nameData[i], 'q:'))
						{
							var cueData = nameData[i].split('q:')[1].split(',');
							//debug('cueData:', cueData);
							if(cueData[data.q-1])
							{
								//var denominator = finder.get('signature_denominator');
								//var numerator = finder.get('signature_numerator');
								//debug('song start marker to:', Math.floor(4 * cueData[data.q-1]));
								//finder.call('set', 'start_marker', Math.floor(denominator * cueData[data.q]));
								//finder.set('start_marker', Math.floor(4 * cueData[data.q-1]));
								//defer.message(Math.floor(finder.id), Math.floor(4 * cueData[data.q-1]));
								tasks.addTask(set_start_marker, [Math.floor(finder.id), Math.floor(4 * cueData[data.q-1])], 1, false, 'song');
							}
							break;
						}
					}
				}
				finder.call('fire');

				//acappella
				if(data.a)
				{
					finder.id = Math.floor(acappella.id);
					finder.goto('clip_slots', Math.floor(data.a-1));
					finder.call('stop');
					finder.goto('clip');
					if(data.aq)
					{
						var nameData = finder.get('name').toString().split(' ');
						//debug('data.aq:', data.aq, 'nameData:', nameData);
						for(var i in nameData)
						{
							//debug('nameData', i, nameData[i], startsWith(nameData[i], 'q:'))
							if(startsWith(nameData[i], 'q:'))
							{
								var cueData = nameData[i].split('q:')[1].split(',');
								//debug('cueData:', cueData);
								if(cueData[data.aq])
								{
									//var denominator = finder.get('signature_denominator');
									//var numerator = finder.get('signature_numerator');
									//debug('acappella start marker to:', Math.floor(4 * cueData[data.aq]));
									//finder.call('set', 'start_marker', Math.floor(denominator * cueData[data.q]));
									//finder.set('start_marker', Math.floor(4 * cueData[data.aq-1]));
									//defer.message(Math.floor(finder.id), Math.floor(4 * cueData[data.aq-1]));
									tasks.addTask(set_start_marker, [Math.floor(finder.id), Math.floor(4 * cueData[data.aq-1])], 1, false, 'acappella');
								}
								break;
							}
						}
					}
					//debug('acappella slot:', data.a);

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
}

function set_start_marker(id, val)
{
	debug('set_start_marker:', id, val);
	finder.id = id;
	finder.set('start_marker', val);
}

function sc_pset(num, val)
{
	debug('send sc_pset, button', num, val?'pressed':'not pressed');
	//messnamed('sc_pset', num, next_scPset[num]);
	outlet(0, 'sc_pset', num+1, next_scPset[num]);
}


forceload(this);
