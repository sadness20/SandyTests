var char1 = argument[0];
var char2 = argument[1];

var cell = char1.standingNode;
if(obj_game.gamestate == "select target dir")cell = global.cellAttack;

if(char2.faction > 0 && char2 != global.selectedActor && char2.weaponType >= 2)
{
	char2.lastWeapon = -1;
	for(var i = 0; i < ds_list_size(global.CHAR[char2.characterID, 49]); i ++)
	{
		var wep = ds_list_find_value(global.CHAR[char2.characterID, 49], i);
		if(global.ITEM[wep, 14] < 2 && CanUse(char2.characterID, wep) && CheckRange_weapon(char2, cell, wep))
		{
			char2.equipAfter = global.CHAR[char2.characterID, 56];
			Equip(char2, i);
			break;
		}
	}
}
if(char2.faction > 0 && char2 != global.selectedActor && char2.weaponType < 2 && !CheckRange_weapon(char2, cell, global.CHAR[char2.characterID, 44]))
{
	char2.lastWeapon = -1;
	var lastwepscore = 0;
	for(var i = 0; i < ds_list_size(global.CHAR[char2.characterID, 49]); i ++)
	{
		var wep = ds_list_find_value(global.CHAR[char2.characterID, 49], i);
		var wepscore = global.ITEM[wep, 10];
		if(!CheckRange_weapon(char2, cell, wep))wepscore = -1;
		if(wepscore > lastwepscore && global.ITEM[wep, 14] < 2 && CanUse(char2.characterID, wep))
		{
			lastwepscore = wepscore;
			char2.equipAfter = global.CHAR[char2.characterID, 56];
			Equip(char2, i);
			//show_message("XD");
			break;
		}
	}
}

UpdateStats(char1, -1);
UpdateStats(char2, -1);

var wep1 = global.CHAR[char1.characterID, 44];
var wep2 = global.CHAR[char2.characterID, 44];

global.cellDistance = FindDistance(cell.gridX, cell.gridY, char2.standingNode.gridX, char2.standingNode.gridY);

var adv = 0;
if(wep1 != -1 && wep2 != -1)
{
	if(global.ITEM[wep1, 4] == 10 && global.ITEM[wep2, 4] == 11)
	{
		adv = 2;
	}
	if(global.ITEM[wep2, 4] == 10 && global.ITEM[wep1, 4] == 11)
	{
		adv = 1;
	}

	if(global.ITEM[wep1, 4] == 12 && global.ITEM[wep2, 4] == 11)
	{
		adv = 1;
	}
	if(global.ITEM[wep2, 4] == 12 && global.ITEM[wep1, 4] == 11)
	{
		adv = 2;
	}

	if(global.ITEM[wep1, 4] == 12 && global.ITEM[wep2, 4] == 10)
	{
		adv = 2;
	}
	if(global.ITEM[wep2, 4] == 12 && global.ITEM[wep1, 4] == 10)
	{
		adv = 1;
	}
}
char1.adva = -1;
char2.adva = -1;
var char1hitbonus = 0;
var char2hitbonus = 0;
var char1atkbonus = 0;
var char2atkbonus = 0;
var char1critbonus = 0;
var char2critbonus = 0;

if(wep1 == -1)adv = -1;
if(wep2 == -1)adv = -1;

if(adv == 1)
{
	//char2.hitbonus = 0;
	//char2.atkbonus = 0;
	
	var rank = global.CHAR[char1.characterID, 12 + global.ITEM[global.CHAR[char1.characterID, 44], 4]];
	switch(rank)
	{
		case 0:
		
		char1hitbonus += 10;
		char2hitbonus -= 10;
		char1atkbonus += 2;
		char2atkbonus -= 2;
		
		break;
		
		case 1:
		
		char1hitbonus += 10;
		char2hitbonus -= 10;
		char1atkbonus += 3;
		char2atkbonus -= 3;
		
		break;
		
		case 2:
		
		char1hitbonus += 15;
		char2hitbonus -= 15;
		char1atkbonus += 3;
		char2atkbonus -= 3;
		
		break;
		
		case 3:
		
		char1hitbonus += 15;
		char2hitbonus -= 15;
		char1atkbonus += 4;
		char2atkbonus -= 4;
		
		break;
		
		case 4:
		
		char1hitbonus += 20;
		char2hitbonus -= 20;
		char1atkbonus += 4;
		char2atkbonus -= 4;
		
		break;
		
		case 5:
		
		char1hitbonus += 20;
		char2hitbonus -= 20;
		char1atkbonus += 5;
		char2atkbonus -= 5;
		
		break;
	}
	char1.adva = 1;
	char2.adva = 0;
}
if(adv == 2)
{
	//char2.hitbonus = 0;
	//char2.atkbonus = 0;
	
	var rank = global.CHAR[char2.characterID, 12 + global.ITEM[global.CHAR[char2.characterID, 44], 4]];
	switch(rank)
	{
		case 0:
		
		char2hitbonus += 10;
		char1hitbonus -= 10;
		char2atkbonus += 2;
		char1atkbonus -= 2;
		
		break;
		
		case 1:
		
		char2hitbonus += 10;
		char1hitbonus -= 10;
		char2atkbonus += 3;
		char1atkbonus -= 3;
		
		break;
		
		case 2:
		
		char2hitbonus += 15;
		char1hitbonus -= 15;
		char2atkbonus += 3;
		char1atkbonus -= 3;
		
		break;
		
		case 3:
		
		char2hitbonus += 15;
		char1hitbonus -= 15;
		char2atkbonus += 4;
		char1atkbonus -= 4;
		
		break;
		
		case 4:
		
		char2hitbonus += 20;
		char1hitbonus -= 20;
		char2atkbonus += 4;
		char1atkbonus -= 4;
		
		break;
		
		case 5:
		
		char2hitbonus += 20;
		char1hitbonus -= 20;
		char2atkbonus += 5;
		char1atkbonus -= 5;
		
		break;
	}
	char2.adva = 1;
	char1.adva = 0;
}

