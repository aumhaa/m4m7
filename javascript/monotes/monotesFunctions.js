autowatch = 1;

var WIKI = 'monotes';

function initialize_instance()
{
	mod.Send('set_legacy', 1);
}

function _grid(x, y, val)
{
	debug('grid', x, y, val);
	outlet(0, 'grid', x, y, val);
}

function _key(x, val)
{
	debug('key', x, val);
	outlet(0, 'key', x, val);
}

function _key_out(x, val)
{
	debug('key_out', x, val);
	mod.Send('key', 'value', x, val);
}

function _grid_out(x, y, val)
{
	debug('grid_out', x, y, val);
	mod.Send('grid', 'value', x, y, val);
}
