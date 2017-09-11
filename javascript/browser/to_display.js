autowatch = 1;

inlets = 9;
outlets = 2;


aumhaa = require('_base');
var FORCELOAD = true;
var DEBUG = true;
aumhaa.init(this);

var finder;

var banks = ['*', '*', '*', '*', '*', '*', '*', '*'];

var shifted = false;
var selected_bank = 0;
var main_folder = 'PUSH(oji_presets)';

function init()
{
	debug('init!');
	for(var i=0;i<8;i++)
	{
		banks[i] = this.patcher.getnamed('textedit['+(i+1)+']').getvalueof();
	}
	main_folder = this.patcher.getnamed('main_folder').getvalueof();
	//debug('banks are:', banks);
	outlet(0, 'call_function', 'write_presets_to_lcd', banks[selected_bank], main_folder);
}

function text(args)
{
	var args = arrayfromargs(arguments);
	debug('inlet', inlet, ':', args);
	if(args[0]<8)
	{
		banks[args[0]] = args[1];
	}
}

function mainFolder(val)
{
	main_folder = val;
}

function path()
{
	outlet(0, 'grab', 'RecordButton');
	outlet(0, 'grab', 'Pad_0');
	outlet(0, 'grab', 'Pad_1');
	outlet(0, 'grab', 'Pad_2');
	outlet(0, 'grab', 'Pad_3');
	outlet(0, 'grab', 'Pad_4');
	outlet(0, 'grab', 'Pad_5');
	outlet(0, 'grab', 'Pad_6');
	outlet(0, 'grab', 'Pad_7');
	outlet(0, 'call_function', 'enable_browser_mode',  '1');
}

function RecordButton()
{
	var args = arrayfromargs(arguments);
	debug('RecordButton', args);
	if(args[0] == 'value')
	{
		//outlet(1, value > 64);
		var val = args[1]>64;
		shifted = val;
		this.patcher.getnamed('bank_preset').message('int', val);
	}
	if(args[1]>64)
	{
		display_banks();
	}
	else
	{
		/*for(var i=0;i<8;i++)
		{
			outlet(0, 'call_function', 'write_to_lcd', i, '--------');
		}*/
		outlet(0, 'call_function', 'write_presets_to_lcd', banks[selected_bank], main_folder);
	}
}

function display_banks()
{
	for(var i=0;i<8;i++)
	{
		outlet(0, 'call_function', 'write_to_lcd', i, i==selected_bank ? '> ' + banks[i] : banks[i]);
	}
}

function Pad_0()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_0 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 4;
			this.patcher.getnamed('selected_bank').message('set', 4);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 4, banks[selected_bank], main_folder);
		}
	}
}

function Pad_1()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_1 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 5;
			this.patcher.getnamed('selected_bank').message('set', 5);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 5, banks[selected_bank], main_folder);
		}
	}
}

function Pad_2()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_2 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 6;
			this.patcher.getnamed('selected_bank').message('set', 6);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 6, banks[selected_bank], main_folder);
		}
	}
}

function Pad_3()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_3 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 7;
			this.patcher.getnamed('selected_bank').message('set', 7);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 7, banks[selected_bank], main_folder);
		}
	}
}

function Pad_4()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_4 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 0;
			this.patcher.getnamed('selected_bank').message('set', 0);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 0, banks[selected_bank], main_folder);
		}
	}
}

function Pad_5()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_5 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 1;
			this.patcher.getnamed('selected_bank').message('set', 1);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 1, banks[selected_bank], main_folder);
		}
	}
}

function Pad_6()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_6 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 2;
			this.patcher.getnamed('selected_bank').message('set', 2);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 2, banks[selected_bank], main_folder);
		}
	}
}

function Pad_7()
{
	var args = arrayfromargs(arguments);
	if((args[0] == 'value')&&(args[1]>0))
	{
		debug('Pad_7 value is:', args[1]);
		if(shifted)
		{
			selected_bank = 3;
			this.patcher.getnamed('selected_bank').message('set', 3);
			display_banks();
		}
		else
		{
			outlet(0, 'call_function', 'load_preset', 3, banks[selected_bank], main_folder);
		}
	}
}


forceload(this);
