/// @description Insert description here
// You can write your code in this editor

if(obj_pers.showMap)
{
	var map = ds_list_find_value(global.REGION[global.currentRegion, 2], obj_pers.tempVar13);
	xTo = global.MAP[map, 6];
	yTo = global.MAP[map, 7];
	
	camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);

	var dis = point_distance(x, y, xTo, yTo);
	var dir = point_direction(x, y, xTo, yTo);
	var spd = median(0, max(0, dis - 64) / 10, 10);

	if(dis >= 64)
	{
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	var camerawid = (global.wid / global.zoom) / 2;
	var camerahei = (global.hei / global.zoom) / 2;
	
	var xx = clamp(200, x, 800);
	var yy = clamp(120, y, 880);

	camera_set_view_pos(global.camera, xx - camerawid, yy - camerahei);
	
	//camera_set_view_pos(view_get_camera(0), x - camerawid, y - camerahei);
}