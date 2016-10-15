autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var finder;
var mod;
var mod_finder;
var Mod = ModComponent.bind(script);

var unique = jsarguments[1];
var shifted = false;
var alted = false;
var assignment_gui;
var assignment_coll;
var keys_gui;
var assignments = [];
var current_edit = 0;
var KEYS = [0, 1, 2, 3, 4, 5, 6, 7];
var NOTES = [-1, 0, 1, 2, 3, 4, 5, 6];
var groups={0:{'val':0, 'fsr':undefined}, 
			1:{'val':0, 'fsr':undefined}, 
			2:{'val':0, 'fsr':undefined}, 
			3:{'val':0, 'fsr':undefined},
 			4:{'val':0, 'fsr':undefined},
 			5:{'val':0, 'fsr':undefined}, 
			6:{'val':0, 'fsr':undefined}, 
			7:{'val':0, 'fsr':undefined}};

function init()
{
	mod = new Mod(script, 'hex', unique, false);
	//mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);
}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		debug('mod callback:', args);
		if(args[1] in script)
		{
			script[args[1]].apply(script, args.slice(2));
		}
		if(args[1]=='disconnect')
		{
			mod.restart.schedule(3000);
		}
	}
}

function alive(val)
{
	initialize(val);
}

function initialize()
{
	debug('skin init.');
	assignment_gui = this.patcher.getnamed('assignments');
	assignment_coll = this.patcher.getnamed('matrix');
	keys_gui = this.patcher.getnamed('keys');
	for(var i=0;i<8;i++)
	{
		mod.Send('base_fader', 'value', i, 1);
		assignments[i]=[];
		for(var j=0;j<8;j++)
		{
			assignments[i][j] = {'val':0, 'fsr':new fsr(i, j)}
		}
	}
	get_assignment_grid();
	update_assignment_grid();
}

function anything()
{
	//post('anything', arrayfromargs(messagename, arguments));
}

function fsr(x, y)
{
	var self = this;
	this._x = x;
	this._y = y;
	this._group = 0;
}

function key(num, val)
{
	debug('key', num, val, '\n');
	if(val > 0)
	{
		current_edit = num;
		//post('current_edit', current_edit, '\n');
		for(var i=0;i<8;i++)
		{
			mod.Send('key', 'value', i, parseInt((current_edit == i)*KEYS[i]));
		}
	}
}

function shift(val)
{
	debug('shift', val);
	shifted = val>0;
	update_assignment_grid();
}

function alt(val)
{
	debug('alt', val);
	alted = val>0;
	update_assignment_grid();
}

function push_grid(x, y, val)
{
	debug('push_grid', x, y, val);
	base_grid(x, y, val);
}

function base_grid(x, y, val)
{
	debug('base_grid', x, y, val);
	grid(x, y, val);
}

function grid(x, y, val)
{
	debug('grid', x, y, val);
	if(shifted||alted)
	{
		if((val>0))
		{
			if(assignments[x][y].val!=current_edit)
			{
				assignments[x][y].val = current_edit;
				debug('assignment for:', x, y, 'is', current_edit);
				mod.Send( 'base_grid', 'value', x, y, KEYS[current_edit]);
				mod.Send( 'grid', 'value', x, y, KEYS[current_edit]);
			}
		}
		else
		{
			
			/*var group = assignments[x][y].val;
			debug('calculating for group', group, '\n');
			if(groups[group].val < val)
			{
				debug('group.val < val');
				groups[group].fsr = assignments[x][y].fsr;
				groups[group].val = val;
				//outlet(1, group, groups[group].val);
				mod.Send( 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
			}
			else if(groups[group].fsr == assignments[x][y].fsr)
			{
				debug('group.fsr == fsr');
				groups[group].val = val;
				//outlet(1, group, groups[group].val);
				mod.Send( 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
			}*/
		}
	}
}

function get_assignment_grid()
{
	var assgn = assignment_gui.getvalueof()
	//debug('assgn:', assgn, '\n');
	while(assgn.length)
	{
		assignments[assgn.shift()][assgn.shift()].val = assgn.shift();
	}
	post_assignments();
}

function update_assignment_grid()
{
	if((!shifted)&&(!alted))
	{
		//debug('update assignment grid\n');
		groups={0:{'val':0, 'fsr':undefined}, 
		1:{'val':0, 'fsr':undefined}, 
		2:{'val':0, 'fsr':undefined}, 
		3:{'val':0, 'fsr':undefined},
		4:{'val':0, 'fsr':undefined},
		5:{'val':0, 'fsr':undefined}, 
		6:{'val':0, 'fsr':undefined}, 
		7:{'val':0, 'fsr':undefined}};	
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				//groups[assignments[i][j].value].push(assignments[i][j]);
				this.patcher.getnamed('assignments').message(i, j, assignments[i][j].val);
				mod.Send('grid', 'value', i, j, KEYS[assignments[i][j].val]);
				mod.Send('grid', 'identifier', i, j, NOTES[assignments[i][j].val]);
				mod.Send('grid', 'channel', i, j, 2);
				if(j<4)
				{
					mod.Send( 'base_grid', 'value', i, j, KEYS[assignments[i][j].val]);
					mod.Send( 'base_grid', 'identifier', i, j, NOTES[assignments[i][j].val]);
					mod.Send( 'base_grid', 'channel', i, j, 2);
				}
			}
		}
	}
	else
	{
		debug('reassigning default grids');
		var x=7;do{
			var y=3;do{
				mod.Send( 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]);
				mod.Send( 'base_grid', 'channel', x, y, -1);
				mod.Send( 'base_grid', 'identifier', x, y, -1);
			}while(y--);
			var y=7;do{
				mod.Send( 'grid', 'value', x, y, KEYS[assignments[x][y].val]);
				mod.Send( 'grid', 'channel', x, y, -1);
				mod.Send( 'grid', 'identifier', x, y, -1);
			}while(y--);
		}while(x--);
	}
}

function post_assignments()
{
	if(DEBUG)
	{
		debug('assigns:')
		{
			for(var i=0;i<8;i++)
			{
				for(var j=0;j<4;j++)
				{
					debug(i, j, assignments[i][j].value, '\n');
				}
			}
		}
	}
}

forceload(this);


