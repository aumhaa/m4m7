autowatch = 1;



var script = this;
var prefix = jsarguments[1];
var max_time = jsarguments[2];
var Alive = false;

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = false;
aumhaa.init(this);


var buffer_loop = prefix+'loop';
var buffer_undo = prefix+'undo';
var dummy = prefix+'dummy';
var resync = prefix+'resync';
var looper = [];
var finder;
var dev;
var this_instance_number = -1;

var INSTANCE = [[6, 6], [7, 6], [6, 7], [7, 7]];
var grid_position = 0;
var speed_values = [2, 1, 0, -1, -2];
var inertia_values = [0, 50, 90, 300, 600];
var circle = [[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [3, 4], [2, 4], [1, 4], [0, 4], [0, 3], [0, 2], [0, 1]];
var cell_fire = [];
for(var i=0;i<16;i++)
{
	cell_fire[i] = [];
	for(var j=0;j<16;j++)
	{
		cell_fire[i][j] = [-1, (((i>7)+0)+(((j>7)+0)*2))];
		for(var p=0;p<16;p++)
		{
			if((circle[p][0] == i)&&(circle[p][1] == j))
			{
				cell_fire[i][j][0] = p;
			}
		}
		if(((i%8)>0)&&((i%8)<4)&&((j%8)>0)&&((j%8)<4))
		{
			cell_fire[i][j][0] = 17;
		}
		else if (((i%8)>5)&&((j%8)<5))
		{
			cell_fire[i][j][0] = 18 + (i%2);
			cell_fire[i][j][2] = j;
		}
		else if ((j%8)>5)
		{
			cell_fire[i][j][0] = 20 + (j%2);
			cell_fire[i][j][2] = i;
		}
		else if ((i==6)&&(j==5))
		{
			cell_fire[i][j][0] = 30;
		}
		else if ((i==7)&&(j==5))
		{
			cell_fire[i][j][0] = 31;
		}
	}
}


var in_loop = 0;
var	go_to_overdub = 0;
var go_to_mute = 0;
var clock_start = 0;			//used for resync;  logs the Live time that the loop was started
var loop_start = 0;
var loop_end = 0;
var buffer_size = max_time;
var offset = 240;
var slave = false;

var fadetime = 100;
var speed = 1.;
var inertia = 1000;
var phase = 0;
var overdub_status = 0;
var state = 'empty';
var mute_status = 0;
var fb_lvl = 1.0;
var in_lvl = 1.0;

var quantize_record = {enabled:1, ticks:1920, ms:2142.857178, samples:94500, menu:0, relative:1};
var position = {ms:0, phase:0, report:0, relative:0};
var undo_data = {can:false, loop_size: 0, clock_start: 0}
var samps_per_ms = quantize_record.samples/quantize_record.ms;
var looper = {};
var POBJ = ['bufferloop', 'bufferundo', 'pokeloop', 'looper',
			'groovespeed', 'grooveend', 'quantization', 'recphase',
			'offset', 'tapeinertia', 'volout', 'feedback', 'input',
			'overdub', 'reverse', 'undo', 'clear', 'speed', 'inertia', 'mute',
			'quantizerecord', 'loop', 'quantizemenu', 'fadein', 'fadetime', 
			'relativerecord', 'state', 'position', 'position_remote', 'state_remote',
			'master', 'slave', 'fl_delay']; 
			// 'record', 'buffetin', 'bufferin', 'groovelength', 'latency', 'inloop', 'frommaster',
			//'copybuffer', 'calc_record', 'drivesource', 'buffetloop', 'buffetundo', 
var TOBJ = ['relativetimer',  'metro'];
var TRIGGER = ['inlet', 'quantize', 'relative', 'quantization', 'buffer_size', 'master_length'];  // 'quantize_metro', 'relative_metro'];
var LENGTHS = [1, 2, 4, 8, 16, 32, 64];
var stored_messages = [];

//var del_chan = new Task(change_poke_channel, this);

if (!Array.prototype.indexOf) {
  Array.prototype.indexOf = function (obj, fromIndex) {
    if (fromIndex == null) {
        fromIndex = 0;
    } else if (fromIndex < 0) {
        fromIndex = Math.max(0, this.length + fromIndex);
    }
    for (var i = fromIndex, j = this.length; i < j; i++) {
        if (this[i] === obj)
            return i;
    }
    return -1;
  };
}

function inArray(arr,obj) {
    return (arr.indexOf(obj) != -1);
}

var Mod = ModComponent.bind(script);
var mod, modfinder;

var glob = new Global('jove_global');
if(!glob.master_looper)
{
	debug('making master...');
	glob.master_looper = [];
}
if(!glob.slave_loopers)
{
	debug('making slaves...');
	glob.slave_loopers = [];
}

function no_debug(){}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//debug('mod callback', prefix, ':', args);
		if(args[1] in script)
		{
			//debug('in script:', args[1]);
			script[args[1]].apply(script, args.slice(2));
		}
		if(args[1]=='disconnect')
		{
			mod.restart.schedule(3000);
		}
	}
}

