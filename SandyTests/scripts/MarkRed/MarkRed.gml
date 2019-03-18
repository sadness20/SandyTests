var char = argument[0];
with(obj_node)
{
	marked4 = 0;
	var dis = FindDistance(gridX, gridY, char.gridX, char.gridY);
	if(id != char.standingNode && dis >= char.minRange && dis <= char.maxRange)
	{
		marked4 = 1;
	}
}
if(char.weaponType == 2)global.markedColor = 6; else global.markedColor = 1;