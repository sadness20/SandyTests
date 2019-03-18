/// @description Insert description here
// You can write your code in this editor

light = surface_create(1200, 720);

global.view_xvieww = camera_get_view_x(global.camera);
global.view_yvieww = camera_get_view_y(global.camera);
ambientsfx = -1;

skycolor = choose(145, 15);
skyintensity = floor(irandom_range(10, 90));
if(skycolor == 15 && (room == rm_Arena_cold1 || room == rm_Arena_cold2))skycolor = 145;
if(skycolor == 145 && (room == rm_wastelands || room == rm_wastelands2))skycolor = 15;