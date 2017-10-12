autowatch = 1;

var script = this;

script._name = 'skin_editor';

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);

var glob = new Global('skin_global');

var Vars = ['function_selector', 'incremental', 'which_value', 'note', 'channel', 'next_value'];

var function_selector_val = 0;
var incremental_val = false;
var which_value_val = 'zone';
var note_val = 0;
var channel_val = 1;


function init()
{
	//post('skin init');
	debug('skin_editor init()');
	
	initialize();
	test_this();
}

function initialize()
{
	debug('skin_editor initialize()');
	setup_patcher();
	grab_vals();
	deprivatize_script_functions(this);
	setup_global_link();
}

function setup_patcher()
{
	for(var i in Vars)
	{
		script[Vars[i]] = this.patcher.getnamed(Vars[i]);
		//debug('Vars:', i, Vars[i], script[Vars[i]]);
	}
}

function setup_global_link()
{
	//debug('skin_editor setup_global_link()');
	glob.skin_editor = script;
	if(glob.skin)
	{
		//glob.skin.debug('editor calling skin.');
		glob.skin.SkinEditor.set_frontEnd();
	}
}

function grab_vals()
{
	function_selector_val = Math.floor(function_selector.getvalueof());
	incremental_val = incremental.getvalueof()>0;
	which_value_val = ['zone', 'local'][which_value.getvalueof()];
	note_val = note.getvalueof();
	channel_val = channel.getvalueof();
	debug('function_selector_val is:', function_selector_val, function_selector.getvalueof());
}

function grab_and_advance_channel_value()
{
	if(glob.skin){glob.skin.debug('grab_and_advance_channel_value');}
	var old_val = channel.getvalueof();
	debug('channel:', old_val);
	channel.message(incremental_val ? Math.max(1, (Math.floor(old_val) + 1)%17) : old_val);
	return old_val;
}
	
function grab_and_advance_note_value()
{
	if(glob.skin){glob.skin.debug('grab_and_advance_note_value');}
	var old_val = note.getvalueof();
	note.message(incremental_val ? (Math.floor(old_val) + 1)%128 : old_val);
	return old_val;
}

function _gui_input()
{
	var args = arrayfromargs(arguments);
	//debug('gui_input:', args);
	switch(args[0])
	{
		case 0:
			function_selector_val = Math.floor(args[1]);
			break;
		case 1:
			channel_val = args[1];
			break;
		case 2:
			note_val = args[1];
			break;
		case 3:
			which_val = ['zone', 'local'][args[1]];
			break;
		case 4:
			incremental_val = args[1]>0;
			break;
	}
}

function anything(){debug('anything:', messagename, arguments);}

function test_this()
{
	debug('test_this');
	//advance_value();
}

function freebang()
{
	glob.skin_editor = undefined;
	//delete glob.skin_editor;
}


forceload(this);