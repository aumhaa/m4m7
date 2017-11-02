autowatch = 1; 


inlets = 1;
outlets = 2;

var script = this;

script._name = 'skin';

aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

ROLI = require('ROLI');

var SHOW_STORAGE = false;
var DISPLAY_POLY = false;
var BLOCKS_ENABLE = false;
var GRID_ENABLE = false;
var SUPPRESS_BLOCK = true;

var finder;
var mod;
var found_mod;
var mod_finder;
var Mod = ModComponent.bind(script);
var ModProxy = ModProxyComponent.bind(script);

var unique = jsarguments[1];
var ctrlr_type = jsarguments[2];
var topDict = new Dict('topology');
var cellDict = new Dict('cell_dict');
//var pushDict = new Dict('push_dict');
var topKeys = [];
var topology = {};
var cells = [];
var pads = [];
var miraPads = [];
var miraKeys = [];
var miraShift, miraAlt;
var KEYCOLORS = [];
var PALETTE = ROLI.PALETTE;
var pos_fix = [0, .13333, .26666, .4, .5, .63333, .76666, .9];
var current_pset = 1;
var assign_mode = false;
var follow_mode = false;
var mod_assign_mode = false;
var chord_assign_mode = false;
var blocks_page_visible = false;
var drumrack_id = 0;
var this_device_id = -1;
var current_device;
var current_chords = [[], [], [], []];
var dirty = false;
//var storageTask;
var inputPort = undefined;
var outputPort = undefined;
var miraEnable = false;
var miraGridPane, miraZonePane, miraDevicePane;
var Alive = false;

var PRS_DLY = 300;
var colors = {OFF : 0, WHITE : 1, YELLOW : 2, CYAN : 3, MAGENTA : 4, RED : 5, GREEN : 6, BLUE : 7};
var PushColors = {OFF : 0, WHITE : 1, YELLOW : 2, CYAN : 3, MAGENTA : 4, RED : 5, GREEN : 6, BLUE : 7};

var Vars = ['main_note_input', 'input_mode', 'thru_channel', 'output_port', 'input_port', 'storage_text', 'storage_menu', 
			'assignments', 'matrix', 'push_notes', 'storage', 'preset', 'poly', 'Mask', 'midiInputGate', 'info_pcontrol', 'info_patcher', 
			'blocks_pad', 'blocks_pcontrol', 'blocks_patcher', 'skin_settings_pcontrol', 'skin_settings', 'mira_grid', 'mira_grid_pcontrol'];

var EditorVars = ['selected_layer_tab', 'mod_sustain', 'target_device', 'target_device_reset', 'main_port', 'main_mono', 'main_clear', 'mod_release', 'settings_thispatcher',
			'settings_position', 'toggle_note', 'chord_assignment', 'chord_enable', 'chord_channel', 'selected', 'color', 'Mask', 'remote_name', 
			'remote_enable', 'remote_scale_lo', 'remote_scale_hi', 'remote_scale_exp',  'cc_id', 'cc_enable', 'cc_scale_lo', 'cc_scale_hi', 'cc_scale_exp', 'cc_channel',
			'mod_target', 'mod_target_assignment', 'breakpoint', 'breakpoint_obj', 'assign_mode', 'follow_mode', 'modify_mode', 'panel[0]', 'panel[1]', 'panel[2]', 
			'panel[3]', 'panel[4]', 'panel[5]', 'cc_port', 'modify_target', 'slider', 'kslider_offset_display', 'thru'];

//'note', 'mod_A', 'mod_B', 'mod_C', 'note_enable', 'modA_enable', 'modB_enable', 'modC_enable', 

