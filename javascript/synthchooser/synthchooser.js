autowatch = 1;

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = true;
aumhaa.init(this);
var script = this;

var finder;
var mod;
var mod_finder;

var Mod = ModComponent.bind(script);

var pset_id = 0;
var name_listener;
var device_name = '';

var unique = jsarguments[1];
var synths_track;
var chain_selectors = [];
var storage;
var ksliders  = [];
var kslider;
var synth_tab;
var lines = [];
var presets = [{'synth':1, 'lo':0, 'hi':24, 'atouch':0, 'program':0},
				{'synth':2, 'lo':25, 'hi':36, 'atouch':0, 'program':0},
				{'synth':3, 'lo':37, 'hi':48, 'atouch':0, 'program':0},
				{'synth':4, 'lo':49, 'hi':61, 'atouch':0, 'program':0}];

var chosen_synth = 4;
var synth_track_names = ['Synth1', 'Synth2', 'Synth3', 'Synth4'];
var synthchooser_storage;
var synth_tracks = [];
var chain_selectors = [];
var dynamic_gate;
var dynamic_assign = false;
var dyn1 = -1;
var dyn2 = -1;
var Alive = false;
var twister_encoder_button_grid;
var current_preset = 0;
var current_sub = 0;

var multi_synths = [0, 1];
var super_synth = 0;
var multi_banks = [0, 0];
var super_bank = 0;

var synth_param_ids = [[], [], [], []];
var raw_synth_param_ids = [[], [], [], []];

var SYNTHCHOOSER_BANKS = {'NoDevice':[['ModDevice_s1_mod', 'ModDevice_s2_mod', 'ModDevice_s3_mod', 'ModDevice_s4_mod', 'CustomParameter_32', 'CustomParameter_33', 'CustomParameter_34', 'CustomParameter_35', 'CustomParameter_36', 'CustomParameter_37', 'CustomParameter_38', 'CustomParameter_39', 'CustomParameter_40', 'CustomParameter_41', 'CustomParameter_42', 'CustomParameter_43'],
										['CustomParameter_0', 'CustomParameter_1', 'CustomParameter_2', 'CustomParameter_3', 'CustomParameter_4', 'CustomParameter_5', 'CustomParameter_6', 'CustomParameter_7', 'CustomParameter_8', 'CustomParameter_9', 'CustomParameter_10', 'CustomParameter_11', 'CustomParameter_12', 'CustomParameter_13', 'CustomParameter_14', 'CustomParameter_15'],
										['CustomParameter_16', 'CustomParameter_17', 'CustomParameter_18', 'CustomParameter_19', 'CustomParameter_20', 'CustomParameter_21', 'CustomParameter_22', 'CustomParameter_23', 'CustomParameter_24', 'CustomParameter_25', 'CustomParameter_26', 'CustomParameter_27', 'CustomParameter_28', 'CustomParameter_29', 'CustomParameter_30', 'CustomParameter_31']],
						'Other':[['ModDevice_s1_mod', 'ModDevice_s2_mod', 'ModDevice_s3_mod', 'ModDevice_s4_mod', 'CustomParameter_32', 'CustomParameter_33', 'CustomParameter_34', 'CustomParameter_35', 'CustomParameter_36', 'CustomParameter_37', 'CustomParameter_38', 'CustomParameter_39', 'CustomParameter_40', 'CustomParameter_41', 'CustomParameter_42', 'CustomParameter_43'],
										['CustomParameter_0', 'CustomParameter_1', 'CustomParameter_2', 'CustomParameter_3', 'CustomParameter_4', 'CustomParameter_5', 'CustomParameter_6', 'CustomParameter_7', 'CustomParameter_8', 'CustomParameter_9', 'CustomParameter_10', 'CustomParameter_11', 'CustomParameter_12', 'CustomParameter_13', 'CustomParameter_14', 'CustomParameter_15'],
										['CustomParameter_16', 'CustomParameter_17', 'CustomParameter_18', 'CustomParameter_19', 'CustomParameter_20', 'CustomParameter_21', 'CustomParameter_22', 'CustomParameter_23', 'CustomParameter_24', 'CustomParameter_25', 'CustomParameter_26', 'CustomParameter_27', 'CustomParameter_28', 'CustomParameter_29', 'CustomParameter_30', 'CustomParameter_31']]}

