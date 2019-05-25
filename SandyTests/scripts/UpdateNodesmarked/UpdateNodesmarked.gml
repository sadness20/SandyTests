with (obj_node)
{
	parent2 = noone;
	G2 = 0;
}

var open;
var start, current, neighbor;
var tempG;

start = argument0;
var char = argument1;
var charType = global.CLASS[global.CHAR[char.characterID, 3], 21];

var mp = char.MP;

open = ds_priority_create();
var closed = ds_list_create();

ds_priority_add(open, start, start.G2);

var targetFaction1 = -1, targetFaction2 = -1;
if(char.faction == 0)targetFaction1 = 1;
if(char.faction == 1)targetFaction1 = 0;
if(char.faction == 1 && char.aggressive == true)targetFaction2 = 2;
if(char.faction == 2)targetFaction1 = 1;


//start.color = 1;

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
		if(neighbor.occupant != noone && char.hasSkill[0] == 0  && (neighbor.occupant.faction == targetFaction1 || neighbor.occupant.faction == targetFaction2))check = 0;
		if(abs(neighbor.level - current.level) > 1)check = 0;
		if(neighbor.passable && check && ds_list_find_index(closed, neighbor) < 0 && nCost + current.G2 <= mp)
		{
			if(ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined)
			{
				neighbor.parent2 = current;
				neighbor.G2 = current.G2 + nCost;

				ds_priority_add(open, neighbor, neighbor.G2);
				
				var mir = char.minRangeDamage, mar = char.maxRangeDamage;
				/*
				if(mir == 1 && mar == 1)
				{
					for(var a = 0; a < ds_list_size(neighbor.neighbors); a ++)
					{
						var tile = ds_list_find_value(neighbor.neighbors, a);
						if(abs(neighbor.level - tile.level) < 2)
						{
							if(tile != start)tile.marked2 = 1;
						}
					}
				}
				*/
				if(mir == 1 && mar == 1)checkRange1(neighbor.gridX, neighbor.gridY, 0);
				if(mir == 1 && mar == 2)checkRange1_2(neighbor.gridX, neighbor.gridY, 0);
				if(mir == 2 && mar == 2)checkRange2(neighbor.gridX, neighbor.gridY, 0);
				if(mir == 2 && mar == 3)checkRange2_3(neighbor.gridX, neighbor.gridY, 0);
				if(mir == 1 && mar == 3)checkRange1_3(neighbor.gridX, neighbor.gridY, 0);
			}
			else
			{
				tempG = current.G2 + nCost;
				if(tempG < neighbor.G2)
				{
					neighbor.parent2 = current;

					neighbor.G2 = tempG;

					ds_priority_change_priority(open, neighbor, neighbor.G2)
				}
			}
		} 
	}
}

ds_priority_destroy(open);
ds_list_destroy(closed);


//start.marked2++;
// set red cells

with(obj_node)
{
	if((start != id && global.tileBinary[gridY] & 1<<gridX))marked2 ++;
}

for(i = 0; i < global.mapHeight; i ++)
{
    global.tileBinary[i] = 0;
}