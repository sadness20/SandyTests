/// @description Insert description here
// You can write your code in this editor
draw_self();
for(var i = 0; i < 10; i ++)
{
	var xx = lengthdir_x(i * 2, image_angle);
	var yy = lengthdir_y(i * 2, image_angle);
	draw_sprite_ext(sprite_index, image_index, x + xx, y + yy, image_xscale, image_yscale, image_angle, image_blend, 0.6 - (i / 20));
}