function _anything()
{
	var args = arrayfromargs(messagename, arguments);
	debug('anything:', args);
}

function anything()
{
	var args = arrayfromargs(arguments);
	if(finder == null)
	{
		if(stored_messages.length>500)
		{
			stored_messages.shift();
		}
		stored_messages.push([messagename, args]);
	}
}
	
//called when live.this_device bangs
function init()
{
	debug('init');
	debug('prefix is:', prefix);
	setup_tasks();
	for(var obj in POBJ)
	{
		looper[POBJ[obj]] = this.patcher.getnamed(POBJ[obj]);
	}
	for(var obj in TOBJ)
	{
		looper[TOBJ[obj]] = this.patcher.getnamed('timers').subpatcher().getnamed(TOBJ[obj]);
	}
	looper.trigger = {state : 'empty', patcher : this.patcher.getnamed('trigger').subpatcher()};
	for(var obj in TRIGGER)
	{
		looper.trigger[TRIGGER[obj]] = looper.trigger.patcher.getnamed(TRIGGER[obj]);
	}
	looper.looper.message('Loop', buffer_loop);
	//looper.bufferloop.message('size', max_time);
	looper.groovespeed.message('float', 1.0);
	looper.quantizemenu.message('int', looper.quantizemenu.getvalueof());
	looper.quantizerecord.message('int', looper.quantizerecord.getvalueof());
	looper.offset.message('int', looper.offset.getvalueof());
	//debug('---------------offset is:', looper.offset.getvalueof());
	_set_offset(looper.offset.getvalueof());
	looper.feedback.message('float', looper.feedback.getvalueof());
	looper.input.message('float', looper.input.getvalueof());
	looper.speed.message('float', looper.speed.getvalueof());
	looper.inertia.message('int', looper.inertia.getvalueof());
	looper.fadetime.message('int', looper.fadetime.getvalueof());
	//looper.relativerecord.message('int', looper.relativerecord.getvalueof());
	//looper.quantizerecord.message('int', looper.quantizerecord.getvalueof());
	//looper.relativerecord.message('bang');
	//looper.quantizerecord.message('bang');
	looper.overdub.message('set', 0);
	looper.quantizemenu.message('bang');
	looper.metro.message('bang');
	looper.trigger.buffer_size.message(max_time);
	looper.looper.message('play', 0);
	looper.bufferloop.message('clear');
	if(!(dev instanceof LiveAPI))
	{
		dev = new LiveAPI(dummy_callback, 'live_set', 'this_device');
	}
	dev.goto('this_device');
	detect_instance(dev);
	dev.goto('parameters', 19);
	looper.position_remote.message('id', dev.id);
	dev.goto('live_set', 'this_device');
	dev.goto('parameters', 20);
	looper.state_remote.message('id', dev.id);
	dev.id = 0;

	//mod = new Mod(script, 'jove', prefix, false);
	mod = new Mod(script, undefined, 'jove', prefix, false);
	mod.debug = no_debug;
	//mod.wiki_addy = WIKI;
	mod_finder = new LiveAPI(mod_callback, 'live_set', 'this_device');
	mod.assign_api(mod_finder);

	var val = looper.quantizerecord.getvalueof();
	debug('quantize:', val);
	_set_quantize_record(parseInt(val));

	var val = looper.relativerecord.getvalueof();
	debug('relative:', val);
	_set_relative_record(parseInt(val));

	looper.trigger.quantization.message('int', looper.trigger.quantization.getvalueof());


	looper.slave.message('int', looper.slave.getvalueof());
	looper.master.message('int', looper.master.getvalueof());



}

