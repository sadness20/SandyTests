/// @description Insert description here
// You can write your code in this editor
draw_self();
for(var i = 0; i < a; i ++)
{
	var xx = lengthdir_x(i * 6, point_direction(x, y, xprevious, yprevious));
	var yy = lengthdir_y(i * 6,  point_direction(x, y, xprevious, yprevious));
	draw_sprite_ext(sprite_index, image_index, x + xx, y + yy, image_xscale * 0.5, image_yscale * 0.5, image_angle - i * 12, image_blend, 0.6 - (i / 40));
}