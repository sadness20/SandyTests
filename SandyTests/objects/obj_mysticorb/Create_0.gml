/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < 10; i ++)
{
	sinWave[i] = i / 10;
	sinVal[i] = sin(sinWave[i]);
	sinDir[i] = i * floor(random(36));
	sinDirv[i] = 0;
	cdir[i] = 1;
	cchange[i] = 0;
}
pow = 4;

sinWavee = 0;
sinVall = 0;
react = 0;

/// @description Insert description here
// You can write your code in this editor
//////test
lightpower=150;
lightalpha=80;
lightcolor=make_color_rgb(185, 150, 255);
lightjitter=0;

powerMult = 1;

lightxpos=0;
lightypos=-26;

lighttype=spr_light;

depth = -y;