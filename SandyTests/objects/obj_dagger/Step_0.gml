/// @description Insert description here
// You can write your code in this editor
if(stop == false)
{
	x += hspd * 1.5;
	y += vspd * 1.5;
	image_angle += 12;
	vspd += 0.3;
	if(a < 20)a += 1;
} else
{
	image_angle = 135;
	a = 1;
}
life++;