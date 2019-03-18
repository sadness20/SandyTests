/// @description Insert description here
// You can write your code in this editor
size=0;
maxsize=25+random(75);
alpha=0;
step=0;
direction=random(360);
speed=(10+random(40))/50;
timer=60+random(150);
dirchange=irandom_range(-2,2);
dirchangedir=random(dirchange/timer*-2);

lightpower=maxsize * 0.6;
lightalpha=30;
lightcolor=make_color_rgb(255, 240, 205);
lightjitter=0;

powerMult = 0;

lightxpos=0;
lightypos=0;

lighttype=spr_light;