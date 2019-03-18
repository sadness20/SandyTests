/// @description Insert description here
// You can write your code in this editor
x+=irandom_range(-8,8);
y+=irandom_range(-8,8);
image_angle=random(360);
size=1;
xx=0;
yy=0;
maxduration=25+ceil(random(25));
duration=maxduration;
hspeed=choose(-1,-0.5,0,0.5,1) / 2;
vspeed=choose(-1,-0.5,0,0.5,1) / 2;
alarm[0]=1;
depth = -6000;

xsize = 0;
ysize = 0;
create = 0;