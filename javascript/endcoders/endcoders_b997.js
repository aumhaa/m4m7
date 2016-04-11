autowatch = 1;

inlets = 2;
outlets = 2;

var finder;
var mod;
var mod_finder;

var unique = jsarguments[1];

var script = this;

var FORCELOAD = false;
var DEBUG = true;
var DEBUGLCD = false;
var SHOW_STORAGE = 0;

var debug = (DEBUG&&Debug) ? Debug : function(){};
var debuglcd = (DEBUGLCD&&Debug) ? Debug : function(){};
var forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

var modColor=6;

var FUNCTION_COLORS = [3, 6, 5, 0];
var ACCEL_FACTORS = [.15, .05];
var CLEAR_TOLLERANCE = 7;
var knob_ids=[];
var knob=[];
var finder=[];
var parameters=[];
var rows=[];
var columns=[];
var c_rows=[];
var c_keys=[];
var grid_rows=[];
var keys=[];
var accel = .1;
var	Alive = 0;
var assignments;
var id_numbers;
var active_preset = 0;
var script = this;
var is_shifted = false;
var is_alted = false;
var assign_mode_enabled = false;
var selected_row = 0;

var encs = [];
for(var i=0;i<32;i++)
{
	encs['Encoder_'+i]=[];
	encs['Encoder_'+i].val = 0;
	encs['Encoder_'+i].x_c = i%8;
	encs['Encoder_'+i].y_c = Math.floor(i/8);
}

ENDCODER_BANK_CONTROL = ['ModDevice_knob0', 'ModDevice_knob1', 'ModDevice_knob2', 'ModDevice_knob3', 'ModDevice_knob4', 'ModDevice_knob5', 'ModDevice_knob6', 'ModDevice_knob7']

var banks =[];
for(var bank=0;bank<8;bank++)
{
	var entry = ENDCODER_BANK_CONTROL.slice(0);
	for(var index=0;index<24;index++)
	{
		entry.push('CustomParameter_'+(index+(bank*24)));
	}
	banks.push(entry);
}


var regular_banks = [];
for(var bank=0;bank<8;bank++)
{
	regular_banks.push(ENDCODER_BANK_CONTROL.slice(0));
	for(var b=0;b<3;b++)
	{
		var entry = [];
		for(var e=0;e<8;e++)
		{
			entry.push('CustomParameter_'+(b*8+e+(bank*24)));
		}
		regular_banks.push(entry);
	}
}

CODEC_ENDCODER_BANKS = {'MxDeviceMidiEffect':banks};
ENDCODER_BANKS = {'MxDeviceMidiEffect':regular_banks};


