autowatch = 1;


function initialize_instance()
{
}

function _grid(x, y, val)
{
	outlet(0, 'grid', x, y, val);
}

function _key(x, val)
{
	outlet(0, 'key', x, val);
}

function to_mod()
{
	var args = arrayfromargs(arguments);
	debug('base_anything:', arguments);
	if(args[0] in mod)
	{
		debug('applying to mod:', messagename, arguments);
		mod[args[0]].apply(mod, args.slice(1));
	}
}
