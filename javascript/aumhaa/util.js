autowatch = 1;

function inherits(ctor, superCtor)
{
	ctor.super_ = superCtor;
	ctor.prototype = Object.create(superCtor.prototype, {constructor:{value: ctor, enumerable: false, writable: true, configurable: true}});
	ctor.prototype.Super_ = function(){return superCtor;}
}

exports.inherits = inherits;

function extend(destination, source)
{
	for (var k in source) 
	{
		if (source.hasOwnProperty(k))
		{
			destination[k] = source[k];
		}
	}
	return destination; 
}

exports.extend = extend;

function clone_with_extension(source, mixins)
{
	//var destination = function () {}
	var destination = source.clone();
	//inherits(destination, source);
	//destination.prototype = Object.create(source.prototype, mixins);
	//destination.prototype.constructor = source;
	for (var k in source)
	{
		//debug('in source:', k);
		if (source.hasOwnProperty(k))
		{
			//debug('copying to dest:', k, source[k]);
			destination.prototype[k] = source[k];
		}
	}
	inherits(destination, source);
	for (var k in mixins)
	{
		//debug('in mixins:', k);
		if (mixins.hasOwnProperty(k))
		{
			//debug('copying to dest:', k, mixins[k]);
			destination.prototype[k] = mixins[k];
		}
	}
	return destination;
}

exports.clone_with_extension = clone_with_extension;

aumhaaSetup = function(script)
{
	script['autowatch'] = 1;
	Function.prototype.clone = function()
	{
		var that = this;
		var temp = function temporary() { return that.apply(this, arguments); };
		for(var key in this) {
			if (this.hasOwnProperty(key)) {
				temp[key] = this[key];
			}
		}
		return temp;
	};
	script['inherits'] = inherits;
}

function override(object, methodName, callback)
{
	object[methodName] = callback(object[methodName])
}

exports.override = override;

function after(extraBehavior)
{
	return function(original)
	{
		return function()
		{
			var returnValue = original.apply(this, arguments)
			extraBehavior.apply(this, arguments)
			return returnValue
		}
	}
}

exports.after = after;

var toClass = {}.toString

exports.toClass = toClass;

function protoarrayfromargs(args)
{
	return Array.prototype.slice.call(args, 0);
}

exports.protoarrayfromargs = protoarrayfromargs;

function flatten1(args)
{
	var arr =  Array.prototype.slice.call(args, 0);
	for(var i=0;i<arr.length;i++)
	{
		if(arr[i] instanceof Array)
		{
			var a = [i, arr[i].length].concat(arr[i]);
			arr.splice.apply(arr, a);
		}
	}
	return arr;
}

exports.flatten1 = flatten1;

//Used to post when DEBUG is true
//Setup in js by:
//debug = (DEBUG&&Debug) ? Debug : function(){};

function assign_jsarg_attributes()
{
	for(var i=0;i<jsarguments.length;i++)
	{
		if(jsarguments[i].toString().charAt(0) == '@')
		{
			var new_att = jsarguments[i].slice(1).toString();
			script[new_att] = jsarguments[i+1];
		}
	}
}

exports.assign_jsarg_attributes = assign_jsarg_attributes;

function deprivatize_script_functions(script)
{
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			//debug('replacing', i, '\n');
			script[i.replace('_', "")] = script[i];
		}
	}
}

exports.deprivatize_script_functions = deprivatize_script_functions;

Debug = function()
{
	var args = protoarrayfromargs(arguments);
	for(var i in args)
	{
		if(args[i] instanceof Array)
		{
			args[i] = args[i].join(' ');
		}
	}
	post('debug->', args, '\n');
}

exports.Debug = Debug;

//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1
//should only be turned on while editing
//Setup in js by:
//forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

Forceload = function(script)
{
	post('FORCELOAD!!!!!!!\n');
	script.init(1);
}

exports.Forceload = Forceload;

/*function concat_properties(instance, new_properties)
{
	var old_props = instance._bound_properties ? instance._bound_properties : [];
	return old_props.concat(new_properties);
}*/

/*function bind_properties(obj, prop_list)
{
	debug('binding properties for:', obj._name, prop_list);
	for(var index in prop_list)
	{
		var prop = prop_list[index];
		if(obj.constructor.prototype[prop])
		{
			debug('has prop:', prop);
			obj[prop] = obj.constructor.prototype[prop].bind(obj);
		}
	}
}*/

/*function clone (obj)
{
	function CloneFactory () {}
	CloneFactory.prototype = obj;

	return new CloneFactory();
}*/

//MyClass.prototype = clone(AnotherClass.prototype);

function startsWith(str, search)
{
	return str.lastIndexOf(search, 0) === 0;
}

exports.startsWith = startsWith;

function parse_ids(arr)
{
	return arr.filter(function(element){return element == 'id' ? false : element == '' ? false : true});
}

exports.parse_ids = parse_ids;

function dict_to_jsobj(dict) {
	if (dict == null) return null;
	var o = new Object();
	var keys = dict.getkeys();
	if (keys == null || keys.length == 0) return null;
	if (keys instanceof Array) {
		for (var i = 0; i < keys.length; i++)
		{
			var value = dict.get(keys[i]);
			
			if (value && value instanceof Dict) {
				value = dict_to_jsobj(value);
			}
			o[keys[i]] = value;
		}		
	} else {
		var value = dict.get(keys);
		
		if (value && value instanceof Dict) {
			value = dict_to_jsobj(value);
		}
		o[keys] = value;
	}
	return o;
}

exports.dict_to_jsobj = dict_to_jsobj;

function wiki()
{
	if((mod!=undefined)&&(mod.wiki_addy!=undefined))
	{
		max.launchbrowser(mod.wiki_addy);
	}
	else
	{
		max.launchbrowser('http://www.aumhaa.com/wiki/index.php?title=Mainpage');
	}
}

exports.wiki = wiki;