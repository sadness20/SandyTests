/// @description Insert description here
// You can write your code in this editor
state = "idle";
characterID = 100;

cindex = 20;
index = 20;

movespeed = 2.5;
hspd = 0;
vspd = 0;
xdir = 0;
ydir = 0;

fr = 0;

footstepTimer = 0;
markRange = false;

lightpower=200;
lightalpha=40;
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
dis = 0;
alp = 1;

hmove = 0;
vmove = 0;
free = 0;