function alive(val)
{
	Alive = val>0;
	debug('Alive =', Alive);
	initialize();
}

function initialize()
{
	debug('initialize');
	if(Alive)
	{
		for(var i in script)
		{
			if((/^_/).test(i))
			{
				script[i.replace('_', "")] = script[i];
			}
		}
		mod.Send('set_legacy', 0);
		setup_translations();
		//quantizemenu.message('bang');
		display_position();
		mod.Send('receive_translation', 'dummy_row_batch', 'batch_row', 4, 4, 4, 4, 4);
		mod.Send('receive_translation', 'undo',  'value', (undo_data.can*7)+1);
		mod.Send('receive_translation', 'overdub', 'value', (overdub_status*7)+3);	
		mod.Send('receive_translation', 'record',  'value', (in_loop*7)+5);
		mod.Send('receive_translation', 'mute', 'value', (mute_status*7)+7);
		mod.Send('receive_translation', 'clear',  'value', 2);
		for(var i=0;i<4;i++)
		{
			mod.Send('receive_translation', 'instance_'+i, 'value', this_instance_number==i?5:1);
		}
		_change_speed(speed);
		_change_inertia(inertia);
	}
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 100);
}

function detect_instance(this_device)
{
	var name = this_device.get('name');
	var KEYS = [new RegExp(/(@loop1)/), new RegExp(/(@loop2)/), new RegExp(/(@loop3)/), new RegExp(/(@loop4)/)];
	for(var i=0;i<4;i++)
	{
		if(KEYS[i].test(name))
		{
			this_instance_number = i;
			//Alive&&mod.Send('receive_translation', 'instance_'+i, 'value', 1);
			debug('found instance number:', i);
			break;
		}
	}
}
	
function current_state(val)
{
	debug('current state:', val);
	if((val=='play')&&(overdub_status)){val = 'odub';}
	looper.trigger.state = val;
	in_loop = val == 'play' ? 0 : 1;
	update_state();
}

function update_state()
{
	var new_state = {'rec':0, 'empty':1, 'play':2, 'odub':3, 'wait_in':4, 'wait_out':4}[looper.trigger.state];
	if(mute_status){new_state = 5;}
	looper.state.message('int', new_state);
	debug('update state:', new_state);
}

function trigger_end(val)
{
	loop_end = val;
	if(glob.master_looper == script)
	{
		for(var i in glob.slave_loopers)
		{
			glob.slave_loopers[i].set_master_length(loop_end);
		}
	}
}

//begin or end loop recording, depending on current state
function _loop(val)
{	
	debug('loop');
	switch(looper.trigger.state)
	{
		case 'empty':
		case 'odub':
		case 'play':
			begin_loop();
			break;
		case 'rec':
			end_loop();
			break;
	}
}

function begin_loop()
{
	debug('begin_loop');
	looper.looper.message('play', 0);
	in_loop = 1;
	loop_start = 0;//rec_phase * max_time;//ms, new						//set the internal value of loop_start to 0, the beginning of the buffer
	change_mute(0);														//mute the output of the patch
	change_overdub(0);
	change_speed(1., 1);												//turn speed to <forward 1.0
	make_undo_step();													//copy the current loop into the record buffer and store its relevant attributes
	looper.looper.message('overdub', 0);
	looper.trigger.inlet.message('start');
	looper.input.message('float', 1);									//turn the input all the way up
	mod.Send('receive_translation', 'record', 'value', 12);
}

