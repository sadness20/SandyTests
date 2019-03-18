with (obj_node)G = 0;

var open;
var start, current, neighbor;
var tempG;

start = argument0;
var char = argument1;
var charType = global.CLASS[global.CHAR[char.characterID, 3], 21];

var colorType = 2;
if(global.CHAR[char.characterID, 44] != -1 && global.ITEM[global.CHAR[char.characterID, 44], 4] == 18)colorType = 6;

open = ds_priority_create();
var closed = ds_list_create();

ds_priority_add(open, start, start.G);

var targetFaction1 = -1, targetFaction2 = -1;
if(char.faction == 0)targetFaction1 = 1;
if(char.faction == 1)targetFaction1 = 0;
if(char.faction == 1 && char.aggressive == true)targetFaction2 = 2;
if(char.faction == 2)targetFaction1 = 1;

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
		}
		if(neighbor.type == 4 && charType != 1 && charType != 4)nCost = 100;
		if(neighbor.type == 5 && charType != 1 && charType != 4)nCost = 100;
		
		var check = 1;
		if(neighbor.occupant != noone && char.hasSkill[0] == 0 && (neighbor.occupant.faction == targetFaction1 || neighbor.occupant.faction == targetFaction2))check = 0;
		if(abs(neighbor.level - current.level) > 1)check = 0;
		if(check && ds_list_find_index(closed, neighbor) < 0 && nCost + current.G <= 60)
		{
			if(ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined)
			{
				neighbor.parent = current;
				neighbor.G = current.G + nCost;
				neighbor.rawG = current.rawG + 1;

				ds_priority_add(open, neighbor, neighbor.G);
				//neighbor.marked4 = 1;
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
