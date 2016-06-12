autowatch = 1;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var finder;
var synths_track;
var chain_selectors = [];
var storage;
var ksliders  = [];
var kslider;
var synth_tab;
var lines = [];
var presets = [{'synth':1, 'lo':0, 'hi':24, 'atouch':0, 'program':0},
				{'synth':2, 'lo':25, 'hi':36, 'atouch':0, 'program':0},
				{'synth':3, 'lo':37, 'hi':48, 'atouch':0, 'program':0},
				{'synth':4, 'lo':49, 'hi':61, 'atouch':0, 'program':0}];

var chosen_synth = 4;
var synth_track_names = ['Synth1', 'Synth2', 'Synth3', 'Synth4'];
var synthchooser_storage;
var synth_tracks = [];
var chain_selectors = [];
var dynamic_gate;
var dynamic_assign = false;
var dyn1 = -1;
var dyn2 = -1;
var alive = false;

function init()
{
	debug('synthchooser init');
	for(var i=0;i<4;i++)
	{
		synth_track_names[i] = this.patcher.getnamed('s'+(i+1)+'_name').getvalueof()[0];
	}
	debug('synth_track_names:', synth_track_names);
	detect_synth_tracks();
	for(var i=0;i<4;i++)
	{
		presets[i].synth = this.patcher.getnamed('synth'+(i+1)).getvalueof();
		presets[i].lo = this.patcher.getnamed('lo'+(i+1)).getvalueof();
		presets[i].hi = this.patcher.getnamed('hi'+(i+1)).getvalueof();
		presets[i].atouch = this.patcher.getnamed('touch'+(i+1)).getvalueof();
		presets[i].program = this.patcher.getnamed('prog'+(i+1)).getvalueof();
	}
	storage = this.patcher.getnamed('synthchooser_storage');
	kslider = this.patcher.getnamed('kslider');
	for(var i=0;i<4;i++)
	{
		ksliders[i] = this.patcher.getnamed('s'+(i+1)+'_kslider');
		//lines[i] = this.patcher.getnamed('s'+(i+1)+'_line');
	}
	dynamic_gate = this.patcher.getnamed('dynamic_gate');
	dynamic_gate.message('int', 0);
	synth_tab = this.patcher.getnamed('synth_tab');
	synth_tab.message('int', 4);
	deprivatize_script_functions(this);
	alive = true;
	update();
}

function callback()
{
	var args = arrayfromargs(arguments);
	debug('callback args:', args);
}

function track_callback(){}


function _synth(val)
{
	debug('synth:', val);
	chosen_synth = val;
	update();
}

function _synth_chooser(num, val)
{
	debug('synth_chooser', num, val);
	if(val)
	{
		synth_tab.message('int', num);
		dynamic_assign = true;
		dynamic_gate.message('int', 1);
	}
	else
	{
		dynamic_assign = false;
		dynamic_gate.message('int', 0);
		dyn1 = -1;
		dyn2 = -1;
	}
}

function _change(track, synth, lo, hi, atouch, program)
{
	presets[track] = {'synth':synth, 'lo':lo, 'hi':hi, 'atouch':atouch, 'program':program};
	debug('selector is:', chain_selectors[track]);
	if(chain_selectors[track]!=undefined)
	{
		debug('setting new chain:', synth);
		chain_selectors[track].set('value', synth-1);
	}
	update();
}

function update()
{
	for(var i=0;i<4;i++)
	{
		ksliders[i].message('clear');
		if(chosen_synth == i||chosen_synth == 4)
		{
			var lo = presets[i].lo;
			var hi = presets[i].hi;
			for(var note=lo;note<hi;note++)
			{
				ksliders[i].message('int', note);
			}
		}
	}
}

function anything(){}

function _dynamic_assign_input(note, vel)
{
	if((vel > 0)&&(dynamic_assign))
	{
		debug('dynamic_assign_input', note, vel);
		if(dyn1>-1)
		{
			dyn2 = note;
			this.patcher.getnamed('hi'+(chosen_synth+1)).message('int', dyn2);
		}
		else
		{
			dyn1 = note;
			this.patcher.getnamed('lo'+(chosen_synth+1)).message('int', dyn1);
		}
	}
}

function synth_name(num, text, name)
{
	debug('synth_name:', num, text, name);
	synth_track_names[num] = name;
	detect_synth_tracks();
}

function detect_synth_tracks()
{
	if((!finder)||(!finder.id))
	{
		finder = new LiveAPI(callback, 'live_set');
		debug('this set id is', finder.id);
	}
	if(finder.id!==0)
	{
		finder.goto('live_set');
		var track_ids = finder.get('tracks');
		for(var i in track_ids)
		{
			if(track_ids[i] == 'id')
			{
				delete track_ids[i];
			}
		}
		debug('tracks are:', track_ids);
		for(var i in track_ids)
		{
			finder.id = parseInt(track_ids[i]);
			var name = finder.get('name');
			debug('new finder id is:', finder.id, 'name:', finder.get('name'));
			for(var index in synth_track_names)
			{
				if(name == synth_track_names[index])
				{
					debug('found synth track', index);
					if(!synth_tracks[index])
					{
						synth_tracks[index] = new LiveAPI(track_callback, 'live_set');
					}
					synth_tracks[index].id = parseInt(track_ids[i]);
					debug(synth_tracks[index].get('devices'));
					if(!chain_selectors[index])
					{
						chain_selectors[index] = new LiveAPI(track_callback, 'live_set');
					}
					chain_selectors[index].id = parseInt(track_ids[i]);
					chain_selectors[index].goto('devices', 0, 'parameters', 1);
					debug('chain selector name:', chain_selectors[index].get('name'));
					break;
				}
			}
		}
	}
}

forceload(this);