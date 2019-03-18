/// @description Insert description here
// You can write your code in this editor
if(y > height)
{
    instance_create_depth(x + 0.5, y + 10, depth, obj_rainsplash);
    x = camera_get_view_x(global.camera) - 64 + random((global.window_w * 2) / global.zoom + 128);
    y = camera_get_view_y(global.camera) - 32;
    height = y + random((global.window_h * 2) / global.zoom + 32);
}