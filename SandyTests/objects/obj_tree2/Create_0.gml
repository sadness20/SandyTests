/// @description Insert description here
// You can write your code in this editor
depth = -y;
image_index = floor(random(image_number));
image_speed = 0;
image_xscale = choose(-1, 1);

var sc = irandom_range(85, 100) / 100;
image_xscale *= sc;
image_yscale *= sc;

event_inherited();