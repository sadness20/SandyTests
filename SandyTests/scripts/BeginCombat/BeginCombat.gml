global.char1 = argument[0];
global.char2 = argument[1];

global.oldZoom = global.zoom;

obj_game.whoDied = -1;

if(global.char1.faction != 0 && global.char2.faction != 0)
{
	var temp = global.char1;
	global.char1 = global.char2;
	global.char2 = temp;
}

global.combatDistance = FindDistance(global.char1.standingNode.gridX, global.char1.standingNode.gridY, global.char2.standingNode.gridX, global.char2.standingNode.gridY);

global.currentTurn = global.selectedActor;

if(global.selectedActor.weaponType == 2)global.combatType = 1; else global.combatType = 0;

if(global.char1.faction == 0 && global.char1 != global.selectedActor && global.char1.weaponType >= 2)
{
	if(global.char1.equipAfter == -1)
	{
		global.char1.equipAfter = global.CHAR[global.char1.characterID, 56];
		//show_message(global.char1.equipAfter);
	}
	if(global.char1.lastWeapon != -1)
	{
		var wep = ds_list_find_value(global.CHAR[global.char1.characterID, 49], global.char1.lastWeapon);
		if(wep == undefined)
		{
			global.char1.lastWeapon = -1;
		} else
		if(global.ITEM[wep, 14] >= 2 || CanUse(global.char1.characterID, wep) == false || CheckRange_weapon(global.char1, global.char2, wep, 0) == false)global.char1.lastWeapon = -1;
	}
	if(global.char1.lastWeapon == -1)
	{
		for(var i = 0; i < ds_list_size(global.CHAR[global.char1.characterID, 49]); i ++)
		{
			var wep = ds_list_find_value(global.CHAR[global.char1.characterID, 49], i);
			if(global.ITEM[wep, 14] < 2 && CanUse(global.char1.characterID, wep) && CheckRange_weapon(global.char1, global.char2, wep, 0))
			{
				global.char1.lastWeapon = i;
				break;
			}
		}
	}
	if(global.char1.lastWeapon != -1)
	{
		var wep = ds_list_find_value(global.CHAR[global.char1.characterID, 49], global.char1.lastWeapon);
		if(global.ITEM[wep, 14] < 2 && CanUse(global.char1.characterID, wep) && CheckRange_weapon(global.char1, global.char2, wep, 0))
		{
			Equip(global.char1, global.char1.lastWeapon);
		}
	}
}

UpdateStatsCompare(global.char1, global.char2);


global.char1.weapon = global.CHAR[global.char1.characterID, 44];
global.char2.weapon = global.CHAR[global.char2.characterID, 44];

with global.char1 
{
	damagehealed = 0;
	damagedealt = 0;
	state = "idle";
	index = 0;
	
	showdamage = 1;
	initCombatfx = -1;
}
with global.char2
{
	state = "idle";
	index = 0;	
	
	showdamage = 1;
	initCombatfx = -1;
}
//enemy skills
if(global.phase == global.selectedActor.faction && global.phase > 0)
{
	for(var i = 0; i < ds_list_size(global.CHAR[global.selectedActor.characterID, 34]); i ++)
	{
		var skill = ds_list_find_value(global.CHAR[global.selectedActor.characterID, 34], i);
		if(global.SKILL[skill, 4] == 0 && global.selectedActor.SP > global.SKILL[skill, 3] && global.selectedActor.combatSkill == -1)
		{
			global.selectedActor.combatSkill = skill;
			global.selectedActor.initCombatfx = skill;
	
			global.selectedActor.SP -= global.SKILL[skill, 3];
			break;
		}
		if(global.SKILL[skill, 4] == 2 && global.selectedActor.moved == false && global.selectedActor.SP > global.SKILL[skill, 3] && global.selectedActor.combatSkill == -1)
		{
			global.selectedActor.combatSkill = skill;
			global.selectedActor.initCombatfx = skill;
			
			for(var i = 0; i < 4; i ++)
			{
				var subtype = global.SKILL[cs2, 5 + i];
				var might = global.SKILL[cs2, 12 + i];
								
				switch(subtype)
				{		
					case 0:
				
					global.selectedActor.HITd += might;
				
					break;
					case 1:
				
					global.selectedActor.CRITd += might;
				
					break;
				}
			}
	
			global.selectedActor.SP -= global.SKILL[skill, 3];
			break;
		}

		if(global.SKILL[skill, 4] == 0 && global.selectedActor.SP > global.SKILL[skill, 3] && global.selectedActor.combatSkill == -1)
		{
			for(var i = 0; i < 4; i ++)
			{
				var subtype = global.SKILL[skill, 5 + i];
				var might = global.SKILL[skill, 12 + i];
								
				switch(subtype)
				{		
					case 1:
					
					global.selectedActor.ATKd = floor(ATKd / 2);
					global.selectedActor.nattacks = might;
					global.selectedActor.mind = 2;
					global.selectedActor.nturns = 1;
					global.selectedActor.tempVar = 1;
					global.selectedActor.maxattacks = 1;
				
					break;
				}
			}
		}
	}
}


if(global.skillSelected != -1)
{
	global.char1.combatSkill = global.skillSelected;
	
	global.char1.SP -= global.SKILL[global.skillSelected, 3];
	global.char1.initCombatfx = global.skillSelected;
	
	global.skillSelected = -1;
}

if(global.CHAR[global.char1.characterID, 44] == -1 || global.char1.minRange > global.combatDistance || global.char1.maxRange < global.combatDistance)
{
	global.char1.nturns = 0;
	global.char1.showdamage = 0;
}
if(global.CHAR[global.char2.characterID, 44] == -1 || global.char2.minRange > global.combatDistance || global.char2.maxRange < global.combatDistance)
{
	global.char2.nturns = 0;
	global.char2.showdamage = 0;
}
	
if(global.combatType == 0)
{
	if(global.char1.weapon != -1 && global.ITEM[global.char1.weapon, 4] == 18)
	{
		global.char1.nturns = 0;
		global.char1.showdamage = 0;
	}
	if(global.char2.weapon != -1 && global.ITEM[global.char2.weapon, 4] == 18)
	{
		global.char2.nturns = 0;
		global.char2.showdamage = 0;
	}
	
	
	with global.char1 CombatSkill();
	with global.char2 CombatSkill();
	
	if(global.char1.nturns <= 0)global.currentTurn = global.char2;
	if(global.char2.nturns <= 0)global.currentTurn = global.char1;
}
else
{
	global.char1.showdamage = 0;
	global.char2.showdamage = 0;
}

CleanNodes();
if(!(global.phase == 1 && global.optionState[7] == 1))
{
	global.transitionCombat = 1;
	audio_play_sound(sfx_beginCombat, 0, 0);
	with obj_musPlayer event_user(0);
}
else
{
	global.transitionCombat = 120;
}
global.showOptions = 0;

/*
var dis = point_distance(global.char1.x, global.char1.y, global.char2.x, global.char2.y);
var dir = point_direction(global.char1.x, global.char1.y, global.char2.x, global.char2.y);
*/

global.combatX = global.char1.x + 16;
global.combatY = global.char1.y + 24;

global.target = noone;

