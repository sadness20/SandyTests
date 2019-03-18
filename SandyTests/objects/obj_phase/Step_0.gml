/// @description Insert description here
// You can write your code in this editor
if(st == 1)
{
	xx += 1;
	if(step < 6)
	{
		if(alpha < 1)alpha += 0.12;
		step ++;
		scale += ((1 / 10) * 0.1) * boo;
		if(boo < 1)boo += 0.12;
	}
	else if(step < 24)
	{
		if(alpha < 1)alpha += 0.12;
		scale += ((1 / 10) * 0.12) * boo;
		if(boo > 0)boo -= boo / 5;
		step ++;
	}
	else if(step < 25)
	{
		step ++;
		scale -= ((1 / 15) * 0.07) * boo;
		if(boo < 1)boo += 0.2;
	}
	else if(step < 30)
	{
		step ++;
		scale -= ((1 / 15) * 0.07) * boo;
		if(boo > 0)boo -= 0.1;
	}
	else
	{
		if(boo < 1)boo += 0.2;
		scale += (1 / 30) * 0.5;
		alpha -= 1 / 20;
	
		if(alpha <= 0)instance_destroy();
	}
}

with obj_game
{
	if(opSize < 1)opSize += 1 / 4;
	if(opSize2 < 1)opSize += 1 / 4;
	if(opSize3 < 1)opSize += 1 / 4;
}