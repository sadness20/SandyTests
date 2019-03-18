global.nSpawns = 0;
with(obj_spawnAlly)
{
	global.spawn[global.nSpawns] = id;
	global.nSpawns ++;
	
	gridX = floor(x / global.gridSize);
	gridY = floor(y / global.gridSize);
	
	global.map[gridX, gridY].spawn = id;
}


global.activeCharacters = 0;
var finished = false;

with obj_pers CharListOrder();
for(var i = 0; i < ds_list_size(global.charList); i ++)
{
	var charID = ds_list_find_value(global.charList, i);
	
	global.CHAR[charID, 59] = false;
	if(finished == false && global.CHAR[charID, 58] == true)
	{
		global.CHAR[charID, 59] = true;
		
		var unit = instance_create_layer(0, 0, "base", obj_unit);
		var spawn = global.spawn[global.activeCharacters];
		spawn.occupant = unit;
		
		unit.standingSpawn = spawn;
		unit.gridX = spawn.gridX;
		unit.gridY = spawn.gridY;
		unit.x = unit.gridX * global.gridSize;
		unit.y = unit.gridY * global.gridSize;
		global.map[unit.gridX, unit.gridY].occupant = unit;
		unit.standingNode = global.map[unit.gridX, unit.gridY];
		
		unit.characterID = charID;
		unit.faction = 0;
		
		global.activeCharacters ++;
		if(global.CHAR[charID, 73] == 0)global.CHAR[charID, 73] = 1;
	}
	if(global.activeCharacters >= global.nSpawns)
	{
		finished = true;
	}
}

for(var i = 0; i < 3; i ++)
{
	ds_list_clear(global.faction[i]);
}
with (obj_unit)
{
	ds_list_add(global.faction[faction], id);
}

with obj_pers CharListOrder();