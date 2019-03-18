var skill = argument[0], xx = argument[1], yy = argument[2];

draw_sprite(spr_statsItem, 0, xx, yy);

xx -= 2;
yy -= 2;

draw_set_font(ft_med);

var a = 0, b = 0;

draw_sprite(spr_switchWeapon, 0, xx + 16, yy + 16);
draw_sprite(spr_skills, global.SKILL[skill, 2], xx + 8, yy + 8);

draw_sprite(spr_itemListsmall, 0, xx + 28, yy + 6);

draw_set_color(fontColor2);
draw_text(xx + 32, yy - 1, global.SKILL[skill, 0]);

draw_set_color(fontColor1);
if(string_height_ext(global.SKILL[skill, 1], 13, 148) > 64)
{
	draw_set_font(ft_small);
	draw_text_ext(xx + 7, yy - 2 + 19, global.SKILL[skill, 1], 11, 148);
}
else
draw_text_ext(xx + 7, yy - 2 + 19, global.SKILL[skill, 1], 13, 148);
draw_set_font(ft_med);

a = 0;
b = 0;

if(global.SKILL[skill, 3] > 0)
{
	draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 72 + a * 18);
	draw_set_color(fontColor1);
	draw_set_halign(fa_center);
	draw_text(xx + 27 + b * 74, yy + 63 + a * 18, "SP");
	draw_set_color(fontColor2);
	draw_set_halign(fa_right);
	draw_text(xx + 72 + b * 74, yy + 63 + a * 18, global.SKILL[skill, 3]);
	b = 1;
}

if(global.SKILL[skill, 9] != -1)
{
	draw_sprite(spr_levelupSkill, 0, xx + 6 + b * 74, yy + 72 + a * 18);
	draw_set_color(fontColor1);
	draw_set_halign(fa_center);
	draw_text(xx + 27 + b * 74, yy + 63 + a * 18, "Rng");
	draw_set_color(fontColor2);
	draw_set_halign(fa_right);
	draw_text(xx + 72 + b * 74, yy + 63 + a * 18, string(global.SKILL[skill, 9]) + "-" + string(global.SKILL[skill, 10]));
}	
	
draw_set_halign(fa_left);