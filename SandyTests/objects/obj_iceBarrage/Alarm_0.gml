/// @description Insert description here
// You can write your code in this editor
if cont<=3 then
{
var ii=instance_create_depth(x+lengthdir_x(32,dir),y+lengthdir_y(32,dir), 0, obj_iceBarrage);
ii.origin=origin;
ii.parent=id;
daughter=ii.id;
ii.damage=damage;
ii.dir=dir;
ii.cont=cont+1;
ii.hitplayer=hitplayer;

with origin mySpell = ii.id;
}