/// @description Insert description here
// You can write your code in this editor
if(stop == false)
{
	x += hspd;
	y += vspd;
	image_angle = 180 + point_direction(x, y, xprevious, yprevious);
	vspd += 0.1;
}
life++;