function startsWith(str, search)
{
	return str.lastIndexOf(search, 0) === 0;
}


function init()
{
	debug('synthchooser init');

	mod = new Mod(script, 'synthchooser', unique, false);
	//mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);

	deprivatize_script_functions(this);
	Alive = true;
	update_multi_a_track();
	update_multi_b_track();
	update_super_track();
	update_keysplit_display();
	update_device();
}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//debug('mod callback:', args);
		if(args[1] in script)
		{
			//debug(script[args[1]]);
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

function initialize(val)
{
	if(val>0)
	{
		debug('synthchooser init\n');
		setup_tasks();
		setup_translations();
		setup_colors();
		setup_patcher();
		setup_controls();
		setup_device();
		setup_notifiers();
		setup_modes();
		setup_pset_id();
		DEBUG&&storage.message('clientwindow');
		DEBUG&&storage.message('storagewindow');
	}
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 300);
}

function setup_translations(){}

function setup_colors()
{
	mod.Send( 'set_color_map', 'RGB', 0, 8, 16, 24, 32, 40, 48, 56, 64, 72);
}

function setup_controls()
{
	//debug('setup controls!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
	GridControlRegistry = new ControlRegistry('GridRegistry');
	GridButtons = [];
	Grid = new GridClass(4, 4, 'Grid');
	for(var x=0;x<4;x++)
	{
		GridButtons[x] = [];
		for(var y=0;y<4;y++)
		{
			var id = x+(y*4);
			GridButtons[x][y] = new ButtonClass(id, 'Button_'+id, make_send_func('twister_encoder_button_grid', 'value', x, y));
			GridControlRegistry.register_control(id, GridButtons[x][y]);
			Grid.add_control(x, y, GridButtons[x][y]);
		}
	}
	script['_twister_encoder_button_grid'] = function(x, y, val)
	{
		GridControlRegistry.receive(x+(y*4), val);
	}
	script['sub1'] = new GridClass(4, 1, 'sub1');
	script['sub2'] = new GridClass(4, 1, 'sub2');
	script['sub3'] = new GridClass(4, 1, 'sub3');
	script['sub4'] = new GridClass(4, 1, 'sub4');

	sub1.sub_grid(Grid, 0, 4, 0, 1);
	sub2.sub_grid(Grid, 0, 4, 1, 2);
	sub3.sub_grid(Grid, 0, 4, 2, 3);
	sub4.sub_grid(Grid, 0, 4, 3, 4);
}

function setup_patcher()
{
	for(var i=0;i<4;i++)
	{
		synth_track_names[i] = this.patcher.getnamed('s'+(i+1)+'_name').getvalueof()[0];
	}
	//debug('synth_track_names:', synth_track_names);
	for(var i=0;i<4;i++)
	{
		presets[i].synth = this.patcher.getnamed('synth'+(i+1)).getvalueof();
		presets[i].lo = this.patcher.getnamed('lo'+(i+1)).getvalueof();
		presets[i].hi = this.patcher.getnamed('hi'+(i+1)).getvalueof();
		presets[i].atouch = this.patcher.getnamed('touch'+(i+1)).getvalueof();
		presets[i].program = this.patcher.getnamed('prog'+(i+1)).getvalueof();
	}
	storage = this.patcher.getnamed('synthchooser_storage');
	kslider = this.patcher.getnamed('kslider');
	for(var i=0;i<4;i++)
	{
		ksliders[i] = this.patcher.getnamed('s'+(i+1)+'_kslider');
		//lines[i] = this.patcher.getnamed('s'+(i+1)+'_line');
	}
	dynamic_gate = this.patcher.getnamed('dynamic_gate');
	dynamic_gate.message('int', 0);
	synth_tab = this.patcher.getnamed('synth_tab');
	synth_tab.message('int', 4);
}

