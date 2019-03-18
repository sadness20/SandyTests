with obj_game UpdateWeaponSkill();

global.nOptions = 0;

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