var SKIN_BANKS = {'InstrumentGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'DrumGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'MidiEffectGroupDevice':[['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'Macro 5', 'Macro 6', 'Macro 7', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Macro 1', 'Macro 2', 'Macro 3', 'Macro 4', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'Other':[['None', 'None', 'None', 'None', 'None', 'None', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['None', 'None', 'None', 'None', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']],
			'Operator':[['Osc-A Level', 'Osc-B Level', 'Osc-C Level', 'Osc-D Level', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Osc-A Level', 'Osc-B Level', 'Osc-C Level', 'Osc-D Level', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'UltraAnalog':[['AEG1 Attack', 'AEG1 Decay', 'AEG1 Sustain', 'AEG1 Rel', 'OSC1 Semi', 'F1 Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['AEG1 Attack', 'AEG1 Decay', 'AEG1 Sustain', 'AEG1 Rel', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'OriginalSimpler':[['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'MultiSampler':[['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'Transpose', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Ve Attack', 'Ve Decay', 'Ve Sustain', 'Ve Release', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'LoungeLizard':[['M Force', 'F Release', 'F Tone Decay', 'F Tone Vol', 'Semitone', 'P Distance', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['M Force', 'F Release', 'F Tone Decay', 'F Tone Vol', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'StringStudio':[['E Pos', 'Exc ForceMassProt', 'Exc FricStiff', 'Exc Velocity', 'Semitone', 'Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['E Pos', 'Exc ForceMassProt', 'Exc FricStiff', 'Exc Velocity', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'Collision':[['Noise Attack', 'Noise Decay', 'Noise Sustain', 'Noise Release', 'Res 1 Tune', 'Res 1 Brightness', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['Noise Attack', 'Noise Decay', 'Noise Sustain', 'Noise Release', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'InstrumentImpulse':[['1 Start', '1 Envelope Decay', '1 Stretch Factor', 'Global Time', 'Global Transpose', '1 Filter Freq', 'None', 'Mod_Chain_Vol', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['1 Start', '1 Envelope Decay', '1 Stretch Factor', 'Global Time', 'ModDevice_PolyOffset', 'ModDevice_Mode', 'ModDevice_Speed', 'Mod_Chain_Vol', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']], 
			'NoDevice':[['None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'ModDevice_selected', 'ModDevice_note', 'ModDevice_mod_A', 'ModDevice_mod_B', 'ModDevice_mod_C', 'ModDevice_color', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1'], ['None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'ModDevice_Channel', 'ModDevice_Groove', 'ModDevice_Random', 'ModDevice_BaseTime', 'Mod_Chain_Send_0', 'Mod_Chain_Send_1', 'Mod_Chain_Send_2', 'Mod_Chain_Send_3']]}


var DEFAULT_FOLLOW = 1;

var glob = new Global('skin_global');


function anything()
{
	debug('anything:', messagename, arrayfromargs(arguments));
}



function init()
{
	mod = new ModProxy(script, ['Send', 'SendDirect', 'restart']);
	found_mod = new Mod(script, 'skin', unique, false);
	//mod.debug = debug;
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	found_mod.assign_api(mod_finder);


	debug('skin init.');
	//debug('dict keys:', cellDict.getkeys());
	//outlet(1, 'clear');
	//outlet(1, 'repaint');
	setup_tasks();
	setup_translations();
	setup_colors();
	setup_patchers();
	setup_controls();
	setup_device();
	setup_zonesettingsmodule();
	setup_skinmodule();
	setup_modmatrix();
	setup_scalesmodule();
	setup_external_chord_assigner();
	setup_modes();
	setup_track_input_component();
	setup_listeners();
	setup_storage();
	setup_ports();
	setup_global_link();
	deprivatize_script_functions(this);
	blocks_patcher_lock();
	settings_patcher_lock();
	Device.update_remote_targets();
	ZoneSettings.select_voice({'_value':1});
	MainModes.push_mode(0);
	MainModes.change_mode(0);
	storage.message('getslotnamelist');
	_storage_in('recall');
	Alive = true;
	//setup_mira_interface();
	_update_topology();
	if(SHOW_STORAGE)
	{
		storage.message('clientwindow');
		storage.message('storagewindow');
	}
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
	mod = found_mod;
}

function setup_translations(){}

function setup_colors()
{
	/*var d = new Dict('colors');
	var new_colors = [];
	var keys = d.getkeys();
	for(var i in keys)
	{
		var ar = d.get(keys[i]);
		debug(ar);
		new_colors.push([ar.get('red')/255, ar.get('green')/255, ar.get('blue')/255]);
	}
	PALETTE = new_colors;*/
	PALETTE[0] = PALETTE[0];
	PALETTE[1] = PALETTE[120];
	PALETTE[2] = PALETTE[30];
	PALETTE[3] = PALETTE[12];
	PALETTE[4] = PALETTE[20]
	PALETTE[5] = PALETTE[65];
	PALETTE[7] = PALETTE[11];
	PALETTE[8] = PALETTE[125];
	PALETTE[127] = PALETTE[125];
}

function setup_patchers()
{
	
	for(var i in Vars)
	{
		script[Vars[i]] = this.patcher.getnamed(Vars[i]);
		//debug('Vars:', i, Vars[i], script[Vars[i]]);
	}
	for(var i in EditorVars)
	{
		script[EditorVars[i]] = this.patcher.getnamed('skin_settings').subpatcher().getnamed(EditorVars[i]);
		//debug('EditorVars:', i, EditorVars[i], script[EditorVars[i]]);
	}
	pads = [];
	for(var i = 0;i < 64;i++)
	{
		pads[i] = new ZoneClass(i+1, this.patcher.getnamed('poly').subpatcher(i), 'Zone_'+i);
	}
	for(var i = 0;i < 64;i++)
	{
		miraPads[i] = this.patcher.getnamed('mira_grid').subpatcher().getnamed('cell['+i+']');
	}
	for(var i = 0;i < 8;i++)
	{
		miraKeys[i] = this.patcher.getnamed('mira_grid').subpatcher().getnamed('key['+i+']');
	}
	miraShift = this.patcher.getnamed('mira_grid').subpatcher().getnamed('shift');
	miraAlt = this.patcher.getnamed('mira_grid').subpatcher().getnamed('alt');
	//for(var i=0;i<64;i++)
	//{
	//	KEYCOLORS[i] = pads[i]._color.getvalueof();
	//}
	//tasks.addTask(_update_topology, [], 4);
}
	
function setup_controls()
{

	script['GridControlRegistry'] = new ControlRegistry('GridRegistry');
	script['KeysControlRegistry'] = new ControlRegistry('KeysRegistry');
	script['cells'] = [];
	script['raw_cells'] = [];
	script['KeyButtons'] = [];
	script['Grid'] = new GridClass(8, 8, 'Grid');
	script['Keys'] = new GridClass(8, 1, 'Keys');
	script['ShiftButton'] = new ButtonClass('shift', 'Shift', function(){});
	script['AltButton'] = new ButtonClass('alt', 'Alt', function(){});

	script['miraGrid'] = new MiraGridComponent('miraGrid', {'cells':miraPads, 'keys':miraKeys, 'shift':miraShift, 'alt':miraAlt});
	script['miraGridOutput'] = miraGrid._button_press;
	script['miraKeyOutput'] = miraGrid._key_press;
	script['miraShiftOutput'] = miraGrid._shift_press;
	script['miraAltOutput'] = miraGrid._alt_press;

	var make_send_func = function()
	{
		var args = arrayfromargs(arguments);
		if(args.length == 4)
		{
			var func = function(value, suppress_block)
			{
				//debug('send:', value, suppress_block, !suppress_block);
				//debug('sending:', args[0], args[1], args[2], args[3], value);
				mod.Send(args[0], args[1], args[2], args[3], value);
				var COLOR = PALETTE[value<0?0:value];
				if(!suppress_block)
				{
					outlet(1, "rectangle", pos_fix[args[2]], pos_fix[args[3]], .1, .1);
					outlet(1, "setcolor", 0, 0, 0, 1);
					outlet(1, "setcolor", COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .3));
					outlet(1, "fill");
					outlet(1, "append");
				}
				//debug('miraPad:', args[2] + (args[3]*8), 'bgcolor', COLOR[0], COLOR[1], COLOR[2], COLOR[3]);
				miraPads[args[2] + (args[3]*8)].message('bgcolor', COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .3));
			}
		}
		else
		{
			var func = function(value)
			{
				//debug('value:', args, value);
				mod.Send(args[0], args[1], args[2], value);
				var COLOR = PALETTE[value<0?0:value];
				//debug('color:', (value<0)||(value>8)?0:value, COLOR)
				miraKeys[args[2]].message('bgcolor', COLOR[0], COLOR[1], COLOR[2], 1);
			}
		}
		return func;
	}

	for(var x=0;x<8;x++)
	{
		cells[x] = [];
		for(var y=0;y<8;y++)
		{
			var id = x+(y*8);
			cells[x][y] = new CellClass(x, y, id, 'Cell_'+id, make_send_func('grid', 'value', x, y));
			raw_cells.push(cells[x][y]);
			GridControlRegistry.register_control(id, cells[x][y]);
			Grid.add_control(x, y, cells[x][y]);
		}
	}

	for(var id=0;id<8;id++)
	{
		KeyButtons[id] = new ButtonClass(id, 'Key_'+id, make_send_func('key', 'value', id));
		KeysControlRegistry.register_control(id, KeyButtons[id]);
		Keys.add_control(id, 0, KeyButtons[id]);
	}

	script['_grid'] = function(x, y, val){GridControlRegistry.receive(x+(y*8), val);}
 	script['_key'] = function(num, val){KeysControlRegistry.receive(num, val);}
	script['_shift'] = function(val){ShiftButton.receive(val);}
	script['_alt'] = function(val){AltButton.receive(val);}
}

function setup_device()
{
	script['Device'] = new DeviceModule('DeviceComponent', {'finder':new LiveAPI(function(){}, 'this_device')});
}

function setup_tasks()
{
	script['tasks'] = new TaskServer(script, 150);
}

function setup_zonesettingsmodule()
{
	script['ZoneSettings'] = new ZoneSettingsModule();
}

function setup_skinmodule()
{
	script['Skin'] = new SkinModule();
	Skin._assign_mode.add_listener(update_input_gate);
}

function setup_modmatrix()
{
	script['ModMatrix'] = new ModifierMatrixModule();
}

function setup_scalesmodule()
{
	script['Scales'] = new ScalesModule();
}

function setup_external_chord_assigner()
{
	script['chordAssigner'] = new ExternalChordAssigner('ChordAssigner');
}

function setup_modes()
{
	//Page 1:  mainPage
	mainPage = new ModeSwitchablePage('mainPage');
	mainPage.enter_mode = function()
	{
		debug('mainPage entered');
		Skin.assign_grid(Grid);
		Skin._assign_mode.set_control(KeyButtons[0]);
		Skin._modify_mode.set_control(KeyButtons[1]);
		Skin._follow_mode.set_control(KeyButtons[2]);
		mainPage.set_shift_button(AltButton);
		mainPage.set_alt_button(ShiftButton);

	}
	mainPage.exit_mode = function()
	{
		Skin.assign_grid();
		Skin._assign_mode.set_control();
		Skin._follow_mode.set_control();
		ZoneSettings._chord_gate.set_control();
		ZoneSettings._chord_modA_gate.set_control();
		ZoneSettings._chord_modB_gate.set_control();
		ZoneSettings._chord_modC_gate.set_control();
		mainPage.set_alt_button();
		mainPage.set_shift_button();
		debug('mainPage exited');
	}
	mainPage.update_mode = function()
	{
		debug('mainPage updated');
		if(mainPage._shifted)
		{
			Skin._assign_mode.set_control();
			Skin._follow_mode.set_control();
			Skin._modify_mode.set_control();
			ZoneSettings._main_mono.set_control(KeyButtons[0]);
			ZoneSettings._modA_mono.set_control(KeyButtons[1]);
			ZoneSettings._modB_mono.set_control(KeyButtons[2]);
			ZoneSettings._modC_mono.set_control(KeyButtons[3]);
		}
		else if(mainPage._alted)
		{
			debug('mainPage._alted');
			Skin.assign_grid();
			Skin._assign_mode.set_control();
			Skin._follow_mode.set_control();
			Skin._modify_mode.set_control();
			ZoneSettings._chord_gate.set_control(KeyButtons[0]);
			ZoneSettings._chord_modA_gate.set_control(KeyButtons[1]);
			ZoneSettings._chord_modB_gate.set_control(KeyButtons[2]);
			ZoneSettings._chord_modC_gate.set_control(KeyButtons[3]);
			ZoneSettings._selected_zone.set_controls(Grid);
		}
		else if(mainPage._moded)
		{
			debug('mainPage is moded');
			Skin._transform_mode.receive(1);
		}
		else
		{
			ZoneSettings._chord_gate.set_control();
			ZoneSettings._chord_modA_gate.set_control();
			ZoneSettings._chord_modB_gate.set_control();
			ZoneSettings._chord_modC_gate.set_control();
			ZoneSettings._main_mono.set_control();
			ZoneSettings._modA_mono.set_control();
			ZoneSettings._modB_mono.set_control();
			ZoneSettings._modC_mono.set_control();
			Skin._transform_mode.receive(0);
			ZoneSettings._selected_zone.set_controls();
			Skin.assign_grid(Grid);
			Skin._assign_mode.set_control(KeyButtons[0]);
			Skin._modify_mode.set_control(KeyButtons[1]);
			Skin._follow_mode.set_control(KeyButtons[2]);
		}
	}

	//Page 2:  chordPage
	chordPage = new ModeSwitchablePage('chordPage');
	chordPage.enter_mode = function()
	{
		debug('chordPage entered');
		chordPage.set_shift_button(ShiftButton);
		chordPage.set_alt_button(AltButton);
		Scales._outputChooser.set_controls([KeyButtons[0], KeyButtons[1], KeyButtons[2], KeyButtons[3]]);
		Scales._assignMode.set_control(KeyButtons[7]);
		Scales.assign_grid(Grid);
	}
	chordPage.exit_mode = function()
	{
		Scales.assign_grid();
		Scales._noteOffset.set_inc_dec_buttons();
		Scales._octaveOffset.set_inc_dec_buttons();
		Scales._outputChooser.set_controls();
		chordPage.set_shift_button();
		chordPage.set_alt_button();
		debug('chordPage exited');
	}
	chordPage.update_mode = function()
	{
		debug('chordPage updated');
		if(chordPage._shifted)
		{
			chordPage.set_alt_button();
			Scales._outputChooser.set_controls();
			Scales._noteOffset.set_inc_dec_buttons(KeyButtons[0], KeyButtons[1]);
			Scales._octaveOffset.set_inc_dec_buttons(KeyButtons[2], KeyButtons[3]);
			//Scales._scaleOffset.set_inc_dec_buttons();
			//Scales._noteOffset.set_inc_dec_buttons();
		}
		else if(chordPage._alted)
		{
			debug('setting alted controls');
			chordPage.set_shift_button();
			Scales._outputChooser.set_controls();
			Scales.assign_grid();
			ZoneSettings._selected_zone.set_controls(Grid);
			ZoneSettings._main_mono.set_control(KeyButtons[0]);
			ZoneSettings._modA_mono.set_control(KeyButtons[1]);
			ZoneSettings._modB_mono.set_control(KeyButtons[2]);
			ZoneSettings._modC_mono.set_control(KeyButtons[3]);
		}
		else if(chordPage._moded)
		{
			debug('chordPage is moded');
		}
		else
		{
			ZoneSettings._selected_zone.set_controls();
			Scales._assignMode.receive(0);
			chordPage.set_shift_button(ShiftButton);
			chordPage.set_alt_button(AltButton);
			Scales._noteOffset.set_inc_dec_buttons();
			Scales._octaveOffset.set_inc_dec_buttons();
			ZoneSettings._main_mono.set_control();
			ZoneSettings._modA_mono.set_control();
			ZoneSettings._modB_mono.set_control();
			ZoneSettings._modC_mono.set_control();
			Scales._outputChooser.set_controls([KeyButtons[0], KeyButtons[1], KeyButtons[2], KeyButtons[3]]);
			Scales.assign_grid(Grid);
			//Scales._scaleOffset.set_inc_dec_buttons();
			//Scales._noteOffset.set_inc_dec_buttons();
		}
	}

	//Page 3:  modPage
	modPage = new ModeSwitchablePage('modPage');
	modPage.enter_mode = function()
	{
		debug('modPage entered');
		modPage.set_shift_button(ShiftButton);
		modPage.set_alt_button(AltButton);
		ModMatrix.assign_grid(Grid);
	}
	modPage.exit_mode = function()
	{
		modPage.set_shift_button();
		modPage.set_alt_button();
		ModMatrix.assign_grid();
		debug('modPage exited');
	}
	modPage.update_mode = function()
	{
		debug('modPage updated');
		if(modPage._shifted)
		{

		}
		else if(mainPage._alted)
		{
		}
		else if(mainPage._moded)
		{
			debug('mainPage is moded');
		}
		else
		{

		}
	}

	script["MainModes"] = new PageStack(3, 'Main Modes', {'behaviour':DefaultPageStackBehaviourWithModeShift});
	MainModes.add_mode(0, mainPage);
	MainModes.add_mode(1, chordPage);
	MainModes.add_mode(2, modPage);
	//MainModes.add_mode(3, seqPage);
	MainModes.set_mode_buttons([KeyButtons[4], KeyButtons[5], KeyButtons[6]]);
}

function setup_track_input_component()
{
	output_port.message('bang');
	script['InputSource'] = new TrackInputSourceComponent('InputSourceComponent', {'apiProperty':'current_input_routing'});
	//debug('_apiProperty:', InputSource._apiProperty);
}

function setup_listeners()
{
	MainModes.add_listener(update_input_gate);
	ZoneSettings._selected_zone.add_listener(ModMatrix.update);
}

function setup_storage()
{
	tasks.addTask(update_preset, [], 2, true, 'update_preset');
}

function setup_ports()
{
	input_port.message('symbol', 'Ableton Push 2 Live Port');
	output_port.message('symbol', 'IAC Bus Bus 1');
}

function setup_global_link()
{
	debug('setup_global_link');
	glob.skin = script;
	//debug('here');
	if(glob.skin_editor)
	{
		//debug(glob.skin_editor);
		//glob.skin_editor.debug('skin calling editor.');
	}
	script['SkinEditor'] = new SkinEditorComponent('SkinEditor');
	//debug('done with link');
}

function setup_mira_interface()
{
	debug('setup_mira_interface');
	messnamed(unique+'mira_enable', miraEnable);
}

function active_handlers()
{
	var args = arrayfromargs(arguments);
	debug('active_handlers:', args);
	var controlling = false;
	for(var i in args)
	{
		if((args[i]=='AumPush2ModHandler')||(args[i]=='DefaultModHandler')||(args[i]=='MonoBlocksModHandler'))
		{
			controlling = true;
		}
	}
	set_input_gate(controlling);
}


function input(val)
{
	inputPort = val;
}

function output(val)
{
	debug('output:', val);
	outputPort = val;
	Alive&&InputSource.update();
}

function update_input_gate()
{
	var enabled = (MainModes._value == 0) && (Skin._assign_mode._value == 0);// && (controlling);
	//debug('update_input_gate:', enabled);
	set_input_gate(enabled);
}

function set_input_gate(val)
{
	//debug('set_input_gate', val);
	if(midiInputGate)
	{
		midiInputGate.message('int',  val);
	}
}


function skin_pset(val)
{
	debug('skin_pset received in skin.js:', val);
	preset.message(val+1);
}

function _storage_in()
{
	var args = arrayfromargs(arguments);
	switch(args[0])
	{
		case 'recall':
			debug('recall:', args);
			if(!args[1])
			{
				storage.message('recall', 1);
			}
			else
			{
				args[1] = args[1] ? args[1] : 1;
				current_pset = args[1];
				ZoneSettings._pset = current_pset;
				for(var i in pads)
				{
					pads[i].clear_cells();
				}
				for(var i in raw_cells)
				{
					raw_cells[i].update_group_assignment();
				}
				for(var i in pads)
				{
					pads[i].reassign_color();
				}
				storage_menu.message('set', current_pset-1);
				ZoneSettings.select_voice({'_value':ZoneSettings._poly_index});
				ModMatrix.update();
			}
			break;
		case 'text':
			args.shift();
			var name = args.join(' ');
			debug('create_preset:', name);
			storage.message('insert', 1);
			storage.message('slotname', 1, name);
			storage_text.message('clear');
			storage.message('getslotnamelist');
			break;
		case 'menu':
			debug('storage menu:', args);
			storage.message(args[1]+1);
			break;
		case 'slotname':
			debug('slotname:', args);
			if(args[1]==0)
			{
				storage_menu.message('clear');
			}
			else if(args[1]=='done')
			{
				break;
			}
			else
			{
				args.splice(0,2);
				args.unshift('append');
				storage_menu.message(args);
			}
			break;
		default:
			debug('storage: default:', args);
			break;
	}
}

function dirtyStorage()
{
	dirty = true;
	tasks.resetTask('update_preset');
	//debug('setting dirty');
}

function update_preset()
{
	//debug('update_preset');
	if(dirty)
	{
		//debug('updating storage...');
		dirty = false;
		storage.message('store', current_pset);
		//debug('storage updated.');
	}
}



var target_keys = {2:'_toggle_note', 4:'_mod_sustain', 5:'_mask', 6:'_selected_zone', 7:'_color', 9:'_remote_enable', 10:'_remote_scale_lo', 11:'_remote_scale_hi', 12:'_remote_scale_exp', 
				13:'_cc_enable', 14:'_cc_id', 15:'_cc_scale_lo', 16:'_cc_scale_hi', 17:'_cc_scale_exp', 21: '_activeLayer', 22:'_editor_channel', 23:'_editor_gate', 24:'_editor_chord',
				27:'_editor_port', 25:'_editor_mono', 26:'_editor_clear', 41:'_modify_target', 42:'_cc_port', 44:'_cc_channel'};
				//0:'_note_id', 1:'_note_gate', 2:'_modA_id', 3:'_modA_gate', 4:'_modB_id', 5:'_modB_gate', 6:'_modC_id', 7:'_modC_gate',


function _mod_assign(num, val, extra)
{
	//debug('mod_assign', num, val);
	var current_edit = ZoneSettings._poly_index;
	var pad = ZoneSettings.current_edit();
	if(current_edit)
	{
		switch(num)
		{
			default:
				//debug('default', num, val, extra);
				//debug('target_key:', target_keys[num]);
				ZoneSettings[target_keys[num]].receive(val, extra);
				dirtyStorage();
				break;
			case 0:
				var args = arrayfromargs(arguments);
				debug('settings_position', args.slice(-4));
				settings_position.message(args.slice(-4));
				break;
			case 1:
				debug('r chordAssigner', val, extra);
				var args = arrayfromargs(arguments);
				chordAssigner.receive(args);
				break;
			case 3:
				//debug('set_scale');
				Scales._scaleOffset.set_value(Math.floor(val));
				debug('new scale is:', Scales.SCALENAMES[Scales._scaleOffset._value]);
				break;
			case 8:
				debug('set_remote_id');
				Device.select_parameter(current_edit);
				remote_name.message('set', Device.parameter_name_from_id(pad._remote_id.getvalueof()));
				break;
			case 18:
				debug('modifier_target_assignment:', val);
				pad._modifier_assignments.message('list', mod_target.getvalueof(), 0, val);
				ModMatrix.update();
				break;
			case 19:
				debug('modifier_target:', val);
				pad.update_mod_assignments();
				mod_target_assignment.message('set', pad._mod_assigns[val]);
				//ModMatrix.update();
				break;
			case 20:
				debug('clear_remote_id');
				Device.clear_parameter(current_edit);
				break;
			case 28:
				debug('set_parameter0');
				break;
			case 29:
				debug('set_parameter1');
				break;
			case 30:
				debug('set_parameter2');
				break;
			case 31:
				debug('set_parameter3');
				break;
			case 32:
				debug('set_parameter4');
				break;
			case 33:
				debug('set_parameter5');
				break;
			case 34:
				debug('set_parameter6');
				break;
			case 35:
				debug('set_parameter7');
				break;
			case 36:
				debug('set_device_target');
				//Device.select_parameter(current_edit);
				//remote_name.message('text', Device.parameter_name_from_id(pad._remote_id.getvalueof()));
				break;
			case 37:
				debug('clear_device_target');
				//Device.clear_parameter(current_edit);
				break;
			case 38:
				debug('assign_mode');
				Skin._assign_mode.receive(val);
				break;
			case 39:
				debug('follow_mode');
				Skin._follow_mode.receive(val);
				break;
			case 40:
				debug('modify_mode');
				Skin._modify_mode.receive(val);
				break;
			case 43:
				debug('kslider_thru');
				Scales._thruMode.receive(val);
				break;
			case 'breakpoint':
				var args = arrayfromargs(arguments);
				debug('breakpoint:', args);
				if(val=='bang')
				{
					debug('update poly breakpoints:', breakpoint.getvalueof());
					//pads[current_edit-1]._breakpoint.message('list', breakpoint.getvalueof());
					storage.setstoredvalue('poly.'+(current_edit)+'::breakpoint', current_pset, breakpoint.getvalueof());
					//storage.getstoredvalue('poly.'+(current_edit)+'::breakpoint', current_pset);
					storage.message('recall', 'poly.'+(current_edit)+'::breakpoint', current_pset);
					pad._breakpoint.message('bang');
				}
				break;
		}
		dirtyStorage();
	}
}



function Editor(val)
{
	editorVisible = val > 0;
	if(editorVisible)
	{
		skin_settings_pcontrol.open();
		BLOCKS_ENABLE&&blocks_pcontrol.open();
		GRID_ENABLE&&mira_grid_pcontrol.open();
	}
	else
	{
		settings_thispatcher.message('window', 'getsize');
		skin_settings_pcontrol.close();
		blocks_pcontrol.close();
		mira_grid_pcontrol.close();
	}
}

function settings_patcher_unlock()
{
	skin_settings.window('size', 0, 400, 1190, 800);
	skin_settings.window('flags', 'minimize');
	skin_settings.window('flags', 'zoom');
	skin_settings.window('flags', 'close');
	skin_settings.window('flags', 'grow');
	skin_settings.window('flags', 'title');
	skin_settings.window('flags', 'nofloat');
	skin_settings.window('exec');
}

function settings_patcher_lock()
{
	//var pos = settings_thispatcher.getsize();
	var pos = settings_position.getvalueof();
	//debug('LOCK:', pos);
	pos[2] = pos[0] + 450;
	pos[3] = pos[1] + 700;
	//var pos = [300, 40, 750, 750];
	skin_settings.window('size', pos[0], pos[1], pos[2], pos[3]);
	skin_settings.window('flags', 'nominimize');
	//blocks_patcher.window('flags', 'nozoom');
	skin_settings.window('flags', 'noclose');
	skin_settings.window('flags', 'nogrow');
	//blocks_patcher.window('flags', 'notitle');
	skin_settings.window('flags', 'float');
	skin_settings.window('exec');
}

function mira_enable(val)
{
	debug('mira_enable:', val);
	miraEnable = val;
	if(Alive)
	{
		setup_mira_interface();
	}
}



function ZoneSettingsModule()
{
	var self = this;
	this.add_bound_properties(this, ['update_background_color', '_poly_index', '_zone_index', 'update', 'select_voice', 'current_edit', '_edit_index', '_parameterObjs', 'change_color', 'chord_assigners']);
	this._name = 'ZoneSettings';
	this._pset = 1;
	this._poly_index = 1;
	this._zone_index = 0;
	this.current_edit = function(){return pads[this._zone_index];}
	this._parameterObjs = [];

	ZoneSettingsModule.super_.call(this, 'ZoneSettingsModule');

	var make_layer_callback = function(layer_number, polyname, settingsname)
	{
		var func = function(obj)
		{
			//debug('setting:', polyname, obj._value);
			self.current_edit()['_layers'][layer_number]['_'+polyname].message(obj._value);
			//script[settingsname].message('set', obj._value);
			storageTask=true;
		}
		return func;
	}

	this._chord_channel = new RegisteredRangedParameterForLayer(this._name + '_ChordChannel', {'layer_number':0, 'polyobj':'chord_channel', 'registry':this._parameterObjs, 'range':16, 'callback':make_layer_callback(0, 'chord_channel', 'chord_channel')});
	this._chordA_channel = new RegisteredRangedParameterForLayer(this._name + '_ChordModAChannel', {'layer_number':1, 'polyobj':'chord_channel', 'registry':this._parameterObjs, 'range':16, 'callback':make_layer_callback(1, 'chord_channel', 'chordA_channel')});
	this._chordB_channel = new RegisteredRangedParameterForLayer(this._name + '_ChordModBChannel', {'layer_number':2, 'polyobj':'chord_channel', 'registry':this._parameterObjs, 'range':16, 'callback':make_layer_callback(2, 'chord_channel', 'chordB_channel')});
	this._chordC_channel = new RegisteredRangedParameterForLayer(this._name + '_ChordModCChannel', {'layer_number':3, 'polyobj':'chord_channel', 'registry':this._parameterObjs, 'range':16, 'callback':make_layer_callback(3, 'chord_channel', 'chordC_channel')});
	this.chord_channels = function(index){return [this._chord_channel, this._chordA_channel, this._chordB_channel, this._chordC_channel][index];}.bind(this);

	this._chord_gate = new RegisteredToggledParameterForLayer(this._name + '_ChordGate', {'layer_number':0, 'polyobj':'chord_gate', 'registry':this._parameterObjs, 'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':1, 'callback':make_layer_callback(0, 'chord_gate', 'chord_enable')});
	this._chord_modA_gate = new RegisteredToggledParameterForLayer(this._name + '_ChordModAGate', {'layer_number':1, 'polyobj':'chord_gate', 'registry':this._parameterObjs, 'onValue':colors.YELLOW, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(1, 'chord_gate', 'chord_modA_enable')});
	this._chord_modB_gate = new RegisteredToggledParameterForLayer(this._name + '_ChordModBGate', {'layer_number':2, 'polyobj':'chord_gate', 'registry':this._parameterObjs, 'onValue':colors.YELLOW, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(2, 'chord_gate', 'chord_modB_enable')});
	this._chord_modC_gate = new RegisteredToggledParameterForLayer(this._name + '_ChordModCGate', {'layer_number':3, 'polyobj':'chord_gate', 'registry':this._parameterObjs, 'onValue':colors.YELLOW, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(3, 'chord_gate', 'chord_modC_enable')});
	this.chord_gates = function(index){return [this._chord_gate, this._chord_modA_gate, this._chord_modB_gate, this._chord_modC_gate][index];}.bind(this);

	this._note_chord = new RegisteredChordNotifier(this._name + '_NoteChord', {'mode':0, 'layer_number':0, 'polyobj':'chord', 'settingsobj':'chord_assignment', 'registry':this._parameterObjs});
	this._modA_chord = new RegisteredChordNotifier(this._name + '_ModAChord', {'mode':0, 'layer_number':1, 'polyobj':'chord', 'settingsobj':'chord_modA_assignment', 'registry':this._parameterObjs});
	this._modB_chord = new RegisteredChordNotifier(this._name + '_ModBChord', {'mode':0, 'layer_number':2, 'polyobj':'chord', 'settingsobj':'chord_modB_assignment', 'registry':this._parameterObjs});
	this._modC_chord = new RegisteredChordNotifier(this._name + '_ModCChord', {'mode':0, 'layer_number':3, 'polyobj':'chord', 'settingsobj':'chord_modC_assignment', 'registry':this._parameterObjs});
	this.chord_assigners = function(index){return [this._note_chord, this._modA_chord, this._modB_chord, this._modC_chord][index];}.bind(this);

	this._main_port = new RegisteredToggledParameterForLayer(this._name + '_MainPort', {'layer_number':0, 'polyobj':'port', 'registry':this._parameterObjs, 'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(0, 'port', 'main_port')});
	this._modA_port = new RegisteredToggledParameterForLayer(this._name + '_ModAPort', {'layer_number':1, 'polyobj':'port', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(1, 'port', 'modA_port')});
	this._modB_port = new RegisteredToggledParameterForLayer(this._name + '_ModBPort', {'layer_number':2, 'polyobj':'port', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(2, 'port', 'modB_port')});
	this._modC_port = new RegisteredToggledParameterForLayer(this._name + '_ModCPort', {'layer_number':3, 'polyobj':'port', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_layer_callback(3, 'port', 'modC_port')});
	this.chord_ports = function(index){return [this._main_port, this._modA_port, this._modB_port, this._modC_port][index];}.bind(this);

	var make_mono_layer_callback = function(layer_number, polyname, settingsname, chordassigner)
	{
		var func = function(obj)
		{
			self.current_edit()['_layers'][layer_number]['_'+polyname].message(obj._value);
			//script[settingsname].message('set', obj._value);
			chordassigner.update_mode();
			storageTask=true;
		}
		return func;
	}

	this._main_mono = new RegisteredToggledParameterForLayer(this._name + '_MainMono', {'layer_number':0, 'polyobj':'mono', 'registry':this._parameterObjs, 'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'callback':make_mono_layer_callback(0, 'mono', 'main_mono', self._note_chord)});
	this._modA_mono = new RegisteredToggledParameterForLayer(this._name + '_ModAMono', {'layer_number':1, 'polyobj':'mono', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_mono_layer_callback(1, 'mono', 'modA_mono', self._modA_chord)});
	this._modB_mono = new RegisteredToggledParameterForLayer(this._name + '_ModBMono', {'layer_number':2, 'polyobj':'mono', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_mono_layer_callback(2, 'mono', 'modB_mono', self._modB_chord)});
	this._modC_mono = new RegisteredToggledParameterForLayer(this._name + '_ModCMono', {'layer_number':3, 'polyobj':'mono', 'registry':this._parameterObjs, 'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0, 'callback':make_mono_layer_callback(3, 'mono', 'modC_mono', self._modC_chord)});
	this.chord_monos = function(index){return [this._main_mono, this._modA_mono, this._modB_mono, this._modC_mono][index];}.bind(this);

	this._main_clear = new RegisteredMomentaryParameter(this._name + '_MainClear', {'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'registry':this._parameterObjs, 'callback':self._note_chord.clear_assignment});
	this._modA_clear = new RegisteredMomentaryParameter(this._name + '_ModAClear', {'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'registry':this._parameterObjs, 'callback':self._modA_chord.clear_assignment});
	this._modB_clear = new RegisteredMomentaryParameter(this._name + '_ModBClear', {'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'registry':this._parameterObjs, 'callback':self._modB_chord.clear_assignment});
	this._modC_clear = new RegisteredMomentaryParameter(this._name + '_ModCClear', {'onValue':colors.BLUE, 'offValue':colors.OFF, 'value':0, 'registry':this._parameterObjs, 'callback':self._modC_chord.clear_assignment});
	this.chord_clears = function(index){return [this._main_clear, this._modA_clear, this._modB_clear, this._modC_clear][index];}.bind(this);

	this._layerChooser = new LayerChooser(this._name + '_LayerChooser', {'parent':this});
	this._layerChooser._editor_mono._additional_callbacks = [self._note_chord.update_mode];

	var make_callback = function(polyname, settingsname)
	{
		var func = function(obj)
		{
			self.current_edit()['_'+polyname].message(obj._value);
			//storage.setstoredvalue('poly.'+self._poly_index+'::'+polyname, self._pset, obj._value);
			script[settingsname].message('set', obj._value);
			storageTask=true;
		}
		return func;
	}

	this._toggle_note = new RegisteredToggledParameter(this._name + '_Toggle', {'polyobj':'toggle_note', 'registry':this._parameterObjs, 'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':0, 'callback':make_callback('toggle_note', 'toggle_note')});

	this._cc_enable = new RegisteredToggledParameter(this._name + '_CCEnable', {'polyobj':'cc_enable', 'registry':this._parameterObjs, 'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':0, 'callback':make_callback('cc_enable', 'cc_enable')});
	this._cc_id = new RegisteredRangedParameter(this._name + '_CCID', {'polyobj':'cc_id', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('cc_id', 'cc_id')});
	this._cc_scale_lo = new RegisteredRangedParameter(this._name + '_CCScaleLo', {'polyobj':'cc_scale_lo', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('cc_scale_lo', 'cc_scale_lo')});
	this._cc_scale_hi = new RegisteredRangedParameter(this._name + '_CCScaleHi', {'polyobj':'cc_scale_hi', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('cc_scale_hi', 'cc_scale_hi')});
	this._cc_scale_exp = new RegisteredRangedParameter(this._name + '_CCScaleExp', {'polyobj':'cc_scale_exp', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('cc_scale_exp', 'cc_scale_exp')});
	this._cc_channel = new RegisteredRangedParameter(this._name + '_CCChannel', {'polyobj':'cc_channel', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('cc_channel', 'cc_channel')});
	this._cc_port = new RegisteredToggledParameter(this._name + '_CCPort', {'polyobj':'cc_port', 'registry':this._parameterObjs, 'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':0, 'callback':make_callback('cc_port', 'cc_port')});

	this._remote_enable = new RegisteredToggledParameter(this._name + '_RemoteEnable', {'polyobj':'remote_enable', 'registry':this._parameterObjs, 'onValue':colors.WHITE, 'offValue':colors.OFF, 'value':0, 'callback':make_callback('remote_enable', 'remote_enable')});
	//this._remote_id = new RegisteredRangedParameter(this._name + '_CCID', {'polyobj':'remote_id', 'registry':this._parameterObjs, 'range':128, 'callback':make_callback('remote_id', 'remote_id')});
	this._remote_scale_lo = new RegisteredRangedParameter(this._name + '_RemoteScaleLo', {'polyobj':'remote_scale_lo', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('remote_scale_lo', 'remote_scale_lo')});
	this._remote_scale_hi = new RegisteredRangedParameter(this._name + '_RemoteScaleHi', {'polyobj':'remote_scale_hi', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('remote_scale_hi', 'remote_scale_hi')});
	this._remote_scale_exp = new RegisteredRangedParameter(this._name + '_RemoteScaleExp', {'polyobj':'remote_scale_exp', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('remote_scale_exp', 'remote_scale_exp')});

	this._mask = new RegisteredRangedParameter(this._name + '_Mask', {'polyobj':'mask', 'registry':this._parameterObjs, 'range':127, 'callback':make_callback('mask', 'Mask')});
	this._mod_sustain = new RegisteredRangedParameter(this._name + '_ModSustain', {'polyobj':'mod_sustain', 'registry':this._parameterObjs, 'range':2000, 'callback':make_callback('mod_sustain', 'mod_sustain')});

	var color_callback = make_callback('color', 'color');
	var color_callback_full = function(obj)
	{
		color_callback(obj);
		self.update_background_color();
		self.current_edit().reassign_color();
	}
	this._color = new RegisteredRangedParameter(this._name + '_Color', {'polyobj':'color', 'registry':this._parameterObjs, 'range':128, 'callback':color_callback_full});

	this._modify_target = new RadioComponent(this._name + '_ModifyTarget', 0, 4, 0, function(){}, color.BLUE, color.OFF, {'value':script['modify_target'].getvalueof()});
	//this._selected_zone = new ParameterClass(this._name + '_SelectedZone', {'callback':this.select_voice, 'value':1});
	this._selected_zone = new ColoredRadioComponent(this._name + '_SelectedZone', 1, 64, 1, this.select_voice, color.RED, color.CYAN, {'value':1});
}

inherits(ZoneSettingsModule, Bindable);

ZoneSettingsModule.prototype.change_color = function(obj)
{
	debug('change_color:', obj._value);
}

ZoneSettingsModule.prototype.update_background_color = function()
{
	var value = this._color._value;
	var COLOR = PALETTE[value<0?0:value];
	for(var i = 0;i<6;i++)
	{
		script['panel['+i+']'].message('bgcolor', COLOR[0], COLOR[1], COLOR[2], Math.max(COLOR[3], .2));
	}
}

ZoneSettingsModule.prototype.update = function()
{
	var pad = this.current_edit();
	for(var i in this._parameterObjs)
	{
		this._parameterObjs[i].relink(pad);
	}
	this._layerChooser.update_layer();
	Scales.update_chord_display();
	pad.update_mod_assignments();
	mod_target_assignment.message('set', pad._mod_assigns[parseInt(mod_target.getvalueof())]);
	this.update_device();
	//select_pad_device(pad._layers[0]._id.getvalueof());
	//Device.select_pad_device(pad._layers[0]._id.getvalueof());
	Scales.update_program_output();
	this.update_background_color();
	//debug('ZoneSettings finished updating');
}

//this needs to be moved into DeviceModule?
ZoneSettingsModule.prototype.update_device = function()
{
	//debug('update_device');
	var pad = ZoneSettings.current_edit();
	var remote_id = pad._remote_id.getvalueof();
	//debug('remote_id is:', remote_id);
	if((remote_id!=undefined)&&(remote_id>0))
	{
		Device._finder.id = parseInt(remote_id);
		//var lo = Device._finder.get('min');
		//var hi = Device._finder.get('max');
		//remote_scale_lo.message('minimum', lo);
		//remote_scale_lo.message('maximum', hi-1);
		remote_scale_lo.message('set', pad._remote_scale_lo.getvalueof());
		//remote_scale_hi.message('minimum', lo+1);
		//remote_scale_hi.message('maximum', hi);
		remote_scale_hi.message('set', pad._remote_scale_hi.getvalueof());
		remote_scale_exp.message('set', pad._remote_scale_exp.getvalueof());
		remote_name.message('set', Device.parameter_name_from_id(remote_id));
		remote_scale_lo.message('hidden', 0);
		remote_scale_hi.message('hidden', 0);
		remote_scale_exp.message('hidden', 0);
		//debug('finished displaying linked parameter');
	}
	else
	{
		remote_scale_lo.message('hidden', 1);
		remote_scale_hi.message('hidden', 1);
		remote_scale_exp.message('hidden', 1);
		remote_name.message('set', Device.parameter_name_from_id(remote_id));
		//debug('finished hiding remote parameter');
	}
	breakpoint_obj.message('clear');
	breakpoint.message(pad._breakpoint.getvalueof());
	//debug('breakpoint val:', pad._breakpoint.getvalueof());
	//debug('finished updating device');
}

ZoneSettingsModule.prototype.select_voice = function(obj)
{
	var num = obj._value;
	//debug('ZoneSettingsModule.select_voice:', num);
	if(num != this._poly_index)
	{
		if(DISPLAY_POLY){poly.message('wclose');}
		this._poly_index = num;
		this._zone_index = num-1;
		if(selected){selected.message('set', num);}
	}
	if(DISPLAY_POLY){poly.message('open', num);}
	this.update();
}



function LayerChooser(name, args)
{
	var self = this;
	this.add_bound_properties(this, []);
	this._parameterObjs = [];
	LayerChooser.super_.call(this, name, args);
	this._activeLayer = new RadioComponent(this._name + '_ActiveLayer', 0, 3, 0, self.update_layer.bind(this), colors.RED, colors.MAGENTA);
	this._editor_channel = new ParameterAlias(this._name + '_Channel', {'chooser':this._parent.chord_channels, 'settingsname':'chord_channel'});
	this._editor_gate = new ParameterAlias(this._name + '_Gate', {'chooser':this._parent.chord_gates, 'settingsname':'chord_enable'});
	this._editor_chord = new ParameterAlias(this._name + '_Chord', {'chooser':this._parent.chord_assigners, 'settingsname':'chord_assignment'});
	this._editor_port = new ParameterAlias(this._name + '_Port', {'chooser':this._parent.chord_ports, 'settingsname':'main_port'});
	this._editor_mono = new ParameterAlias(this._name + '_Mono', {'chooser':this._parent.chord_monos, 'settingsname':'main_mono'});
	this._editor_clear = new ParameterAlias(this._name + '_Clear', {'chooser':this._parent.chord_clears, 'settingsname':'main_clear'});
	this._aliases = {'_editor_channel':this._editor_channel, '_editor_gate':this._editor_gate, '_editor_chord':this._editor_chord, 
						'_editor_port':this._editor_port, '_editor_mono':this._editor_mono, '_editor_clear':this._editor_clear};
	this._parent._activeLayer = this._activeLayer;
	for(var i in this._aliases)
	{
		this._parent[i] = this._aliases[i];
	}

}

inherits(LayerChooser, Bindable);

LayerChooser.prototype.update_layer = function()
{
	//debug('LayerChooser.update_layer()', this._activeLayer._value);
	var layer = this._activeLayer._value;
	selected_layer_tab.message('set', layer);
	for(var i=0;i<4;i++)
	{
		var assigner = this._parent.chord_assigners(i)
		assigner.set_settingsobj(layer == i ? 'chord_assignment' : undefined);
		//assigner.update_mode();
	}
	this._parent.chord_assigners(layer).update_mode();
	for(var i in this._aliases)
	{
		this._aliases[i].update_linked_parameter(this._aliases[i]._chooser(layer));
	}
	var output_chooser = Scales._outputChooser;
	if(output_chooser._value != layer){output_chooser.receive(layer);}
}



function SkinModule()
{
	var self = this;
	this.add_bound_properties(this, ['update', 'assign_grid', 'assign_keys', '_grid', '_keys', '_button_press', '_pressed_color']);
	this._grid = undefined;
	this._keys = undefined;
	this._pressed_color = colors.WHITE;

	this._assign_mode = new ToggledParameter(this._name + '_AssignMode', {'onValue':colors.RED, 'offValue':colors.GREEN, 'value':0, 'callback':function(){assign_mode.message('set', this._assign_mode._value);}.bind(this)});   // 'callback':self.update})
	this._follow_mode = new ToggledParameter(this._name + '_FollowMode', {'onValue':colors.YELLOW, 'offValue':colors.WHITE, 'value':DEFAULT_FOLLOW, 'callback':function(){follow_mode.message('set', this._follow_mode._value);}.bind(this)});   // 'callback':self.update})
	this._transform_mode = new ToggledParameter(this._name + '_TransformMode', {'onValue':colors.CYAN, 'offValue':colors.OFF, 'value':0});
	this._modify_mode = new ToggledParameter(this._name + '_ModifyMode', {'onValue':colors.MAGENTA, 'offValue':colors.CYAN, 'value':0, 'callback':function(){modify_mode.message('set', this._modify_mode._value);}.bind(this)});   // 'callback':self.update})
	//initialize the gui in case settings have changed on frontend
	this._assign_mode._callback();
	this._follow_mode._callback();
	this._modify_mode._callback();
	SkinModule.super_.call(this, 'SkinModule');
}

inherits(SkinModule, Bindable);

SkinModule.prototype.update = function()
{
	for(var i in pads)
	{
		pads[i].update_color();
	}
}

SkinModule.prototype.assign_grid = function(grid)
{
	//debug('SkinModule assign grid', grid);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
	}
	this.update();
}

SkinModule.prototype.assign_keys = function(keys)
{
	this._keys = keys;
}

SkinModule.prototype._button_press = function(button)
{
	if(button.pressed())
	{
		if(this._modify_mode._value>0)
		{
			var pad = ZoneSettings.current_edit();
			pad._modifier_assignments.message(button.group, 0, ZoneSettings._modify_target._value);
			debug('to matrixctl:', button.group, 0, ZoneSettings._modify_target._value);
			pad.update_mod_assignments();
		}
		else if(this._assign_mode._value>0)
		{
			//debug('assigning...', button._name, ZoneSettings._zone_index);
			if(button.group!=ZoneSettings._zone_index)
			{
				for(var i in pads)
				{
					pads[i].remove_cell(button);
				}
				pads[ZoneSettings._zone_index].add_cell(button);
				storageTask=true;
				//storage.setstoredvalue('cell_dict', current_pset, cell_dict.getstoredvalue());
				push_notes.message(button._push_note, ZoneSettings._poly_index);
				this.update();
				dirtyStorage();
			}
		}
		else
		{
			pads[button.group].send(ZONE_ON_COLOR, SUPPRESS_BLOCK);
			if(this._transform_mode._value>0)
			{
				SkinEditor.transform_pad(pads[button.group]);
			}
			else if(AltButton.pressed()||this._follow_mode._value>0)
			{
				tasks.removeTask(ZoneSettings.select_voice, [], 'select_zone');
				tasks.addTask(ZoneSettings.select_voice, [{'_value':button.group + 1}], 1, false, 'select_zone');
			}
		}
	}
	else
	{
		pads[button.group].update_color(SUPPRESS_BLOCK);
	}
}



function ModifierMatrixModule()
{
	var self = this;
	this._grid = undefined;
	this._keys = undefined;
	this.add_bound_properties(this, ['update', 'assign_grid', 'assign_keys', '_grid', '_keys']);
	ModifierMatrixModule.super_.call(this, 'ModifierMatrixModule');
}

inherits(ModifierMatrixModule, Bindable);

ModifierMatrixModule.prototype.update = function()
{
	//debug('ModifierMatrixModule.update');
	//var modArray = pads[SkinSettings
	//outlet(1, 'clear');
	//outlet(1, 'repaint');
	if(this._grid)
	{
		var pad= ZoneSettings.current_edit();
		pad.update_mod_assignments();
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)
			{
				cells[i][j].send(pad._mod_assigns[i+(j*8)]);
			}
		}
	}
}

ModifierMatrixModule.prototype.assign_grid = function(grid)
{
	debug('ModMatrix assign grid', grid);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid ? grid : undefined;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
	}
	this.update();
}

ModifierMatrixModule.prototype.assign_keys = function(keys)
{
	this._keys = keys;
}

ModifierMatrixModule.prototype._button_press = function(button)
{
	if(button.pressed())
	{
		//debug('button_press:', button._name);
		//button.send(this._pressed_color);
		var pad = ZoneSettings.current_edit();
		var coords = button.get_coords(Grid);
		var pos = (coords[0]+(coords[1]*8));
		var old_val = pad._mod_assigns[pos];
		pad._modifier_assignments.message(pos, 0, (old_val+1)%4);
		//this.update();
		update_mod_matrix();
		
	}
	else
	{
		//debug('button_unpress:', button._name, pads[button.group]._color);
		//button.send(pads[button.group]._color);
	}
}

//for some reason ModMatrix is losing its binding in _button_press, so this is a workaround
function update_mod_matrix()
{
	ModMatrix.update();
}



ScalesModule = function(parameters)
{
	var self = this;
	this.add_bound_properties(this, ['_current_scale', '_button_press', '_update', 'assign_grid', '_grid', '_pressed_color', 'width', 'height', 'colors', '_output_target', 'chord_display']);
	this.colors = PushColors;
	this._current_scale = 'Chromatic';
	this._pressed_color = this.colors.GREEN;
	this._chord_color = this.colors.RED;
	this.chord_display = -1;
	this._grid = undefined;
	this._grid_function = function(){}
	this.width = function(){return  !this._grid ? 0 : this._grid.width();}
	this.height = function(){return !this._grid ? 0 : this._grid.height();}
	this._NOTENAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'];
	this.NOTENAMES = [];
	for(var i=0;i<128;i++)
	{
		this.NOTENAMES[i]=(this._NOTENAMES[i%12] + ' ' + (Math.floor(i/12)-2) );
	}
	this.WHITEKEYS = {0:0, 2:2, 4:4, 5:5, 7:7, 9:9, 11:11, 12:12};
	//this.NOTES = [24, 25, 26, 27, 28, 29, 30, 31, 16, 17, 18, 19, 20, 21, 22, 23, 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7];
	//this.DRUMNOTES = [12, 13, 14, 15, 28, 29, 30, 31, 8, 9, 10, 11, 24, 25, 26, 27, 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 16, 17, 18, 19];
	//this.SCALENOTES = [36, 38, 40, 41, 43, 45, 47, 48, 24, 26, 28, 29, 31, 33, 35, 36, 12, 14, 16, 17, 19, 21, 23, 24, 0, 2, 4, 5, 7, 9, 11, 12];
	this.KEYCOLORS = [this.colors.OFF, this.colors.WHITE, this.colors.CYAN, this.colors.BLUE, this.colors.RED, this.colors.RED, this.colors.RED, this.colors.RED];
	this.SCALES = 	{'Chromatic':[0,1,2,3,4,5,6,7,8,9,10,11],
				'Major':[0,2,4,5,7,9,11],
				'Minor':[0,2,3,5,7,8,10],
				'Dorian':[0,2,3,5,7,9,10],
				'Mixolydian':[0,2,4,5,7,9,10],
				'Lydian':[0,2,4,6,7,9,11],
				'Phrygian':[0,1,3,5,7,8,10],
				'Locrian':[0,1,3,4,7,8,10],
				'Diminished':[0,1,3,4,6,7,9,10],
				'Whole-half':[0,2,3,5,6,8,9,11],
				'Whole Tone':[0,2,4,6,8,10],
				'Minor Blues':[0,3,5,6,7,10],
				'Minor Pentatonic':[0,3,5,7,10],
				'Major Pentatonic':[0,2,4,7,9],
				'Harmonic Minor':[0,2,3,5,7,8,11],
				'Melodic Minor':[0,2,3,5,7,9,11],
				'Dominant Sus':[0,2,5,7,9,10],
				'Super Locrian':[0,1,3,4,6,8,10],
				'Neopolitan Minor':[0,1,3,5,7,8,11],
				'Neopolitan Major':[0,1,3,5,7,9,11],
				'Enigmatic Minor':[0,1,3,6,7,10,11],
				'Enigmatic':[0,1,4,6,8,10,11],
				'Composite':[0,1,4,6,7,8,11],
				'Bebop Locrian':[0,2,3,5,6,8,10,11],
				'Bebop Dominant':[0,2,4,5,7,9,10,11],
				'Bebop Major':[0,2,4,5,7,8,9,11],
				'Bhairav':[0,1,4,5,7,8,11],
				'Hungarian Minor':[0,2,3,6,7,8,11],
				'Minor Gypsy':[0,1,4,5,7,8,10],
				'Persian':[0,1,4,5,6,8,11],
				'Hirojoshi':[0,2,3,7,8],
				'In-Sen':[0,1,5,7,10],
				'Iwato':[0,1,5,6,10],
				'Kumoi':[0,2,3,7,9],
				'Pelog':[0,1,3,4,7,8],
				'Spanish':[0,1,3,4,5,6,8,10]};
	this.SCALENAMES = [];
	var i = 0;
	for (var name in this.SCALES){this.SCALENAMES[i] = name;i++};
	this._noteMap = new Array(256);
	for(var i=0;i<256;i++)
	{
		this._noteMap[i] = [];
	}
	this.DEFAULT_SCALE = 'Chromatic';
	this.SPLIT_SCALES = {}; //{'DrumPad':1, 'Major':1};
	for(var param in parameters)
	{
		self[param] = parameters[param];
	}

	this._output_object_names = ['_chord_out', '_chord_modA_out', '_chord_modB_out', '_chord_modC_out'];
	this._vertOffset = new OffsetComponent(this._name + '_Vertical_Offset', 0, 119, 4, self._update.bind(this), colors.MAGENTA);
	this._scaleOffset = new OffsetComponent(this._name + '_Scale_Offset', 0, self.SCALES.length, 0, self._update.bind(this), colors.BLUE);
	this._noteOffset = new OffsetComponent(this._name + '_Note_Offset', 0, 12, 0, self._update.bind(this), colors.CYAN);
	this._octaveOffset = new OffsetComponent(this._name + '_Octave_Offset', 0, 119, 0, self._update.bind(this), colors.YELLOW, colors.OFF, 12);
	this._outputChooser = new RadioComponent(this._name + '_Output_Chooser', 0, 3, 0, self.update_output_target.bind(this), colors.RED, colors.MAGENTA);
	this._assignMode = new ToggledParameter(this._name + '_AssignMode', {'onValue':colors.MAGENTA, 'offValue':colors.WHITE, 'value':0});
	this._thruMode = new ToggledParameter(this._name + '_ThruMode', {'onValue':colors.BLUE, 'offValue':colors.CYAN, 'value':script['thru'].getvalueof()});

	ScalesModule.super_.call(this, 'ScalesModule');
}

inherits(ScalesModule, Bindable);

ScalesModule.prototype.set_grid_function = function(func){this.grid_function = func;}

ScalesModule.prototype.assign_grid = function(grid)
{
	debug('ScalesClass assign grid', grid);
	if(this._grid instanceof GridClass)
	{
		this._grid.clear_translations();
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
		if(!(this._last_pressed_button instanceof ButtonClass))
		{
			this._last_pressed_button = this._grid.get_button(0, this._grid.height()-1);
		}
	}
	this._update();
}

ScalesModule.prototype._button_press = function(button)
{
	if(button.pressed())
	{
		//debug('button_press:', button._name, button._translation);
		button.send(this._pressed_color);
		//this._output_target&&this._output_target.message('in0', button._translation, 127);
		poly.message('target', ZoneSettings._poly_index);
		poly.message('chordout', button._translation, button._value);
		var current_output = this._outputChooser._value;
		//if((this._outputChooser._buttons.length > current_output)&&(this._outputChooser._buttons[current_output].pressed()))
		if(Scales._assignMode._value)
		{
			//debug('chord_assigners:', ZoneSettings.chord_assigners(current_output));
			//debug('selected:', ZoneSettings._chord_assigners[current_output]);
			ZoneSettings.chord_assigners(current_output).toggle(button._translation, button._value);
			this.update_chord_display()
		}
		//debug('sent:', ZoneSettings._poly_index, button._translation, 127);
	}
	else
	{
		//debug('button_unpress:', button._name);
		button.send(button.scale_color);
		//this._output_target&&this._output_target.message('in0', button._translation, 0);
		poly.message('target', ZoneSettings._poly_index);
		poly.message('chordout', button._translation, 0);
		//debug('sent:', ZoneSettings._poly_index, button._translation, 0);
	}
}

ScalesModule.prototype._update = function()
{
	//debug('Scales update', this, Scales);
	this._update_request = false;
	this._noteMap = [];
	for(var i=0;i<128;i++)
	{
		this._noteMap[i] = [];
	}
	//debug('grid:', this._grid, this._grid instanceof GridClass);
	if(this._grid instanceof GridClass)
	{
		var width = this.width();
		var height = this.height();
		var offset = this._noteOffset._value + this._octaveOffset._value;
		//debug('offset is:', offset);
		var vertoffset = this._vertOffset._value;
		var scale = this.SCALENAMES[this._scaleOffset._value];
		//debug('new scale is:', scale);
		this._current_scale = scale;
		var scale_len = this.SCALES[scale].length;
		//debug('chord_display:', this.chord_display);
		for(var column=0;column<width;column++)
		{
			for(var row=0;row<height;row++)
			{
				var note_pos = column + (Math.abs((height-1)-row))*parseInt(vertoffset);
				var note = offset + this.SCALES[scale][note_pos%scale_len] + (12*Math.floor(note_pos/scale_len));
				var button = this._grid.get_button(column, row);
				if(button)
				{
					button.set_translation(note%127);
					this._noteMap[note%127].push(button);
					//debug(button._name, 'translation:', button._translation, 'eval:', ((button._translation in this.chord_display)*4), 'scale_color:', ((note%12) in this.WHITEKEYS) + (((note_pos%scale_len)==0)*2) + ((this.chord_display.indexOf(button._translation)>-1)*4));
					button.scale_color = this.KEYCOLORS[((note%12) in this.WHITEKEYS) + (((note_pos%scale_len)==0)*2) + ((this.chord_display.indexOf(button._translation)>-1)*4)];  // + (button._chord*4)
					button.send(button.scale_color, true);
				}
			}
		}
	}
	//debug('ending Scale update');
}

ScalesModule.prototype.update_output_target = function(obj)
{
	debug('update_output_target', obj._value + 1);
	//this._output_target = ZoneSettings.current_edit()[this._output_object_names[obj._value]];
	messnamed(unique+'chord_target', obj._value + 1);
	this.update_chord_display();
	this.update_program_output();
	var editor_layer = ZoneSettings._layerChooser._activeLayer;
	var layer = this._outputChooser._value;
	if(editor_layer._value != layer){editor_layer.set_value(layer);}
}

ScalesModule.prototype.update_program_output = function()
{
	var obj = this._outputChooser;
	thru_channel.message(ZoneSettings.chord_channels(obj._value)._value);  //send out the current edits active chord channel to the programthru bus.
	//debug('sending to thru channel:', ZoneSettings.chord_channels(obj._value)._value);
}

ScalesModule.prototype.update_chord_display = function()
{
	//debug('update_chord_display.......................');
	this.chord_display = ZoneSettings.current_edit()['_layers'][this._outputChooser._value]['_chord'].getvalueof();
	//debug('chord_display is:', this.chord_display);
	this._update();
}



RegisteredToggledParameter = function(name, args)
{
	RegisteredToggledParameter.super_.call(this, name, args);
	if(this._registry)
	{
		this.register(this._registry);
	}
}

inherits(RegisteredToggledParameter, ToggledParameter);

RegisteredToggledParameter.prototype.register = function(registry)
{
	if(registry.indexOf(this)==-1)
	{
		registry.push(this);
	}
}

RegisteredToggledParameter.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj, pad['_'+this._polyobj].getvalueof());
	this.set_value(pad['_'+this._polyobj].getvalueof());
}	



RegisteredToggledParameterForLayer = function(name, args)
{
	RegisteredToggledParameterForLayer.super_.call(this, name, args);
}

inherits(RegisteredToggledParameterForLayer, RegisteredToggledParameter);

RegisteredToggledParameterForLayer.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj)
	//debug(pad['_'+this._polyobj].getvalueof());
	this.set_value(pad['_layers'][this._layer_number]['_'+this._polyobj].getvalueof());
}	



RegisteredRangedParameter = function(name, args)
{
	RegisteredRangedParameter.super_.call(this, name, args);
	if(this._registry)
	{
		this.register(this._registry);
	}
	//this.add_bound_properties(this, ['_Callback']);
}

inherits(RegisteredRangedParameter, RangedParameter);

RegisteredRangedParameter.prototype.register = function(registry)
{
	if(registry.indexOf(this)==-1)
	{
		registry.push(this);
	}
}

RegisteredRangedParameter.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj, pad['_'+this._polyobj].getvalueof());
	this.set_value(pad['_'+this._polyobj].getvalueof());
}

RegisteredRangedParameter.prototype._Callback = function(obj)
{
	//debug(
	if(obj._value!=undefined)
	{
		if(this._javaObj)
		{
			debug('Callback', self._name, obj._value);
			this._javaObj.set(obj._value, this._range);
		}
		else
		{
			debug('Callback', 'received:', self._name, obj._value, 'forwarding:', Math.round((obj._value/127)*this._range) );
			this.receive(Math.round((obj._value/127)*this._range));
		}
	}
}



RegisteredRangedParameterForLayer = function(name, args)
{
	RegisteredRangedParameterForLayer.super_.call(this, name, args);
}

inherits(RegisteredRangedParameterForLayer, RegisteredRangedParameter);

RegisteredRangedParameterForLayer.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj);
	//debug('layer:', this._layer_number, pad['_layers'][this._layer_number], pad['_layers'][this._layer_number]['_'+this._polyobj].getvalueof());
	this.set_value(pad['_layers'][this._layer_number]['_'+this._polyobj].getvalueof());
}



RegisteredMomentaryParameter = function(name, args)
{
	RegisteredMomentaryParameter.super_.call(this, name, args);
	if(this._registry)
	{
		this.register(this._registry);
	}
	//this.add_bound_properties(this, ['_Callback']);
}

inherits(RegisteredMomentaryParameter, MomentaryParameter);

RegisteredMomentaryParameter.prototype.register = function(registry)
{
	if(registry.indexOf(this)==-1)
	{
		registry.push(this);
	}
}

RegisteredMomentaryParameter.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj, pad['_'+this._polyobj].getvalueof());
	//this.set_value(pad['_'+this._polyobj].getvalueof());
}

RegisteredMomentaryParameter.prototype.receive = function(obj)
{
	if(!obj)
	{
		var obj = this;
	}
	if(this._target_heap[0])
	{
		var cb = this._target_heap[0];
		try
		{
			cb(obj);
		}
		catch(err){}
	}
	for (var i in this._listeners)
	{
		var cb = this._listeners[i];
		try
		{
			cb(obj);
		}
		catch(err){}
	}
}

RegisteredMomentaryParameter.prototype.notify = function(obj){}



ColoredRadioComponent = function(name, minimum, maximum, initial, callback, onValue, offValue, arg)
{
	var self = this;
	this.add_bound_properties(this, ['update_controls']);
	ColoredRadioComponent.super_.call(this, name, minimum, maximum, initial, callback, onValue, offValue, arg);
}

inherits(ColoredRadioComponent, RadioComponent);

ColoredRadioComponent.prototype.update_controls = function()
{
	for(var i in this._buttons)
	{
		if(this._buttons[i])
		{
			//debug('setting button color:', this._buttons.indexOf(this._buttons[i])==this._value ? this._onValue : pads[i]._color.getvalueof());
			this._buttons[i].send(this._buttons.indexOf(this._buttons[i])==this._value-this._min ? this._onValue : pads[i]._color.getvalueof());
		}
	}
}



function ParameterAlias(name, args)
{
	var self = this;
	this._alias = undefined;
	this._additional_callbacks = [];
	this.add_bound_properties(this, ['update_linked_parameter', '_Callback', '_callback', '_alias']);
	ParameterAlias.super_.call(this, name, args);
}

inherits(ParameterAlias, ParameterClass);

ParameterAlias.prototype.update_linked_parameter = function(obj)
{
	//debug(this._name, 'ParameterAlias.update_linked_parameter():', obj ? obj._name : 'None');
	if(this._alias!=undefined)
	{
		this._alias.remove_listener(this._Callback);
	}
	this._alias = obj;
	if(this._alias)
	{
		this._alias.add_listener(this._Callback);
		this._alias.notify();
	}
}

ParameterAlias.prototype._Callback = function(obj)
{
	//debug('_Callback:', this._name, obj._name, obj._value);
	if(obj)
	{
		script[this._settingsname].message('set', obj._value);
		//this.receive(obj._value);
	}
}

ParameterAlias.prototype.receive = function(val, extra)
{
	//debug('_callback:', this._name, obj._value);
	if(this._alias)
	{
		//this._alias._callback(obj);
		this._alias.receive(val, extra);
		for(var i in this._additional_callbacks)
		{
			this._additional_callbacks[i]();
		}
	}
}



RegisteredChordNotifier = function(name, args)
{
	var self = this;
	this._mode = 0;
	this._default_when_cleared = true;
	this.add_bound_properties(this, ['update', 'toggle', 'receive', 'mode', 'update_mode', 'clear_assignment', '_default_when_cleared', 'update_scroll_position']);
	RegisteredChordNotifier.super_.call(this, name, args);
	if(this._registry)
	{
		this.register(this._registry);
	}
}

inherits(RegisteredChordNotifier, NotifierClass);

RegisteredChordNotifier.prototype.set_settingsobj = function(name)
{
	//debug(this._name, 'set_settingsobj:', name);
	this._settingsobj = name;
	this.update();
}

RegisteredChordNotifier.prototype.register = function(registry)
{
	if(registry.indexOf(this)==-1)
	{
		registry.push(this);
	}
}

RegisteredChordNotifier.prototype.relink = function(pad)
{
	//debug('relink polyobj:', this._polyobj, pad['_'+this._polyobj].getvalueof());
	//if(!pad['_'+this._polyobj]){debug('missing target for:', this._polyobj)}
	this.set_value(pad['_layers'][this._layer_number]['_'+this._polyobj].getvalueof());
	this.update_mode();
	this.update();
	if(this._settingsobj!=undefined)
	{
		this.update_scroll_position();  //only if this is in the selected layer...
	}

}

RegisteredChordNotifier.prototype.update = function()
{
	var pad = ZoneSettings.current_edit();
	var assgn = pad._layers[this._layer_number]._chord.getvalueof();
	var chord_assignment = script[this._settingsobj];
	if(chord_assignment!=undefined)
	{
		chord_assignment.message('clear');
		for(var i in assgn)
		{
			//debug('assgn:', assgn[i], '....................');
			if(assgn[i]>-1)
			{
				chord_assignment.message('set', assgn[i], 127);
			}
		}
	}
	Scales.update_chord_display();
}

RegisteredChordNotifier.prototype.update_mode = function()
{
	//debug('update_mode');
	var oldMode = Math.floor(this._mode);
	var newMode = Math.floor(ZoneSettings.chord_monos(this._layer_number)._value);
	//if(Math.floor(oldMode)!=Math.floor(newMode))
	//{
	this._mode = newMode;
	//debug( unique+this._settingsobj, 'mode', this._mode);
	if(this._settingsobj!=undefined)
	{
		messnamed(unique+this._settingsobj, 'mode', this._mode);
	}
	//else{debug('bad settingsobj:', unique+this._settingsobj, 'mode', this._mode);}
	/*if(this._mode==0)
	{
		debug('setting:', Math.max.apply(Math, this._value));
		this.set_value(Math.max.apply(Math, this._value));
	}*/
	//debug('updated', this._name, 'mode', newMode);
	this.update();
	//}
}

RegisteredChordNotifier.prototype.receive = function(note, value)
{
	//debug(this._name, 'receive:', note, value);
	if(Scales._thruMode._value)
	{
		poly.message('target', ZoneSettings._poly_index);
		poly.message('chordout', note, value);
		poly.message('chordout', note, 0);
	}
	switch(this._mode)
	{
		case 0:
			this.set_value(note);
			//debug('receive mono, new_value is:', ZoneSettings.current_edit()['_layers'][this._layer_number]['_'+this._polyobj].getvalueof());
			break;
		case 1:
			var pad = ZoneSettings.current_edit();
			var polyobj = pad['_layers'][this._layer_number]['_'+this._polyobj];
			var old = polyobj.getvalueof();
			var index = old.indexOf(note);
			debug('poly_mode receive:', note, value, old, index);
			if((value>0)&&(index=-1))
			{
				debug('adding:', note, value, index);
				old.push(note);
				this.set_value(old);
			}
			else if((value==0)&&(index!=-1))
			{
				debug('removing:', note, value, index);
				old.splice(index,1);
				if(old.length)
				{
					this.set_value(old);
				}
				else
				{
					this.set_value([-1]);
				}
			}
			//debug('receive poly, new_value is:', polyobj.getvalueof());
			break;
	}
	this.update();
}

RegisteredChordNotifier.prototype.toggle = function(note, value)
{
	debug('toggle', note, value);
	var pad = ZoneSettings.current_edit();
	var polyobj = pad['_layers'][this._layer_number]['_'+this._polyobj];
	var old = polyobj.getvalueof();
	var index = old.indexOf(note);
	if(value>0)
	{
		messnamed(unique+this._settingsobj, note, index < 0 ? value : 0);
		//debug('sent chord...', note, index = -1 ? value : 0);
	}
	//debug('toggle, new_value is:', polyobj.getvalueof());
}

RegisteredChordNotifier.prototype.set_value = function(value)
{
	//value of <undefined> here causes illegal message selector
	debug(this._name, 'set_value:', value, typeof(value));
	var pad = ZoneSettings.current_edit();
	var polyobj = pad['_layers'][this._layer_number]['_'+this._polyobj];
	this._value = value === undefined ? [-1] : value;
	debug('about to fail?', this._value);
	polyobj.message(this._value);
	this.notify();
	storageTask = true;
	//debug('set_value, new_value is:', polyobj.getvalueof());
}

RegisteredChordNotifier.prototype.clear_assignment = function(value)
{
	debug(this._name, 'clear_assignment', ZoneSettings.current_edit()._number, this._default_when_cleared ? (ZoneSettings.current_edit()._number)-1 : -1);
	this.set_value(this._default_when_cleared ? (ZoneSettings.current_edit()._number)-1 : -1);
	this.update();
}

RegisteredChordNotifier.prototype.update_scroll_position = function()
{
	//var val = ZoneSettings.current_edit()['_layers'][this._layer_number]['_'+this._polyobj].getvalueof()[0];
	this._value.sort();
	var val = this._value[0];
	val = val != -1 ? val : this._value.length > 1 ? this._value[2] : 0;
	var current_position = slider.getvalueof();
	debug('current_kslider_position:', current_position, val);
	var val_lo = val - 25;
	
	debug('update_scroll_position', val, val_lo, current_position, Math.floor(val/12)*12);
	//if((current_position > val)||(current_position < val_lo))
	//{
	slider.message(Math.floor(val/12)*12);
	//}
}


CellClass = function(x, y, identifier, name, _send, args)
{
	this.add_bound_properties(this, ['_num', '_chord', 'group', '_push_note', 'update_color']);
	this._num = (x + (y*8));
	this.group = 0;
	this._chord = false;
	this._push_note = (Math.abs(y-7)*8)+(x+36);
	CellClass.super_.call(this, identifier, name, _send, args);
}

inherits(CellClass, ButtonClass);

CellClass.prototype.update_color = function(supress_block)
{
	//this needs to be moved to the Pad instead.
	//this.send(KEYCOLORS[this.group]);
}

CellClass.prototype.update_group_assignment = function()
{
	//debug('update_group_assignment:', cellDict.get(this._name));
	var num = cellDict.get(this._name);
	pads[num > -1 ? num : 0].add_cell(this);
	//pads[cellDict.get(this._name)].add_cell(this);
}

CellClass.prototype.send = function(value, suppress_block, flash)
{
	//midiBuffer[this._type][this._id] = [this, value];
	this.flash(flash);
	this._last_sent_value = value;
	this._send(value, suppress_block);
}


var LayerVars = ['mono', 'port', 'chord_gate', 'chord', 'chord_channel'];

//'gate', 'id', 

LayerClass = function(layer_number, patcher, name, args)
{
	var self = this;
	this._patcher = patcher;
	this._layer_number = layer_number;
	//debug('making layer:', i, this._patcher);
	var bound_props = [];
	for(var i in LayerVars)
	{
		var script_name = LayerVars[i];
		//debug('looking for:',  script_name);
		this['_'+script_name] = this._patcher.subpatcher().getnamed(script_name);
		bound_props.push('_'+script_name);
	}
	LayerClass.super_.call(this, name, args);
	this.add_bound_properties(this, bound_props);
}

inherits(LayerClass, Bindable);



var PolyVars = ['target_device', 'toggled_state', 'toggle_note', 'mod_sustain', 'mask', 'modifier_assignments', 'color', 'cc_id', 'cc_enable', 'remote_enable', 'remote_id', 'remote_scale_lo', 
				'remote_scale_hi', 'remote_scale_exp', 'cc_scale_lo', 'cc_scale_hi', 'cc_scale_exp', 'remote_id_init_gate',
				'breakpoint', 'breakpoint_obj', 'chord_flush', 'cc_channel', 'cc_port'];

var ZONE_ON_COLOR = colors.WHITE;

ZoneClass = function(num, patcher, name, args)
{
	var self = this;
	this._number = num;  //this starts @1, coresponds with poly#
	this.add_bound_properties(this, ['_patcher', '_cells', '_mod_assigns', 'update_mod_assignments', 'get_cells', 'add_cell', 'remove_cell', 'clear_cells', 'reassign_color', 'update_color', 'send']);
	this._patcher = patcher;
	this._cells = [];
	this._layers = [];
	for(var i in PolyVars)
	{
		var script_name = PolyVars[i];
		this['_'+script_name] = this._patcher.getnamed(script_name);
	}
	for(var i=0;i<4;i++)
	{
		this._layers[i] = new LayerClass(i, this._patcher.getnamed('layer_'+i), 'layer_'+i);
	}
	this._mod_assigns = [];
	this.update_mod_assignments();
	this._current_color = this._color.getvalueof();
	ZoneClass.super_.call(this, name, args);
}

inherits(ZoneClass, Bindable);

ZoneClass.prototype.initialize = function()
{
	this._remote_id_init_gate.message(1);
}

ZoneClass.prototype.update_mod_assignments = function()
{
	this._mod_assigns = [];
	var assgn = this._modifier_assignments.getvalueof()
	while(assgn.length)
	{
		var x = assgn.shift();
		var y = assgn.shift();
		this._mod_assigns.push(assgn.shift());
	}
	//debug('update_mod_assignments', this._name, this._mod_assigns);
}

ZoneClass.prototype.get_cells = function()
{
	return this._cells;
}

ZoneClass.prototype.add_cell = function(cell)
{
	//debug('cell:', cell._name, 'group:', cell.group);
	if(cell.group>-1){pads[cell.group].remove_cell(cell);}
	cell.group = this._number-1;
	cellDict.set(cell._name, cell.group);
	push_notes.message(cell._push_note, cell.group+1);  //patcher ignores a 0 assignment coming from push_notes coll
	//pushDict.set(cell._push_note, cell.group);
	if(this._cells.indexOf(cell)<0)
	{
		this._cells.push(cell);
	}
	//debug(this._name, 'add_cell', cell._name, 'group is now:', this._number, 'zone_members:', this._cells.length);
	//dirtyStorage();
}

ZoneClass.prototype.remove_cell = function(cell)
{
	//var index = this._cells.indexOf(cell);
	//if(index>0)
	//{
	//	this._cells.splice(index, 1);
	//}
	for(var i in this._cells)
	{
		if(this._cells[i] == cell)
		{
			this._cells.splice(i, 1);
		}
	}
	//cell.group = 0;
	//cellDict.set(cell._name, cell.group);
}

ZoneClass.prototype.clear_cells = function()
{
	for(var i in this._cells)
	{
		this.remove_cell(this._cells[i]);
	}
	this._cells = [];
}

ZoneClass.prototype.reassign_color = function()
{
	this._current_color = this._color.getvalueof();
	this.update_color();
}

ZoneClass.prototype.update_color = function(suppress_block)
{
	var page = MainModes.current_page();
	if((page == mainPage)&&(!mainPage._moded))
	{
		var toggled = Math.floor(this._toggled_state.getvalueof());
		//debug('toggled:', toggled, this._current_color, this._current_color + toggled);
		for(var i in this._cells)
		{
			this._cells[i].send(toggled ? colors.WHITE : this._current_color, suppress_block);
		}
	}
}

ZoneClass.prototype.send = function(val, suppress_block)
{
	//debug(this._name, 'send', val, this._cells.length);
	for(var i in this._cells)
	{
		//debug(this._cells[i]._name, val);
		this._cells[i].send(val, suppress_block);
	}
}



ExternalChordAssigner = function(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['_chord_number']);
	ExternalChordAssigner.super_.call(this, name, args);
	this._chord_number = new RadioComponent(this._name + '_ChordNumber', 0, 3, 0, function(){}, colors.WHITE, colors.RED, {'value':0});
}

inherits(ExternalChordAssigner, Bindable);

ExternalChordAssigner.prototype.receive = function(args)
{
	//var args = arrayfromargs(arguments);
	//debug('ExternalChordAssigner receive:', args);
	switch(args[1])
	{
		case 'chord_thru':
			poly.message('target', ZoneSettings._poly_index);
			poly.message('chordout', args[2], args[3]);
			break;
		case 'chord_number':
			this._chord_number.receive(args[2]);
			break;
		case 'assign':
			var number = this._chord_number._value;
			var polyobj = ZoneSettings.current_edit()._layers[number]['_chord'];
			var new_args = args.slice(2);
			new_args.unshift(-1);
			debug('new_args:', new_args);
			if(new_args.length>2)
			{
				ZoneSettings.chord_monos(number).set_value(1);
			}
			polyobj.message(new_args);
			storageTask=true;
			var name = ZoneSettings.chord_assigners(number)['_settingsobj'];
			//debug('name:', name);
			var chord_assignment = script[name];
			chord_assignment.message('clear');
			for(var i in new_args)
			{
				chord_assignment.message('set', new_args[i], 127);
			}
			Scales.update_chord_display();
			break;
	}
}



DefaultPageStackBehaviourWithModeShift = function(parent_mode_object)
{
	//debug('initializing DefaultPageStackBehaviourWithModeShift');
	var self = this;
	var parent = parent_mode_object;
	this.press_immediate = function(button)
	{
		//debug('press_immediate', parent, parent.mode_buttons);
		var mode = parent.mode_buttons.indexOf(button);
		if(mode!=parent.current_mode())
		{
			parent.splice_mode(mode);
			parent.push_mode(mode);
			parent.recalculate_mode();
		}
		else
		{
			var page = parent.current_page();
			parent.current_page()._mode_button_value(button);
		}
	}
	this.press_delayed = function(button)
	{
		//debug('press_delayed');
		
	}
	this.release_immediate = function(button)
	{
		//debug('release_immediate');
		parent.clean_mode_stack();
		var mode = parent.mode_buttons.indexOf(button);
		if(mode==parent.current_mode())
		{
			parent.current_page()._mode_button_value(button);
		}
	}
	this.release_delayed = function(button)
	{
		//debug('release_delayed');
		var mode = parent.mode_buttons.indexOf(button);
		//if(mode!=parent.current_mode())
		//{
			parent.pop_mode(mode);
			parent.recalculate_mode();
		//}
		//else
		//{
			parent.current_page()._mode_button_value(button);
		//}
	}
}

ModeSwitchablePage = function(name, args)
{
	var self = this;
	this._moded = false;
	this.add_bound_properties(this, ['_moded', '_mode_button_value']);
	ModeSwitchablePage.super_.call(this, name, args);
}

inherits(ModeSwitchablePage, Page);

ModeSwitchablePage.prototype._mode_button_value = function(obj)
{
	//lcl_debug('old altValue');
	//debug('_mode_button_value', obj, obj._value);
	var new_mode = false;
	if(obj)
	{
		new_mode= obj._value > 0;
	}
	if(new_mode != this._moded)
	{
		this._moded = new_mode;
		this.update_mode();
	}
}



TrackInputSourceComponent = function(name, args)
{
	var self = this;
	//debug('ROOT DEVICE IS:', this._liveobj.get('name'));
	TrackInputSourceComponent.super_.call(this, name, args);
	this._liveobj = new LiveAPI(this._apiCallback, 'this_device');
	this.find_root_track(this._liveobj);
	this._liveobj.property = this._apiProperty;

}

inherits(TrackInputSourceComponent, ParameterClass);

TrackInputSourceComponent.prototype.find_root_track = function(obj)
{
	if(obj.id > 0)
	{
		if(obj.type == 'Track')
		{
			return (obj);
		}
		else
		{
			obj.goto('canonical_parent');
			this.find_root_track(obj);
		}
	}
	else
	{
		return undefined;
	}
}

TrackInputSourceComponent.prototype.receive = function(value)
{
	this.Super_().prototype.receive.call(this, value);
	this.update();
}

TrackInputSourceComponent.prototype.update = function()
{
	var name = this._value.replace(/\(|\)|\"/gi, '');
	//debug('replaced name:', name);
	debug('TrackInputSourceComponent.update', name, name.length, outputPort, outputPort.length, name == outputPort);
	if((name == 'All Ins')||(name == outputPort))
	{
		var mode = input_mode.getvalueof();
		if(mode==2)
		{
			input_mode.message(0);
		}
		input_mode.message('enableitem', 2, 0);
	}
	else
	{
		input_mode.message('enableitem', 2, 1);
	}
}



SkinEditorComponent = function(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['update']);
	SkinEditorComponent.super_.call(this, name, args);
	//this.set_frontEnd();
	//this.update();
}

inherits(SkinEditorComponent, Bindable);

SkinEditorComponent.prototype.set_frontEnd = function()
{
	debug('SkinEditorComponent.set_frontEnd');
	if(glob.skin_editor)
	{
		//this._frontEnd = glob.skin_editor;
		//for(var i in glob.skin_editor)
		//{
		//	debug(i, glob.skin_editor[i]);
		//}
	}
}

SkinEditorComponent.prototype.update = function()
{
	debug('SkinEditorComponent.update');
	if(glob.skin_editor)
	{
		glob.skin_editor.debug('SkinEditorComponent.update()');
	}
	debug('done');
}

SkinEditorComponent.prototype.transform_pad = function(pad)
{
	debug('transform_pad:', pad._name);
	var frontEnd = glob.skin_editor;
	if(frontEnd)
	{
		var current_edit = ZoneSettings.current_edit();
		var function_selector_val = frontEnd.function_selector_val;
		var incremental_val = frontEnd.incremental_val;
		var which_value_val = frontEnd.which_value_val === 'local';
		var note_val = frontEnd.note_val;
		var channel_val = frontEnd.channel_val;
		var next_value_val = frontEnd.next_value_val;
		debug('which value:', frontEnd.which_value_val, which_value_val);
		switch(function_selector_val)
		{
			case 0:
				var val = which_value_val ? frontEnd.grab_and_advance_channel_value() : ZoneSettings._chord_channel._value;
				//debug('value is:', val);
				pad._layers[0]._chord_channel.message(val);
				break;
			case 1:
				//pad._layers[0]._id.message(which_value_val ? frontEnd.grab_and_advance_note_value() : current_edit._note._value);
				pad._layers[0]._mono.message(which_value_val ? 0 : ZoneSettings._main_mono._value);
				//debug('chord is:', ZoneSettings._note_chord._value);
				pad._layers[0]._chord.message(which_value_val ? [-1, frontEnd.grab_and_advance_note_value()] : ZoneSettings._note_chord._value);
				ZoneSettings._note_chord.update();
				break;
			case 2:
				pad._layers[0]._chord_channel.message(0);
				pad._layers[0]._mono.message(0);
				pad._layers[0]._chord.message([-1, pad._number-1]);
				ZoneSettings._note_chord.update();
				debug('reset to default');
				break;
		}
		//debug('values now, channel:', pad._layers[0]._chord_channel.getvalueof(), 'id:', pad._layers[0]._id.getvalueof());
		if(pad == current_edit)
		{
			ZoneSettings.update();
		}
	}
}



MiraGridComponent = function(name, args)
{
	var self = this;
	this.add_bound_properties(this, ['_grid', 'set_grid', 'update', '_button_press']);
	this._grid = undefined;
	this._cells = undefined;
	MiraGridComponent.super_.call(this, name, args);
}

inherits(MiraGridComponent, Bindable);

MiraGridComponent.prototype.set_grid = function(grid)
{
	debug('MiraGridComponent set_grid', grid);
	if(this._grid instanceof GridClass)
	{
		this._grid.remove_listener(this._button_press);
	}
	this._grid = grid;
	if(this._grid instanceof GridClass)
	{
		this._grid.add_listener(this._button_press);
	}
	this._update();
}

MiraGridComponent.prototype.update = function()
{
}

MiraGridComponent.prototype._button_press = function()
{
	var args = arrayfromargs(arguments)
	//debug('MiraGrid._button_press:', args);
	if(args[0] == 'region')
	{
		var x = args[1]%8;
		var y = Math.floor(args[1]/8);
		var z = args[3] ? 127 : 0;
		if(MainModes.current_mode() == 0)
		{
			main_note_input.message('list', (x + (y*8) + 36), z);
		}
		grid(x, y, z);
	}
}

MiraGridComponent.prototype._key_press = function()
{
	var args = arrayfromargs(arguments)
	//debug('MiraGrid._button_press:', args);
	if(args[0] == 'region')
	{
		key(args[1], args[3] ? 127 : 0);
	}
}

MiraGridComponent.prototype._shift_press = function()
{
	var args = arrayfromargs(arguments)
	//debug('MiraGrid._button_press:', args);
	if(args[0] == 'region')
	{
		shift(args[3] ? 127 : 0);
	}
}

MiraGridComponent.prototype._alt_press = function()
{
	var args = arrayfromargs(arguments)
	//debug('MiraGrid._button_press:', args);
	if(args[0] == 'region')
	{
		alt(args[3] ? 127 : 0);
	}
}

MiraGridComponent.prototype.send = function(x, y, val)
{
	this._cells[x + (y*8)].message('bgcolor', ROLI.PALLETTE[val]);
}



DeviceModule = function(name, args)
{
	var self = this;
	this._drumrack_id = 0;
	this.add_bound_properties(this, ['update', 'setup_device', 'select_pad_device', 'detect_drumrack', 'select_parameter', 'clear_parameter', 'parameter_name_from_id', 'update_remote_targets']);
	DeviceModule.super_.call(this, name, args);
}

inherits(DeviceModule, Bindable);

DeviceModule.prototype.update = function(){}

DeviceModule.prototype.setup_device = function()
{
	mod.Send('receive_device', 'set_mod_device_type', 'Skin');
	mod.Send( 'receive_device', 'set_number_params', 16);
	for(var dev_type in SKIN_BANKS)
	{
		for(var bank_num in SKIN_BANKS[dev_type])
		{
			mod.SendDirect('receive_device_proxy', 'set_bank_dict_entry', dev_type, bank_num, SKIN_BANKS[dev_type][bank_num]);
		}
		//mod.Send('receive_device_proxy', 'update_parameters');
	}
	//debug('current parameters:', mod.Send('receive_device_proxy', 'current_parameters'));
	mod.Send('code_encoders_to_device', 'value', 1);
	this.detect_drumrack();
}

DeviceModule.prototype.select_pad_device = function(note)
{
	//debug('select_pad_device:', note);
	if(this._drumrack_id>0)
	{
		mod.Send( 'send_explicit', 'receive_device_proxy', 'set_mod_device_parent', 'id', drumrack_id);
		mod.Send( 'receive_device_proxy', 'set_mod_drum_pad', note);
	}
}

DeviceModule.prototype.detect_drumrack = function()
{
	this._finder.goto('this_device');
	var this_id = parseInt(finder.id);
	this._finder.goto('canonical_parent');
	var track_id = parseInt(this._finder.id);
	var found_devices = finder.getcount('devices');
	for (var i=0;i<found_devices;i++)
	{
		this._finder.id = track_id;
		this._finder.goto('devices', i);
		if(finder.get('class_name')=='DrumGroupDevice')
		{
			this._drumrack_id = parseInt(finder.id);
			//debug('DrumRack id:', drumrack_id);
			break;
		}
	}
}

DeviceModule.prototype.select_parameter = function(poly_num)
{
	this._finder.goto('live_set', 'view', 'selected_parameter');
	pads[poly_num-1]._remote_id.message(parseInt(this._finder.id));
	pads[poly_num-1]._remote_scale_lo.message(parseInt(this._finder.get('min')));
	pads[poly_num-1]._remote_scale_hi.message(parseInt(this._finder.get('max')));
	storageTask=true;
	ZoneSettings.update_device();
}

DeviceModule.prototype.clear_parameter = function(poly_num)
{
	pads[poly_num-1]._remote_id.message(0);
	ZoneSettings.update_device();
}

DeviceModule.prototype.parameter_name_from_id = function(id)
{
	var new_name = 'None';
	this._finder.id = parseInt(id);
	if(id > 0)
	{
		var new_name = [];
		new_name.unshift(this._finder.get('name'));
		this._finder.goto('canonical_parent');
		this._finder.goto('canonical_parent');
		new_name.unshift(' || ');
		new_name.unshift(this._finder.get('name'));
		new_name = new_name.join('');
		new_name = new_name.slice(0, 25);
	}
	return new_name;
}

DeviceModule.prototype.update_remote_targets = function()
{
	for(var i in pads)
	{
		pads[i]._remote_id_init_gate.message(1);
		pads[i]._remote_id.message('bang');
	}
}



///  Blocks Lightpad Stuff

function _update_topology()
{
	debug('update_topology');
	topology = dict_to_jsobj(topDict);
	if(blocks_patcher)
	{
		var a = (blocks_patcher.subpatcher().getnamed('block1_scene').getvalueof());
		var b = (blocks_patcher.subpatcher().getnamed('block2_scene').getvalueof());
		var c = (blocks_patcher.subpatcher().getnamed('block3_scene').getvalueof());
		var d = (blocks_patcher.subpatcher().getnamed('block4_scene').getvalueof());
		blocks_patcher.subpatcher().getnamed('blocks_pad').message('scene', a, 1, b, 2, c, 3, d, 4);
		debug('sending scene:', a, 1, b, 2, c, 3, d, 4);
	}
	else
	{
		//tasks.addTask(_update_topology, [], 4);
	}
}

function _update_topology(){}

function _blockNote(note, val)
{
	var args = arrayfromargs(arguments);
	//debug('BlockNote', (note-36)%8, Math.abs(Math.floor((note-36)/8)-7), val);
	//var x = (note-36)%8, y = (note-36)/8;
	_grid((note-36)%8, Math.abs(Math.floor((note-36)/8)-7), val);
}

function _blockMode(val)
{
	if(val)
	{
		if(blocks_page_visible)
		{
			blocks_pcontrol.message('close');
			blocks_page_visible = false;
			//blocks_patcher.wclose();
		}
		else
		{
			blocks_pcontrol.message('open');
			blocks_page_visible = true;
			//blocks_patcher.open();
		}
	}
}

function blocks_patcher_unlock()
{
	blocks_patcher.window('size', 0, 400, 1190, 800);
	blocks_patcher.window('flags', 'minimize');
	blocks_patcher.window('flags', 'zoom');
	blocks_patcher.window('flags', 'close');
	blocks_patcher.window('flags', 'grow');
	blocks_patcher.window('flags', 'title');
	blocks_patcher.window('flags', 'nofloat');
	blocks_patcher.window('exec');
}

function blocks_patcher_lock()
{
	blocks_patcher.window('size', 80, 80, 375, 600);
	blocks_patcher.window('flags', 'nominimize');
	//blocks_patcher.window('flags', 'nozoom');
	blocks_patcher.window('flags', 'noclose');
	blocks_patcher.window('flags', 'nogrow');
	//blocks_patcher.window('flags', 'notitle');
	blocks_patcher.window('flags', 'float');
	blocks_patcher.window('exec');
}



function info()
{
	debug('info...');
	info_pcontrol.message('open');
	//info_patcher.subpatcher().getnamed('info_text').message('set', [INFO, SETUP_INFO, OVERVIEW_INFO, KEY_INFO]);
}



function freebang()
{
	debug('freebang');
	glob.skin = undefined;
	miraEnable = false;
	setup_mira_interface();
	//delete glob.skin;
}

forceload(this);



//Chromatic Major Minor Dorian Mixolydian Lydian Phrygian Locrian Diminished Whole-half WholeTone MinorBlues MinorPentatonic MajorPentatonic HarmonicMinor MelodicMinor Dominant Sus SuperLocrian NeopolitanMinor NeopolitanMajor EnigmaticMinor EnigmaticComposite Bebop Locrian BebopDominant BebopMajor Bhairav HungarianMinor MinorGypsy Persian Hirojoshi In-Sen Iwato Kumoi Pelog Spanish
