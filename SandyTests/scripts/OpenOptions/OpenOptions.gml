

with obj_game UpdateWeaponSkill();

global.nOptions = 0;
global.opSelect4 = -1;
global.opSelect2 = -1;

if(standingNode.type == 6 && standingNode.objectLink != noone && standingNode.objectLink.visited == 0)
{
	global.options[global.nOptions] = "Visit";
	global.nOptions++;
}
var hasKey = 0;
for(var i = 0; i < ds_list_size(global.CHAR[global.selectedActor.characterID, 49]); i ++)
{
	if(global.ITEM[ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], i), 3] == 5)
	{
		hasKey = 1;
	}
}
if(standingNode.type == 7 && standingNode.objectLink != noone && standingNode.objectLink.opened == 0 && hasKey)
{
	global.options[global.nOptions] = "Open";
	global.nOptions++;
}
if(global.CHAR[characterID, 3] == 30 && canAttack && canDance)
{
	var next = false;
	for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
	{
		var neighbor = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
		if(neighbor.occupant != noone && neighbor.occupant.faction == global.selectedActor.faction && neighbor.occupant.usedTurn == 1)
		{
			next = true;
		}
	}
	if(next)
	{
		global.options[global.nOptions] = "Dance";
		global.nOptions++;
	}
}
if(ds_list_size(standingNode.cellAttack) > 0 && canAttack)
{
	global.options[global.nOptions] = "Attack";
	global.nOptions++;
}
if(ds_list_size(standingNode.cellHeal) > 0 && canAttack)
{
	global.options[global.nOptions] = "Heal"; 
	global.nOptions++;
}
if(obj_game.skillsinrange > 0)
{
	global.options[global.nOptions] = "Skills";
	global.nOptions++;
}
if(ds_list_size(global.CHAR[characterID, 49]) > 0)
{
	global.options[global.nOptions] = "Items";
	global.nOptions++;
}
if(global.canRewind == true)
{
	var next = false;
	for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
	{
		var neighbor = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
		if(neighbor.occupant != noone && neighbor.occupant.faction == global.selectedActor.faction)
		{
			next = true;
		}
	}
	if(next)
	{
		global.options[global.nOptions] = "Trade";
		global.nOptions++;
			/*
		global.options[global.nOptions] = "Pair Up";
		global.nOptions++;
		*/
	}
}
global.options[global.nOptions] = "Wait";
global.nOptions++;

global.showOptions = 1;
global.opSelect4 = 0;
audio_play_sound(sfx_showOptions, 0, 0);

//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);