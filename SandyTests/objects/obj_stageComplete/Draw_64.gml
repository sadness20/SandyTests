/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_gradient2, 0, 0, 0, 1, 1, 0, c_white, gr * 0.8);

draw_sprite_ext(sprite_index, 0, 200, 64, scale * 0.7 * 0.96, scale * 0.7 * 0.96, 0, c_black, alpha);
draw_sprite_ext(sprite_index, 0, 200, 64, scale * 0.7, scale * 0.7, 0, c_white, alpha);

gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_scLight, 0, 200, 64, scale * ls, scale * ls, 0, make_color_rgb(160, 245, 255), alpha * la * 0.65);
draw_sprite_ext(spr_scLight, 0, 200, 64, scale * ls * 0.55, scale * ls * 0.48, 0, make_color_rgb(240, 255, 255), alpha * la * 0.8);

gpu_set_blendmode(bm_normal);