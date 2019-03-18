/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_phase, indexx, global.wid / 4, global.hei / 4, scale * 0.865, scale * 0.865, 0, c_black, alpha);
draw_sprite_ext(spr_phase, indexx, global.wid / 4, global.hei / 4, scale * 0.9, scale * 0.9, 0, c_white, alpha);

if(!surface_exists(surfPhase))surfPhase = surface_create(76, 48);
surface_set_target(surfPhase);
draw_clear_alpha(c_black, 0);

draw_sprite_ext(spr_phaseColor, indexx, 0, 0, 0.5, 0.5, 0, c_white, 1);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_phaseThingie, 0, 0, 0, 0.5, 0.5, 0, c_white, 1);
gpu_set_blendmode(bm_normal);

surface_reset_target();

gpu_set_blendmode(bm_add);
for(var i = -2; i < 8; i ++)
{
    draw_surface_ext(surfPhase, xx + i * 76, 0, 1, 1, 0, c_white, alpha);
}
for(var i = 8; i > -2; i --)
{
    draw_surface_ext(surfPhase, - xx + i * 76, global.hei / 2, 1, -1, 0, c_white, alpha);
}
gpu_set_blendmode(bm_normal);