var arm1 = 0, arm2 = 0;
if(char1.weaponType == 0)arm2 = char2.DEF; else if(char1.weaponType == 1)
{
	arm2 = char2.RES;
	//show_message("xd");
}
if(char2.weaponType == 0)arm1 = char1.DEF; else if(char2.weaponType == 1)
{
	arm1 = char1.RES;
	//show_message(char1.RES);
}

//effective damage
char1.effectiveDamage = 0;
char2.effectiveDamage = 0;

if(wep1 != -1)
{
	if((global.ITEM[wep1, 18] == 1 || global.ITEM[wep1, 19] == 1) && (global.CLASS[global.CHAR[char2.characterID, 3], 21] == 1 || global.CLASS[global.CHAR[char2.characterID, 3], 21] == 4))
	{
		char1.atkbonus += global.ITEM[wep1, 10] * 2;
		char1.effectiveDamage = 1;
	}
	if(wep1 != -1 && char1.effectiveDamage == 0 && (global.ITEM[wep1, 18] == global.CLASS[global.CHAR[char2.characterID, 3], 21] || global.ITEM[wep1, 19] == global.CLASS[global.CHAR[char2.characterID, 3], 21]))
	{
		char1.atkbonus += global.ITEM[wep1, 10] * 2;
		char1.effectiveDamage = 1;
	}
}
if(wep2 != -1)
{
	if((global.ITEM[wep2, 18] == 1 || global.ITEM[wep2, 19] == 1) && (global.CLASS[global.CHAR[char1.characterID, 3], 21] == 1 || global.CLASS[global.CHAR[char1.characterID, 3], 21] == 4))
	{
		char2.atkbonus += global.ITEM[wep2, 10] * 2;
		char2.effectiveDamage = 1;
	}
	if(wep2 != -1 && char2.effectiveDamage == 0 && (global.ITEM[wep2, 18] == global.CLASS[global.CHAR[char1.characterID, 3], 21] || global.ITEM[wep2, 19] == global.CLASS[global.CHAR[char1.characterID, 3], 21]))
	{
		char2.atkbonus += global.ITEM[wep2, 10] * 2;
		char2.effectiveDamage = 1;
	}
}

var cs1 = -1;
if(global.skillSelected != -1)cs1 = global.skillSelected;
//if(char2.combatSkill != -1)cs2 = char2.combatSkill;

//skills before combat
with char1
{
	if(cs1 != -1 && wep1 != -1)
	{
		if(global.SKILL[cs1, 4] == 0)
		{
			for(var i = 0; i < 4; i ++)
			{
				var subtype = global.SKILL[cs1, 5 + i];
				var might = global.SKILL[cs1, 12 + i];
								
				switch(subtype)
				{		
					case 2:
				
						arm2 = max(0, floor(arm2 * might));
				
					break;
					case 26:
					
						char1atkbonus += ceil(char1.MAG * (global.ITEM[wep1, 33] / 100));
				
					break;
				}
			}
		}
		if(global.SKILL[cs1, 4] == 2)
		{
			for(var i = 0; i < 4; i ++)
			{
				var subtype = global.SKILL[cs1, 5 + i];
				var might = global.SKILL[cs1, 12 + i];
								
				switch(subtype)
				{		
					case 0:
				
					char1hitbonus += might;
				
					break;
					case 1:
				
					char1critbonus += might;
				
					break;
				}
			}
		}
	}
}

