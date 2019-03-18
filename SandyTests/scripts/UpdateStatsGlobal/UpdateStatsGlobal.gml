var charID = argument[0];
var rank = 0;
if(global.CHAR[charID, 44] != -1)rank = global.CHAR[charID, 12 + global.ITEM[global.CHAR[charID, 44], 4]];
var atkbonus = 0;
var hitbonus = 0;

if(global.CHAR[charID, 44] != -1)
{
	var bonus = false;
	if(global.ITEM[global.CHAR[charID, 44], 4] == 10)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				atkbonus += 1;
			}
			break;
			case 3:
			{
				atkbonus += 2;
			}
			break;
			case 4:
			{
				atkbonus += 3;
			}
			break;
			case 5:
			{
				atkbonus += 4;
				hitbonus += 5;
			}
			break;
		}
	}
	if(global.ITEM[global.CHAR[charID, 44], 4] == 12)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				hitbonus += 5;
			}
			break;
			case 3:
			{
				hitbonus += 10;
			}
			break;
			case 4:
			{
				atkbonus += 1;
				hitbonus += 10;
			}
			break;
			case 5:
			{
				atkbonus += 2;
				hitbonus += 15;
			}
			break;
		}
	}
	if(global.ITEM[global.CHAR[charID, 44], 4] == 18)
	{
		bonus = true;
		switch(rank)
		{
			case 2:
			{
				atkbonus += 1;
			}
			break;
			case 3:
			{
				atkbonus += 2;
			}
			break;
			case 4:
			{
				atkbonus += 3;
			}
			break;
			case 5:
			{
				atkbonus += 5;
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
				atkbonus += 1;
			}
			break;
			case 3:
			{
				atkbonus += 1;
				hitbonus += 5;
			}
			break;
			case 4:
			{
				atkbonus += 2;
				hitbonus += 5;
			}
			break;
			case 5:
			{
				atkbonus += 3;
				hitbonus += 10;
			}
			break;
		}
	}
}

var type = 0, dmgItem = 0, hitItem = 0, critItem = 0, avoItem = 0;
if(global.CHAR[charID, 44] != -1)
{
	var type =  global.ITEM[global.CHAR[charID, 44], 14];
	dmgItem =  global.ITEM[global.CHAR[charID, 44], 10];
	hitItem = global.ITEM[global.CHAR[charID, 44], 11];
	critItem = global.ITEM[global.CHAR[charID, 44], 12];
	avoItem = global.ITEM[global.CHAR[charID, 44], 13];
}
var dmg = 0;
if(type == 0)dmg = global.CHAR[charID, 7];
if(type == 1)dmg = global.CHAR[charID, 8];
if(type == 2)dmg = floor(global.CHAR[charID, 8] / 2);

global.CHAR[charID, 45] = dmg + dmgItem + atkbonus; //atk
global.CHAR[charID, 46] = floor((global.CHAR[charID, 9] * 1.5) + (global.CHAR[charID, 11] * 0.5) + hitItem + hitbonus); //hit
global.CHAR[charID, 47] = floor(critItem + (global.CHAR[charID, 9] / 2)); //crit
global.CHAR[charID, 48] = avoItem + floor(global.CHAR[charID, 10] + global.CHAR[charID, 11] / 2); //avo

//global.CHAR[charID, 70] = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2); //SP