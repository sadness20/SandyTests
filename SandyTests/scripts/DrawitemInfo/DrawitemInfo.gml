var item = argument[0];
	
//blackbar

//var dr = 0;
if(item != -1 && item != undefined)
{
	var a = 0;
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0, 192, global.window_w, global.window_h, 0);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_font(ft_med);
	if(global.ITEM[item, 3] == 2 && global.ITEM[item, 4] >= 10 && global.ITEM[item, 14] < 2)
	{
		a += 1;
		draw_set_color(fontColor4);
	
		draw_set_font(ft_large);

		var weaponTyp = global.ITEM[item, 4] - 10;
		var weaponRank = global.ITEM[item, 20];
		draw_sprite(spr_weaponIcons, weaponTyp, 32, 197);
		draw_sprite(spr_rank, weaponRank, 48, 200);

		draw_text(66, 185, "Mt");
		draw_text(66 + 58, 185, "Hit");
		draw_text(66 + 58 * 2, 185, "Crit");
		//draw_text(66 + 58 * 3, 185, "Avo");
		draw_text(66 + 58 * 3, 185, "Rng");
		
		if(global.ITEM[item, 18] != -1 || global.ITEM[item, 19] != -1)draw_text(68 + 58 * 4, 185, "Eff");

	
		draw_set_halign(fa_right);
	
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
		draw_text(117, 189, global.ITEM[item, 10]);
		draw_text(117 + 58, 189, global.ITEM[item, 11]);
		draw_text(117 + 58 * 2, 189, global.ITEM[item, 12]);
		//draw_text(117 + 58 * 3, 189,global.ITEM[item, 13]);
		draw_text(119 + 58 * 3, 189, string(global.ITEM[item, 7]) + "-" + string(global.ITEM[item, 8]));
		
		var count = 0;
		for(var i = 0; i < 2; i ++)
		{
			if(global.ITEM[item, 18 + i] != -1)
			{
				draw_sprite(spr_effectiveDamage, global.ITEM[item, 18 + i], 96 + 58 * 4 + count * 13, 197);
				count ++;
			}
		}
	
		//draw_text(xScroll, 209, boxtext);
		//draw_text(xScroll + string_width(boxtext) + 16, 209, boxtext);
	}
	if(global.ITEM[item, 3] == 2 && global.ITEM[item, 4] >= 10 && global.ITEM[item, 14] == 2)
	{

		
		a += 1;
		draw_set_color(fontColor4);
	
		draw_set_font(ft_large);
		
		var weaponTyp = global.ITEM[item, 4] - 10;
		var weaponRank = global.ITEM[item, 20];
		draw_sprite(spr_weaponIcons, weaponTyp, 32, 197);
		draw_sprite(spr_rank, weaponRank, 48, 200);
		
		if(global.ITEM[item, 10] > 0)draw_text(66, 185, "Mt");
		if(global.ITEM[item, 8] > 0)draw_text(66 + 58, 185, "Rng");
		
		
		draw_set_halign(fa_right);
	
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
		
		if(global.ITEM[item, 10] > 0)
		{
			draw_text(117, 189, global.ITEM[item, 10]);
		}
		if(global.ITEM[item, 8] > 0)
		{
			draw_text(117 + 58, 189, string(global.ITEM[item, 7]) + "-" + string(global.ITEM[item, 8]));
		}
	
		//draw_text(xScroll, 209, boxtext);
		//draw_text(xScroll + string_width(boxtext) + 16, 209, boxtext);
	}

	draw_set_halign(fa_left);
	draw_set_font(ft_large);
	draw_set_color(fontColor1);
	var txt = DescriptionString(item);
	
	if(string_width(txt) > 400 - 64)
	{
		draw_text(32 + xScroll, 185 + 19, string(txt));
		draw_text(32 + xScroll + string_width(txt) + 48, 185 + 19, string(txt));
	}
	else
	{
		draw_text(32, 185 + 19, string(txt));
	}
	
	draw_set_font(ft_med);
}