var Mod = ModComponent.bind(script);

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
		//debug('mod callback:', args);
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
	setup_translations();
	mod.Send('code_encoder_grid', 'local', 0);
	mod.Send('create_alt_device_proxy', '_codec_device_proxy');
	for(var dev_type in CODEC_ENDCODER_BANKS)
	{
		for(var bank_num in CODEC_ENDCODER_BANKS[dev_type])
		{
			debug('sending entry:', 'receive_alt_device_proxy', '_codec_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, CODEC_ENDCODER_BANKS[dev_type][bank_num]);
			mod.SendDirect('receive_alt_device_proxy', '_codec_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, CODEC_ENDCODER_BANKS[dev_type][bank_num]);
		}
	}
	mod.Send('receive_alt_device_proxy', '_codec_device_proxy', 'set_number_custom', 192);
	mod.Send('receive_alt_device_proxy', '_codec_device_proxy', 'set_number_params', 32);
	mod.Send('code_encoders_to_device', 'value', 1);
	mod.Send('receive_alt_device_proxy', '_codec_device_proxy', 'rebuild_parameters');

	for(var dev_type in ENDCODER_BANKS)
	{
		for(var bank_num in ENDCODER_BANKS[dev_type])
		{
			debug('sending entry:', 'receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, ENDCODER_BANKS[dev_type][bank_num]);
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, ENDCODER_BANKS[dev_type][bank_num]);
		}
	}
	mod.Send('receive_device_proxy', 'set_number_custom', 192);
	mod.Send('receive_device_proxy', 'set_number_params', 32);
	mod.Send('receive_device_proxy', 'rebuild_parameters');

	for(var l=0;l<8;l++)
	{
		mod.Send('trans', 'm_enc_'+l, 'mode', 5);
		mod.Send('trans', 'm_enc_'+l, 'green', 0);
		mod.Send('trans', 'm_enc_'+l, 'value', 0);
		mod.Send('trans', 'm_button_'+l, 'value', 0);
	}
	for(var l=0;l<24;l++)
	{
		mod.Send('trans', 'e_enc_'+l, 'mode', 5);
		mod.Send('trans', 'e_enc_'+l, 'green', 0);
		mod.Send('trans', 'e_enc_'+l, 'value', 0);
		mod.Send('trans', 'e_button_'+l, 'value', 0);
	}
	finder = new LiveAPI(finder_cb, 'this_device');
	var this_device_id = finder.id;
	for(var b=0;b<8;b++)
	{
		finder.goto('live_set', 'this_device', 'parameters', b + 1);
		knob_ids.push(finder.id);
	}
	finder.goto('live_set', 'view', 'selected_parameter');
	preset = this.patcher.getnamed('preset');
	storage = this.patcher.getnamed('storage');
	if(SHOW_STORAGE){storage.message('storagelist');}
	if(SHOW_STORAGE){storage.message('clientlist');}
	gui_edit = this.patcher.getnamed('edit');
	gui_selected = this.patcher.getnamed('selected');
	for(var h=0;h<4;h++)
	{
		rows[h]=[];
		rows[h].pressed = false;
		c_rows[h]=[];
		c_rows.pressed = false;
	}
	for(var i=0;i<32;i++)
	{
		c_keys[i]=[];
		c_keys[i].pressed = false;
	}
	for(var i=0;i<4;i++)
	{
		grid_rows[i]=[];
		grid_rows[i].pressed = false;
	}
	for(var i=0;i<8;i++)
	{
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nominimize');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nozoom');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nogrow');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'float');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('exec');
		keys[i]=[];
		keys[i].pressed = 0;
		columns[i]=[];
		columns[i].pressed = false;
		knob[i]=[];
		knob[i].num = i;
		knob[i].val = 0.0;
		knob[i].knob = this.patcher.getnamed('knob'+i);
		knob[i].knob.message('set', knob[i].val * 127);
		knob[i].assignment = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('assignments');
		knob[i].id_numbers = knob[i].assignment.getvalueof();
		debug('assignments', i, knob[i].id_numbers);
		if(knob[i].id_numbers.length < 24)
		{
			knob[i].id_numbers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			knob[i].assignment.setvalueof(knob[i].id_numbers);
		}
		knob[i].active = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('active');
		knob[i].active_states = knob[i].active.getvalueof();
		for(var j=0;j<24;j++)
		{
			knob[i][j] = [];
			knob[i][j].bank = i;
			knob[i][j].num = j;
			knob[i][j].x_c = (j%8);
			knob[i][j].y_c = Math.floor(j/8) + 1;
			if(j<8){
				knob[i][j].cntrlr = 1;
				knob[i][j].c_x_c = j%4;
				knob[i][j].c_y_c = Math.floor(j/4)+1;
			}
			else{
				knob[i][j].cntrlr = 0;
				knob[i][j].c_x_c = 0;
				knob[i][j].c_y_c = 0;
			}
			knob[i][j].active = parseInt(knob[i].active_states[j]);
			knob[i][j].gui_active = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('active['+j+']');
			knob[i][j].gui_select = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('select['+j+']');
			knob[i][j]._title = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('title'+j);
			knob[i][j].parameter = [];
			knob[i][j].parameter.id = parseInt(knob[i].id_numbers[j]);
			knob[i][j].parameter.obj = knob[i][j];
			if(knob[i][j].parameter.id != 0)
			{
				var new_parameter_id = parseInt(knob[i][j].parameter.id);
				var new_name = [];
				finder.id = new_parameter_id;
				new_name.unshift(finder.get('name'));
				finder.goto('canonical_parent');
				finder.goto('canonical_parent');
				new_name.unshift(' || ');
				new_name.unshift(finder.get('name'));
				new_name = new_name.join('');
				new_name = new_name.slice(0, 25);
				knob[i][j]._title.message('set', new_name);
				mod.Send('send_explicit', 'receive_alt_device_proxy', '_codec_device_proxy', 'set_custom_parameter', j+(i*24), 'id', new_parameter_id);
				mod.Send('send_explicit', 'receive_device_proxy', 'set_custom_parameter', j+(i*24), 'id', new_parameter_id);
			}
			knob[i][j].breakpoint = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('breakpoint'+j);
			knob[i][j].breakpoint.message('setdomain', 100.);
			knob[i][j].breakpoint.message('mode', 1);
			knob[i][j].breakpoint.message('grid', 1);
			knob[i][j].breakpoint.message('gridstep_x', 14.28);
			knob[i][j].breakpoint.message('gridcolor', 1, 1, 1, 1);
		}
	}
	deprivatize_script_functions(script);
	Alive = 1;
	clear_surface();
	mod.Send('key', 'value', 4, 64);
	mod.Send('key', 'value', 5, 65);
	selected = knob[0];
	select_knob(0);
	select_row(0);
	load_preset();
	storage.message('getslotlist');
	debug('initialize endcoders');
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
	
	//Code stuff:
	for(var i = 0;i < 8;i++)
	{
		mod.Send('add_translation', 'm_button_'+i, 'code_grid', 'macro_buttons', i, 0);
		mod.Send('add_translation', 'm_enc_'+i, 'code_encoder_grid', 'macro_encoders', i, 0);
	}
	for(var i = 0;i < 24;i++)
	{
		mod.Send('add_translation', 'e_button_'+i, 'code_grid', 'buttons', i%8, Math.floor(i/8)+1);
		mod.Send('add_translation', 'e_enc_'+i, 'code_encoder_grid', 'encoders', i%8, Math.floor(i/8)+1);
	}
	for(var i = 0;i < 4;i++)
	{
		mod.Send('add_translation', 'f_button_'+i, 'code_button', 'functions', i);
	}
	for(var i = 0;i < 8;i++)
	{
		mod.Send('add_translation', 'c_key_'+i, 'code_key', 'sliders', i);
		mod.Send('add_translation', 'key_'+i, 'code_key', 'presets', i);
	}

	//Grid Stuff
	for(var i = 0;i < 8;i++)
	{
		mod.Send('add_translation', 'm_button_'+i, 'grid', 'grid_macro_buttons', i, 0);
	}
	//for(var i = 0;i < 24;i++)
	//{
	//	mod.Send('add_translation', 'e_button_'+i, 'grid', 'grid_buttons', i%8, Math.floor(i/8)+1);
	//}
	for(var i = 0;i < 4;i++)
	{
		mod.Send('add_translation', 'f_button_'+i, 'key', 'grid_functions', i+4);
	}
	for(var i = 0;i < 8;i++)
	{
		mod.Send('add_translation', 'c_key_'+i, 'grid', 'grid_sliders', i, 7);
		mod.Send('add_translation', 'key_'+i, 'grid', 'grid_presets', i, 6);
	}
		
}

