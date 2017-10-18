autowatch = 1;



inlets = 1;
outlets = 1;

var script = this;

script._name = 'mira_grid';

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var miraCell = [];

function init()
{
	initialize();
}

function initialize()
{
	debug('initialize');
	for(var i=0;i<64;i++)
	{
		miraCell[i] = this.patcher.getnamed('cell['+i+']');
	}
	for(var i in miraCell)
	{
		//miraCell[i].message('activebgcolor', 0, 0, 0);
		miraCell[i].message('bgcolor', 0, 0, 0);
	}
}

function anything(){}

function region(num, q, val)
{
	//debug('region:', num, q, val);
	var sendVal = val > 0 ? [1, 1, 1] : [0, 0, 0];
	miraCell[num].message('bgcolor', sendVal);
}


forceload(this);

