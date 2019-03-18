/// @description Insert description here
// You can write your code in this editor
if(st == 1)
{
	xx += 1;
	if(step < 8)
	{
		if(alpha < 1)alpha += 0.1;
		step ++;
		scale += ((1 / 10) * 0.1) * boo;
		if(boo < 1)boo += 0.12;
	}
	else if(step < 30)
	{
		if(alpha < 1)alpha += 0.1;
		scale += ((1 / 10) * 0.1) * boo;
		if(boo > 0)boo -= boo / 5;
		step ++;
	}
	else if(step < 35)
	{
		step ++;
		scale -= ((1 / 15) * 0.05) * boo;
		if(boo < 1)boo += 0.2;
	}
	if(step < 20)
	{
		if(ls < 1)
		{
			ls += 1 / 17;
			la += 1 / 17;
			gr += 1 / 10;
		}
	}
	if(step >= 35)
	{
		if(ls > 0)
		{
			ls -= 1 / 17;
			la -= 1 / 17;
		}
	}
	/*
	else if(step < 40)
	{
		step ++;
		scale -= ((1 / 15) * 0.05) * boo;
		if(boo > 0)boo -= 0.1;
	}
	else
	{
		if(boo < 1)boo += 0.2;
		scale += (1 / 30) * 0.4;
		alpha -= 1 / 30;
	
		if(alpha <= 0)instance_destroy();
	}
	*/
}