/// @description Insert description here
// You can write your code in this editor
event_inherited();

createe ++;
spd += createe / 120;
if(spd > 1.5)
{
	spd += createe / 40;
	if(spdy == 0)audio_play_sound(sfx_lightningSpear,3,0);
	spdy = 1;
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);