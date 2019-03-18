var item = argument[0], xx = argument[1], yy = argument[2];

draw_sprite(spr_statsItem, 0, xx, yy);

xx -= 2;
yy -= 2;

draw_set_font(ft_med);

var a = 0, b = 0;

draw_sprite(spr_switchWeapon, 0, xx + 16, yy + 16);
draw_sprite(spr_items, global.ITEM[item, 1], xx + 8, yy + 8);

draw_sprite(spr_itemListsmall, 0, xx + 28, yy + 6);

draw_set_color(fontColor2);
draw_text(xx + 32, yy - 1, global.ITEM[item, 0]);

if(global.ITEM[item, 3] == 2)
{
	if(global.ITEM[item, 14] >= 2)
	{
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Mt");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, global.ITEM[item, 10]);
	
		b = 1;
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Rng");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, string(global.ITEM[item, 7]) + "-" + string(global.ITEM[item, 8]));
	}
	else
	{
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Mt");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, global.ITEM[item, 10]);


		a = 1;
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Hit");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, global.ITEM[item, 11]);


		a = 0;
		b = 1;
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Crit");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, global.ITEM[item, 12]);

		a = 1;
		b = 1;
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Avo");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, global.ITEM[item, 13]);

		a = 2;
		b = 0;
		draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 30 + a * 18);
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		draw_text(xx + 27 + b * 74, yy + 21 + a * 18, "Rng");
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 72 + b * 74, yy + 21 + a * 18, string(global.ITEM[item, 7]) + "-" + string(global.ITEM[item, 8]));
	}
}
else
{
	draw_set_color(fontColor1);
	/*
	if(string_height_ext(global.ITEM[item, 17], 13, 148) > 64)
	{
		draw_set_font(ft_small);
		draw_text_ext(xx + 7, yy - 2 + 19, global.ITEM[item, 17], 11, 148);
	}
	else
	*/
	draw_text_ext(xx + 7, yy - 2 + 19, global.ITEM[item, 17], 16, 148);
	//draw_set_font(ft_med);
}
	
draw_set_halign(fa_left);