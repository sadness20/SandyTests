
var node = argument[0];
var actor = argument[1];

var charID = actor.characterID;

//CalcRanges(actor, 1);
/*
actor.minRangeEnemy = 100;
actor.minRangeAlly = 100;
actor.maxRangeEnemy = 0;
actor.maxRangeAlly = 0;

for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]); i ++)
{
	var item = ds_list_find_value(global.CHAR[charID, 49], i);
	if(global.ITEM[item, 14] < 2)
	{
		if(CanUse(charID, item))
		{
			var item = ds_list_find_value(global.CHAR[charID, 49], i);
			if(actor.minRangeEnemy > global.ITEM[item, 7])actor.minRangeEnemy = global.ITEM[item, 7];
			if(actor.maxRangeEnemy < global.ITEM[item, 8])actor.maxRangeEnemy = global.ITEM[item, 8];
		}
	}
	else
	{
		if(CanUse(charID, item))
		{
			var item = ds_list_find_value(global.CHAR[charID, 49], i);
			if(actor.minRangeAlly > global.ITEM[item, 7])actor.minRangeAlly = global.ITEM[item, 7];
			if(actor.maxRangeAlly < global.ITEM[item, 8])actor.maxRangeAlly = global.ITEM[item, 8];
		}
	}
}
*/
with node
{
	ds_list_clear(cellAttack);
	ds_list_clear(cellHeal);
	
	if(actor.canAttack)
	{
		with (obj_unit)
		{
			if(faction == 1)
			{
				CalcRanges(actor, 1);
				var dis = FindDistance(gridX, gridY, node.gridX, node.gridY);
				if(dis >= actor.minRangeDamage && dis <= actor.maxRangeDamage)
				{
					if(!(dis <= 1 && abs(node.level - standingNode.level) >= 2))
					ds_list_add(node.cellAttack, standingNode);
				}
			}
			if(id != actor && (faction == 0 || faction == 2))
			{
				var canHeal = 0;
				if(HP < MAXHP)canHeal = 1;
				CalcRanges(actor, canHeal);
				var dis = FindDistance(gridX, gridY, node.gridX, node.gridY);
				if(dis >= actor.minRangeAlly && dis <= actor.maxRangeAlly)
				{
					if(!(dis <= 1 && abs(node.level - standingNode.level) >= 2))
					ds_list_add(node.cellHeal, standingNode);
				}
			}
		}
	}
}