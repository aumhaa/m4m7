autowatch = 1;

inlets = 1;
outlets = 4;

var DEBUG = false;
var FORCELOAD = false;
var STATS_GRAPH = false;
var script = this;
var unique = jsarguments[1];
var Alive = false;

var held_notes = []; //active sequence of note #'s to be output to coll for use in arp processing
var held_velocities = [];  //active sequence of velocities to be output to coll for use in arp processing
var ordered_held_notes = [];  //currently held notes, in the order that they were received
var ordered_held_velocities = [];  //currently held velocities, keyed to their corresponding held note.
var statuses = [];
var dice_statuses = [];

//the matrixes contains SILENCE, RATCHET, TIE, GATE and NOTE_OFFSET values for each step
var DEFAULT_STATUSES = [[0,60,0,100,0],[0,0,0,100,5],[0,0,0,100,7],[0,0,0,100,10],[0,0,0,100,3],[0,0,0,100,0],[0,0,0,100,10],[0,0,0,100,12]];
var NORMALIZED_DICE_STATUSES = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]];
var MODE_VALUES = ['down', 'up', 'excl', 'incl', 'random', 'order'];  //CONST array holding descriptive name for each mode
var RANGE_VALUES = [-1, 0, 1, 2, 3, 4];   //CONST array holding actual values for range knob
var SYNCED_TEMPOS = [15360, 7680, 3840, 1920, 960, 640, 480, 320, 240, 160, 120, 80, 60, 40, 30, 20];
var SYNCED_TEMPO_NAMES = ['8 notes', '4 notes', '2 notes', '1 note', '1/2 n', '1/2 nt', '1/4 n', '1/4 nt', '1/8 n', '1/8 nt', '1/16 n', '1/16 nt', '1/32 n', '1/32 nt'];
var UNSYNCED_TEMPOS = [];
for(var i = 0;i<14;i++)
{
	var t = SYNCED_TEMPOS[i];
	var t2 = SYNCED_TEMPOS[i+1];
	var diff = t - t2;
	var interval = diff/9;
	UNSYNCED_TEMPOS.push(t);
	for(var j=0;j<9;j++)
	{
		t -= interval;
		UNSYNCED_TEMPOS.push(Math.round(t));
	}
}
GATEMIN = 8;

var enabled = true;
var spice_enabled = false;
var dice_enabled = false;
var fixVel = false;
var mode = 'down';
var range = 0;
var dice_dial_val = 64;
var spice_dial_val = 64;
var dice_factor = 0;
var spice_factor = 0;
var PB_val = 64;
var sync = true;
var tempo_val = 64;
var tempo = 480;
var current_active_notes = 0;
var last_metro = 0;
var skip_next_beat = false;

function deprivatize_script_functions(script)
{
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			//debug('replacing', i, '\n');
			script[i.replace('_', "")] = script[i];
		}
	}
}

function protoarrayfromargs(args)
{
	return Array.prototype.slice.call(args, 0);
}

Debug = function()
{
	var args = protoarrayfromargs(arguments);
	for(var i in args)
	{
		if(args[i] instanceof Array)
		{
			args[i] = args[i].join(' ');
		}
	}
	post('debug->', args, '\n');
}

Forceload = function(script)
{
	post('FORCELOAD!!!!!!!\n');
	script.init(1);
}

update_stats_graph = function(){};

var debug = DEBUG ? Debug : function(){};
var forceload = FORCELOAD ? Forceload : function(){};
var update_stats_graph = STATS_GRAPH ? UpdateStatsGraph : function(){};

CounterClass =  function(callback)
{
	this._self = this;
	this._callback = callback != undefined ? callback : function(){};
	this._restart = true;
	this._dir = 1;  //1 is up, -1 is down
	this.count = 0;
	this.last_count = 0;
	this.hi = 0;
	this.low = 0;
	this.mode = 'down';
	this.full = false;
}