function slotlist()
{
	args = arrayfromargs(arguments);
	post('slotlist', args, '\n');
	for(var i=0;i<16;i++)
	{
		var found = 0;
		for(var j in args)
		{
			if(args[j]==(i+1))
			{
				found = 1;
			}
		}
		//outlet(0, 'cntrlr_key', 'value', i, found*127);
		if(i<8)
		{
			//outlet(0, 'key', 'value', i, found);
			mod.Send('trans', 'key_'+i, 'value', found);
		}
	}
	if(active_preset > 0)
	{
		//outlet(0, 'cntrlr_key', 'value', active_preset-1, 5);
		if(active_preset<8)
		{
			//outlet(0, 'key', 'value', active_preset-1, 8);
			mod.Send('trans', 'key_'+(active_preset-1), 'value', 8);
		}
	}
	//else if(args.length > 0)
	//{
	//	preset.message(args[0]);
	//}
}

function load_preset()
{
	for(var i=0;i<8;i++)
	{
		knob[i].active_states = knob[i].active.getvalueof();
		for(var j=0;j<24;j++)
		{
			if(knob[i][j].parameter.id != 0)
			{
				//knob[i][j]._title.message('set', knob[i][j].parameter.get('name'));
				knob[i][j].active = knob[i].active_states[j];
				if(knob[i][j].active == 0)
				{
					knob[i][j].gui_active.message('outlinecolor', .35, .35, .35, 1.);
				}
				else
				{
					knob[i][j].gui_active.message('outlinecolor', .15, .45, .15, 1.);
				}
			}
		}
	}
	select_knob(selected.num);
}

