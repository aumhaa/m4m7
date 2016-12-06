autowatch = 1;

outlets = 1;
inlets = 1;

var script = this;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var finder;

function init()
{
	debug('browser init!');
	finder = new LiveAPI(callback, 'this_device');
}

function callback(args)
{
	debug('callback', args);
}




forceload(this);