//this is only called from the loop() func, and only when a loop is already recording
function end_loop()
{
	debug('loop_end', loop_end);
	in_loop = 0;
	looper.trigger.inlet.message('end');
	if(go_to_overdub)
	{
		change_overdub(1);
	}
	else if(go_to_mute)
	{
		change_mute(1);
	}
	else
	{
		change_mute(0);
		looper.fadein.message('int', 0.);
		looper.fadein.message('list', 1., fadetime);
	}
	update_state();
	mod.Send('receive_translation', 'record', 'value', 5);
	mod.Send('receive_translation', 'clear', 'value', 9);
}

//change overdubbing state
function _overdub()
{
	switch(looper.trigger.state)
	{
		case 'rec':
		case 'wait_in':
			if(!go_to_overdub)
			{
				go_to_overdub = 1;
				_loop();
			}
			break;
		default:
			if(mute_status){change_mute(0);}
			_change_overdub(Math.abs(overdub_status - 1));
			break;
	}
	update_state();
}

function _change_overdub(val)
{
	debug('change_overdub', val);
	overdub_status = val;
	go_to_overdub = 0;
	looper.trigger.state = overdub_status ? 'odub' : 'play';
	looper.looper.message('feedback', overdub_status ? fb_lvl : 1);
	looper.looper.message('overdub', overdub_status);
	mod.Send('receive_translation', 'overdub', 'value', (overdub_status*7)+3);
	mod.Send('receive_translation', 'clear', 'value', 9);
}

function _mute()
{
	debug('_mute');
	var status = mute_status;
	switch(looper.trigger.state)
	{
		case 'play':
			status = Math.abs(mute_status-1);
			_change_mute(status);
			break;
		case 'wait_in':
			go_to_mute = 1;
			_loop();
			break;
		case 'odub':
			_change_overdub(0);
			_change_mute(1);
			break;
		case 'wait_out':
			go_to_mute = 1;
			break;
		default:
			go_to_mute = 1;
			_loop();
			break;
	}
	update_state();
}

function _change_mute(val)
{
	debug('change_mute', val);
	mute_status = val;
	go_to_mute = 0;
	looper.volout.message('float', Math.abs(val-1));
	mod.Send('receive_translation', 'mute', 'value', (mute_status*7)+7);
}

//copy the current loop into the record buffer and store its relevant attributes
function make_undo_step()
{
	undo_data.can = true;
	undo_data.loop_size = loop_end;
	undo_data.clock_start = clock_start;
	looper.bufferundo.message('duplicate', buffer_loop);
	mod.Send('receive_translation', 'undo', 'value', (undo_data.can*7)+1);
}

//move the undo buffer's contents to the loop buffer and restore it's settings
function _undo()
{
	if(undo_data.can == true)
	{
		//looper.overdub.message('set', 0);
		looper.looper.message('play', 0);
		loop_end = undo_data.loop_size;
		looper.bufferloop.message('duplicate', buffer_undo);
		looper.looper.message('end', undo_data.loop_size);
		looper.looper.message('restart', 1);
		looper.looper.message('play', 1);
		undo_data.can = false;
	}
	mod.Send('receive_translation', 'undo', 'value', (undo_data.can*7)+1);
}

//store an undo step and clear the buffer
function _clear()
{
	looper.looper.message('play', 0);
	make_undo_step();
	looper.bufferloop.message('clear');
	looper.looper.message('play', 1);
	update_state();
	mod.Send('receive_translation', 'clear', 'value', 2);	
}	

//reverse the tape transport; force ignores inertia;  sets internal attribute and forwards to change_speed()
function _reverse(force)
{
	change_speed(speed * -1, force);
}

function make_dummy_loop(len)
{
	if(!in_loop)
	{
		make_undo_step();
		loop_end = LENGTHS[len]*quantize_record.samples;
		looper.fl_delay.message('list', loop_end, 'samples');
		looper.fl_delay.message('bang');
		debug('make_dummy_loop', len, loop_end);
		looper.speed.message('float', 1);
		looper.feedback.message('float', 1);
		looper.input.message('float', 1);
		change_mute(0);
		looper.looper.message('start', 0);
		looper.looper.message('end', loop_end);
		looper.looper.message('restart', 1);
		clear();
		looper.looper.message('play', 1);
		looper.looper.message('overdub', 1);
		overdub_status = 1;
		wating_for_overdub = 0;
		looper.trigger.state = 'odub';
	}
}

