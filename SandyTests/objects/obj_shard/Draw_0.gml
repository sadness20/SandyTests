/// @description Insert description here
// You can write your code in this editor
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale/(6-alpha),image_yscale/(6-alpha),image_angle,c_white,alpha/5);
gpu_set_blendmode(bm_normal);