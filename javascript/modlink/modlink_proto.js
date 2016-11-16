autowatch = 1;

var script = this;
var unique = jsarguments[1];
var protocol = 1;
var prefix="256";
var in_port = parseInt(unique) + 10000;
var out_port = 8000;
var slash=new RegExp(/^\//);
var space=new RegExp(/^\S/);

var xquads = [{'X':0, 'Y':0}, {'X':8, 'Y':0}, {'X':0, 'Y':8}, {'X':8, 'Y':8}];
var yquads = [{'X':0, 'Y':0}, {'X':0, 'Y':8}, {'X':8, 'Y':0}, {'X':8, 'Y':8}];

aumhaa = require('_base');
var FORCELOAD = false;
var DEBUG = false;
aumhaa.init(this);

var colors = {'Aumpad': ['fill',  127],
				'Launchpad': ['fill', 127],
				'Monochrome': ['fill', 127],
				'OhmRGB': ['fill', 127]};


var Mod = ModComponent.bind(script);

function send_color(val)
{
	mod.Send('grid', 'value', 0, 0, val);
}

function setup_colors()
{
	mod.Send( 'fill_color_map', 'Push', 0, 49, 49, 49, 49, 57, 57, 57, 57, 50, 50, 50, 51, 51, 51, 1);
}

function loadbang()
{
	this.patcher.getnamed('service').message('name', 'modlink_'+unique);
	this.patcher.getnamed('service').message('bang');
}

function init()
{
	debug('init modlink_proto.js', unique);
	mod = new Mod(script, 'modlink', unique, true);
	//mod.debug = debug;
	//mod.wiki_addy = 'fuckoff';
	mod_finder = new LiveAPI(mod_callback, 'this_device');
	mod.assign_api(mod_finder);
	//debug('mod.wiki_addy:', mod.patch_type, mod.unique, mod.legacy, mod._type);
}

function mod_callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//debug('mod callback:', args);
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

function alive(val)
{
	debug('alive', val);
	mod.Send('set_legacy', 1);
	initialize(val);
}

function initialize(val)
{
	debug('init');
	if(val)
	{
		setup_colors();
		set_prefix(this.patcher.getnamed('prefixbox').getvalueof().toString());
		set_inport(this.patcher.getnamed('inportbox').getvalueof());
		set_outport(this.patcher.getnamed('outportbox').getvalueof());
		debug('inits:', prefix, in_port, out_port);
	}
}

function set_prefix(str)
{
	debug('set_prefix', str);
	prefix=str.replace(slash, "");
	debug("prefix:", prefix);
	change_protocol(protocol);
}

function set_inport(val)
{
	debug('set_inport', val);
	if(!val)
	{
		val = 10000 + parseInt(unique);
		this.patcher.getnamed('inportbox').message('set', val);
	}
	in_port = val;
	this.patcher.getnamed('udpin').message('port', in_port);
	this.patcher.getnamed('service').message('port', in_port);
	this.patcher.getnamed('service').message('bang');
}

function set_outport(val)
{
	debug('set_outport', val);
	out_port = val;
	this.patcher.getnamed('udpout').message('port', out_port);
}

function change_protocol(val)
{
	debug('change_protocol', val);
	protocol = Math.floor(val>0);
	switch(protocol)
	{
		case 0:
			//this.patcher.getnamed('prependout').message('set', '/'+prefix+'/press');
			outprefix = '/'+prefix+'/press';
			break;
		case 1:
			//this.patcher.getnamed('prependout').message('set', '/'+prefix+'/grid/key');
			outprefix = '/'+prefix+'/grid/key';
			break;
	}
}

function anything()
{
	var args=arrayfromargs(arguments);
	var str=messagename.split("/");
	debug('anything:', str, args);
	for (i in str)
	{
		str[i].replace(space, "");
	}
	//debug('de-spaced:', str);
	if(protocol==0)
	{
		switch (str[2])
		{
			case "led":	   
				mod.Send('grid', 'value', args[0], args[1], args[2]);
				break;
			case "clear":
				for(var x=0;x<15;x++)
				{
					for(var y=0;y<15;y++)
					{
						mod.Send('grid', 'all', 0);
					}
				}
			case "led_col":
				var dec1=dectobin(args[1]);
				for(var i=0;i<dec1.length;i++)
				{
					mod.Send('grid', 'value', parseInt(args[0]), i, dec1[i]);
				}
				break;
			case "led_row":
				var dec1=dectobin(args[1]);
				for(var i=0;i<dec1.length;i++)
				{
					mod.Send('grid', 'value',  i, parseInt(args[0]), dec1[i]);
				}
				break;
			case "prefix":
				this.patcher.getnamed('prefixbox').message('set', '/'+args[0]);
				this.patcher.getnamed('prefixbox').message('bang');
				//outlet(0, "/sys/"+prefix);  //causes feedback loop
				break;
			case "cable":
				debug('cable', args);
				break;
		}
	}
	else
	{
		switch(str[1])
		{
			case prefix:
				debug('match prefix');
				switch(str[2])
				{
					case 'grid':
						debug('grid');
						if(str[3]=='led')
						{
							switch(str[4])
							{
								case 'set':
									mod.Send('grid', 'value', args[0], args[1], args[2]);
									break;
								case 'all':
									mod.Send('grid', 'all', args[0]);
									break;
								case 'map':
									if(args.length == 10)
									{
										mod.Send('grid', 'map', args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
									}
									break;
								case 'row':
									if((args.length > 2)&&(args[0]%8==0))
									{
										var xOff = args.shift();
										var yOff = args.shift();
										for(var index=0;index<args.length;index++)
										{
											var dec1=dectobin(args[index]);
											for(var i=0;i<dec1.length;i++)
											{
												X = xOff+i+xquads[index].X;
												Y = yOff+xquads[index].Y;
												mod.Send('grid', 'value', X%16, Y%16, dec1[i]);
											}
										}
									}
									break;
								case 'col':
									if((args.length > 2)&&(args[1]%8==0))
									{
										var xOff = args.shift();
										var yOff = args.shift();
										for(var index=0;index<args.length;index++)
										{
											var dec1=dectobin(args[index]);
											for(var i=0;i<dec1.length;i++)
											{
												X = xOff+yquads[index].X;
												Y = yOff+i+yquads[index].Y;
												mod.Send('grid', 'value', X%16, Y%16, dec1[i]);
											}
										}
									}
								case 'level':
									switch(str[5])
									{
										case 'set':
											mod.Send('grid', 'value', args[0], args[1], args[2]);
											break;
										case 'all':
											mod.Send('grid', 'all', args[0]);
											break;
										case 'map':
											if(args.length == 10)
											{
												mod.Send('grid', 'map', args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
											}
											break;
										case 'row':
											if((args.length > 2)&&(args[0]%8==0))
											{
												var xOff = args.shift();
												var yOff = args.shift();
												debug('level/row, args length:', args.length, 'args:', args);
												for(var index=0;index<args.length;index++)
												{
													mod.Send('grid', 'value', xOff+index, yOff, args[index]);
												}
											}
											break;
										case 'col':
											if((args.length > 2)&&(args[1]%8==0))
											{
												var xOff = args.shift();
												var yOff = args.shift();
												debug('level/col, args length:', args.length, 'args:', args);
												for(var index=0;index<args.length;index++)
												{
													mod.Send('grid', 'value', xOff, yOff+index, args[index]);
												}
											}
										break;
									}
									break;
							}
						}
						break;	  
				}
				break;
			case 'sys':
				debug('sys');
				switch(str[2])
				{
					case 'port':
						debug('setting new output port', args[0]);
						this.patcher.getnamed('outportbox').message('set', args[0]);
						this.patcher.getnamed('outportbox').message('bang');
						break;
					case 'host':
						this.patcher.getnamed('udpout').message('host', args[0]);
						break;
					case 'prefix':
						this.patcher.getnamed('prefixbox').message('set', args[0]);
						this.patcher.getnamed('prefixbox').message('bang');
						break;
					case 'info':
						debug('info', args);
						switch(args.length)
						{
							case 1:
								this.patcher.getnamed('outportbox').message('set', args[0]);
								this.patcher.getnamed('outportbox').message('bang');
								break;
							case 2:
								this.patcher.getnamed('udpout').message('host', args[0]);
								this.patcher.getnamed('outportbox').message('set', args[1]);
								this.patcher.getnamed('outportbox').message('bang');
								break;
						}
						this.patcher.getnamed('udpout').message('/sys/id', unique);
						this.patcher.getnamed('udpout').message('/sys/size', 16, 16);
						this.patcher.getnamed('udpout').message('/sys/host', 'localhost');
						this.patcher.getnamed('udpout').message('/sys/port', out_port);
						this.patcher.getnamed('udpout').message('/sys/prefix', '/'+prefix);
						this.patcher.getnamed('udpout').message('/sys/rotation', 0);
						break;
				}
				break;
		}
	}
}

function dectobin(arg)
{
	var dec = [];
	for(var i=0;i<8;i++)
	{
		dec.unshift(arg&1);
		arg = arg>>>1;
	}
	return dec;
}

function revdectobin(arg)
{
	var dec = [];
	for(var i=0;i<8;i++)
	{
		dec.push(arg&1);
		arg = arg>>>1;
	}
	return dec;
}

function grid(x, y, val)
{
	debug('grid', x, y, val);
	outlet(0, outprefix, x, y, val ? 1 : 0);
}

function host()
{
	var args = arrayfromargs(arguments);
	debug('host:', args);
	var str=args[0].split("/");
	for (i in str)
	{
		str[i].replace(space, "");
	}
	debug('replaced:', str[1], str[2]);
	switch(str[1])
	{
		case 'serialosc':
			switch(str[2])
			{
				case 'list':
					debug('sending out list...');
					this.patcher.getnamed('hostout').message('port', args[2]);
					this.patcher.getnamed('hostout').message('/serialosc/device', unique, 'mod', in_port);
					break;
				case 'notify':
					break;
			}
	}
}

forceload(this);