//passive skills
with(obj_unit)
{
	if(id == char1 || id == char2)
	{
		for(var i = 0; i < ds_list_size(global.CHAR[characterID, 34]); i ++)
		{
			var skill = ds_list_find_value(global.CHAR[characterID, 34], i);
			if(global.SKILL[skill, 4] == 30)
			{
				for(var i = 0; i < 4; i ++)
				{
					var subtype = global.SKILL[skill, 5 + i];
					var might = global.SKILL[skill, 12 + i];
			
					switch(subtype)
					{
						case 0:
						
						if(id == char1)char1atkbonus += might;
						else char2atkbonus += might;
				
						break;
						case 1:
				
						 //+= might;
				
						break;
						case 2:
				
						if(id == char1)char1hitbonus += might;
						else char2hitbonus += might;
				
						break;
						case 3:
				
						if(id == char1)char1critbonus += might;
						else char2critbonus += might;
				
						break;
						case 4:
				
						//avobuff_area += might;
				
						break;
						case 5:
				
						//spbuff_area += might;
				
						break;
					}
				}
			}
			if(global.SKILL[skill, 4] == 15 && global.phase == 0)
			{
				//UpdateStats(id);
				//how_message(HP);
				//show_message(MAXHP);
				var val = (MAXHP - HP) * 100;
				//show_message(val);
				val = (val / MAXHP);
				//show_message(val);
				val = floor(val / 30);
				//show_message(val);
				
				//show_message(might);
				//var might = (1 + floor((((MAXHP - HP) / MAXHP) * 100) / 30));
				if(char1 == id)
				{
					arm1 += val;
					char1atkbonus += val;
				}
				else
				{
					arm2 += val;
					char2atkbonus += val;
				}
			}
			if(global.SKILL[skill, 4] == 14 && HP < floor(MAXHP * (global.SKILL[skill, 12] / 100)))
			{
				for(var i = 1; i < 4; i ++)
				{
					var subtype = global.SKILL[skill, 5 + i];
					var might = global.SKILL[skill, 12 + i];
			
					switch(subtype)
					{
						case 0:
				
						if(id == char1)char1atkbonus += might;
						else char2atkbonus += might;
				
						break;
						case 1:
				
						 //+= might;
				
						break;
						case 2:
				
						if(id == char1)char1hitbonus += might;
						else char2hitbonus += might;
				
						break;
						case 3:
				
						if(id == char1)char1critbonus += might;
						else char2critbonus += might;
				
						break;
						case 4:
				
						//avobuff_area += might;
				
						break;
						case 5:
				
						//spbuff_area += might;
				
						break;
					}
				}
			}
		}
	}
}


char1.ATKd = max(char1.ATK + char1.atkbonus + char1atkbonus - arm2 + char1.terrainATK - char2.defbuff - char2.defbuff_area, 0);
char1.HITd = max(char1.HIT + char1.hitbonus + char1hitbonus - char2.AVO + char2.terrainHIT, 0);
char1.CRITd = char1critbonus + max(char1.CRIT - char2.LCK - char2.luckbuff_area, 0);

char2.ATKd = max(char2.ATK + char2.atkbonus + char2atkbonus - arm1 + char2.terrainATK - char1.defbuff - char1.defbuff_area, 0);
char2.HITd = max(char2.HIT + char2.hitbonus + char2hitbonus - char1.AVO + char1.terrainHIT, 0);
char2.CRITd = char2critbonus + max(char2.CRIT - char1.LCK - char1.luckbuff_area, 0);

if(char1.weaponType == 2)char1.ATKd = 0;
if(char2.weaponType == 2)char2.ATKd = 0;


char1.nturns = 1;
char2.nturns = 1;
char1.nattacks = 1;
char2.nattacks = 1;

if(wep1 != -1)
{
	char1.nattacks = global.ITEM[wep1, 32];
	char1.maxattacks = global.ITEM[wep1, 32];
}
if(wep2 != -1)
{
	char2.nattacks = global.ITEM[wep2, 32];
	char2.maxattacks = global.ITEM[wep2, 32];
}

var spd1 = char1.SPD;
var spd2 = char2.SPD;

char1.mind = -1;
char2.mind = -1;
char1.tempVar = 0;
char2.tempVar = 0;

if(char1.nattacks > 1)
{
	char1.mind = 1;
}
if(char2.nattacks > 1)
{
	char2.mind = 1;
}

if(spd1 > spd2 + 4)
{
	char1.nturns = 2;
	char1.mind = 0;
	if(char1.nattacks > 1)
	{
		char1.mind = 2;
	}
}
if(spd2 > spd1 + 4)
{
	char2.nturns = 2;
	char2.mind = 0;
	if(char2.nattacks > 1)
	{
		char2.mind = 2;
	}
}

//skills after combat
with char1
{
	if(cs1 != -1)
	{
		if(global.SKILL[cs1, 4] == 0)
		{
			for(var i = 0; i < 4; i ++)
			{
				var subtype = global.SKILL[cs1, 5 + i];
				var might = global.SKILL[cs1, 12 + i];
								
				switch(subtype)
				{		
					case 1:
				
					ATKd = floor(ATKd / 2);
					nattacks = might;
					mind = 2;
					nturns = 1;
					tempVar = 1;
					maxattacks = 1;
				
					break;
				}
			}
		}
	}
}