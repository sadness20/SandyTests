/// @description Insert description here
// You can write your code in this editor
vspeed+=grav;
if trans=0 and alpha<5 then alpha+=1;
if trans=1 then alpha-=0.5;
if alpha<=0 then instance_destroy();
image_angle+=rotation;

if(destroy > 0)destroy--;

event_inherited();