function setup_device()
{
	mod.Send('receive_device', 'set_mod_device_type', 'SynthChooser');
	mod.Send( 'receive_device', 'set_number_params', 16);
	mod.Send( 'receive_device', 'set_number_custom', 44);
	for(var dev_type in SYNTHCHOOSER_BANKS)
	{
		for(var bank_num in SYNTHCHOOSER_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, SYNTHCHOOSER_BANKS[dev_type][bank_num]);
		}
		//mod.Send('receive_device_proxy', 'update_parameters');
	}
	detect_synth_tracks();
}

function setup_notifiers()
{
	s1_octave = new OffsetComponent('s1_octave', -3, 3, 0, function(obj){debug('s1_octave', obj._value); patcher.getnamed('s1_octave').message('int', obj._value)}, 1, 0, 1);
	s2_octave = new OffsetComponent('s2_octave', -3, 3, 0, function(obj){debug('s2_octave', obj._value); patcher.getnamed('s2_octave').message('int', obj._value)}, 1, 0, 1);
	s3_octave = new OffsetComponent('s3_octave', -3, 3, 0, function(obj){debug('s3_octave', obj._value); patcher.getnamed('s3_octave').message('int', obj._value)}, 1, 0, 1);
	s4_octave = new OffsetComponent('s4_octave', -3, 3, 0, function(obj){debug('s4_octave', obj._value); patcher.getnamed('s4_octave').message('int', obj._value)}, 1, 0, 1);
	octave_controls = [s1_octave, s2_octave, s3_octave, s4_octave];

	s1_prog = new OffsetComponent('s1_prog', 0, 127, presets[0].program, function(obj){debug('s1_prog', obj._value); patcher.getnamed('prog1').message('int', obj._value)}, 4, 0, 1);
	s2_prog = new OffsetComponent('s2_prog', 0, 127, presets[1].program, function(obj){debug('s2_prog', obj._value); patcher.getnamed('prog2').message('int', obj._value)}, 4, 0, 1);
	s3_prog = new OffsetComponent('s3_prog', 0, 127, presets[2].program, function(obj){debug('s3_prog', obj._value); patcher.getnamed('prog3').message('int', obj._value)}, 4, 0, 1);
	s4_prog = new OffsetComponent('s4_prog', 0, 127, presets[3].program, function(obj){debug('s4_prog', obj._value); patcher.getnamed('prog4').message('int', obj._value)}, 4, 0, 1);
	program_controls = [s1_prog, s2_prog, s3_prog, s4_prog];

	s1_chain = new RadioComponent('s1_chain', 0, 4, presets[0].synth, function(obj){debug('s1_chain', obj._value); patcher.getnamed('synth1').message('int', obj._value+1)}, 1, 0, 1);
	s2_chain = new RadioComponent('s2_chain', 0, 4, presets[1].synth, function(obj){debug('s2_chain', obj._value); patcher.getnamed('synth2').message('int', obj._value+1)}, 1, 0, 1);
	s3_chain = new RadioComponent('s3_chain', 0, 4, presets[2].synth, function(obj){debug('s3_chain', obj._value); patcher.getnamed('synth3').message('int', obj._value+1)}, 1, 0, 1);
	s4_chain = new RadioComponent('s4_chain', 0, 4, presets[3].synth, function(obj){debug('s4_chain', obj._value); patcher.getnamed('synth4').message('int', obj._value+1)}, 1, 0, 1);
	chain_selector_radios = [s1_chain, s2_chain, s3_chain, s4_chain];

	super_synth = new RadioComponent('super_track', 0, 4, 0, function(obj){debug('super_track:', obj._value); update_super_track();}, 2, 3);
	multi_a = new RadioComponent('multi_a_track', 0, 4, 0, function(obj){debug('multi_a_track:', obj._value); update_multi_a_track();}, 1, 7);
	multi_b = new RadioComponent('multi_b_track', 0, 4, 1, function(obj){debug('multi_b_track:', obj._value); update_multi_b_track();}, 1, 7);

	super_bank = new OffsetComponent('super_bank', 0, 1, 0, function(obj){debug('super_bank', obj._value);update_super_device();}, 7, 0, 1);
	multi_a_bank = new OffsetComponent('multi_a_bank', 0, 1, 0, function(obj){debug('multi_a_bank', obj._value);update_multi_device();}, 6, 0, 1);
	multi_b_bank = new OffsetComponent('multi_b_bank', 0, 1, 0, function(obj){debug('multi_b_bank', obj._value);update_multi_device();}, 6, 0, 1);

	multi_a_to_super = new ParameterClass('multi_a_to_super', {'onValue':5, 'offValue':4});
	multi_a_to_super.set_target(switch_to_multi_a_super);
	multi_b_to_super = new ParameterClass('multi_b_to_super', {'onValue':5, 'offValue':4});
	multi_b_to_super.set_target(switch_to_multi_b_super);

	split_assignment = new ToggledParameter('split_assignment', {'onValue':12, 'offValue':5, 'value':0});
	split_assignment.set_target(enable_dynamic_split_assignment);
}