function finder_cb(args)
{
	//var args = arrayfromargs(messagename, arguments);
	//post('finder', args, '\n');
}

/*function parameter_cb(args)
{
	//var args = arrayfromargs(messagename, arguments);
	//post('parameter_callback', args[0], ', ', args[1], '\n');
	if((this.id != 0)&&(args[0]=='value')&&(args[1]!='bang')&&(Alive>0))
	{
		var new_val = parseFloat(scale(args[1], parseFloat(this.obj.min), parseFloat(this.obj.max), 0, 1));
		this.obj.val = new_val;
		if(this.obj.bank == selected.num)
		{
			mod.Send('wheel', this.obj.x_c, this.obj.y_c, 'value', Math.floor(new_val * 11) + 1);
		}
	}
}*/

function anything()
{
	var args = arrayfromargs(arguments);
	switch(messagename)
	{			
		default:
			debug('anything', messagename, args);
			break;
	}
}

function _recall(num)
{
	active_preset = num;
	//for(var i=0;i<8;i++)
	//{
	//	mod.Send('key', i, 7 * ((i + 1)==num));
	//}
	load_preset();
}	

function _button(x, y, val)
{
	debug('button', x, y, val);
	if(val>0)
	{
		if(y==0)
		{
			if(rows[0].pressed>0)
			{
				for(var i=0;i<24;i++)
				{
					set_breakpoint(i);
				}
			}
			else if(rows[1].pressed>0)
			{
				for(var i=0;i<24;i++)
				{
					clear_breakpoint(i);
				}
			}
			else if(is_alted)
			{
				for(var i=0;i<24;i++)
				{
					set_breakpoint(i);
				}
			}
			else if(is_shifted)
			{
				select_knob(x);
				this.patcher.getnamed('breakpoints').message('wclose');
				this.patcher.getnamed('breakpoints').message('open', x+1);
			}
			else
			{
				select_knob(x);
			}
		}
		else
		{
			if(rows[0].pressed>0)
			{
				//select_parameter(((y-1)*8)+x);
				set_breakpoint(((y-1)*8)+x);
			}
			else if(rows[1].pressed>0)
			{
				//select_parameter(((y-1)*8)+x);
				clear_breakpoint(((y-1)*8)+x);
			}
			//else if(is_shifted)
			else if(assign_mode_enabled)
			{
				select_parameter(((y-1)*8)+x);
			}
			else if(is_alted)
			{
				set_breakpoint(((y-1)*8)+x);
			}
			else
			{
				toggle_active(selected[((y-1)*8)+x]);
			}
		}
	}
}

function _code_key(num, val)
{
	debug('column', num, val);
	if((num < 8)&&(val>0))
	{
		selected.knob.message('int', Math.round((num/7)*100));
	}
}

function _code_button(num, val)
{
	debug('row', num, val);// rows[num].pressed);
	if(num < 2)
	{
		rows[num].pressed = (val!=0);
		mod.Send('code_button', 'value', num, (val>0) * 127);
		mod.Send('key', 'value', num+4, ((val>0)*7) + 64);
	}
	else if((num ==2)&&(val>0))
	{
		rows[2].pressed = Math.abs(rows[2].pressed - 1);
		assign_mode_enabled = (!assign_mode_enabled);
		debug('assign_mode_enabled', assign_mode_enabled);
		mod.Send('code_button', 'value', 2, assign_mode_enabled * 8);
		mod.Send('key', 'value', 6, assign_mode_enabled * 8);
	}
	else if((num ==3)&&(val>0))
	{
		rows[3].pressed = Math.abs(rows[3].pressed - 1);
		mod.Send('code_button', 'value', 3, rows[3].pressed * 127);
		mod.Send('key', 'value', 7, rows[3].pressed * 127);
		if(rows[3].pressed > 0)
		{
			accel = ACCEL_FACTORS[0];
		}
		else
		{
			accel = ACCEL_FACTORS[1];
		}
	}
}