function _end_dummy_loop()
{
	debug('_end_dummy_loop', in_loop, overdub_status);
	if((!in_loop)&&(overdub_status))
	{
		_change_overdub(0);
	}
}

//change the transport speed;  force ignores inertia
function _change_speed(new_speed, force)
{
	if(force||!inertia)
	{
		looper.groovespeed.message('float', new_speed);
	}
	else
	{
		looper.tapeinertia.message('list', new_speed, inertia* Math.abs(speed - new_speed));
	}
	speed = new_speed;
	looper.speed.message('set', speed);
	var s = [];
	for(var i=0;i<5;i++)
	{
		s.push(((speed==speed_values[i])*1)+2);
	}
	mod.Send('receive_translation', 'speed_column_batch', 'batch_column', s);
}

//change the transport inertia attribute 
function _change_inertia(new_inertia)
{
	inertia = new_inertia;
	var n = [];
	for(var i=0;i<5;i++)
	{
		n.push(((inertia>=inertia_values[i])*2)+3);
	}
	mod.Send('receive_translation', 'inertia_column_batch', 'batch_column', n);
}

//change the record quantize amount
function set_quantize_amount(menu, ticks, ms, samples)
{
	debug('quantize_amount', menu, ticks, ms, samples);
	quantize_record.samples = samples;
	quantize_record.ticks = ticks;
	quantize_record.menu = menu;
	quantize_record.ms = ms;
	samps_per_ms = samples/ms;
	Alive&&looper.trigger.quantization.message('int', menu);
}

//turn on/off quantization
function _set_quantize_record(val)
{
	debug('set_quantize_record', val);
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.enabled = val;
		looper.trigger.quantize.message('int', val+1);
	}
	else
	{
		looper.quantizerecord.message('set', 0);
	}
	mod.Send('receive_translation', 'quantize', 'value', ((quantize_record.enabled*7)+2));
}

//turn on/off relative quantization	
function _set_relative_record(val)
{
	debug('set_relative_record', val);
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.relative = val;
		looper.trigger.relative.message('int', val+1);
	}
	else
	{
		looper.relativerecord.message('set', 0);
	}
	mod.Send('receive_translation', 'relative', 'value', ((quantize_record.relative*7)+3));
}

//set the predefined loop creation size
function _set_dummy_size(size)
{
	dummy_size = size;
}

//set the latency offset
function _set_offset(new_offset)
{
	debug('offset', new_offset);
	offset = new_offset;
	//looper.trigger.offset.message(new_offset);
	looper.looper.message('offset', new_offset);
}

function _set_fade_time(new_fade_time)
{
	fadetime = new_fade_time;
}

function _input_level(level)
{
	in_lvl = level;
	messnamed(prefix+'input', in_lvl);
}

function _feedback_level(level)
{
	fb_lvl = level;
	if(overdub_status)
	{
		looper.looper.message('feedback', fb_lvl);
	}
}

function _display_position()
{
	var s = looper.groovespeed.getvalueof();
	grid_position = parseInt(phase*16);	
	if(s > 0)
	{
		for(var i=0;i<16;i++)
		{
			mod.Send('receive_translation', 'circle_'+((i+grid_position)%16), 'value', i==0 ? 5 : i>(15-s) ? 7 : 1);
		}
	}
	else
	{
		for(var i=0;i<16;i++)
		{
			mod.Send('receive_translation', 'circle_'+((i+grid_position)%16), 'value', i==0 ? 5 : i < (1 - s) ? 7 : 1);
		}
	}
}

//this is called every 100ms to update the GUI and HUD
function _loop_phase(val)
{
	phase = val;
	looper.position.message('float', val);
	display_position();
}

