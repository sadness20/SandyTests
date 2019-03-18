draw_sprite(spr_boxx, 0, 18, 6);
DrawUnit(global.OWchar, tcindex, tindex, 17 + 2.5, 7, 1, 1, c_white, 1, 0, 3, 0);

if(ds_list_size(global.charList) > 0)
{
	draw_sprite_ext(spr_switchArrow, 0, 12 - sinVal2, 23, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_switchArrow, 0, 11 + 48 + sinVal2, 23, -1, 1, 0, c_white, 1);
}