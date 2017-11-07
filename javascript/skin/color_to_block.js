autowatch = 1;

var script = this;

script._name = 'color_to_block';

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');
var PALETTE = ROLI.PALETTE;
var intPALETTE = ROLI.intPALETTE;


var pos_fix = [0, .13333, .26666, .4, .5, .63333, .76666, .9];

function init(){}

function send(x, y, value)
{
	//outlet(0, 'clear');
	var COLOR = PALETTE[value<0?0:value];
	outlet(0, "rectangle", pos_fix[x], pos_fix[y], .1, .1);
	outlet(0, "setcolor", 0, 0, 0, 1);
	outlet(0, "setcolor", COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .3));
	outlet(0, "fill");
	outlet(0, "append");
	//outlet(0, 'repaint');
}

forceload(this);
