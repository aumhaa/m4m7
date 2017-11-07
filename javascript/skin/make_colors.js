autowatch = 1;

inlets = 1;
outlets = 4;

var script = this;

script._name = 'make_colors';

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');
var PALETTE = ROLI.PALETTE;
var intPALETTE = ROLI.intPALETTE;
//intPALETTE[0] = intPALETTE[0];
//intPALETTE[1] = intPALETTE[120];
//intPALETTE[2] = intPALETTE[30];
//intPALETTE[3] = intPALETTE[12];
//intPALETTE[4] = intPALETTE[20]
//intPALETTE[5] = intPALETTE[65];
//intPALETTE[7] = intPALETTE[11];
//intPALETTE[8] = intPALETTE[125];
//intPALETTE[127] = intPALETTE[125];

function init()
{
	debug('init');
	//make_color_coll();
	make_color_defs_for_Littlefoot();
}

function make_original_color_defs_for_Littlefoot()
{
	outlet(0, 'wclose');
	outlet(0, 'clear');
	for(var i in PALETTE)
	{
		outlet(0, 'int palette'+i+';');
		outlet(1, 'bang');
	}
	outlet(1, 'bang');
	for(var i in PALETTE)
	{
		outlet(0, 'palette'+i+' = makeARGB(', PALETTE[i][3]+',', PALETTE[i][0]+',', PALETTE[i][1]+',', PALETTE[i][2], ');');
		outlet(1, 'bang');
	}
	debug('finished');
	outlet(0, 'open');
}

function make_color_defs_for_Littlefoot()
{
	outlet(0, 'wclose');
	outlet(0, 'clear');
	/*for(var i in PALETTE)
	{
		outlet(0, 'int palette'+i+';');
		outlet(1, 'bang');
	}
	outlet(1, 'bang');*/
	for(var i in PALETTE)
	{
		outlet(0, 'if (color == '+i+')  return makeARGB(', intPALETTE[i][3]+',', intPALETTE[i][0]+',', intPALETTE[i][1]+',', intPALETTE[i][2], ');');
		outlet(1, 'bang');
	}
	//outlet(1, 'bang');
	debug('finished2');
	outlet(0, 'open');
}

function make_color_coll()
{
	outlet(3, 'wclose');
	outlet(3, 'clear');
	for(var i in PALETTE)
	{
		outlet(2, i, PALETTE[i][0], PALETTE[i][1], PALETTE[i][2], PALETTE[i][3]);
	}
	outlet(3, 'open');
	debug('finished');
}

function make_color_coll()
{
	outlet(0, 'wclose');
	outlet(0, 'clear');
	/*for(var i in PALETTE)
	{
		outlet(0, 'int palette'+i+';');
		outlet(1, 'bang');
	}
	outlet(1, 'bang');*/
	for(var i in PALETTE)
	{
		outlet(0, i + ',', PALETTE[i][0]+' '+PALETTE[i][1]+' '+PALETTE[i][2]+' '+intPALETTE[i][3]+';');
		outlet(1, 'bang');
	}
	//outlet(1, 'bang');
	debug('finished2');
	outlet(0, 'open');
}



forceload(this);