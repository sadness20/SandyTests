/// @description Insert description here
// You can write your code in this editor
depth = -y + 16;
if(react > 0)react -= 0.25;

sinWavee += 0.05;
sinVall = sin(sinWavee);
for(var i = 0; i < 10; i ++)
{
	sinWave[i] += 0.1 + i / 100;
	sinVal[i] = sin(sinWave[i]);
	sinDir[i] += sinDirv[i];
	
	if(sinVal[i] < 0.1 && cchange[i] == 0)
	{
		cdir[i] = !cdir[i];
		cchange[i] = 60;
	}
	if(cchange[i] > 0)cchange[i] --;
	
	sinDirv[i] += (sinVal[i] * 5 * cdir[i]) / 20;
	if(abs(sinDirv[i]) > 5)sinDirv[i] = 5 * sign(sinDirv[i]);
}
pow = 2;
var di = point_distance(x, y + 2, obj_campUnit.x + 16, obj_campUnit.y + 16);
if(di < 44)
{
	pow = 2 + 6 * (1 - di / 44);
}