function setup_modes()
{

	var main_Page = new Page('Main');
	main_Page.enter_mode = function()
	{
		mod.SendDirect('receive_device', 'set_mod_device_bank', 0);
		main_Page.set_shift_button(GridButtons[3][3]);
		main_Page.update_mode();
	}
	main_Page.exit_mode = function()
	{
		s1_octave.set_inc_dec_buttons();
		s2_octave.set_inc_dec_buttons();
		s3_octave.set_inc_dec_buttons();
		s4_octave.set_inc_dec_buttons();

		s1_prog.set_inc_dec_buttons();
		s2_prog.set_inc_dec_buttons();
		s3_prog.set_inc_dec_buttons();
		s4_prog.set_inc_dec_buttons();

		main_Page.set_shift_button();
	}
	main_Page.update_mode = function()
	{
		debug('main_Page updated');
		if(main_Page._shift_button&&main_Page._shift_button.pressed())
		{
			s1_octave.set_inc_dec_buttons();
			s2_octave.set_inc_dec_buttons();
			s3_octave.set_inc_dec_buttons();
			s4_octave.set_inc_dec_buttons();

			s1_prog.set_inc_dec_buttons();
			s2_prog.set_inc_dec_buttons();
			s3_prog.set_inc_dec_buttons();
			s4_prog.set_inc_dec_buttons();
			main_modes.set_mode_buttons([GridButtons[0][3], GridButtons[1][3], GridButtons[2][3]]);
			
		}
		else
		{
			main_modes.set_mode_buttons();
			s1_octave.set_inc_dec_buttons(GridButtons[0][0], GridButtons[0][1]);
			s2_octave.set_inc_dec_buttons(GridButtons[1][0], GridButtons[1][1]);
			s3_octave.set_inc_dec_buttons(GridButtons[2][0], GridButtons[2][1]);
			s4_octave.set_inc_dec_buttons(GridButtons[3][0], GridButtons[3][1]);

			s1_prog.set_inc_dec_buttons(GridButtons[0][2], GridButtons[0][3]);
			s2_prog.set_inc_dec_buttons(GridButtons[1][2], GridButtons[1][3]);
			s3_prog.set_inc_dec_buttons(GridButtons[2][2], GridButtons[2][3]);
			s4_prog.set_inc_dec_buttons(GridButtons[3][2], undefined);
		}
	}
	main_Page._shiftValue = function(obj)
	{
		main_Page.update_mode();
	}

	var multi_Page = new Page('Multi');
	multi_Page.enter_mode = function()
	{
		mod.SendDirect('receive_device', 'set_mod_device_bank', 2);
		multi_Page.set_shift_button(GridButtons[3][3]);
		multi_Page.update_mode();
	}
	multi_Page.exit_mode = function()
	{
		multi_a_to_super.set_control();
		multi_b_to_super.set_control();
		multi_a.set_controls();
		multi_b.set_controls();
		multi_a_bank.set_inc_dec_buttons();
		multi_b_bank.set_inc_dec_buttons();
		multi_Page.set_shift_button();
	}
	multi_Page.update_mode = function()
	{
		debug('multi_Page updated');
		if(multi_Page._shift_button&&multi_Page._shift_button.pressed())
		{
			multi_a_bank.set_inc_dec_buttons();
			multi_b_bank.set_inc_dec_buttons();
			program_controls[multi_a._value].set_inc_dec_buttons();
			program_controls[multi_b._value].set_inc_dec_buttons();
			multi_a_to_super.set_control();
			multi_b_to_super.set_control();
			multi_a.set_controls(sub1);
			multi_b.set_controls(sub3);
			main_modes.set_mode_buttons([GridButtons[0][3], GridButtons[1][3], GridButtons[2][3]]);
		}
		else
		{
			multi_a_to_super.set_control(GridButtons[2][1]);
			multi_b_to_super.set_control(GridButtons[2][3]);
			multi_a.set_controls();
			multi_b.set_controls();
			main_modes.set_mode_buttons();
			multi_a_bank.set_inc_dec_buttons(GridButtons[1][1], GridButtons[0][1]);
			multi_b_bank.set_inc_dec_buttons(GridButtons[1][3], GridButtons[0][3]);
			program_controls[multi_a._value].set_inc_dec_buttons(GridButtons[0][0], GridButtons[1][0]);
			program_controls[multi_b._value].set_inc_dec_buttons(GridButtons[0][2], GridButtons[1][2]);
			octave_controls[multi_a._value].set_inc_dec_buttons(GridButtons[3][0], GridButtons[2][0]);
			octave_controls[multi_b._value].set_inc_dec_buttons(GridButtons[3][2], GridButtons[2][2]);

		}
	}
	multi_Page._shiftValue = function(obj)
	{
		multi_Page.update_mode();
	}

	var super_Page = new Page('Super');
	super_Page.enter_mode = function()
	{
		debug('entering super_Page');
		mod.SendDirect('receive_device', 'set_mod_device_bank', 1);
		super_Page.set_shift_button(GridButtons[3][3]);
		super_Page.update_mode();
	}
	super_Page.exit_mode = function()
	{
		chain_selector_radios[super_synth._value].set_controls();
		super_synth.set_controls();
		split_assignment.set_control();
		split_assignment.set_value(0);
		super_bank.set_inc_dec_buttons();
		program_controls[super_bank._value].set_inc_dec_buttons();
		octave_controls[super_bank._value].set_inc_dec_buttons();
		super_Page.set_shift_button();
	}
	super_Page.update_mode = function()
	{
		debug('super_Page updated');
		if(super_Page._shift_button&&super_Page._shift_button.pressed())
		{
			split_assignment.set_control();
			super_bank.set_inc_dec_buttons();
			program_controls[super_bank._value].set_inc_dec_buttons();
			octave_controls[super_bank._value].set_inc_dec_buttons();
			chain_selector_radios[super_synth._value].set_controls();
			super_synth.set_controls(sub1);
			main_modes.set_mode_buttons([GridButtons[0][3], GridButtons[1][3], GridButtons[2][3]]);
		}
		else
		{
			super_synth.set_controls();
			main_modes.set_mode_buttons();
			chain_selector_radios[super_synth._value].set_controls(sub1);
			split_assignment.set_control(GridButtons[2][3]);
			super_bank.set_inc_dec_buttons(GridButtons[1][3], GridButtons[0][3]);
			program_controls[super_bank._value].set_inc_dec_buttons(GridButtons[0][2], GridButtons[1][2]);
			octave_controls[super_bank._value].set_inc_dec_buttons(GridButtons[3][2], GridButtons[2][2]);
		}
	}
	super_Page._shiftValue = function(obj)
	{
		super_Page.update_mode();
	}

	main_modes = new PageStack(3, 'MainModes');
	main_modes.add_mode(0, main_Page);
	main_modes.add_mode(1, multi_Page);
	main_modes.add_mode(2, super_Page);
	main_modes.change_mode(0);
}