function _key(num, val)
{
	/*if(num<8)
	{
		debug('key', num, val);
		keys[num].pressed = (val!=0);
		if(val > 0)
		{
			storage.message('store', active_preset);
			active_preset = num+1;
			preset.message('int', active_preset);
			storage.message('getslotlist');
		}
	}*/
	if(val&&(num<4))
	{
		select_row(num);
	}
	else if(num>3)
	{
		_code_button(num-4, val);
	}
}

function _c_key(num, val)
{
	debug('c_key', num, val);
	c_keys[num].pressed = (val!=0);
	if(val > 0)
	{
		if(num<16)
		{
			storage.message('store', active_preset);
			active_preset = num + 1;
			preset.message('int', num + 1);
			storage.message('getslotlist');		
		}
		else
		{
			selected.knob.message('int', Math.floor(((num-16)/15)*100));
		}

	}
}

function _c_grid(x, y, val)
{
	var num = x+(y*4);
	debug('c_grid', x, y, val);
	if(num<4)
	{
		c_rows[num].pressed=val;
		mod.Send('cntrlr_grid', 'value', num, 0, FUNCTION_COLORS[x] + ((val>0)*7));
	}
	else if((num>7)&&(val>0))
	{
		if(c_rows[0].pressed>0)
		{
			select_knob(num-8);
			this.patcher.getnamed('breakpoints').message('wclose');
			this.patcher.getnamed('breakpoints').message('open', num-7);
		}
		else if(c_rows[1].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				if(selected.id_numbers[i]>0)
				{
					set_breakpoint(i);
				}
			}
		}
		else if(c_rows[2].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				clear_breakpoint(i);
			}
		}
		else
		{
			select_knob(num-8);
		}
	}
}

function _c_button(x, y, val)
{
	debug('c_button', x, y, val);
	if(val>0)
	{
		if(c_rows[0].pressed>0)
		{
			select_parameter(((y)*4)+x);
		}
		if(c_rows[1].pressed>0)
		{
			set_breakpoint(((y)*4)+x);
		}
		else if(c_rows[2].pressed>0)
		{
			clear_breakpoint(((y)*4)+x);
		}
		else
		{
			toggle_active(selected[((y)*4)+x]);
		}
	}
}

function _grid(x, y, val)
{
	var num = x+(y*8);
	debug('grid', x, y, val);
	if((num>7)&&(num<11))
	{
		grid_rows[num-8].pressed = val>0;
		mod.Send('grid', 'value', x, y, FUNCTION_COLORS[x]+((val>0)*7));
	}
	else if((num>15)&&(num<40))
	{
		if(val>0)
		{
			if(grid_rows[0].pressed>0)
			{
				select_parameter(((y-2)*8)+x);
			}
			if(grid_rows[1].pressed>0)
			{
				set_breakpoint(((y-2)*8)+x);
			}
			else if(grid_rows[2].pressed>0)
			{
				clear_breakpoint(((y-2)*8)+x);
			}
			else
			{
				toggle_active(selected[((y-2)*8)+x]);
			}
		}
	}
	else if((num>=56)&&(num<64))
	{
		_code_key(x, val);
	}
	else if((num<8)&&(val>0))
	{
		if(grid_rows[0].pressed>0)
		{
			select_knob(num);
			this.patcher.getnamed('breakpoints').message('wclose');
			this.patcher.getnamed('breakpoints').message('open', num+1);
		}
		else if(grid_rows[1].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				if(selected.id_numbers[i]>0)
				{
					set_breakpoint(i);
				}
			}
		}
		else if(grid_rows[2].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				clear_breakpoint(i);
			}
		}
		else
		{
			select_knob(num);
		}
	}
}

function _grid(x, y, val)
{
	if(y<4){_button(x, y, val);}
	else if(y==7){selected.knob.message('int', Math.floor(((x)/7)*100));}
	else if(y==6){_c_key(x, val);}
}

function _code_grid(x, y, val)
{
	button(x, y, val)
}

function _code_encoder_grid(x, y, val)
{
	debug('_code_encoder_grid', x, y, val);
	if(y==0)
	{
		//this.patcher.getnamed('knob'+x).message('int', val);
	}
	else
	{
	}
}

