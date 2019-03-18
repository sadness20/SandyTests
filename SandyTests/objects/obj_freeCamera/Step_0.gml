
	
xTo = global.camTarget.x + 16;
yTo = global.camTarget.y + 32;

var dis = point_distance(x, y, xTo, yTo);
var dir = point_direction(x, y, xTo, yTo);
var spd = median(0, dis / 5, 15);

if(dis >= 0.5)
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}

camera_set_view_pos(global.camera, x - global.wid / 4, y - global.hei / 4);
















