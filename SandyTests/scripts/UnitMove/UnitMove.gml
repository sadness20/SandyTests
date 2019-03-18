var char = argument[0];
var xx = argument[1];
var yy = argument[2];

if(global.map[xx, yy].occupant == noone)
{
	char.gridX = xx;
	char.gridY = yy;
	char.x = xx * global.gridSize;
	char.y = yy * global.gridSize;
	global.map[xx, yy].occupant = char;
	char.standingNode.occupant = noone;
	char.standingNode = global.map[xx, yy];
}