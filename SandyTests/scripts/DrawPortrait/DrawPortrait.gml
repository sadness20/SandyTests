var charID = argument[0];
var xscale = argument[1];

var xi = argument[2];
var yi = argument[3];

if(global.CHAR[charID, 1] != -1)
{	
	var port = global.PORT[global.CHAR[charID, 1], 0];
	var eyeX = global.PORT[global.CHAR[charID, 1], 1];
	var eyeY = global.PORT[global.CHAR[charID, 1], 2];
	var xx = 0;
	if(xscale == -1)
	{
		xx += 256;
		eyeX = 256 - eyeX;
	}

	var xpos = -eyeX + 52;
	var ypos = -eyeY + 56;

	draw_sprite_ext(port, 0, xpos + xx + xi, ypos + yi, xscale, 1, 0, c_white, 1);
	
	if(sprite_get_number(port) > 1)
	{
		draw_sprite_ext(port, 1, xpos + xx + xi, ypos + yi, xscale, 1, 0, global.CHAR[charID, 38], 1);
	}
}