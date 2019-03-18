var char = argument[0];
var xpos = argument[1], ypos = argument[2];
var xx = 0, yy = 0;
if(char.MAXHP > 50)ypos += 5;
for(var i = 0; i < min(char.HPD, 100); i ++)
{
	draw_sprite(spr_hp, 0, xpos + xx * 3, ypos - yy * 9);
	xx += 1;
	if(xx >= 50)
	{
	    xx = 0;
	    yy += 1;
	}
}
if(char.HPD > 100)
{
	xx = 0;
	yy = 0;
	for(var i = 0; i < min(char.HPD - 100, 100); i ++)
	{
		draw_sprite(spr_hp, 1, xpos + xx * 3, ypos - yy * 9);
		xx += 1;
		if(xx >= 50)
		{
		    xx = 0;
		    yy += 1;
		}
	}
}