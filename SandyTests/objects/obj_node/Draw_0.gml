/// @description Insert description here
// You can write your code in this editor

/*
draw_set_font(ft_small);
var str = "";
for(var i = 4; i <= string_length(string(id)); i ++)
{
	str += string_char_at(string(id), i);
}
draw_text(x, y, str);
*/



/*
if(parent!=noone)
{
	draw_sprite_ext(spr_arrow, 0, x + 16, y + 16, 1, 1, point_direction(x, y, parent.x, parent.y), c_blue, 0.2);
}
*/

//draw_set_font(ft_small);
//draw_text(x + 16, y + 1, G);
//draw_sprite_ext(spr_grid32, image_index, x, y, image_xscale, image_yscale, image_angle, color, 0.2);

if(obj_pers.gamestate != "prepmap" && global.transitionCombat <= 0 && obj_game.inCombat == 0 && obj_game.gamestate != "idle")
{
	var lessAlpha = false;
	if((obj_game.gamestate == "selected" || obj_game.gamestate == "select") && global.phase == 0 && color > 0 && global.showOptions == 0 && global.unitMoving == noone)
	{
		lessAlpha = true;
		draw_sprite_ext(sprite_index, color - 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
	}
	if((obj_game.gamestate == "select target" || obj_game.gamestate == "trading" || obj_game.gamestate == "dancing" || obj_game.gamestate == "shoving" || obj_game.gamestate == "rescuing" || obj_game.gamestate == "dropping") && marked4 == 1)
	{
		lessAlpha = true;
		draw_sprite_ext(sprite_index, global.markedColor, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
	}
	if(global.phase == 0 && marked2 > 0 && global.rangeToggle == true)
	{
		var alpha = 0.35;
		if(marked3 > 0)alpha /= 1.5;
		draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
	}
	//if(marked > 0)draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	if(global.phase == 0 && marked3 > 0)
	{
		var alpha = 0.35 + (marked3 - 1) * 0.2;
		if(alpha > 0.8)alpha = 0.8;
		if(lessAlpha == true)alpha /= 1.5;
		draw_sprite_ext(sprite_index, 4, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
	}
}
if(obj_pers.gamestate == "prepmap")
{
	var lessAlpha = false;
	if(color > 0)
	{
		lessAlpha = true;
		draw_sprite_ext(sprite_index, color - 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
	}
	if(marked2 > 0 && global.rangeToggle == true)
	{
		var alpha = 0.35;
		if(marked3 > 0)alpha /= 1.5;
		draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
	}
	if(marked3 > 0)
	{
		var alpha = 0.35 + (marked3 - 1) * 0.2;
		if(alpha > 0.8)alpha = 0.8;
		if(lessAlpha == true)alpha /= 1.5;
		draw_sprite_ext(sprite_index, 4, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
	}
}