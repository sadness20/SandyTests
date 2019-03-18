/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y + 24 , 0.2 - sinVall / 30, (0.2 - sinVall / 30) * 0.75, 0, c_black, 0.3);

draw_sprite_ext(sprite_index, image_index, x, y - sinVall * 8, 0.2, 0.2, 0, image_blend, 1);

gpu_set_blendmode(bm_add);
for(var i = 0; i < 10; i ++)
{
	var len = (sinVal[i] * pow) + react * 8;
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(len, sinDir[i]), y - sinVall * 8 + lengthdir_y(len, sinDir[i]), 0.2, 0.2, 0, image_blend, sinVal[i] * 0.5);
}
gpu_set_blendmode(bm_normal);

