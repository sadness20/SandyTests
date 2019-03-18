UpdateSkillList(global.selectedActor.characterID);

for(var ii = 0; ii < 10; ii ++)
{
	weaponinrange[ii] = false;
}
for(var ii = 0; ii < 10; ii ++)
{
	skillinrange[ii] = false;
}
global.opSelect = -1;
						
var targetFaction = ds_list_create();
						
for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
{
	var unit = ds_list_find_value(global.faction[1], i);
	ds_list_add(targetFaction, unit);
}
						
for(var i = 0; i < ds_list_size(targetFaction); i ++)
{
	var enemy = ds_list_find_value(targetFaction, i);
	var dis = FindDistance(global.selectedActor.gridX, global.selectedActor.gridY, enemy.gridX, enemy.gridY);
							
	for(var ii = 0; ii < ds_list_size(global.CHAR[global.selectedActor.characterID, 49]); ii ++)
	{
		var item = ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], ii);
		if(global.selectedActor.weaponType == 2 && global.ITEM[item, 14] == 2)isHeal = 1;
		if(dis >= global.ITEM[item, 7] && dis <= global.ITEM[item, 8] && CanUse(global.selectedActor.characterID, item) && global.ITEM[item, 14] < 2)
		{
			if(!(dis <= 1 && abs(global.selectedActor.standingNode.level - enemy.standingNode.level) >= 2))
			{
				weaponinrange[ii] = true;
				if(global.opSelect == -1)global.opSelect = ii;
			}
		}
	}
}
						
ds_list_destroy(targetFaction);
weaponsinrange = 0;
for(var i = 0; i < 10; i ++)
{
	if(weaponinrange[i] == true)weaponsinrange ++;
}
						
for(var ii = 0; ii < ds_list_size(obj_pers.skillList); ii ++)
{
	var skill = ds_list_find_value(obj_pers.skillList, ii);
	var skillType = global.SKILL[skill, 4];
	var skillsubType = global.SKILL[skill, 5];
	var canuse = false;
	if((skillType == 0) && weaponsinrange > 0 && canAttack)canuse = true;
	if((skillType == 2) && weaponsinrange > 0 && global.selectedActor.moved == false && canAttack)canuse = true;
	if(skillType == 1)
	{
		if(skillsubType != 0)
		{
			with(obj_unit)
			{
				var dis = FindDistance(gridX, gridY, global.selectedActor.gridX, global.selectedActor.gridY);
				if((faction == 0 || faction == 2) && id != global.selectedActor && dis >= global.SKILL[skill, 9] && dis <= global.SKILL[skill, 10])
				{
					canuse = true;
				}
			}
		}
		else
		{
			with(obj_unit)
			{
				var dis = FindDistance(gridX, gridY, global.selectedActor.gridX, global.selectedActor.gridY);
				if(usedTurn == 0 && (faction == 0 || faction == 2) && id != global.selectedActor && dis >= global.SKILL[skill, 9] && dis <= global.SKILL[skill, 10])
				{
					canuse = true;
				}
			}
		}
	}
	if(skillType == 60)
	{
		for(var b = 0; b < ds_list_size(global.selectedActor.standingNode.neighbors); b ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, b);
			if(node.occupant != noone && node.occupant.faction == global.selectedActor.faction)
			{
				var xx = node.occupant.gridX, yy = node.occupant.gridY;
				if(xx < global.selectedActor.standingNode.gridX)xx --; else
				if(xx > global.selectedActor.standingNode.gridX)xx ++; else
				if(yy < global.selectedActor.standingNode.gridX)yy --; else
				if(yy < global.selectedActor.standingNode.gridX)yy ++;
				
				var charType = global.CLASS[global.CHAR[node.occupant.characterID, 3], 21];
				
				var available = 0;
				if(global.map[xx, yy].occupant == noone)available = 1;
				if(global.map[xx, yy].type == 4 && charType != 1 && charType != 4)available = 0;
				if(global.map[xx, yy].type == 5 && charType != 1 && charType != 4)available = 0;
				if(available)canuse = true;
			}
		}
	}
	if(skillType == 61 && global.selectedActor.isCarrying == noone)
	{
		for(var b = 0; b < ds_list_size(global.selectedActor.standingNode.neighbors); b ++)
		{
			var cell = ds_list_find_value(global.selectedActor.standingNode.neighbors, b);
			if(cell.occupant != noone && (cell.occupant.faction == 0 || cell.occupant.faction == 2))
			{
				if(global.CLASS[global.CHAR[cell.occupant.characterID, 3], 21] == 0)canuse = true;
			}
		}
	}
	if(skillType == 62 && global.selectedActor.isCarrying != noone)
	{
		for(var b = 0; b < ds_list_size(global.selectedActor.standingNode.neighbors); b ++)
		{
			var cell = ds_list_find_value(global.selectedActor.standingNode.neighbors, b);
			if(cell.occupant == noone)
			{
				canuse = true;
			}
		}
	}
	if(skillType == 63 && global.selectedActor.canAttack)canuse = true;
	if(canuse && global.selectedActor.SP >= max(0, global.SKILL[skill, 3] - global.selectedActor.spbuff - global.selectedActor.spbuff_area))
	{
		skillinrange[ii] = true;
		if(global.opSelect == -1)global.opSelect = ii;
	}
}
skillsinrange = 0;
for(var i = 0; i < 10; i ++)
{
	if(skillinrange[i] == true)skillsinrange ++;
}
