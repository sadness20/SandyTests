/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor
if (!surface_exists(light))light = surface_create(1200, 720);
surface_set_target(light);
var darkness=global.MAP[global.currentMap, 5];
if darkness>180 then darkness=360-global.MAP[global.currentMap, 5];
if(instance_exists(obj_game)) draw_clear_alpha(make_color_hsv(skycolor,skyintensity,255-(darkness*(255/180))),1); else draw_clear_alpha(make_color_hsv(0,0,50),1);
if(room == rm_camp)
{
	draw_set_alpha(0.4);
	draw_set_color(make_color_rgb(170, 255, 240));
	draw_rectangle(0, 0, 580, 420, 0);
	draw_set_alpha(1);
}
gpu_set_blendmode(bm_add);

global.view_xvieww -= 90;
global.view_yvieww -= 90;

with (obj_fx)
{

	draw_sprite_ext(lighttype,0,x-global.view_xvieww+lightxpos,y-global.view_yvieww+lightypos,lightxsize * ((lightpower/200)+(lightjitter/200)),lightysize * ((lightpower/200)+(lightjitter/200)),0,lightcolor,lightalpha/100);

}

if(instance_exists(obj_game) && obj_game.inCombat == 0)
{
	with (obj_unit)
	{

		jitter=irandom_range(0,lightjitter);
		draw_sprite_ext(lighttype,0,x-global.view_xvieww+lightxpos + 16,y-global.view_yvieww+lightypos+48,(lightpower/200)+(jitter/200),(lightpower/200)+(jitter/200),0,lightcolor,lightalpha/100);
	}
	/*
	with obj_lightsource_solid 
	{
		surface_reset_target();
		surface_set_target(obj_globalLight.light)
		jitter=irandom_range(0,lightjitter);
		draw_sprite_ext(lighttype,0,x-global.view_xvieww+lightxpos+6,y-global.view_yvieww+lightypos+6,(lightpower/200)+(jitter/200),(lightpower/200)+(jitter/200),0,lightcolor,lightalpha/100);
	}
	*/
}

with (obj_simpleLight)
{

	jitter=irandom_range(0,lightjitter);
	draw_sprite_ext(lighttype,0,x-global.view_xvieww+lightxpos,y-global.view_yvieww+lightypos,((lightpower/200)+(jitter/200)) * powerMult,((lightpower/200)+(jitter/200)) * powerMult,0,lightcolor,(lightalpha/100) * powerMult);
}

global.view_xvieww += 90;
global.view_yvieww += 90;
gpu_set_blendmode(bm_normal);
surface_reset_target();

gpu_set_blendmode_ext(9,1);   //--addative for more hardcore looking light
//draw_surface_ext(light_surface,0,0,1,1,0,c_white,1);
draw_surface_ext(light,- 90 + global.view_xvieww,- 90 + global.view_yvieww,1,1,0,c_white,1);
gpu_set_blendmode(bm_normal);