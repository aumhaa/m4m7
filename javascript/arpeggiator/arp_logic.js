autowatch = 1;

inlets = 2;
outlets = 3;

var held_notes = []; //array of note#'s currently being held.
var ordered_held_notes = [];
var mode = 0;    //mode 0 = play, mode 1 = hold;
var MODES = ['down', 'up', 'excl', 'incl', 'random', 'order'];

function mode_in()
{

}

function range_in()
{

}

function note_in()
{
	var args = arrayfromargs(arguments);
	//post('args', args, '\n');
	if(args[1]>0)
	{
		var index = ordered_held_notes.indexOf(args[0]);
		if(index==-1)
		{
			ordered_held_notes.push(args[0]);
		}
	}
	else
	{
		var index = ordered_held_notes.indexOf(args[0]);
		//post(args[0], 'index:', index, '\n');
		if(index>-1)
		{
			ordered_held_notes.splice(index, 1);
		}
	}
	held_notes = ordered_held_notes.slice();
	held_notes.sort();
	//post('held_notes:', held_notes, '\n');
	output_held_notes();
	output_ordered_held_notes();
}

function output_ordered_held_notes()
{
	outlet(1, 'clear');
	for(var i=0;i<ordered_held_notes.length;i++)
	{
		outlet(1, i, ordered_held_notes[i]);
	}
}

function output_held_notes()
{
	outlet(0, 'clear');
	for(var i=0;i<held_notes.length;i++)
	{
		outlet(0, i, held_notes[i]);
	}
}