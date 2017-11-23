
function paint()
{
	var val = box.getvalueof();
	var viewsize = mgraphics.size;
	var valrange = box.getattr("size");
	var width = viewsize[0];
	var height = viewsize[1];
	var ndegrees, start, end;

	mgraphics.set_source_rgba(box.getattr("bgcolor"));
	mgraphics.rectangle(0, 0, width, height);
	mgraphics.path_roundcorners(width*.1)
	mgraphics.fill();

	ndegrees = box.getattr("degrees");	
	start = (270 - ndegrees * 0.5) * (2*Math.PI / 360.);
	end = (270 + ndegrees * 0.5) * (2*Math.PI / 360.);

	mgraphics.arc(width * .5, height * .5, width * .375, start, end);
	mgraphics.set_line_width(width * 0.1 * (box.getattr("thickness") * 0.01));
	mgraphics.set_source_rgba(box.getattr("outlinecolor"));
	mgraphics.set_line_cap("round");
	mgraphics.stroke();

	var c = box.getattr("needlecolor")
	mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]*.3);
	mgraphics.ellipse(width*.3, height*.3, width*.4, height*.4);
	mgraphics.path_roundcorners(width*.2)
	mgraphics.fill();

	switch(box.getattr('mode'))
	{
		default:
			valrange = valrange <= 1? 1 : valrange - 1;
			prop = val / valrange;	
			end -= ndegrees * (2*Math.PI / 360.) * (1 - prop);

			var needle = Math.max(1, Math.ceil((ndegrees*prop)/20));
			mgraphics.set_line_width(width * 0.1 * (box.getattr("thickness") * 0.006));
			start += .02;
			for(var i=0;i<needle;i++)
			{
				mgraphics.set_source_rgba(i==(needle-1) ? [.8, 0, .1, 1] : box.getattr("needlecolor"));
				mgraphics.arc(width * .5, height * .5, width * .375, start, start+.04);
				mgraphics.stroke_with_alpha(.4 + (i/24));
				start += .35;
			}
			break;
		case 1:
			start = (270) * (2*Math.PI / 360.);
			valrange = valrange <= 1? 1 : valrange -1;
			prop = val / valrange;
			if (prop <= .5)
			{
				var needle = Math.max(1, Math.ceil((ndegrees*(.5-prop))/20));
				mgraphics.set_line_width(width * 0.1 * (box.getattr("thickness") * 0.006));
				for(var i=0;i<needle;i++)
				{
					mgraphics.set_source_rgba(i==(needle-1) ? [.8, 0, .1, 1] : box.getattr("needlecolor"));
					mgraphics.arc_negative(width * .5, height * .5, width * .375, start, start-.04);
					mgraphics.stroke_with_alpha(.4 + (i/24));
					start -= .35;
				}
			}
			else
			{
				var needle = Math.max(1, Math.ceil((ndegrees*(prop-.5))/20));
				mgraphics.set_line_width(width * 0.1 * (box.getattr("thickness") * 0.006));
				for(var i=0;i<needle;i++)
				{
					mgraphics.set_source_rgba(i==(needle-1) ? [.8, 0, .1, 1] : box.getattr("needlecolor"));
					mgraphics.arc(width * .5, height * .5, width * .375, start, start+.04);
					mgraphics.stroke_with_alpha(.4 + (i/24));
					start += .35;
				}
			}
			break;
		case 2:
			mgraphics.set_source_rgba(val == valrange - 1 ? [.8, 0, .1, 1] : box.getattr("bgcolor"));
			mgraphics.ellipse(width*.375, height*.375, width*.25, height*.25);
			mgraphics.path_roundcorners(width*.2)
			mgraphics.fill();
			mgraphics.arc(width * .5, height * .5, width * .375, start, end);
			mgraphics.set_line_width(width * 0.1 * (box.getattr("thickness") * 0.01));
			mgraphics.set_source_rgba(val == valrange - 1 ? box.getattr("needlecolor") : box.getattr("outlinecolor"));
			mgraphics.set_line_cap("round");
			mgraphics.stroke();
			break;
	}
}