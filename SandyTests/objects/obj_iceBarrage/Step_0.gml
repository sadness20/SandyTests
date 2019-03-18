/// @description Insert description here
// You can write your code in this editor
timerr++;
if(destroy > 0)destroy--;

if timerr<=45*0.25 then ltrans=1;
if timerr>=45*0.75 then ltrans=2;
if ltrans=1 and xsize<=sprite_width then xsize+=(sprite_width/(45/2));
if ltrans=2 and xsize>=0 then xsize-=(sprite_width/(45/2));
if ltrans=1 and ysize<=sprite_height then ysize+=(sprite_height/(45/2));
if ltrans=2 and ysize>=0 then ysize-=(sprite_height/(45/2));

if parent!=noone && instance_exists(parent) then
{
if hitplayer=1 then parent.hitplayer=1;
}
if daughter!=noone && instance_exists(daughter) then
{
if hitplayer=1 then daughter.hitplayer=1;
}

event_inherited();