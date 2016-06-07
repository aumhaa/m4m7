autowatch = 1;

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);

var finder;
var synths_track;
var chain_selectors = [];
var storage;
var ksliders  = [];
var kslider;
var lines = [];
var presets = [{'synth':1, 'lo':0, 'hi':24, 'atouch':0, 'program':0},
				{'synth':2, 'lo':25, 'hi':36, 'atouch':0, 'program':0},
				{'synth':3, 'lo':37, 'hi':48, 'atouch':0, 'program':0},
				{'synth':4, 'lo':49, 'hi':61, 'atouch':0, 'program':0}];

var chosen_synth = 4;
var synth_track_names = ['Synth1', 'Synth2', 'Synth3', 'Synth4'];
var synth_tracks = [];
var chain_selectors = [];

function init()
{
	debug('synthchooser init');
	if((!finder)||(!finder.id))
	{
		finder = new LiveAPI(callback, 'live_set');
		debug('this set id is', finder.id);
		if(finder.id!==0)
		{
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
						synth_tracks[index] = new LiveAPI(track_callback, 'live_set');
						synth_tracks[index].id = parseInt(track_ids[i]);
						debug(synth_tracks[index].get('devices'));
						chain_selectors[index] = new LiveAPI(track_callback, 'live_set');
						chain_selectors[index].id = parseInt(track_ids[i]);
						chain_selectors[index].goto('devices', 0, 'parameters', 1);
						debug('chain selector name:', chain_selectors[index].get('name'));
						break;
					}
				}
			}
		}
	}
	storage = this.patcher.getnamed('synthchooser_storage');
	kslider = this.patcher.getnamed('kslider');
	for(var i=0;i<4;i++)
	{
		ksliders[i] = this.patcher.getnamed('s'+(i+1)+'_kslider');
		//lines[i] = this.patcher.getnamed('s'+(i+1)+'_line');
	}
}

function callback()
{
	var args = arrayfromargs(arguments);
	debug('callback args:', args);
}

function track_callback(){}


function synth(val)
{
	debug('synth:', val);
	chosen_synth = val;
	update();
}

function change(track, synth, lo, hi, atouch, program)
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







forceload(this);