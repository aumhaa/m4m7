autowatch = 1;

function init()
{
	display = new LiveAPI(callback, 'control_surfaces', 1);
}

function display_message(message)
{
	display.call('display_message', message);
}

function callback(){}