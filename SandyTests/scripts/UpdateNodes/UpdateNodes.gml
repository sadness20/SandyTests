CleanNodes();
clearPath();

var open;
var start, current, neighbor;
var tempG;

start = argument0;
var char = argument1;
var charType = global.CLASS[global.CHAR[char.characterID, 3], 21];

var colorType = 2;
if(global.CHAR[char.characterID, 44] != -1 && global.ITEM[global.CHAR[char.characterID, 44], 4] == 18)colorType = 6;

var mp = char.MP;

open = ds_priority_create();
var closed = ds_list_create();

ds_priority_add(open, start, start.G);

var targetFaction1 = -1, targetFaction2 = -1;
if(char.faction == 0)targetFaction1 = 1;
if(char.faction == 1)targetFaction1 = 0;
if(char.faction == 1 && char.aggressive == true)targetFaction2 = 2;
if(char.faction == 2)targetFaction1 = 1;

start.color = 1;

var mir = char.minRangeDamage, mar = char.maxRangeDamage;
//if(mir == 1 && mar == 1)checkRange1(start.gridX, start.gridY, 0);else
if(mir == 1 && mar == 2)checkRange1_2(start.gridX, start.gridY, 0);else
if(mir == 2 && mar == 2)checkRange2(start.gridX, start.gridY, 0);else
if(mir == 2 && mar == 3)checkRange2_3(start.gridX, start.gridY, 0);else
if(mir == 1 && mar == 3)checkRange1_3(start.gridX, start.gridY, 0);

mir = char.minRangeAlly;
mar = char.maxRangeAlly;
//if(mir == 1 && mar == 1)checkRange1(start.gridX, start.gridY, 1);else
if(mir == 1 && mar == 2)checkRange1_2(start.gridX, start.gridY, 1);else
if(mir == 2 && mar == 2)checkRange2(start.gridX, start.gridY, 1);else
if(mir == 2 && mar == 3)checkRange2_3(start.gridX, start.gridY, 1);else
if(mir == 1 && mar == 3)checkRange1_3(start.gridX, start.gridY, 1);


while(ds_priority_size(open) > 0)
{
	current = ds_priority_delete_min(open);

	ds_list_add(closed, current);

	for(i = 0; i < ds_list_size(current.neighbors); i ++)
	{
		neighbor = ds_list_find_value(current.neighbors, i);
		var nCost = neighbor.cost;
		switch(charType)
		{
			case 1:
				if(neighbor.type == 2)nCost = 1;
			break;
			case 2:
				if(neighbor.type == 2)nCost = 3;
			break;
			case 4:
				if(neighbor.type == 2)nCost = 1;
			break;
		}
		if(neighbor.type == 4 && charType != 1 && charType != 4)nCost = 100;
		if(neighbor.type == 5 && charType != 1 && charType != 4)nCost = 100;
		
		var check = 1;
		if(neighbor.occupant != noone && char.hasSkill[0] == 0 && (neighbor.occupant.faction == targetFaction1 || neighbor.occupant.faction == targetFaction2))check = 0;
		if(abs(neighbor.level - current.level) > 1)check = 0;
		if(neighbor.passable && check && ds_list_find_index(closed, neighbor) < 0 && nCost + current.G <= mp)
		{
			if(ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined)
			{
				neighbor.parent = current;
				neighbor.G = current.G + nCost;
				neighbor.rawG = current.rawG + 1;

				ds_priority_add(open, neighbor, neighbor.G);
				neighbor.color = 1;
				if(neighbor.occupant == noone)
				{
					mir = char.minRangeAlly;
					mar = char.maxRangeAlly;
					//if(mir == 1 && mar == 1)checkRange1(neighbor.gridX, neighbor.gridY, 1);else
					if(mir == 1 && mar == 2)checkRange1_2(neighbor.gridX, neighbor.gridY, 1);else
					if(mir == 2 && mar == 2)checkRange2(neighbor.gridX, neighbor.gridY, 1);else
					if(mir == 2 && mar == 3)checkRange2_3(neighbor.gridX, neighbor.gridY, 1);else
					if(mir == 1 && mar == 3)checkRange1_3(neighbor.gridX, neighbor.gridY, 1);
				}
				if(neighbor.occupant == noone)
				{
					mir = char.minRangeDamage;
					mar = char.maxRangeDamage;
					//if(mir == 1 && mar == 1)checkRange1(neighbor.gridX, neighbor.gridY, 0);else
					if(mir == 1 && mar == 2)checkRange1_2(neighbor.gridX, neighbor.gridY, 0);else
					if(mir == 2 && mar == 2)checkRange2(neighbor.gridX, neighbor.gridY, 0);else
					if(mir == 2 && mar == 3)checkRange2_3(neighbor.gridX, neighbor.gridY, 0);else
					if(mir == 1 && mar == 3)checkRange1_3(neighbor.gridX, neighbor.gridY, 0);
				}
			}
			else
			{
				tempG = current.G + nCost;
				if(tempG < neighbor.G)
				{
					neighbor.parent = current;

					neighbor.G = tempG;
					neighbor.rawG = current.rawG + 1;

					ds_priority_change_priority(open, neighbor, neighbor.G)
				}
			}
		} 
	}
}

ds_priority_destroy(open);
ds_list_destroy(closed);


// set red cells
if(char.canAttack)
{
	with(obj_node)
	{
		if(color == 1 && id != start)
		{
			for(var i = 0; i < ds_list_size(neighbors); i ++)
			{
				var neighbor = ds_list_find_value(neighbors, i);
				if(neighbor.color == 0 && abs(level - neighbor.level) < 2)
				{
					if(char.minRangeDamage == 1 && char.maxRangeDamage == 1)neighbor.color = 2;
					if(char.minRangeAlly == 1 && char.maxRangeAlly == 1)neighbor.color = 6;
				}
			}
		}
	    if(color == 0 && start != id &&(global.tileBinary[gridY] & 1<<gridX))
	    {
			color = 2;
			//if(occupant != noone color = 0;
	    }
	    if(color == 0 && start != id &&(global.tileBinary2[gridY] & 1<<gridX))
	    {
			color = 6;
			//if(occupant != noone && ((occupant.faction == char.faction) || (char.faction == 0 && occupant.faction == 2)) && occupant.HP < occupant.MAXHP)color = 6;
			//if(color == 0)color = 6;
	    }
	}
}

for(i = 0; i < global.mapHeight; i ++)
{
    global.tileBinary[i] = 0;
	global.tileBinary2[i] = 0;
}