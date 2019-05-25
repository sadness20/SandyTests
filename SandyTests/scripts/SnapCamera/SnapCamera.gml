var xpos = argument[0];
var ypos = argument[1];
cx = xpos;
cy = ypos;
with obj_camera
{
	xTo = xpos * global.gridSize + 16;
	yTo = ypos * global.gridSize + 16;
		
	x = xTo;
	y = yTo;
	lastX = x;
	lastY = y;
}
with obj_nodeDrawer
{
	x = xpos * global.gridSize;
	y = ypos * global.gridSize;
	xTo = xpos * global.gridSize;
	yTo = ypos * global.gridSize;
}
with obj_nodeDrawer1
{
	x = xpos * global.gridSize;
	y = ypos * global.gridSize;
	xTo = xpos * global.gridSize;
	yTo = ypos * global.gridSize;
}

if(cx >= 0 && cy >= 0 && cx <= global.mapWidth && cy <= global.mapHeight)global.hoverNode = global.map[cx, cy]; else
{
	cx = 0;
	cy = 0;
	global.hoverNode = global.map[cx, cy];
}