function _dial_return(bank, number, value)
{
	debug('dial_return', bank, number, value);
	//knob[bank][number].val = value;
	if(knob[bank-1].active_states[number])
	{
		mod.Send('receive_alt_device_proxy', '_codec_device_proxy', 'set_custom_parameter_value', number+((bank-1)*24), value);
		mod.Send('receive_device_proxy', 'set_custom_parameter_value', number+((bank-1)*24), value);
	}
}

function _shift(value)
{
	is_shifted = value>0;
	debug('shift', is_shifted);
}

function _alt(value)
{
	is_alted = value>0;
	debug('alt', is_alted);
}

function set_breakpoint(num)
{
	var param = selected[num].parameter
	if(param.id != 0)
	{
		finder.id = param.id;
		var max = finder.get('max');
		var min = finder.get('min');
		var val = finder.get('value');
		var new_val = (val-min/(max-min))*100;
		debug('val is:', new_val, 'max', max, 'min', min, 'val', val);
		debug('set_breakpoint', num, selected.val, new_val);
		selected[num].breakpoint.message('list', selected.val, new_val);
	}
}

function clear_breakpoint(num)
{
	if(is_shifted)
	{
		selected[num].message('clear');
	}
	else
	{
		debug('clear_breakpoint', num);
		var list = selected[num].breakpoint.getvalueof();
		debug('list is:', list);
		list = list.slice(3);
		debug('list is now:', list, list.length);
		var index = 0;
		do{
			var entry = list.splice(0, 4);
			debug('entry is:', entry);
			if((entry[0] >= (selected.val - CLEAR_TOLLERANCE))&&(entry[0]<=(selected.val + CLEAR_TOLLERANCE)))
			{
				debug('entry is in there....', index);
				selected[num].breakpoint.message('clear', index);
			}
			index+=1;
		}while(list.length);
		//selected[num].breakpoint.message('clear');
	}
}

function select_row(num)
{
	selected_row = num;
	mod.SendDirect('receive_device', 'set_mod_device_bank', selected_row + (selected.num*4));
	var i=3;do{
		mod.Send('key', 'value', i, (i==selected_row)*10);
	}while(i--);
}

function select_knob(num)
{
	debug('select knob', num);
	selected = knob[num];
	mod.Send('receive_alt_device_proxy', '_codec_device_proxy', 'set_mod_device_bank', num);
	mod.SendDirect('receive_device', 'set_mod_device_bank', selected_row + (selected.num*4));
	gui_selected.message('set', num);
	var i=7;do{
		mod.Send('trans', 'm_button_'+i, 'value', (num == i)*127);
		mod.Send('grid', 'value', i, 0, (num == i)*1);
	}while(i--);
	/*var i=3;do{
		var j=1;do{
			mod.Send('cntrlr_grid', 'value', i, j+2, (num == (i+(j*4)))*127);
		}while(j--);
	}while(i--);*/
	for(var i=0;i<24;i++)
	{
		var cur_param = selected[i], assigned = (cur_param.parameter.id != 0);
		//mod.Send('code_grid', 'value', j, i+1, 127 * assigned);
		mod.Send('trans', 'e_button_'+i, 'value', 127 * assigned);
		//mod.Send('code_encoder_grid', 'value', j, i+1,  Math.floor(encs['Encoder_'+cur_param.num].val/10)*assigned);
		mod.Send('trans', 'e_enc_'+i, 'value', Math.floor(encs['Encoder_'+cur_param.num].val/10)*assigned);
		//mod.Send('code_encoder_grid', 'green', j, i+1,  cur_param.active);
		//post('active is:', cur_param, cur_param.active);
		mod.Send('trans', 'e_enc_'+i, 'green', cur_param.active);
		/*if(cur_param.cntrlr)
		{
			mod.Send('code_encoder_grid', 'value', cur_param.c_x_c, cur_param.c_y_c,  Math.floor(encs['Encoder_'+cur_param.num].val/10)*assigned);
			mod.Send('code_grid', 'value', cur_param.c_x_c, cur_param.c_y_c, (cur_param.parameter.id>0)*((cur_param.active*5)+1));
		}*/
		mod.Send('grid', 'value', i%8, (Math.floor(i/8))+1, assigned*((cur_param.active*5)+1));
	}
	refresh_grid_fader();
}