//update the loopers internal state and forward to loopmaster
function change_state(val)
{
	state = val;
	looper.state1.message('int', ['recording', 'empty', 'playing', 'overdubbing', 'awaiting_record', 'muted'].indexOf(val));
	debug('state', state);
}

function set_master(val)
{
	debug('set_master:', val);
	if(val)
	{
		if(slave)
		{
			looper.slave.message('int', 0);
		}
		if('set_master' in glob.master_looper)
		{
			glob.master_looper.set_master(0);
		}
		glob.master_looper = script;
		for(var i in glob.slave_loopers)
		{
			glob.slave_loopers[i].set_master_length(loop_end);
		}
	}
	else
	{
		if(glob.master_looper == script)
		{
			glob.master_looper = [];
		}
	}
	//this.patcher.getnamed('master').message('int', glob.master_looper == script);
	mod.Send('receive_translation', 'master',  'value', 5 + ((script == glob.master_looper)*7));
	tasks.addTask(looper.master.message, ['set', glob.master_looper == script], 0);
	tasks.addTask(set_master_gui, [glob.master_looper == script], 0);
}

function set_master_gui(val)
{
	looper.master.message('set', val);
}

function set_slave(val)
{
	debug('set_slave:', val);
	if(glob.master_looper == script)
	{
		slave = false;
	}
	else
	{
		slave = val>0;
	}
	var index = glob.slave_loopers.indexOf(script);
	if(slave)
	{
		if(index<0)
		{
			glob.slave_loopers.push(script);
			if(glob.master_looper!=[])
			{
				set_master_length(glob.master_looper.loop_end);
			}
		}
	}
	else
	{
		if(index>-1)
		{
			glob.slave_loopers.splice(index, 1);
			looper.trigger.quantize.message('bang');
		}
	}
	//looper.slave.setvalueof(0);
	debug('length of slaves.loopers are now:', glob.slave_loopers.length, slave);
	mod.Send('receive_translation', 'slave',  'value', 7 + (slave*7));
	tasks.addTask(set_slave, [slave], 0);
	//looper.slave.message('set', slave);
	//tasks.addTask(looper.slave.message, ['set', slave], 0);
	
}

function set_slave_gui(val)
{
	looper.slave.message('set', val);
}

function set_master_length(length)
{
	debug('set_master_length', length)
	if(slave == true)
	{
		looper.trigger.master_length.message(length);
		debug('master_length is now:', looper.trigger.master_length.getvalueof());
	}
}

