/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_iceCreate,0,0);

image_angle=random(360);
image_index=floor(random(2));
depth = -6000;

damage=0;
origin=noone;
parent=noone;
daughter=noone;
alarm[3]=2;

xsize=0;
ysize=0;
ltrans=0;
size=1;
alarm[0]=8;
alarm[1]=45;
alarm[2]=1;
image_speed=0;
cont=0;
destroy = 30;

hitplayer=0;
timerr=0;

mycolor=make_color_rgb(185,255,255);
life = 5;

xsize = 0;
ysize = 0;

lightxsize = 0;
lightysize = 0;
lightYscale = 1;
create = 0;

lightpower=150;
lightalpha=100;
lightcolor=make_color_rgb(170, 170, 255);
lightjitter=0;

lightxpos=0;
lightypos=0;

lighttype=spr_light;