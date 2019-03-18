if(allureturns > 0)
{
	allureturns --;
	if(allureturns <= 0)
	{
		var mu = ds_list_find_index(global.faction[faction], id);
		ds_list_delete(global.faction[faction], mu);
				
		faction = ofaction;
				
		ds_list_add(global.faction[faction], id);
	}
}

for(var i = 0; i < 20; i ++)
{
	if(buff[i, 0] != -1)
	{
		buff[i, 2] --;
		if(buff[i, 4] != 0)
		{
			StatsBuff(buff[i, 0], buff[i, 4]);
			if((buff[i, 5] - buff[i, 2]) * abs(buff[i, 4]) >= abs(buff[i, 1]))
			{
				buff[i, 0] = -1;
				buff[i, 1] = 0;
				buff[i, 2] = -1;
				buff[i, 3] = -1;
			}
		}
		
		if(buff[i, 2] <= 0 && buff[i, 4] == 0)
		{
			RemoveBuff(i);
		}
	}
}

for(var i = 0; i < 20; i ++)
{
	debuffed = false;
	if(buff[i, 1] < 0)
	{
		debuffed = true;
		break;
	}
}