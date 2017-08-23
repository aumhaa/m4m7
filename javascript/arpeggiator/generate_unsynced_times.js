autowatch = 1;


var times = [15360, 7680, 3840, 1920, 960, 640, 480, 320, 120, 80, 60, 40, 30, 20];

function bang()
{
	var table = [];
	for(var i = 0;i<14;i++)
	{
		var t = times[i];
		var t2 = times[i+1];
		var diff = t - t2;
		var interval = diff/9;
		table.push(t);
		for(var j=0;j<9;j++)
		{
			t -= interval;
			table.push(Math.round(t));
		}
	}
	for(var i=0;i<127;i++)
	{
		outlet(0, i, table[i]);
	}
}
		