var char = argument[0];
var xx = argument[1];
var yy = argument[2];

var target = noone;
with(obj_unit)
{
	if(characterID == char.isCarrying)
	{
		target = id;
	}
}

if(target != noone)
{
	if(global.map[xx, yy].occupant == noone)
	{
		target.gridX = xx;
		target.gridY = yy;
		target.x = xx * global.gridSize;
		target.y = yy * global.gridSize;
		global.map[xx, yy].occupant = target;
		target.standingNode = global.map[xx, yy];
	}

	target.faction = target.oldFaction;
	ds_list_add(global.faction[target.faction], target);
	target.vis = 1;

	char.isCarrying = noone;

	char.SPD += 2;
	char.MAXSPD += 2;
}