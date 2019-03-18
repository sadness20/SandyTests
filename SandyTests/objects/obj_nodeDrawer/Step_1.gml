/// @description Insert description here
// You can write your code in this editor
if(global.hoverNode != noone)
{
	depth = -global.hoverNode.gridY * global.gridSize + 16;
}

if(global.controlsType > 0)
{
	if(x != xTo || y != yTo)
	{
		var dis = point_distance(x, y, xTo, yTo);
		var spd = median(8, floor(dis / 15), 20);
		repeat(spd)
		{
			if(x < xTo)x += 1;
			if(x > xTo)x -= 1;
			if(y < yTo)y += 1;
			if(y > yTo)y -= 1;
		}
	}
}
else
{
	x = xTo;
	y = yTo;
}