function setup_translations()
{
	/*Here we set up some translation assignments and send them to the Python ModClient.
	Each translation add_translation assignment has a name, a target, a group, and possibly some arguments.
	Translations can be enabled individually using their name/target combinations, or an entire group can be enabled en masse.
	There are not currently provisions to dynamically change translations or group assignments once they are made.*/

	/*Batch translations can be handled by creating alias controls with initial arguments so that when the batch command is sent
	the arument(s) precede the values being sent.  They are treated the same as the rest of the group regarding their
	enabled state, and calls will be ignored to them when they are disabled.  Thus, to send a column command to an address:
	'add_translation', 'alias_name', 'address', 'target_group', n.
	Then, to invoke this translation, we'd call:
	'receive_translation', 'alias_name', 'column', nn.
	This would cause all leds on the column[n] to be lit with color[nn].  
	
	It's important to note that using batch_row/column calls will wrap to the next column/row, whereas column/row commands will
	only effect their actual physical row on the controller.*/


	//Push stuff:
	for(var i = 0;i < 16;i++)
	{
		mod.Send('add_translation', 'circle_'+i, 'grid', 'circle', circle[i][0], circle[i][1]);
	}
	for(var i = 0;i < 4;i++)
	{
		mod.Send('add_translation', 'instance_'+i, 'grid', 'instance', (i%2)+6, Math.floor(i/2)+6);
	}
	mod.Send('add_translation', 'undo', 'grid', 'all', 0, 6);
	mod.Send('add_translation', 'overdub', 'grid', 'all', 1, 6);
	mod.Send('add_translation', 'record', 'grid', 'all', 2, 6);
	mod.Send('add_translation', 'mute', 'grid', 'all', 3, 6);
	mod.Send('add_translation', 'clear', 'grid', 'all', 4, 6);
	mod.Send('add_translation', 'quantize', 'grid', 'all', 5, 7);
	mod.Send('add_translation', 'dummy_row_batch', 'grid', 'all', 7);
	mod.Send('add_translation', 'speed_column_batch', 'grid', 'all', 7);
	mod.Send('add_translation', 'inertia_column_batch', 'grid', 'all', 6);

	mod.Send('add_translation', 'relative', 'grid', 'all', 5, 6);
	mod.Send('add_translation', 'slave', 'grid', 'all', 6, 5);
	mod.Send('add_translation', 'master', 'grid', 'all', 7, 5);

	//Base stuff:
	for(var i = 0;i < 8;i++)
	{
		mod.Send('add_translation', 'circle_'+i, 'base_grid', 'circle', i, 0);
		mod.Send('add_translation', 'circle_'+(i+8), 'base_grid', 'circle', 7-i, 1);
	}
	mod.Send('add_translation', 'undo', 'base_grid', 'all', 0, 3);
	mod.Send('add_translation', 'overdub', 'base_grid', 'all', 1, 3);
	mod.Send('add_translation', 'record', 'base_grid', 'all', 2, 3);
	mod.Send('add_translation', 'mute', 'base_grid', 'all', 3, 3);
	mod.Send('add_translation', 'clear', 'base_grid', 'all', 4, 3);
	mod.Send('add_translation', 'quantize', 'base_grid', 'all', 5, 3);

	//Minim stuff:
	for(var i = 0;i < 4;i++)
	{
		mod.Send('add_translation', 'instance_'+i, 'minim_grid', 'instance', i, 0);
	}
	mod.Send('add_translation', 'undo', 'minim_grid', 'all', 0, 2);
	mod.Send('add_translation', 'overdub', 'minim_grid', 'all', 0, 1);
	mod.Send('add_translation', 'record', 'minim_grid', 'all', 1, 1);
	mod.Send('add_translation', 'mute', 'minim_grid', 'all', 2, 1);
	mod.Send('add_translation', 'clear', 'minim_grid', 'all', 3, 1);
	mod.Send('add_translation', 'quantize', 'minim_grid', 'all', 0, 3);
	mod.Send('add_translation', 'relative', 'minim_grid', 'all', 1, 3);
	mod.Send('add_translation', 'slave', 'minim_grid', 'all', 2, 3);
	mod.Send('add_translation', 'master', 'minim_grid', 'all', 3, 3);
	
}

function _push_grid(x, y, z)
{
	debug('push_grid:', x, y, z);
	grid(x, y, z);
}

function _base_grid(x, y, z)
{
	post('base_grid', x, y, z, '\n');
	if(z)
	{
		switch(y)
		{
			case 0:
				looper.looper.message('pos', x/16);
				looper.looper.message('restart', 1);
				break;
			case 1:
				looper.looper.message('pos', (Math.abs(x-7)+8)/16);
				looper.looper.message('restart', 1);
				break;
			case 3:
				switch(x)
				{
					case 0:
						undo();
						break;
					case 1:
						_overdub();
						break;
					case 2:
						_loop();
						break;
					case 3:
						_mute();
						break;
					case 4:
						_clear();
						break;
					case 5:
						set_quantize_record(Math.abs(quantize_record.enabled-1));
						break;
				}
				break;
		}
	}
}