CounterClass.prototype.bang = function()
{
	var last_count = this.count;
	//debug('dir:', this._dir, 'full:', this.full);
	if(this._restart)
	{
		this.count = this.mode == 'down' ? this.hi : this.low;
		this._restart = false;
	}
	else if(this.mode == 'incl')  //||((this.mode == 'excl')&&(this.hi<3)))
	{
		this.count = this.wrap(this.count + this._dir);
		this._dir = (this.count==this.low||this.count==this.hi) ? this._dir * (-1) : this._dir;
	}
	else if(this.mode == 'excl')
	{
		if(this.full)
		{
			this.count = this.exclwrap(this.count + this._dir);
			this._dir = (this.count==this.low+1||this.count==this.hi-1) ? this._dir * (-1) : this._dir;
		}
		else
		{
			this.count = this.wrap(this.count + this._dir);
			this._dir = (this.count==this.low||this.count==this.hi) ? this._dir * (-1) : this._dir;
		}
	}
	else if(this.mode == 'random')
	{
		this.count = Math.floor(Math.random()*(this.hi+1));
	}
	else
	{
		this.count = this.wrap(this.count + this._dir);
	}
	this.full = this.full ? this.full : last_count > this.count;
	this.last_count = last_count;
	this._callback(parseInt(this.count));
	//debug('count:', this.count);
}

CounterClass.prototype.wrap = function(i)
{
	//if ((i<this.low)||(i>this.hi)){this.full = true;debug('full!')}
	return i < this.low ? this.hi : this.hi > 0 ? i % (this.hi+1) : 0
}

CounterClass.prototype.exclwrap = function(i)
{
	return i < this.low+1 ? this.hi-1 : this.hi > 0 ? i % (this.hi) : 0
}

CounterClass.prototype.unfill = function()
{
	this.full = false;
}

CounterClass.prototype.change_mode = function(new_mode)
{
	if(new_mode != this.mode)
	{
		switch(new_mode)
		{
			case 'down':
				this._dir = -1;
				break;
			case 'excl':
				this.full = false;
				break;
			case 'incl':
				break;
			default:
				this._dir = 1;
				break;
		}
	}
	this.mode = new_mode;
}



function init()
{
	debug('Arp_logic.init()!!!');
	statuses = DEFAULT_STATUSES.slice();
	randomize_dice_statuses();
	update_stats_graph();
	script['counter'] = new CounterClass(calculate_current_event);
	counter.change_mode(mode);
	deprivatize_script_functions(script);
	spice_enabled_in(spice_enabled);
	dice_enabled_in(dice_enabled);
	if(sync)
	{
		var val = Math.floor(tempo_val/9.14286);
		var new_tempo = SYNCED_TEMPOS[val];
		tempo = new_tempo;
		outlet(1, [tempo, 'ticks']);
		outlet(0, ['quantize', tempo, 'ticks']);
		this.patcher.getnamed('tempo_indicator').message('set', SYNCED_TEMPO_NAMES[val]);
		//debug('sending synced tempo:', tempo, 'ticks');
	}
	else
	{
		var new_tempo = UNSYNCED_TEMPOS[tempo_val];
		tempo = new_tempo;
		outlet(1, [tempo, 'ticks']);
		outlet(0, 'quantize');
		this.patcher.getnamed('tempo_translator').message(tempo);
	}
	Alive = true;
	
}

function _enable_in(val)
{
	if(enabled!=(val>0))
	{
		enabled = val>0;
	}
	recalculate_pattern();
}

function _fixVel_in(val)
{
	fixVel = val > 0;
}

//mode value received from MODE tab
function _mode_in(val)
{
	mode = MODE_VALUES[val];
	counter.change_mode(mode);
	recalculate_pattern();
}

//range value received from RANGE dial
function _range_in(val)
{
	range = RANGE_VALUES[val];
	recalculate_pattern();
}

//note/velocity pair received from midi input of device
function _note_in()
{
	var args = arrayfromargs(arguments);
	if(args[1]>0)
	{
		var index = ordered_held_notes.indexOf(args[0]);
		if(index==-1)
		{
			ordered_held_notes.push(args[0]);
			ordered_held_velocities[args[0]] = args[1];
		}
	}
	else
	{
		var index = ordered_held_notes.indexOf(args[0]);
		if(index>-1)
		{
			ordered_held_notes.splice(index, 1);
			ordered_held_velocities[args[0]] = 0;
		}
	}
	recalculate_pattern();
}

//received from borax, currently held active notes (not currently used for anything)
function _active_notes_in(val)
{
	current_active_notes = val;
}

function _metro_in()
{
	counter.bang();
}

function _tempo_in(val)
{
	debug('tempo_in:', val);
	tempo_val = val;
	update_metro_tempo();
}

function _sync_in(val)
{
	sync = val > 0;
	update_metro_tempo();
}

function _PB_in(val)
{
	PB_val = val;
}

