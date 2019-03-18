/// @description Insert description here
// You can write your code in this editor
state = "idle";

cindex = 20;
index = 20;

movespeed = 2.5;
hspd = 0;
vspd = 0;
xdir = 0;
ydir = 0;

fr = 0;
su = 0;
target = noone;

footstepTimer = 0;
markRange = false;

lightpower=260;
lightalpha=60;
lightcolor=c_white;
lightjitter=0;

powerMult = 1;

lightxpos=16;
lightypos=18;

lighttype=spr_light;

unitSurface = surface_create(38, 38);
hairSurface = surface_create(38, 38);

hnd_colorIn = shader_get_uniform(shColorReplaceBlend, "colorIn");
hnd_colorOut = shader_get_uniform(shColorReplaceBlend, "colorOut");
hnd_colorTolerance = shader_get_uniform(shColorReplaceBlend, "colorTolerance");
hnd_blend = shader_get_uniform(shColorReplaceBlend, "blend");

colorIn = c_black;
colorOut = c_black;

csH = color_get_hue(colorOut);
csS = color_get_saturation(colorOut);
csV = color_get_value(colorOut);
vis = 1;

instance_create_depth(0, 0, 0, obj_freeCamera);
instance_create_depth(0, 0, -8000, obj_globalLight);
instance_create_depth(0, 0, 0, obj_particles);



