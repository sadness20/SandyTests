var charID = argument[0];
var xp = argument[1];

if(global.CHAR[charID, 44] == -1)exit;
var weaponTyp = global.ITEM[global.CHAR[charID, 44], 4] - 10;

for(var i = 0; i < ds_list_size(global.CHAR[charID, 34]); i ++)
{
	var skillID = ds_list_find_value(global.CHAR[charID, 34], i);
	if(global.SKILL[skillID, 4] == 10)
	{
		for(var iii = 0; iii < 4; iii ++)
		{
			var subtype = global.SKILL[skillID, 5 + iii];
			var might = global.SKILL[skillID, 12 + iii];
					
			if(subtype != -1)
			{
				switch(subtype)
				{		
					case 1:
				
					xp *= might;
				
					break;
				}
			}
		}
	}
}

while(xp > 0)
{
	var xptolvl = -1;
	switch(global.CHAR[charID, 22 + weaponTyp])
	{
		case 0:
		xptolvl = 10;
		break;
	
		case 1:
		xptolvl = 15;
		break;

		case 2:
		xptolvl = 25;
		break;

		case 3:
		xptolvl = 35;
		break;

		case 4:
		xptolvl = 50;
		break;

		case 5:
		xptolvl = -1;
		break;
	}
	
	if(xptolvl != -1)
	{
		var xpm = xp;
		if(global.CHAR[charID, 60 + weaponTyp] + xpm > xptolvl)
		{
			xpm = xptolvl - global.CHAR[charID, 60 + weaponTyp];
		}
		global.CHAR[charID, 60 + weaponTyp] += xpm;
		xp -= xpm;
		if(global.CHAR[charID, 60 + weaponTyp] >= xptolvl)
		{
			global.CHAR[charID, 22 + weaponTyp] ++;
			global.CHAR[charID, 60 + weaponTyp] = 0;
			if(instance_exists(obj_game))
			{
				obj_game.weaponadvancerank = global.CHAR[charID, 22 + weaponTyp];
				obj_game.weaponadvancetype = weaponTyp;
			}
		}
	}
	else
	{
		global.CHAR[charID, 60 + weaponTyp] = 0;
		xp = 0;
	}
}