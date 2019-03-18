var cell1 = argument[0];
var cell2 = argument[1];

var weapon = argument[2];

//var type = argument[3];

var minrange = global.ITEM[weapon, 7];
var maxrange = global.ITEM[weapon, 8];

if(cell1 != noone && cell2 != noone)
{
	/*
	if(type == 1)
	{
		cx = global.cellAttack.gridX;
		cy = global.cellAttack.gridY;
	}
	*/
	var dis = FindDistance(cell1.gridX, cell1.gridY, cell2.gridX, cell2.gridY);
	if(dis >= minrange && dis <= maxrange)
	{
		return 1;
	}
}

return 0;