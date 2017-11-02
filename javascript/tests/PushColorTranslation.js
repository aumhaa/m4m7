autowatch = 1;

var script = this;

script._name = 'PushColorTranslation';

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var d = new Dict('colors');

function init()
{
	var new_colors = [];
	var keys = d.getkeys();
	debug('names:', keys);
	for(var i in keys)
	{
		var ar = d.get(keys[i]);
		debug(ar);
		new_colors.push([ar.get('red'), ar.get('green'), ar.get('blue')]);
	}
	debug(new_colors);
}





forceload(this);
