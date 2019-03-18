/// @description Insert description here
// You can write your code in this editor

if(spdy == 1)
{
	gpu_set_blendmode(bm_add);
	for(var i = 5; i < 12; i ++)
	{
		var xx = lengthdir_x(spd * ((i * i) / 10), dir);
		var yy = lengthdir_y(spd * ((i * i) / 10), dir);
		draw_sprite_ext(sprite_index, image_index, x + xx, y + yy, 1, 1, dir, image_blend, ((i - 5) / 7));
	}
	gpu_set_blendmode(bm_normal);
} else
{
	gpu_set_blendmode(bm_add);
	draw_self();
	gpu_set_blendmode(bm_normal);
}