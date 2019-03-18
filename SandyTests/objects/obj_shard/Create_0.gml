/// @description Insert description here
// You can write your code in this editor
image_speed=0;
x+=irandom_range(-8,8);
y+=irandom_range(-8,8);
image_index=floor(random(2));
alarm[0]=1;
size=1;
xx=0;
yy=0;
image_angle=random(360);
vspeed=-2;
hspeed=irandom_range(-0.5,0.5);
alpha=0;
trans=0;
alarm[1]=8;
rotation=irandom_range(-10,10);
grav=0.12;
depth = -6000;

destroy = 18;

xsize = 0;
ysize = 0;
create = 0;

lightxsize = 0;
lightysize = 0;
lightYscale = 1;
create = 0;

lightpower=80;
lightalpha=50;
lightcolor=make_color_rgb(170, 170, 255);
lightjitter=0;

lightxpos=0;
lightypos=0;

lighttype=spr_light;