function setup_pset_id()
{
	if((!name_listener)||(!name_listener.id))
	{
		name_listener = new LiveAPI(name_callback, 'live_set', 'this_device');
		debug('this set id is', name_listener.id);
		name_listener.property = 'name';
	}
	device_name = name_listener.get('name').toString().split(' ');
	for(var i in device_name)
	{
		if(startsWith(device_name[i], '@id:'))
		{
			pset_id = device_name[i].split('@id:')[1];
			debug('________pset_id is:', pset_id);
			break;
		}
	}
}

function name_callback(args)
{
	debug('name_listener cb:', args[0], args[1]);
	if((args[0]=='name')&&(args[1]!=device_name))
	{
		setup_pset_id();
	}
}

function callback(){}

function track_callback(){}

function _synth(val)
{
	debug('synth:', val);
	chosen_synth = val;
	update_keysplit_display();
}

function enable_dynamic_split_assignment(obj)
{
	debug('enable_split_assignment:', obj._value);
	_synth_chooser(super_synth._value, obj._value);
}

function _synth_chooser(num, val)
{
	debug('synth_chooser', num, val);
	if(val)
	{
		synth_tab.message('int', num);
		dynamic_assign = true;
		dynamic_gate.message('int', 1);
	}
	else
	{
		dynamic_assign = false;
		dynamic_gate.message('int', 0);
		dyn1 = -1;
		dyn2 = -1;
	}
}

