var char = argument[0];
var item = argument[1];

if(item == -1)item = global.CHAR[char.characterID, 44];

var rank = 0;
if(item != -1)rank = global.CHAR[char.characterID, 12 + global.ITEM[item, 4]];

char.atkbonus = 0;
char.hitbonus = 0;

/*
if(item != -1)
{
	var bonus = false;
	if(global.ITEM[item, 4] == 10)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				char.atkbonus += 1;
			}
			break;
			case 3:
			{
				char.atkbonus += 2;
			}
			break;
			case 4:
			{
				char.atkbonus += 3;
			}
			break;
			case 5:
			{
				char.atkbonus += 4;
				char.hitbonus += 5;
			}
			break;
		}
	}
	if(global.ITEM[item, 4] == 12)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				char.hitbonus += 5;
			}
			break;
			case 3:
			{
				char.hitbonus += 10;
			}
			break;
			case 4:
			{
				char.atkbonus += 1;
				char.hitbonus += 10;
			}
			break;
			case 5:
			{
				char.atkbonus += 2;
				char.hitbonus += 15;
			}
			break;
		}
	}
	if(global.ITEM[item, 4] == 18)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				char.atkbonus += 1;
			}
			break;
			case 3:
			{
				char.atkbonus += 2;
			}
			break;
			case 4:
			{
				char.atkbonus += 3;
			}
			break;
			case 5:
			{
				char.atkbonus += 5;
			}
			break;
		}
	}
	if(bonus == false)
	{
		switch(rank)
		{
			case 2:
			{
				char.atkbonus += 1;
			}
			break;
			case 3:
			{
				char.atkbonus += 1;
				char.hitbonus += 5;
			}
			break;
			case 4:
			{
				char.atkbonus += 2;
				char.hitbonus += 5;
			}
			break;
			case 5:
			{
				char.atkbonus += 3;
				char.hitbonus += 10;
			}
			break;
		}
	}
}
*/

var dmgItem = 0, hitItem = 0, critItem = 0, avoItem = 0;
if(item != -1)
{
	dmgItem =  global.ITEM[item, 10];
	hitItem = global.ITEM[item, 11];
	critItem = global.ITEM[item, 12];
	avoItem = global.ITEM[item, 13];
}

var dmg = 0;
if(char.weaponType == 0)dmg = char.STR;
if(char.weaponType == 1)dmg = char.MAG;
if(char.weaponType == 2)dmg = floor(char.MAG / 2);

char.ATK = char.atkbuff_area + char.atkbuff + dmg + dmgItem + char.atkbonus; //atk
char.HIT = char.hitbuff_area + char.hitbuff + floor(((char.SKILL + char.skillbuff_area) * 1.5) + ((char.LCK + char.luckbuff_area) * 0.5) + hitItem) + char.hitbonus; //hit
char.CRIT = char.critbuff_area + char.critbuff + floor(critItem + ((char.SKILL + char.skillbuff_area) / 2)); //crit
char.AVO = char.avobuff_area + char.avobuff + avoItem + floor((char.SPD + char.speedbuff_area) + (char.LCK + char.luckbuff_area) / 2); //avo