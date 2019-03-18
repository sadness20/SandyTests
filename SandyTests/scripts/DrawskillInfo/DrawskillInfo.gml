var skill = argument[0];
var charID = argument[1];
	
//blackbar
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 192, global.window_w, global.window_h, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_font(ft_med);

if(skill != -1)
{
	var a = 0;

	draw_set_color(fontColor4);
	
	draw_set_font(ft_large);
	draw_sprite(spr_skills, global.SKILL[skill, 2], 32, 197);
	
	draw_text(53 + a * 58, 185, "SP");
	
	draw_set_halign(fa_right);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	draw_text(105 + a * 58, 189, string(global.SKILL[skill, 3]));
	
	draw_set_halign(fa_left);
	a += 1;
	
	if(global.SKILL[skill, 9] != -1)
	{
		draw_set_color(fontColor4);
		draw_set_font(ft_large);
		draw_text(53 + a * 58, 185, "Rng");
	
		draw_set_halign(fa_right);
	
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
		draw_text(105 + 6 + a * 58, 189, string(global.SKILL[skill, 9]) + "-" + string(global.SKILL[skill, 10]));
	
		draw_set_halign(fa_left);
		a += 1;
	}
	
	//draw_text(xScroll, 209, boxtext);
	//draw_text(xScroll + string_width(boxtext) + 16, 209, boxtext);
	
	draw_set_halign(fa_left);
	draw_set_font(ft_large);
	draw_set_color(fontColor1);
	var txt = global.SKILL[skill, 1];
	if(string_width(txt) > 400 - 64)
	{
		draw_text(32 + xScroll, 185 + 19, string(txt));
		draw_text(32 + xScroll + string_width(txt) + 48, 185 + 19, string(txt));
	}
	else
	{
		draw_text(32, 185 + 19, string(txt));
	}
}