function _spice_enabled_in(val)
{
	if(val!=spice_enabled)
	{
		spice_enabled = val>0;
		if(spice_enabled)
		{
			spice_factor = ((spice_dial_val-64)/128)+.5;
			this.patcher.getnamed('dice').message(0);
		}
		else
		{
			spice_factor = 1;
		}
	}
}

function _dice_enabled_in(val)
{
	if(val!=dice_enabled)
	{
		dice_enabled = val>0;
		if(!dice_enabled)
		{
			write_dice_matrix_to_statuses();
			normalize_dice_statuses();
			dice_factor = 1.
		}
		else
		{
			dice_factor = (dice_dial_val-64)/64;
			this.patcher.getnamed('spice').message(0);
		}
	}
}

function _spice_dial_in(val)
{
	if(val != spice_dial_val)
	{
		spice_dial_val = val;
		spice_factor = ((spice_dial_val-64)/128)+.5;
		update_stats_graph();
	}
}

function _dice_dial_in(val)
{
	if(val != dice_dial_val)
	{
		if(dice_dial_val == 64)
		{
			randomize_dice_statuses();
		}
		else if(val == 64)
		{
			write_dice_matrix_to_statuses();
			normalize_dice_statuses();
			
		}
		dice_dial_val = val;
		dice_factor = (dice_dial_val-64)/64;
		update_stats_graph();
	}
}

function _diag(val)
{
	if(val)
	{
		this.patcher.getnamed('stats_pcontrol').message('open');
	}
	else
	{
		this.patcher.getnamed('stats_pcontrol').message('close');
	}
	update_stats_graph = val ? UpdateStatsGraph : function(){};
}
	
function randomize_dice_statuses()
{
	//debug('randomize_dice_statuses!');
	for(var i=0;i<8;i++)
	{
		dice_statuses[i]=[];
		for(var j=0;j<5;j++)
		{
			dice_statuses[i].push(Math.floor(Math.random()*201)-100);
		}
	}
	//debug('dice_statuses:', dice_statuses);
}

function normalize_dice_statuses()
{
	dice_statuses = NORMALIZED_DICE_STATUSES.slice();
}

function write_dice_matrix_to_statuses()
{
	//debug('write_dice_matrix_to_statuses');
	var dice = (dice_dial_val-64)/64;
	for(var i=0;i<8;i++)
	{
		var stats = statuses[i].slice()
		for(var j=0;j<5;j++)
		{
			stats[j] = Math.max(0, Math.min(100, stats[j] + Math.round(dice_statuses[i][j] * dice)));
		}
		statuses[i] = stats.slice();
	}
}
	
//called whenever something changes in settings or a new note is received
function recalculate_pattern()
{
	switch(mode)
	{
		case 'up':
			held_notes = ordered_held_notes.slice();
			held_notes.sort();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			break;
		case 'down':
			held_notes = ordered_held_notes.slice();
			held_notes.sort();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			break;
		case 'excl':
			held_notes = ordered_held_notes.slice();
			held_notes.sort();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			break;
		case 'incl':
			held_notes = ordered_held_notes.slice();
			held_notes.sort();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			break;
		case 'random':
			held_notes = ordered_held_notes.slice();
			held_notes.sort();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
		case 'order':
			held_notes = ordered_held_notes.slice();
			for(var i=0;i<held_notes.length;i++)
			{
				held_velocities[i] = ordered_held_velocities[held_notes[i]];
			}
			var len = held_notes.length;
			var dir = range>0?1:-1;
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			break;
	}
	counter.low = 0;
	counter.hi = held_notes.length-1;
	//debug('held notes:', held_notes);
	update_metro();
}