function select_parameter(num)
{
	var to_active = (selected[num].parameter.id == 0);
	finder.goto('live_set', 'view', 'selected_parameter');
	var new_parameter_id = parseInt(finder.id);
	mod.Send('send_explicit', 'receive_alt_device_proxy', '_codec_device_proxy', 'set_custom_parameter', num+(selected.num*24), 'id', new_parameter_id);
	mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', num+(selected.num*24), 'id', new_parameter_id);
	debug('receive_device', 'set_custom_parameter', num+(selected.num*24), 'id', new_parameter_id);
	var in_this = 0;
	for(var i in knob_ids)
	{
		if(knob_ids[i] == new_parameter_id)
		{
			in_this = 1;
		}
	}
	if((new_parameter_id > 0)&&(in_this == 0))
	{
		selected[num].parameter.id = new_parameter_id;
		selected.id_numbers[num] = new_parameter_id;
		selected.assignment.message('list', selected.id_numbers);
		var new_name = [];
		new_name.unshift(finder.get('name'));
		finder.goto('canonical_parent');
		finder.goto('canonical_parent');
		new_name.unshift(' || ');
		new_name.unshift(finder.get('name'));
		new_name = new_name.join('');
		new_name = new_name.slice(0, 25);
		selected[num]._title.message('set', new_name);
		if(selected[num].parameter.id == 0)
		{
			selected[num].gui_select.message('outlinecolor', .35, .35, .35, 1.);
		}
		else
		{
			selected[num].gui_select.message('outlinecolor', 1., 1., 1., 1.);
		}
		//mod.Send('code_grid', 'value', selected[num].x_c, selected[num].y_c, 127 * (selected[num].parameter.id != 0));
		mod.Send('trans', 'e_button_'+(selected[num].num), 'value', 127 * (selected[num].parameter.id != 0));
		//post('sel cntrlr', selected[num].cntrlr, '\n');
		/*if(selected[num].cntrlr)
		{
			mod.Send('cntrlr_grid', 'value', selected[num].c_x_c, selected[num].c_y_c, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
		}
		mod.Send('grid', 'value', selected[num].x_c, selected[num].y_c + 1, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
		*/
		if(to_active>0)
		{
			set_active(num, 1);
		}
	}
}