function _minim_grid(x, y, z)
{
	if(z)
	{
		if((x<4)&&(y<4))
		{
			switch(y)
			{
				case 0:
					mod.Send('select_device_from_key', '@loop'+(x+1));
					break;
				case 1:
					switch(x)
					{
						case 0:
							_overdub();
							break;
						case 1:
							_loop();
							break;
						case 2:
							_mute();
							break;
						case 3:
							_clear();
							break;
					}
					break;
				case 2:
					switch(x)
					{
						case 0:
							undo();
							break;
					}
					break;
				case 3:
					switch(x)
					{
						case 0:
							//set_quantize_record(Math.abs(quantize_record.enabled-1));
							looper.quantizerecord.message('int', Math.abs(looper.quantizerecord.getvalueof()-1));
							break;
						case 1:
							looper.relativerecord.message('int', Math.abs(looper.relativerecord.getvalueof()-1));
							//set_relative_record(Math.abs(quantize_record.relative-1));
							break;
						case 2:
							looper.slave.message('int', Math.abs(looper.slave.getvalueof()-1));
							//set_slave(Math.abs(slave-1));
							break;
						case 3:
							looper.master.message('int', Math.abs(looper.master.getvalueof()-1));
							//set_master(glob.master_loooper == script ? 0 : 1);
							break;
					}
					break;
			}
		}
	}
}

function _grid(x, y, z)
{
	//debug('grid:', x, y, z);
	if((x<8)&&(y<8))
	{
		var pos = parseInt(cell_fire[x][y][0]);
		//debug(x, y, z, pos, number, '\n');
		if((pos > -1)&&(pos <16)&&(z>0))
		{
			looper.looper.message('pos', pos/16);
			looper.looper.message('restart', 1);
		}
		else if((pos == 17)&&(z>0))
		{
			_reverse();
		}
		else if((pos == 18)&&(z>0))
		{
			_change_inertia(inertia_values[(y%8)]);
		}
		else if((pos == 19)&&(z>0))
		{
			_change_speed(speed_values[(y%8)]);
		}
		else if((pos ==20)&&(z>0))
		{
			switch(x%8)
			{
				case 0:
					undo();
					break;
				case 1:
					_overdub();
					break;
				case 2:
					_loop();
					break;
				case 3:
					_mute();
					break;
				case 4:
					_clear();
					break;
				case 5:
					looper.relativerecord.message('int', Math.abs(quantize_record.relative-1));
					break;
				case 6:
					debug('select_device_from_key @loop1');
					mod.Send('select_device_from_key', '@loop1');
					break;
				case 7:
					debug('select_device_from_key @loop2');
					mod.Send('select_device_from_key', '@loop2');
					break;
			}
		}
		else if((pos ==21)&&(z>0))
		{
			if((x%8)<5)
			{
				make_dummy_loop(x%8);
			}
			else
			{
				switch(x%8)
				{
					case 5:
						//set_quantize_record(Math.abs(quantize_record.enabled-1));
						looper.quantizerecord.message('int', Math.abs(quantize_record.enabled-1));
						break;
					case 6:
						debug('select_device_from_key @loop3');
						mod.Send('select_device_from_key', '@loop3');
						break;
					case 7:
						debug('select_device_from_key @loop4');
						mod.Send('select_device_from_key', '@loop4');
						break;
				}
			}			
		}
		else if((pos == 30)&&(z>0))
		{
			looper.slave.message('int', Math.abs(looper.slave.getvalueof()-1));
		}
		else if((pos == 31)&&(z>0))
		{
			looper.master.message('int', Math.abs(looper.master.getvalueof()-1));
		}
	}
}

function _lcd(){}

//called from other patches, e.g. GrainStorm mod, to transfer the loopers buffer contents to their own buffers
//this will be broken in b995 until I make some adjustments
function copy_buffer_to_destination(dest)
{
	//post('copy buffer', dest, '\n');
	//looper.copybuffer.message('set', dest);
	//looper.copybuffer.message('size', loop_end, 2);
	//looper.buffetloop.message('copy_to_buffer', dest, 0, loop_end-1);
	//looper.copybuffer.message('set', dummy);
}

function dummy_callback(){}

/*function multiply()
{
	looper.buffetloop.message('maxswap', loop_size*2);
	looper.bufferundo.message('size', loop_size);
	looper.buffetloop.message('copy_to_buffer', buffer_undo, 0, loop_size-1)
	looper.bufferloop.message('size', 0, loop_size*2);
	looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
	looper.buffetloop.message('rotatetozero', loop_size);
	looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
	looper.grooveend.message(loop_size*2);
	looper.groovelength.message(loop_size*2);
}*/

forceload(this);