function _change(track, synth, lo, hi, atouch, program)
{
	var old_preset = presets[track];
	var do_keysplit_update = (old_preset.hi!=hi)||(old_preset.lo!=lo);
	var do_device_update = presets[track].synth != synth;
	presets[track] = {'synth':synth, 'lo':lo, 'hi':hi, 'atouch':atouch, 'program':program};
	if(do_device_update&&chain_selectors[track]!=undefined)
	{
		chain_selectors[track].set('value', synth-1);
	}
	if(track == super_synth._value){super_bank._value = 0;}
	if(track == multi_a._value){multi_a_bank._value = 0;}
	if(track == multi_b._value){multi_b_bank._value = 0;}
	do_keysplit_update&&update_keysplit_display();
	do_device_update&&update_device();
}

function update_keysplit_display()
{
	for(var i=0;i<4;i++)
	{
		ksliders[i].message('clear');
		if(chosen_synth == i||chosen_synth == 4)
		{
			var lo = presets[i].lo;
			var hi = presets[i].hi;
			for(var note=lo;note<hi;note++)
			{
				ksliders[i].message('int', note);
			}
		}
	}
}

function update_device()
{
	debug('update_device', main_modes.current_mode());
	switch(main_modes.current_mode())
	{
		case 0: 
			update_main_device();
			break;
		case 1:
			update_multi_device();
			break;
		case 2:
			update_super_device();
			break;
	}
}

function update_super_track()
{
	super_bank._value = 0;
	super_bank._max = Math.floor((synth_param_ids[super_synth._value][presets[super_synth._value].synth-1].length)/16);
	debug('super_bank._max = ', super_bank._max );
	update_super_device();
	(main_modes.current_mode() == 2)&&(main_modes.restore_mode())
	
}

function update_multi_a_track()
{
	multi_a_bank._value = 0;
	multi_a_bank._max = Math.floor((synth_param_ids[multi_a._value][presets[multi_a._value].synth-1].length)/8);
	debug('multi_a_bank._max = ', multi_a_bank._max );
	update_multi_device();
	(main_modes.current_mode() == 1)&&(main_modes.restore_mode())
	
}

function update_multi_b_track()
{
	//multi_b_bank.set_value(0);
	multi_b_bank._value = 0;
	multi_b_bank._max = Math.floor((synth_param_ids[multi_b._value][presets[multi_b._value].synth-1].length)/8);
	update_multi_device();
	(main_modes.current_mode() == 1)&&(main_modes.restore_mode())
}

