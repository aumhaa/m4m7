autowatch = 1;

inlets = 1;
outlets = 6;

var held_notes = []; //active sequence of note #'s to be output to coll for use in arp processing
var held_velocities = [];  //active sequence of velocities to be output to coll for use in arp processing
var ordered_held_notes = [];  //currently held notes, in the order that they were received
var ordered_held_velocities = [];  //currently held velocities, keyed to their corresponding held note.

var MODE_VALUES = ['down', 'up', 'excl', 'incl', 'random', 'order'];  //CONST array holding descriptive name for each mode
var RANGE_VALUES = [-1, 0, 1, 2, 3, 4];   //CONST array holding actual values for range knob
var range = 0;   //actual current range value interpolated from Range dial through RANGE_VALUES
var length = 0;   //the length of the overall current arp sequence
var start = 0;   //starting point of the current arp sequence (theoretically should always be 0)
var direction = 'up';  //direction of the current arp sequence sent to counter ('up', 'down', 'updown');
var last_metro = 0;   //last metronome state sent out (to avoid double triggers, which happen when 1 is sent when metro is already running);
var excl_cycle_trigger = -1;
var enabled = false;

function enable(val)
{
	if(enabled!=(val>0))
	{
		enabled = val>0;
	}
	recalculate_pattern();
}

//mode value received from MODE tab
function mode_in(val)
{
	mode = MODE_VALUES[val];
	recalculate_pattern();
}

//range value received from RANGE dial
function range_in(val)
{
	range = RANGE_VALUES[val];
	recalculate_pattern();
}

//note/velocity pair received from midi input of device
function note_in()
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

//called whenever something changes in settings or a new note is received
function recalculate_pattern()
{
	excl_cycle_trigger = -1;
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
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			start = 0;
			length = held_notes.length;
			direction = 'up';
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
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			length = held_notes.length;
			start = length-1;
			direction = 'down';
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
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			length = held_notes.length;
			start = 0;
			//start = ordered_held_notes.length;
			direction = 'updown';
			excl_cycle_trigger = length-1;
			this.patcher.getnamed('exclusive_start').message('set', 'setmin', 1);
			this.patcher.getnamed('exclusive_end').message('set', 'max', length-2);
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
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			length = held_notes.length;
			start = 0;
			direction = 'updown';
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
			//post('Math.abs(range):', Math.abs(range));
			for(var r=0;r<Math.abs(range);r++)
			{
				for(var i=0;i<len;i++)
				{
					held_notes.push(held_notes[i]+(12*(r+1)*dir));
					held_velocities.push(ordered_held_velocities[held_notes[i]]);
				}
			}
			length = held_notes.length;
			start = 0;
			direction = 'up';
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
			length = held_notes.length;
			start = 0;
			direction = 'up';
			break;
	}
	output_held_notes();
	update_counter();
	update_metro();
}

//update the coll with current sequence data
function output_held_notes()
{
	outlet(1, 'clear');
	if(enabled)
	{
		for(var i=0;i<held_notes.length;i++)
		{
			outlet(1, i, held_notes[i]);
		}
	}
	outlet(2, 'clear');
	if(enabled)
	{
		for(var i=0;i<held_velocities.length;i++)
		{
			outlet(2, i, held_velocities[i]);
		}
	}
	post('held_notes:', held_notes, '\n');
}

//udpate the counter with the current sequence borders, direction
function update_counter()
{
	outlet(0, direction);
	outlet(0, 'setmin', 0);
	outlet(0, 'max', length-1);
	//outlet(0, 'set', start);
	outlet(3, length);
	outlet(5, excl_cycle_trigger);
}

//update the metronome's active state
function update_metro()
{
	var metro = held_notes.length>0;
	if((metro!=last_metro)&&(enabled))
	{
		outlet(4, metro);
		last_metro = metro;
	}
	else if(!enabled)
	{
		outlet(4, 0);
		last_metro = 0;
	}
}

//received from borax, currently held active notes (not currently used for anything)
function active_notes(val)
{
	_active_notes = val;
}

