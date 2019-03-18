var char1 = argument[0];
var char2 = argument[1];

var xp = argument[2];


if(char1 < 50 && char2 < 50 && global.SUPPORTLIMIT[char1, char2] > 0)
{
	global.SUPPORTXP[char1, char2] += xp;
	global.SUPPORTXP[char2, char1] += xp;
		
	if(instance_exists(obj_game))
	{
		with(obj_unit)
		{
			if(characterID == char1 || characterID == char2)
			{
				gainSupport = true;
			}
		}
	}

	if(global.SUPPORTXP[char1, char2] >= 20 && global.SUPPORTS[char1, char2] <= global.SUPPORTLIMIT[char1, char2] - 1)
	{
		global.SUPPORTADV[char1, char2] = true;
		global.SUPPORTADV[char2, char1] = true;
		global.CHAR[char1, 40] = 1;
		global.CHAR[char2, 40] = 1;
	}
}