function calculate_current_event(count)
{
	var use_matrix = (spice_enabled||(dice_enabled&&(dice_dial_val!=64)))
	if(skip_next_beat)
	{
		skip_next_beat = false;
	}
	else if((current_active_notes>0)&&(count!=undefined))
	{
		if(use_matrix)
		{
			var stats = statuses[count%8];
			var dice_stats = dice_statuses[count%8];
			if((stats[0]+(dice_stats[0]*dice_factor))*spice_factor>50)
			{
				//silence
				//debug(count, 'silence');
			}
			else if((stats[1]+(dice_stats[1]*dice_factor))*spice_factor>50)
			{
				//ratchet
				//debug(count, 'ratchet');
				var note = held_notes[count];
				var vel = fixVel ? 90 : held_velocities[count];
				var dur = tempo * (Math.max(GATEMIN, statuses[count%8][3])/200);
				outlet(3, tempo/2);
				outlet(2, [note, vel, dur*.95]);
			}
			else if((stats[2]+(dice_stats[2]*dice_factor))*spice_factor>50)
			{
				//tie
				//debug(count, 'tie');
				var note = held_notes[count];
				var vel = fixVel ? 90 : held_velocities[count];
				var dur = tempo * (Math.max(GATEMIN, statuses[count%8][3])/50);
				skip_next_beat = true;
				outlet(2, [note, vel, dur*.95]);
			}
			else
			{
				//normal
				//debug(count, 'normal');
				var note = held_notes[count];
				var vel = fixVel ? 90 : held_velocities[count];
				var dur = tempo * (Math.max(GATEMIN, statuses[count%8][3])/100);
				outlet(2, [note, vel, dur*.95]);
			}
		}
		else
		{
			//debug(count, 'no slice or dice')
			var note = held_notes[count];
			var vel = fixVel ? 90 : held_velocities[count];
			var dur = tempo * .95;
			outlet(2, [note, vel, dur*.95]);
		}
		//debug('count:', count, 'send_current_event:', note, vel, dur);
	}
}

//update the metronome's active state
function update_metro()
{
	var metro = held_notes.length>0;
	if((metro!=last_metro)&&(enabled))
	{
		outlet(0, metro);
		last_metro = metro;
	}
	else if(!enabled)
	{
		outlet(0, 0);
		last_metro = 0;
	}
}

function update_metro_tempo()
{
	if(sync)
	{
		var val = Math.floor(tempo_val/9.14286);
		var new_tempo = SYNCED_TEMPOS[val];
		if(tempo != new_tempo)
		{
			tempo = new_tempo;
			outlet(1, [tempo, 'ticks']);
			outlet(0, ['quantize', tempo, 'ticks']);
			this.patcher.getnamed('tempo_indicator').message('set', SYNCED_TEMPO_NAMES[val]);
			debug('sending synced tempo:', tempo, 'ticks');
		}
	}
	else
	{
		var new_tempo = UNSYNCED_TEMPOS[tempo_val];
		if(tempo != new_tempo)
		{
			tempo = new_tempo;
			outlet(1, [tempo, 'ticks']);
			outlet(0, 'quantize');
			this.patcher.getnamed('tempo_translator').message(tempo);
			debug('sending unsynced tempo:', tempo, 'ticks');
		}
	}
}

function UpdateStatsGraph()
{
	//debug('update_stats_graph');
	if((dice_enabled)&&(dice_dial_val!=64))
	{
		//debug('dice factor:', dice);
		for(var i=0;i<8;i++)
		{
			var stats = statuses[i].slice()
			for(var j=0;j<5;j++)
			{
				//debug('stats[j]:', stats[j], dice_statuses[i][j], dice, dice_statuses[i][j] * dice);
				stats[j] += Math.round((dice_statuses[i][j] * dice_factor));
			}
			messnamed(unique+'stats', i, stats);
			//debug('stats:', i, '---', stats);
		}
	}
	else if(spice_enabled)
	{
		//debug('spice factor', spice);
		for(var i=0;i<8;i++)
		{
			var stats = statuses[i].slice()
			for(var j=0;j<5;j++)
			{
				//debug('stats[j]:', stats[j], 'spice:', spice, stats[j]*spice);
				stats[j] = Math.round(stats[j] * spice_factor);
			}
			messnamed(unique+'stats', i, stats);
		}
	}
}

function anything()
{
	var args = arrayfromargs(arguments);
	switch(messagename)
	{
		case 'range_in':
			range = args[0];
			break;
		case 'spice_enabled_in':
			spice_enabled = args[0] > 0;
			break;
		case 'dice_enabled_in':
			dice_enabled = args[0] > 0;
			break;
		case 'tempo_in':
			tempo_val = args[0];
			break;
		case 'sync_in':
			sync = args[0];
			break;
		case 'spice_dial_in':
			spice_dial_val = args[0];
			break;
		case 'dice_dial_in':
			dice_dial_val = args[0];
			break;
		case 'mode_in':
			mode = MODE_VALUES[args[0]];
			break;
		case 'fixVel_in':
			fixVel = args[0] > 0;
			break;
		case 'spice_dial_in':
			spice_dial_val = args[0];
			spice_factor = ((spice_dial_val-64)/128)+.5;
			break;
		case 'dice_dial_in':
			dice_dial_val = args[0];
			dice_factor = (dice_dial_val-64)/64;
			break;
	}
}

forceload(this);
