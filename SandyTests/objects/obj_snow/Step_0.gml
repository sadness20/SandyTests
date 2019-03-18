/// @description Insert description here
// You can write your code in this editor
if(y > height)
{
    var ii = instance_create_depth(x, y + 2, depth, obj_snowfall);
    ii.image_index = image_index;
	ii.image_angle = image_angle;
    x = camera_get_view_x(global.camera) - 64 + random(128 + (global.window_w * 2) / global.zoom);
    y = camera_get_view_y(global.camera) - 32;
    height = y + random(272);
}