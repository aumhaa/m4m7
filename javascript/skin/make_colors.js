autowatch = 1;

inlets = 1;
outlets = 2;

var script = this;

script._name = 'make_colors';

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');
var PALETTE = ROLI.intPALETTE;

function init()
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


forceload(this);