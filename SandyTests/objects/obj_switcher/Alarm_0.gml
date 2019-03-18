/// @description Insert description here
// You can write your code in this editor
with(obj_trees1)
{
	sprite_index = spr_trees4;
}
with(obj_mountain1)
{
	sprite_index = spr_mountain2;
}
with(obj_fort1)
{
	sprite_index = spr_fort2;
}
with(obj_water)
{
	sprite_index = spr_water2;
}

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
if (layer_background_get_sprite(back_id) != bk_spookygrass)
{
	layer_background_sprite(back_id, bk_spookygrass);
}