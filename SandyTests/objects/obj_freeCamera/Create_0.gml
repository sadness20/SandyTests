/// @description Insert description here
// You can write your code in this editor


//Enable the use of views
global.zoom = 2;

view_enabled = true;

holdX = mouse_x;
holdY = mouse_y;

//Make view 0 visible
view_set_visible(0, true);

global.mwid = global.window_w * 2;
global.mhei = global.window_h * 2;
global.wid = global.window_w * 2;
global.hei = global.window_h * 2;

global.camera = camera_create();

camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);

view_set_camera(0, global.camera);

global.camTarget = obj_campUnit;

x = obj_campUnit.x;
y = obj_campUnit.y;

xTo = x;
yTo = y;

lastX = x;
lastY = y;

alarm[0] = 5;