function switch_to_multi_a_super()
{
	super_synth._value = multi_a._value;
	super_bank = Math.floor(multi_a_bank._value/2);
	main_modes.change_mode(2, true);
}

function switch_to_multi_b_super()
{
	super_synth._value = multi_b._value;
	super_bank = Math.floor(multi_b_bank._value/2);
	main_modes.change_mode(2, true);
}

function update_main_device()
{
	debug('update_main_device');
	for(var i=0;i<4;i++)
	{
		//finder.id = Math.floor(synth_tracks[i].id);
		//finder.goto('devices', 0, 'chains', 1, 'devices', 0, 'parameters', 1);
		//debug('SYNTH', i, 'PRM id:', finder.id);
		mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', i+40, 'id', synth_param_ids[i][presets[i].synth-1][1]);
	}
}

function update_multi_device()
{
	debug('update_multi_device');
	var a_ids = synth_param_ids[multi_a._value][presets[multi_a._value].synth-1].slice(1+(multi_a_bank._value*8), (multi_a_bank._value*8)+9);
	var b_ids = synth_param_ids[multi_b._value][presets[multi_b._value].synth-1].slice(1+(multi_b_bank._value*8), (multi_b_bank._value*8)+9);
	for(var i=0;i<8;i++)
	{
		mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', i+16, 'id', a_ids[i] ? a_ids[i] : 0);
		mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', i+24, 'id', b_ids[i] ? b_ids[i] : 0, i == 7 ? 1 : 0);
	}
}

function update_super_device()
{
	debug('update_super_device');
	var ids = synth_param_ids[super_synth._value][presets[super_synth._value].synth-1].slice(1+(super_bank._value*16), (super_bank._value*16)+17);
	debug('super ids:', ids);
	for(var i=0;i<16;i++)
	{
			//debug('setting super id:', i,  ids[i] ? ids[i] : 0);
			mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', i, 'id', ids[i] ? ids[i] : 0, i == 15 ? 1 : 0);
	}
	//var raw_ids = raw_synth_param_ids.splice(super_bank*32, (super_bank*32)+32);
	//mod.Send('send_explicit', 'receive_device', 'set_custom_parameters', 0, raw_ids);
}

function anything(){}

function _dynamic_assign_input(note, vel)
{
	if((vel > 0)&&(dynamic_assign))
	{
		debug('dynamic_assign_input', note, vel);
		if(dyn1>-1)
		{
			dyn2 = note;
			this.patcher.getnamed('hi'+(chosen_synth+1)).message('int', dyn2);
		}
		else
		{
			dyn1 = note;
			this.patcher.getnamed('lo'+(chosen_synth+1)).message('int', dyn1);
		}
	}
}

function synth_name(num, text, name)
{
	debug('synth_name:', num, text, name);
	synth_track_names[num] = name;
	Alive&&detect_synth_tracks();
}

function detect_synth_tracks()
{
	if((!finder)||(!finder.id))
	{
		finder = new LiveAPI(callback, 'live_set');
		debug('this set id is', finder.id);
	}
	if(finder.id!==0)
	{
		finder.goto('live_set');
		var track_ids = finder.get('tracks');
		for(var i in track_ids)
		{
			if(track_ids[i] == 'id')
			{
				delete track_ids[i];
			}
		}
		//debug('tracks are:', track_ids);
		for(var i in track_ids)
		{
			finder.id = parseInt(track_ids[i]);
			var name = finder.get('name');
			//debug('new finder id is:', finder.id, 'name:', finder.get('name'));
			for(var index in synth_track_names)
			{
				if(name == synth_track_names[index])
				{
					debug('found synth track', index);
					if(!synth_tracks[index])
					{
						synth_tracks[index] = new LiveAPI(track_callback, 'live_set');
					}
					synth_tracks[index].id = parseInt(track_ids[i]);
					//debug(synth_tracks[index].get('devices'));
					if(!chain_selectors[index])
					{
						chain_selectors[index] = new LiveAPI(track_callback, 'live_set');
					}
					chain_selectors[index].id = parseInt(track_ids[i]);
					chain_selectors[index].goto('devices', 0, 'parameters', 1);

					
					finder.goto('mixer_device', 'volume');
					debug('volume id is:', finder.id);
					mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', (Math.floor(index)+32), 'id', Math.floor(finder.id));
					finder.goto('canonical_parent');
					finder.goto('sends', 0);
					debug('send id is:', finder.id);
					mod.Send('send_explicit', 'receive_device', 'set_custom_parameter', (Math.floor(index)+36), 'id', Math.floor(finder.id));

					//debug('chain selector name:', chain_selectors[index].get('name'));

					for(var i=0;i<4;i++)
					{
						finder.id = parseInt(synth_tracks[index].id);
						finder.goto('devices', 0, 'chains', i, 'devices', 0);
						//debug('s'+(index), 'chain:', i, 'paramters:', finder.get('parameters'));
						synth_param_ids[index][i] = finder.get('parameters').filter(function(element){return element !== 'id';})//.splice(1,-1);
						raw_synth_param_ids[index][i] = finder.get('parameters');
						//debug('just added:', synth_param_ids[index][i]);
					}
					break;
				}
			}
		}
	}
}