function set_active(num, state)
{
	//post('set active', num, state, '\n');
	for(var i = 0;i<8;i++)
	{
		for(var j=0;j<24;j++)
		{
			var Knob = knob[i][j];
			if((Knob.parameter.id == selected[num].parameter.id)&&(Knob.active > 0))
			{
				
				Knob.active = 0;
				knob[i].active_states[j] = 0;
				Knob.gui_active.message('outlinecolor', .35, .35, .35, 1.);
				if(i == selected.num)
				{
					//mod.Send('code_encoder_grid', 'green', Knob.x_c, Knob.y_c, 0);
					mod.Send('trans', 'e_enc_'+(Knob.num), 'green', 0);
					/*mod.Send('grid', 'value', Knob.x_c, Knob.y_c + 2, 0);
					if(Knob.cntrlr)
					{
						mod.Send('cntrlr_grid', 'value', Knob.c_x_c, Knob.c_y_c, (Knob.parameter.id>0)*((Knob.active*5)+1));
					}*/
				}
			}
		}
		knob[i].active.setvalueof(knob[i].active_states);
	}		
	selected[num].active = state;
	selected.active_states[num] = state;
	selected.active.setvalueof(selected.active_states);
	//selected[num].gui_active.setvalueof(selected[num].active);
	if(selected[num].active == 0)
	{
		selected[num].gui_active.message('outlinecolor', .35, .35, .35, 1.);
	}
	else
	{
		selected[num].gui_active.message('outlinecolor', .15, .85, .15, 1.);
	}
	//mod.Send('code_encoder_grid', 'green', selected[num].x_c, selected[num].y_c, selected[num].active);
	mod.Send('trans', 'e_enc_'+(selected[num].num), 'green', selected[num].active);
	mod.Send('grid', 'value', selected[num].x_c, selected[num].y_c, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
	/*if(selected[num].cntrlr)
	{
		debug('sending white', selected[num].c_x_c, selected[num].c_y_c, selected[num].active);
		mod.Send('cntrlr_grid', 'value', selected[num].c_x_c, selected[num].c_y_c, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
	}*/
}

function toggle_active(dial)
{
	set_active(dial.num, Math.abs(dial.active - 1));
}

function scale(x,a,b,c,d)
{
	var in_dif=((Math.max((a+1000000.),(b+1000000.)))-(Math.min((a+1000000.),(b+1000000.))));
	var in_val=((Math.max((a+1000000.),(x+1000000.)))-(Math.min((a+1000000.),(x+1000000.))));
	var out_dif=((Math.max((c+1000000.),(d+1000000.)))-(Math.min((c+1000000.),(d+1000000.))));
	var out_min=(c+1000000.);
	return( ( (out_min+ ( (in_val) / (in_dif) * (out_dif) -1000000.) ) ) ).toFixed(2);
}

function dissolve()
{
	Alive = 0;
}

function _Edit()
{
	this.patcher.getnamed('breakpoints').message('open', selected.num+1);
}

function _select(num)
{
	this.patcher.getnamed('breakpoints').message('wclose');
	select_knob(num);
}

function _select_button(sel, num)
{
	select_parameter(num);
}

function _active_button(sel, num)
{
	toggle_active(selected[num]);
}

function clear_surface()
{
	for(var i = 0; i < 8; i ++)
	{
		mod.Send('trans', 'c_key_'+i, 'value', 0);
		mod.Send('trans', 'key_'+i, 'value', 0);
		mod.Send('trans', 'm_button_'+i, 'value', 0);
		mod.Send('trans', 'm_enc_'+i, 'mode', 5);
		mod.Send('trans', 'm_enc_'+i, 'green', 0);
		mod.Send('trans', 'm_enc_'+i, 'value', 0);
	}
	for(var i = 0; i < 24; i ++)
	{
		mod.Send('trans', 'e_button_'+i, 'value', 0);
		mod.Send('trans', 'e_enc_'+i, 'mode', 5);
		mod.Send('trans', 'e_enc_'+i, 'green', 0);
		mod.Send('trans', 'e_enc_'+i, 'value', 0);
	}
	for(var i = 0; i < 4; i ++)
	{
		mod.Send('trans', 'f_button_'+i, 'value', 0);
	}
	mod.Send('grid', 'batch_all', 0);
	/*for(var i=0;i<4;i++)
	{
		mod.Send('c_grid', i, 0, FUNCTION_COLORS[i]);
		mod.Send('grid', i, 1, FUNCTION_COLORS[i]);
	}*/
}

function _encoders(num, val)
{
	num-=1;
	debug('_encoders:', num, val, num==selected.num);
	knob[num].val = val;
	if((num)==selected.num)
	{
		refresh_grid_fader();
	}
}

function refresh_grid_fader()
{
	var i=7;do{
		debug('grid', 'value', i, 7, ((selected.val/12.5)>=i)*6);
		mod.Send('grid', 'value', i, 7, ((selected.val/12.5)>=i)*6);
	}while(i--);
}

function _lcd()
{
	var args = arrayfromargs(arguments);
	debuglcd('lcd:', args)
	if(args[1]=='encoder_value')
	{
		var enc = encs[args[0]];
		//var wheel = encs[args[0]];
		enc.val = (args[2]/127)*100;
		if((enc.y_c<1)&&(selected.num==enc.x_c))
		{
			var new_val = Math.round(args[2]/8.46666);
			//var i=15;do{
			//	mod.Send('c_key', i+16, new_val>=i);
			//}while(i--);
			var new_val = Math.round(args[2]/18.14);
			var i=7;do{
				//mod.Send('code_key', 'value', i, (new_val>=i)*127);
				//mod.Send('trans', 'c_key_'+i, 'value', (new_val>=i)*127);
				//mod.Send('grid', 'value', i, 7, (new_val>=i)*6);
			}while(i--);
		}	
	}
}

function _lcd(){}

function _zoom_button(group, number, val)
{
	debug('zoom', group, number, val);
}

forceload(this);