function make_send_func()
{
	var args = arrayfromargs(arguments);
	if(args.length == 4)
	{
		var func = function(value)
		{
			//debug('value:', args, value);
			//debug('args:', args, args instanceof Array);
			mod.Send(args[0], args[1], args[2], args[3], value);
		}
	}
	else
	{
		var func = function(value)
		{
			debug('value:', args, value);
			mod.Send(args[0], args[1], args[2], value);
		}
	}
	return func;
}

function make_gui_send_function(patcher_object, message_header)
{
	if(message_header.length == 2)
	{
		var func = function(value)
		{
			//value = value==undefined ? 0 : value;
			//var message = message_header.push(value);
			//debug('sending gui button:', 'header is:', message_header, 'value is:', value, 'message is:', [message_header[0], message_header[1], value]);
			//#message = message_header.concat([value]);
			patcher_object.message.apply(patcher_object, [message_header[0], message_header[1], value]);
		}
	}
	return func;
}


function octave_component()
{
	var self = this;
	this.add_bound_properties(this, ['update', 'assign_grid', 'assign_gui_pad', 'assign_gui_keys']);
	HexModule.super_.call(this, 'HexModule');
}

function sc_pset(num, val)
{
	debug('receive sc_pset', num, val);
	if(num==pset_id)
	{
		debug('updating preset to:', val);
		script.patcher.getnamed('preset_number').message(Math.floor(val));
	}

}

function sub_preset(val)
{
	debug('sub_preset', val);
	current_sub = val;
	this.patcher.getnamed('sub_preset_tab').message('set', current_sub);
	var sub = Math.floor((current_preset*5)+(current_sub))
	if(storage!=undefined)
	{
		for(var i=1;i<5;i++)
		{
			storage.message('recall', 'lo'+i, sub);
			storage.message('recall', 'hi'+i, sub);
			storage.message('recall', 'touch'+i, sub);
		}
	}
}

function preset(val)
{
	debug('preset:', val);
	//storage.message(val);
	if(val!='bang')
	{
		current_preset = val;
		debug('current preset is now:', current_preset);
		if(storage!=undefined)
		{
			debug('we have a storage handle, proceeding...');
			storage.message('recall', current_preset*5);
			this.patcher.getnamed('sub_preset_tab').message('int', 0);
		}
	}
	else
	{
		//storage.message('store', current_preset*5);
		var sub = Math.floor((current_preset*5)+(current_sub))
		if(storage!=undefined)
		{
			for(var i=1;i<5;i++)
			{
				storage.message('store', 'synth'+i, current_preset*5);
				storage.message('store', 'prog'+i, current_preset*5);
				storage.message('store', 'lo'+i, sub);
				storage.message('store', 'hi'+i, sub);
				storage.message('store', 'touch'+i, sub);
			}
		}
	}
}

function preset_dump()
{
	var args = arrayfromargs(arguments);
	debug('preset_dump:', args);
}

forceload(this);