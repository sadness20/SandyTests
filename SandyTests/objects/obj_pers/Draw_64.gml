/// @description Insert description here
// You can write your code in this editor

var xpos = (global.window_w - 381) / 2;
var ypos = global.window_h - 55;
/// @description Insert description here
// You can write your code in this editor


switch(gamestate)
{

	
	case "endgamelose2":
	
		draw_set_color(c_black);
		draw_set_alpha((guiTimer / 60));
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
	
	break;
	
	case "endgamelose3":
	
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_sprite_ext(spr_ending, 0, 0, 0, 1, 1, 0, c_white, (guiTimer / 60));
	
	break;
	
	case "endgamelose4":
	
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_sprite_ext(spr_ending, 0, 0, 0, 1, 1, 0, c_white, 1);
		
		if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen2);
		draw_clear_alpha(c_black, 0);
			
		draw_sprite(spr_menuMessageBig, 0, 200, 120);
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		draw_text(200, 82 + 9, "Reload your last save?");
			
		var iy = 65;
			
		draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
		draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
		if(global.glSelect5 == 2)
		{
			draw_text(150, 189 - iy, "Yes");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(150, 189 - iy, "Yes");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
		}
		if(global.glSelect5 == 1)
		{
			draw_text(250, 189 - iy, "No");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(250, 189 - iy, "No");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
		}
			
		surface_reset_target();
	
		draw_surface_ext(surfScreen2, 200 * tempVar, 0, 1 - tempVar, 1, 0, c_white, 1);
	
	break;
	
	case "endgamelose5":
	
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_sprite_ext(spr_ending, 0, 0, 0, 1, 1, 0, c_white, 1);
		draw_surface_ext(surfScreen2, 200 * tempVar, 0, 1 - tempVar, 1, 0, c_white, 1);
		draw_set_alpha(guiTimer / 30);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
	
	break;
	
	case "camp":
	
		if(tempVar4 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha((tempVar4 / 45));
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
	
	break;
		
	case "chest_interact":
	
		var storage = global.resourceBox;
		var storagestacks = global.resourceBoxAm;
		
		var sel = global.glSelect4;
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 5, ds_list_size(storage));
		var xi = 0;
		var xx = -16, yy = 23, ay = 0;
		
		for(var i = min_i; i < max_i; i ++)
		{
			draw_sprite(spr_weaponName2, 0, xx + 290, yy + 52 + xi * 19 + ay);
			if(sel == i && ds_list_size(storage) > 0)
			{
				var cva = obj_pers.sinVal2;
				draw_sprite_ext(spr_weaponName2, 0, xx + 290, yy + 52 + xi * 19 + ay, 1, 1, 0, make_color_rgb(255, 45, 15), 0.35 + 0.25 * cva);
			}
			xi ++;
		}
		//QWER
		
		xi = 0;
		
		for(var i = min_i; i < max_i; i ++)
		{
			var item = ds_list_find_value(storage, i);
			var stack = ds_list_find_value(storagestacks, i);
		
			if(item != undefined && item >= 0)
			{
				draw_set_font(ft_med);
				draw_set_color(fontColor2);
		
				draw_sprite(spr_items, global.ITEM[item, 1], xx + 138, yy + 54 + xi * 19 + ay);
			
				draw_text(xx + 155, yy + 45 + xi * 19 + ay, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 284, yy + 45 + xi * 19 + ay, "x" + string(stack));

				draw_set_halign(fa_left);
			}
			xi ++;
		}
	
	break;
	
	case "orb_options":
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		var xx = 46, yy = 8;
		draw_sprite(spr_statsAll2, 0, xx, yy);
	
		draw_sprite(spr_name, 0, xx + 10, yy + 9);
		draw_set_font(ft_med);
	
		if(global.glSelect6 == 0)
		{
			draw_set_halign(fa_center);
			draw_set_color(fontColor1);
			draw_text(xx + 69, yy + 2, "Repair");
		
			draw_sprite(spr_boxx, 0, xx + 51, yy + 38);
			var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
			if(item != undefined)DrawitemInfo(ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7));
			if(tempVar11 != -1)
			{
				draw_sprite(spr_items, global.ITEM[tempVar11, 1], xx + 61, yy + 48);
			}
		
			draw_set_halign(fa_left);
		
			draw_text(xx + 142, yy + 2, "Select an item to repair:");
		

		}
		if(global.glSelect6 == 1)
		{
			draw_set_halign(fa_center);
			draw_set_color(fontColor1);
			draw_text(xx + 69, yy + 2, "Dismantle");
		
			draw_sprite(spr_boxx, 0, xx + 51, yy + 38);
			var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
			if(item != undefined)DrawitemInfo(ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7));
			if(tempVar11 != -1)
			{
				draw_sprite(spr_items, global.ITEM[tempVar11, 1], xx + 61, yy + 48);
			}
		
			draw_set_halign(fa_left);
		
			draw_text(xx + 142, yy - 5, "Select an item to");
			draw_text(xx + 142, yy + 9, "dismantle:");

		}
		if(global.glSelect6 == 2)
		{
			draw_set_halign(fa_center);
			draw_set_color(fontColor1);
			draw_text(xx + 69, yy + 2, "Refine");
		
			draw_sprite(spr_boxx, 0, xx + 51, yy + 38);
			var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
			if(item != undefined)DrawitemInfo(ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7));
			if(tempVar11 != -1)
			{
				draw_sprite(spr_items, global.ITEM[tempVar11, 1], xx + 61, yy + 48);
			}
		
			draw_set_halign(fa_left);
		
			draw_text(xx + 142, yy + 2, "Select an item to refine:");
		
			/*
			draw_text(xx + 142, yy - 5, "Select an item to");
			draw_text(xx + 142, yy + 9, "dismantle:");
			*/
		}
		if(global.glSelect6 == 3)
		{
			draw_set_halign(fa_center);
			draw_set_color(fontColor1);
			draw_text(xx + 69, yy + 2, "Enchant");
			if(tempVar11 == -1)
			{
				var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
				if(item != undefined)DrawitemInfo(ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7));
			}
			draw_set_halign(fa_left);
			if(tempVar11 != -1)
			{
				draw_sprite(spr_boxx, 0, xx + 52, yy + 38);
				draw_sprite(spr_arrowHeal, 0, xx + 69, yy + 77);
				draw_sprite(spr_boxx, 0, xx + 52, yy + 38 + 52);
				draw_sprite(spr_items, global.ITEM[tempVar11, 1], xx + 62, yy + 48 + 52);
				
				draw_text(xx + 142, yy + 2, "Select a rune:");
				if(tempVar9 != -1)
				{
					draw_sprite(spr_items, global.ITEM[tempVar9, 1], xx + 62, yy + 48);
				}
			}
			else
			{
				draw_sprite(spr_boxx, 0, xx + 52, yy + 38 + 52);
				draw_text(xx + 142, yy - 5, "Select an item to");
				draw_text(xx + 142, yy + 9, "enchant:");
			}
		}
		if(global.glSelect6 == 4)
		{
			draw_set_halign(fa_center);
			draw_set_color(fontColor1);
			draw_text(xx + 69, yy + 2, "Craft");
		
			var a = 0, b = 0;
			for(var i = 0; i < 9; i ++)
			{
				draw_sprite(spr_boxx, 0, xx - 38 + 52 + a * 37, yy + 38 + b * 37);
			
				var item = ds_list_find_value(reList, i);
				if(item != undefined)draw_sprite(spr_items, global.ITEM[item, 1], xx + 24 + a * 37, yy + 47 + b * 37);
			
				a ++;
			
				if(a > 2)
				{
					a = 0;
					b ++;
				}
			}
		
			draw_set_halign(fa_left);
		
			draw_text(xx + 142, yy + 2, "Select resources:");

		}
		var inventory = global.CHAR[global.OWchar, 49];
		var useslist = global.CHAR[global.OWchar, 50];
		
		var ay = -16;
		xx += 6;
	
		if(tempVar10 != -2)
		{
			for(var i = 0; i < 5; i ++)
			{
				draw_sprite(spr_weaponName2, 0, xx + 290, yy + 52 + i * 19 + ay);
				if(global.glSelect7 == i && ds_list_size(inventory) > 0)
				{
					var cva = obj_pers.sinVal2;
					if(tempVar9 != -1)cva = 1;
					draw_sprite_ext(spr_weaponName2, 0, xx + 290, yy + 52 + i * 19 + ay, 1, 1, 0, make_color_rgb(255, 45, 15), 0.35 + 0.25 * cva);
				}
			}
			for(var i = 0; i < 5; i ++)
			{
				var item = ds_list_find_value(inventory, i);
				var uses = ds_list_find_value(useslist, i);
		
				if(item != undefined && item >= 0)
				{
					draw_set_font(ft_med);
					draw_set_color(fontColor2);
		
					draw_sprite(spr_items, global.ITEM[item, 1], xx + 138, yy + 54 + i * 19 + ay);
			
					var usable = false;
					if(global.ITEM[item, 4] >= 10)usable = true;
					//show_message(global.glSelect6);
					if(global.glSelect6 == 0)
					{
						if(uses >= global.ITEM[item, 2])
						{
							usable = false;
						}
					}
					if(global.glSelect6 == 2)
					{
						var times = global.ITEM[item, 30];
						if(times > 1)
						{
							usable = false;
						}
					}
					if(global.glSelect6 == 3)
					{
						if(global.ITEM[item, 4] == 18)usable = false;
					}

					if(usable == true)
					{
						draw_text(xx + 155, yy + 45 + i * 19 + ay, global.ITEM[item, 0]);
		
						draw_set_halign(fa_right);
						draw_text(xx + 284, yy + 45 + i * 19 + ay, uses);
					}
					else
					{
						draw_set_color(fontColor5);
						draw_text(xx + 155, yy + 45 + i * 19 + ay, global.ITEM[item, 0]);
		
						draw_set_halign(fa_right);
						draw_text(xx + 284, yy + 45 + i * 19 + ay, uses);
						draw_set_color(fontColor2);
					}

					if(global.CHAR[global.OWchar, 56] == i)
					{
						draw_sprite(spr_equipped, 0, xx + 146, yy + 54 + i * 19 + 9 + ay);
					}
					draw_set_halign(fa_left);
				}
			}
		}
		else
		{
			var storage = global.resourceBox;
			var storagestacks = global.resourceBoxAm;
		
			var sel = global.glSelect8;
			var min_i = max(sel - tempVar2, 0);
			var max_i = min(min_i + 5, ds_list_size(storage));
			var xi = 0;
		
			for(var i = min_i; i < max_i; i ++)
			{
				draw_sprite(spr_weaponName2, 0, xx + 290, yy + 52 + xi * 19 + ay);
				if(sel == i && ds_list_size(storage) > 0)
				{
					var cva = obj_pers.sinVal2;
					if(tempVar9 != -1)cva = 1;
					draw_sprite_ext(spr_weaponName2, 0, xx + 290, yy + 52 + xi * 19 + ay, 1, 1, 0, make_color_rgb(255, 45, 15), 0.35 + 0.25 * cva);
				}
				xi ++;
			}
			//QWER
		
		
			var item = ds_list_find_value(storage, global.glSelect8);
			if(item == undefined)item = -1;
			DrawitemInfo(item);
		
			xi = 0;
		
			for(var i = min_i; i < max_i; i ++)
			{
				var item = ds_list_find_value(storage, i);
				var stack = ds_list_find_value(storagestacks, i);
		
				if(item != undefined && item >= 0)
				{
					draw_set_font(ft_med);
					draw_set_color(fontColor2);
		
					draw_sprite(spr_items, global.ITEM[item, 1], xx + 138, yy + 54 + xi * 19 + ay);
			
					var usable = false;
					if(global.ITEM[item, 3] == 4)usable = true;
					//show_message(global.glSelect6);
					if(global.glSelect6 == 3)
					{
						var subtype = global.ITEM[item, 4];
						if(subtype != 6)
						{
							usable = false;
						}
					}
				
					if(global.glSelect6 == 4)
					{
						var subtype = global.ITEM[item, 4];
						if(subtype == 6)
						{
							usable = false;
						}
					}

					if(usable == true)
					{
						draw_text(xx + 155, yy + 45 + xi * 19 + ay, global.ITEM[item, 0]);
		
						draw_set_halign(fa_right);
						draw_text(xx + 284, yy + 45 + xi * 19 + ay, "x" + string(stack));
					}
					else
					{
						draw_set_color(fontColor5);
						draw_text(xx + 155, yy + 45 + xi * 19 + ay, global.ITEM[item, 0]);
		
						draw_set_halign(fa_right);
						draw_text(xx + 284, yy + 45 + xi * 19 + ay, "x" + string(stack));
						draw_set_color(fontColor2);
					}
					draw_set_halign(fa_left);
				}
				xi ++;
			}
		}
	
		yy -= 30;
		if(global.glSelect6 != 4)
		{
			xx += 41;
			yy -= 15;
			draw_set_halign(fa_center);
			draw_sprite(spr_shopConfirmbox, 0, xx + 20, yy + 192 + 17);
			draw_set_color(fontColor2);
		}
	
		if(tempVar11 != -1)
		{
			if(global.glSelect6 < 3)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, xx + 20, yy + 192 + 17, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
		}
		if(tempVar9 != -1)
		{
			if(global.glSelect6 == 3)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, xx + 20, yy + 192 + 17, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
		}
		if(global.glSelect6 == 0)
		{
			draw_text(xx + 20, yy + 192, "Repair");
	
			draw_set_color(fontColor1);
			draw_set_font(ft_small);
	
			draw_text(xx + 20, yy + 175, "Cost: " + string(tempVar10));
	
			draw_sprite_ext(spr_goldIndicator, 2, xx + 259 - 138, yy + 3 + 191, 1, 1, 0, c_white, 1);
	
			draw_set_font(ft_med);
			draw_set_color(fontColor1);
			draw_set_halign(fa_right);
			draw_text(xx + 217, yy + -0.5 + 191, global.gold);
		}
		if(global.glSelect6 == 1)
		{
			draw_text(xx + 20, yy + 192, "Dismantle");
		}
		if(global.glSelect6 == 2)
		{
			draw_text(xx + 20, yy + 192, "Refine");
	
			draw_set_color(fontColor1);
			draw_set_font(ft_small);
	
			draw_text(xx + 20, yy + 175, "Cost: " + string(tempVar10));
	
			draw_sprite_ext(spr_goldIndicator, 2, xx + 259 - 138, yy + 3 + 191, 1, 1, 0, c_white, 1);
	
			draw_set_font(ft_med);
			draw_set_color(fontColor1);
			draw_set_halign(fa_right);
			draw_text(xx + 217, yy + -0.5 + 191, global.gold);
		}
		if(global.glSelect6 == 3)
		{
			draw_text(xx + 20, yy + 192, "Enchant");
		}
		if(global.glSelect6 == 4)
		{
			yy -= 15;
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(xx + 154, yy + 196, "- Press \"M\" to craft -");
		}
	
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, 1 - tempVar, 1, 0, c_white, 1);
	
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
	
	
	break;
	
	case "orb_interact":
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	draw_set_font(ft_med);
		
	draw_sprite(spr_shopConfirmbox, 0, 200, 94);
	if(global.glSelect4 == 0)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77, "Repair");
		
	draw_set_color(fontColor2);
		
	draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
	if(global.glSelect4 == 1)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77 + 26, "Dismantle");
	
	draw_set_color(fontColor2);
	
	draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
	if(global.glSelect4 == 2)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77 + 26 * 2, "Refine");
	
	draw_set_color(fontColor2);
	
	draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 3);
	if(global.glSelect4 == 3)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 3, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77 + 26 * 3, "Enchant");
	
	draw_set_color(fontColor2);
	
	draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 4);
	if(global.glSelect4 == 4)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 4, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77 + 26 * 4, "Craft");
	
	draw_set_color(fontColor2);
	
		
	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 * tempVar, - 30, 1 - tempVar, 1, 0, c_white, 1);
		
	if(global.glSelect3 > 0)
	{
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
	}
		
		
	if(global.glSelect3 == 2)
	{
		if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen2);
		draw_clear_alpha(c_black, 0);
			
		draw_sprite(spr_menuMessageBig, 0, 200, 120);
		draw_set_color(fontColor2);
		draw_text(200, 82, "You're about to free this prisoner.");
		draw_text(200, 82 + 18, "Are you sure?");
			
		var iy = 65;
			
		draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
		draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
		if(global.glSelect5 == 2)
		{
			draw_text(150, 189 - iy, "Yes");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(150, 189 - iy, "Yes");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
		}
		if(global.glSelect5 == 1)
		{
			draw_text(250, 189 - iy, "No");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(250, 189 - iy, "No");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
		}
			
		surface_reset_target();
	
		draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
	}
	
	break;
	
	case "sandyjail_interact":
	
	draw_set_color(c_black);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	draw_set_font(ft_med);
		
	draw_sprite(spr_shopConfirmbox, 0, 200, 94);
	if(global.glSelect4 == 0)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77, "Recruit");
		
	draw_set_color(fontColor2);
		
	draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
	if(global.glSelect4 == 1)
	{
		draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
		draw_set_color(fontColor1);
	}
	draw_text(200, 77 + 26, "Free");
		
	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 * tempVar, 8, 1 - tempVar, 1, 0, c_white, 1);
		
	if(global.glSelect3 > 0)
	{
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
	}
		
		
	if(global.glSelect3 == 2)
	{
		if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen2);
		draw_clear_alpha(c_black, 0);
			
		draw_sprite(spr_menuMessageBig, 0, 200, 120);
		draw_set_color(fontColor2);
		draw_text(200, 82, "You're about to free this prisoner.");
		draw_text(200, 82 + 18, "Are you sure?");
			
		var iy = 65;
			
		draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
		draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
		if(global.glSelect5 == 2)
		{
			draw_text(150, 189 - iy, "Yes");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(150, 189 - iy, "Yes");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
		}
		if(global.glSelect5 == 1)
		{
			draw_text(250, 189 - iy, "No");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(250, 189 - iy, "No");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
		}
			
		surface_reset_target();
	
		draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
	}
	
	break;
	
	
	case "menu":
	
	draw_set_font(ft_med);
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	
	var vx = 1 - tempVar;
	
	draw_sprite(spr_bkMain, 0, -8, -8);
	
	if(global.glSelect2 == 0)
	{
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		draw_text(9, - 37 + vx * 36, "Main Menu");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, global.mmenuDescription[global.glSelect]);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		draw_set_color(fontColor2);
	
		var ay = 118 - (global.mmenuOptions / 2) * 32;
	
		for(var i = 0; i < global.mmenuOptions; i ++)
		{
			if((i == 0 || i == 3 || i == 4) && (global.nFiles == 0 && global.nBattleFiles == 0))shader_set(shGray);
			draw_set_color(fontColor2);
			if(global.glSelect != i)draw_sprite_ext(spr_menuButton, 0, 133, ay + i * 32, 1, 1, 0, c_white, 1);
			else
			{
				draw_sprite_ext(spr_menuButton, 1, 133, ay + i * 32, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menuButton, 0, 133, ay + i * 32, 1, 1, 0, c_white, sinVal2 * 0.3);
				draw_sprite_ext(spr_pick, 0, 52 + 67 + sinSize * 2, ay + 14 +  i * 32, 1, 1, 0, c_white, 1);
			}
			if(global.glSelect == i)draw_set_color(fontColor1);
			draw_text(200, ay + 1 + i * 32, global.mmenuText[i]);
			if((i == 0 || i == 3 || i == 4) && (global.nFiles == 0 && global.nBattleFiles == 0))
			{
				draw_sprite_ext(spr_menuButton, 0, 133, ay + i * 32, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		}
	
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
	}
	if(global.glSelect2 == 1)
	{
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		draw_text(9, - 37 + vx * 36, "Continue");
	
		draw_set_halign(fa_center);
		draw_set_color(fontColor1);
		if(global.glSelect7 == 0)draw_text(200, 209 + 36 - vx * 36, "Continue from a save file.");
		if(global.glSelect7 == 1)draw_text(200, 209 + 36 - vx * 36, "Continue from a normal save file.");
		if(global.glSelect7 == 2)draw_text(200, 209 + 36 - vx * 36, "Continue from a battle save file.");
		

		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
		if(global.glSelect7 == 1)
		{
			draw_set_color(fontColor2);
			//yayay
	
			var ay = 120 - (min(global.nFiles, 5) / 2) * 32;
	
			var sel = global.glSelect4;
			var min_i = max(sel - tempVar2, 0);
			var max_i = min(min_i + 5, global.nFiles);
			var b = 0;
			for(var i = min_i; i < max_i; i ++)
			{
				draw_set_color(fontColor2);
				if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
				else
				{
					draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, sinVal2 * 0.3);
					draw_sprite_ext(spr_pick, 0, 18 + 67 + sinSize * 2, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
				}
				if(global.glSelect4 == i)draw_set_color(fontColor1);
				draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.saveFiles_stage[i], 0] + " - " + string(global.saveFiles_seconds[i]));
				draw_text(200, ay + 1 + b * 32 + 7, global.saveFiles[i]);
			
				b ++;
			}
		} else
		if(global.glSelect7 == 2)
		{
			draw_set_color(fontColor2);
			//yayay
	
			var ay = 120 - (min(global.nBattleFiles, 5) / 2) * 32;
	
			var sel = global.glSelect4;
			var min_i = max(sel - tempVar2, 0);
			var max_i = min(min_i + 5, global.nBattleFiles);
			var b = 0;
			for(var i = min_i; i < max_i; i ++)
			{
				draw_set_color(fontColor2);
				if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
				else
				{
					draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, sinVal2 * 0.3);
					draw_sprite_ext(spr_pick, 0, 18 + 67 + sinSize * 2, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
				}
				if(global.glSelect4 == i)draw_set_color(fontColor1);
				draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.battleFiles_stage[i], 0] + " - " + string(global.battleFiles_seconds[i]));
				draw_text(200, ay + 1 + b * 32 + 7, global.battleFiles[i]);
			
				b ++;
			}
		}
		else
		{
			draw_set_color(fontColor2);
			draw_set_halign(fa_center);
			draw_set_font(ft_med);
		
			if(global.nFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94);
			if(global.glSelect4 == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77, "Normal Save");
			if(global.nFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			if(global.nBattleFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
			if(global.glSelect4 == 1)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26, "Battle Save");
			
			if(global.nBattleFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
			if(global.glSelect4 == 2)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26 * 2, "Back");
		}
	
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
	}
	if(global.glSelect2 == 2)
	{	
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_set_alpha(0.5 * vx);
		draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 0);
		if(global.glSelect4 == 0)
		{
			draw_set_color(fontColor1);
			draw_rectangle(200 - 88.5, 91.5, 200 + 88.5, 98 + 12.5, 1);
			draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 1);
		}
		else
		{
			draw_set_color(fontColor2);
			draw_rectangle(200 - 88.5, 91.5, 200 + 88.5, 98 + 12.5, 1);
			draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 1);
		}
		draw_set_alpha(1);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		draw_set_color(fontColor2);
		draw_set_font(ft_large);
	
		draw_text(200, 60, "File Name:");
		
		draw_set_color(fontColor1);
		
		draw_set_halign(fa_left);
		draw_text(100 + 24, 80, fileName);
		
		var wif = string_width(string_copy(fileName, 1, caret))
		draw_set_font(ft_debug);
		if(global.glSelect3 == 0 && global.glSelect4 == 0)draw_text(101 + 22 + wif, 96.5, slash);
		
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		
		if(fileName == "")shader_set(shGray);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 128);
		if(global.glSelect4 == 1)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111, "Create");
		
		if(fileName == "")
		{
			draw_sprite_ext(spr_shopConfirmbox, 0, 200, 130, 1, 1, 0, c_black, 0.5);
			shader_reset();
		}
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 128 + 26);
		if(global.glSelect4 == 2)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111 + 26, "Back");
		
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
		
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		draw_set_color(fontColor8);
		draw_text(9, - 37 + vx * 36, "New Game");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, global.mmenuDescription[global.glSelect]);
		
		if(global.glSelect3 == 2)
		{
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
			
			draw_sprite(spr_menuMessage, 0, 200, 120);
			draw_set_color(fontColor2);
			draw_text(200, 82, "This file already exists.");
			draw_text(200, 82 + 18, "Overwrite?");
			
			var iy = 65;
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
			if(global.glSelect5 == 2)
			{
				draw_text(150, 189 - iy, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189 - iy, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
			}
			if(global.glSelect5 == 1)
			{
				draw_text(250, 189 - iy, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189 - iy, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
			}
			
			surface_reset_target();
	
			draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
		}
	}
	if(global.glSelect2 == 3)
	{
		draw_set_color(c_black);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
		
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 94);
		if(global.glSelect4 == 0)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77, "Join Game");
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
		if(global.glSelect4 == 1)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77 + 26, "Host Game");
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
		if(global.glSelect4 == 2)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77 + 26 * 2, "Back");
		
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
		
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		draw_set_color(fontColor8);
		draw_text(9, - 37 + vx * 36, "Multiplayer");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, global.mmenuDescription[global.glSelect]);
		
		if(global.glSelect3 == 2)
		{
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
			
			draw_sprite(spr_menuMessage, 0, 200, 120);
			draw_set_color(fontColor2);
			draw_text(200, 82, "This file already exists.");
			draw_text(200, 82 + 18, "Overwrite?");
			
			var iy = 65;
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
			if(global.glSelect5 == 2)
			{
				draw_text(150, 189 - iy, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189 - iy, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
			}
			if(global.glSelect5 == 1)
			{
				draw_text(250, 189 - iy, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189 - iy, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
			}
			
			surface_reset_target();
	
			draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
		}
	}
	if(global.glSelect2 == 10)
	{
		//join game
		draw_set_color(c_black);
		draw_set_alpha(0.5 * vx);
		var yy = -24;
		draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 0);
		if(global.glSelect4 == 0)
		{
			draw_set_color(fontColor1);
			draw_rectangle(243 - 88.5, 91.5 + yy, 200 + 88.5, 98 + 12.5 + yy, 1);
			draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 1);
		}
		else
		{
			draw_set_color(fontColor2);
			draw_rectangle(243 - 88.5, 91.5 + yy, 200 + 88.5, 98 + 12.5 + yy, 1);
			draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 1);
		}
		draw_set_color(c_black);
		var yy = 0;
		draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 0);
		if(global.glSelect4 == 1)
		{
			draw_set_color(fontColor1);
			draw_rectangle(243 - 88.5, 91.5 + yy, 200 + 88.5, 98 + 12.5 + yy, 1);
			draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 1);
		}
		else
		{
			draw_set_color(fontColor2);
			draw_rectangle(243 - 88.5, 91.5 + yy, 200 + 88.5, 98 + 12.5 + yy, 1);
			draw_rectangle(243 - 88, 92 + yy, 200 + 88, 98 + 12 + yy, 1);
		}
		draw_set_alpha(1);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		draw_set_color(fontColor2);
		draw_set_font(ft_large);
	
		draw_set_halign(fa_right);
		draw_text(148, 58, "IP:");
		draw_text(148, 58 + 24, "PORT:");
		
		draw_set_halign(fa_left);
		
		draw_set_color(fontColor1);
		
		draw_text(158, 56, fileName);
		draw_text(158, 56 + 24, fileName2);
		
		var wif = string_width(string_copy(fileName, 1, caret))
		var wiff = string_width(string_copy(fileName2, 1, caret2))
		draw_set_font(ft_debug);
		if(global.glSelect3 == 0 && global.glSelect4 == 0)draw_text(158 + wif, 72, slash);
		if(global.glSelect3 == 0 && global.glSelect4 == 1)draw_text(158 + wiff, 72 + 24, slash);
		
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		
		if(fileName == "" || fileName2 == "")shader_set(shGray);
		
		yy = 6;
		draw_sprite(spr_shopConfirmbox, 0, 200, 128 + yy);
		if(global.glSelect4 == 2)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128 + yy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111 + yy, "Join");
		
		if(fileName == "" || fileName2 == "")
		{
			draw_sprite_ext(spr_shopConfirmbox, 0, 200, 130 + yy, 1, 1, 0, c_black, 0.5);
			shader_reset();
		}
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 128 + 26 + yy);
		if(global.glSelect4 == 3)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128 + 26 + yy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111 + 26 + yy, "Back");
		
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
		
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		draw_set_color(fontColor8);
		draw_text(9, - 37 + vx * 36, "Join Game");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, "Join a multiplayer game.");
		
		if(global.glSelect3 == 2)
		{
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
			
			draw_sprite(spr_menuMessage, 0, 200, 120);
			draw_set_color(fontColor2);
			draw_text(200, 82, "This file already exists.");
			draw_text(200, 82 + 18, "Overwrite?");
			
			var iy = 65;
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
			if(global.glSelect5 == 2)
			{
				draw_text(150, 189 - iy, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189 - iy, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
			}
			if(global.glSelect5 == 1)
			{
				draw_text(250, 189 - iy, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189 - iy, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
			}
			
			surface_reset_target();
	
			draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
		}
	}
	if(global.glSelect2 == 11)
	{
		//host main
		draw_set_color(c_black);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
		
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 94);
		if(global.glSelect4 == 0)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77, "New Game");
		
		draw_set_color(fontColor2);
		
		if(global.nFiles == 0)shader_set(shGray);
		draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
		if(global.glSelect4 == 1)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77 + 26, "Continue");
		if(global.nFiles == 0)
		{
			shader_reset();
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_black, 0.5);
		}
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
		if(global.glSelect4 == 2)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 77 + 26 * 2, "Back");
		
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
		
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		draw_set_color(fontColor8);
		draw_text(9, - 37 + vx * 36, "Host Game");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, "Host a multiplayer game.");
		

	}
	if(global.glSelect2 == 13)
	{	
		//host new game
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_set_alpha(0.5 * vx);
		draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 0);
		if(global.glSelect4 == 0)
		{
			draw_set_color(fontColor1);
			draw_rectangle(200 - 88.5, 91.5, 200 + 88.5, 98 + 12.5, 1);
			draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 1);
		}
		else
		{
			draw_set_color(fontColor2);
			draw_rectangle(200 - 88.5, 91.5, 200 + 88.5, 98 + 12.5, 1);
			draw_rectangle(200 - 88, 92, 200 + 88, 98 + 12, 1);
		}
		draw_set_alpha(1);
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		draw_set_color(fontColor2);
		draw_set_font(ft_large);
	
		draw_text(200, 60, "File Name:");
		
		draw_set_color(fontColor1);
		
		draw_set_halign(fa_left);
		draw_text(100 + 24, 80, fileName);
		
		var wif = string_width(string_copy(fileName, 1, caret))
		draw_set_font(ft_debug);
		if(global.glSelect3 == 0 && global.glSelect4 == 0)draw_text(101 + 22 + wif, 96.5, slash);
		
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		draw_set_font(ft_med);
		
		if(fileName == "")shader_set(shGray);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 128);
		if(global.glSelect4 == 1)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111, "Create");
		
		if(fileName == "")
		{
			draw_sprite_ext(spr_shopConfirmbox, 0, 200, 130, 1, 1, 0, c_black, 0.5);
			shader_reset();
		}
		
		draw_set_color(fontColor2);
		
		draw_sprite(spr_shopConfirmbox, 0, 200, 128 + 26);
		if(global.glSelect4 == 2)
		{
			draw_sprite_ext(spr_shopConfirmbox, 1, 200, 128 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_set_color(fontColor1);
		}
		draw_text(200, 111 + 26, "Back");
		
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
		}
		
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		draw_set_color(fontColor8);
		draw_text(9, - 37 + vx * 36, "New Multiplayer Game");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, "Create a new multiplayer game.");
		
		if(global.glSelect3 == 2)
		{
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
			
			draw_sprite(spr_menuMessage, 0, 200, 120);
			draw_set_color(fontColor2);
			draw_text(200, 82, "This file already exists.");
			draw_text(200, 82 + 18, "Overwrite?");
			
			var iy = 65;
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
			if(global.glSelect5 == 2)
			{
				draw_text(150, 189 - iy, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189 - iy, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
			}
			if(global.glSelect5 == 1)
			{
				draw_text(250, 189 - iy, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189 - iy, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
			}
			
			surface_reset_target();
	
			draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
		}
	}
	if(global.glSelect2 == 12)
	{
		//host game continue
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
		draw_text(9, - 37 + vx * 36, "Continue");
	
		draw_set_halign(fa_center);
	
		draw_set_color(fontColor1);
		draw_text(200, 209 + 36 - vx * 36, "Continue a multiplayer game.");
	
		if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen);
		draw_clear_alpha(c_black, 0);
	
		draw_set_color(fontColor2);
		//yayay
	
		var ay = 120 - (min(global.nFiles, 5) / 2) * 32;
	
		var sel = global.glSelect4;
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 5, global.nFiles);
		var b = 0;
		for(var i = min_i; i < max_i; i ++)
		{
			draw_set_color(fontColor2);
			if(global.glSelect4 != i)draw_sprite_ext(spr_menuButton, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
			else
			{
				draw_sprite_ext(spr_menuButton, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menuButton, 0, 200, ay + b * 32, 1, 1, 0, c_white, sinVal2 * 0.3);
				draw_sprite_ext(spr_pick, 0, 18 + 67 + sinSize * 2, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
			}
			if(global.glSelect4 == i)draw_set_color(fontColor1);
			draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.saveFiles_stage[i], 0] + " - " + string(global.saveFiles_seconds[i]));
			draw_text(200, ay + 1 + b * 32 + 7, global.saveFiles[i]);
			
			b ++;
		}
	
		surface_reset_target();
	
		draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
	}
	if(global.glSelect2 == 4)
	{
		if(global.glSelect7 == 0)
		{
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
			
			draw_set_color(fontColor2);
			draw_set_halign(fa_center);
			draw_set_font(ft_med);
		
			if(global.nFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94);
			if(global.glSelect4 == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77, "Normal Save");
			if(global.nFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			if(global.nBattleFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
			if(global.glSelect4 == 1)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26, "Battle Save");
			
			if(global.nBattleFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
			if(global.glSelect4 == 2)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26 * 2, "Back");
			
			surface_reset_target();
	
			draw_surface_ext(surfScreen2, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
			draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
			draw_text(9, - 37 + vx * 36, "Duplicate");
	
			draw_set_halign(fa_center);
	
			draw_set_color(fontColor1);
			if(global.glSelect7 == 1)draw_text(200, 209 + 36 - vx * 36, "Duplicate a normal save file.");
			else draw_text(200, 209 + 36 - vx * 36, "Duplicate a battle save file.");
			
	
			if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen);
			draw_clear_alpha(c_black, 0);
	
			draw_set_color(fontColor2);
			//yayay
			if(global.glSelect7 == 1)
			{
				var ay = 120 - (min(global.nFiles, 5) / 2) * 32;
	
				var sel = global.glSelect4;
				var min_i = max(sel - tempVar4, 0);
				var max_i = min(min_i + 5, global.nFiles);
				var b = 0;
				for(var i = min_i; i < max_i; i ++)
				{
					draw_set_color(fontColor2);
					if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					else
					{
						draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
						var si2 = sinVal2 * 0.3;
						var si = sinSize * 2;
						if(global.glSelect3 > 0)
						{
							si2 = 0.3;
							si = 2;
						}
						draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, si2);
						draw_sprite_ext(spr_pick, 0, 18 + 67 + si, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
					}
					if(global.glSelect4 == i)draw_set_color(fontColor1);
					draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.saveFiles_stage[i], 0] + " - " + string(global.saveFiles_seconds[i]));
					draw_text(200, ay + 1 + b * 32 + 7, global.saveFiles[i]);
			
					b ++;
				}
			}
			else
			{
				var ay = 120 - (min(global.nBattleFiles, 5) / 2) * 32;
	
				var sel = global.glSelect4;
				var min_i = max(sel - tempVar4, 0);
				var max_i = min(min_i + 5, global.nBattleFiles);
				var b = 0;
				for(var i = min_i; i < max_i; i ++)
				{
					draw_set_color(fontColor2);
					if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					else
					{
						draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
						var si2 = sinVal2 * 0.3;
						var si = sinSize * 2;
						if(global.glSelect3 > 0)
						{
							si2 = 0.3;
							si = 2;
						}
						draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, si2);
						draw_sprite_ext(spr_pick, 0, 18 + 67 + si, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
					}
					if(global.glSelect4 == i)draw_set_color(fontColor1);
					//draw_text(200, ay + 1 + b * 32, global.battleFiles[i]);
					draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.battleFiles_stage[i], 0] + " - " + string(global.battleFiles_seconds[i]));
					draw_text(200, ay + 1 + b * 32 + 7, global.battleFiles[i]);
			
					b ++;
				}
			}
	
			surface_reset_target();
	
			draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		
			if(global.glSelect3 > 0)
			{
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_rectangle(0, 0, global.window_w, global.window_h, 0);
				draw_set_alpha(1);
			}
		
		
			if(global.glSelect3 == 2)
			{
			
				if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
				surface_set_target(surfScreen2);
				draw_clear_alpha(c_black, 0);
			
				draw_sprite(spr_menuMessage, 0, 200, 120);
				draw_set_color(fontColor2);
				if(global.glSelect7 == 1)draw_text(200, 91, "Duplicate this normal file?");
				else draw_text(200, 91, "Duplicate this battle file?");
			
				var iy = 65;
			
				draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
				draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
				if(global.glSelect5 == 2)
				{
					draw_text(150, 189 - iy, "Yes");
				} else
				{	
					draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
					draw_set_color(fontColor1);
					draw_text(150, 189 - iy, "Yes");
					draw_set_color(fontColor2);
				
					draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
				}
				if(global.glSelect5 == 1)
				{
					draw_text(250, 189 - iy, "No");
				} else
				{	
					draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
					draw_set_color(fontColor1);
					draw_text(250, 189 - iy, "No");
					draw_set_color(fontColor2);
				
					draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
				}
			
				surface_reset_target();
	
				draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
			}
		}
	}
	if(global.glSelect2 == 5)
	{
		if(global.glSelect7 == 0)
		{
			
			if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen2);
			draw_clear_alpha(c_black, 0);
				
			draw_set_color(fontColor2);
			draw_set_halign(fa_center);
			draw_set_font(ft_med);
		
			if(global.nFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94);
			if(global.glSelect4 == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77, "Normal Save");
			if(global.nFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			if(global.nBattleFiles == 0)shader_set(shGray);
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26);
			if(global.glSelect4 == 1)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26, "Battle Save");
			
			if(global.nBattleFiles == 0)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26, 1, 1, 0, c_black, 0.5);
				shader_reset();
			}
		
			draw_set_color(fontColor2);
		
			draw_sprite(spr_shopConfirmbox, 0, 200, 94 + 26 * 2);
			if(global.glSelect4 == 2)
			{
				draw_sprite_ext(spr_shopConfirmbox, 1, 200, 94 + 26 * 2, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
			}
			draw_text(200, 77 + 26 * 2, "Back");
			surface_reset_target();
			draw_surface_ext(surfScreen2, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
			draw_sprite(spr_menuBottom, 0, 0, 244 - vx * 36);
			draw_text(9, - 37 + vx * 36, "Delete");
	
			draw_set_halign(fa_center);
	
			draw_set_color(fontColor1);
			if(global.glSelect7 == 1)draw_text(200, 209 + 36 - vx * 36, "Delete a normal save file.");
			else draw_text(200, 209 + 36 - vx * 36, "Delete a battle save file.");
			
	
			if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
			surface_set_target(surfScreen);
			draw_clear_alpha(c_black, 0);
	
			draw_set_color(fontColor2);
			//yayay
	
			if(global.glSelect7 == 1)
			{
				var ay = 120 - (min(global.nFiles, 5) / 2) * 32;
	
				var sel = global.glSelect4;
				var min_i = max(sel - tempVar4, 0);
				var max_i = min(min_i + 5, global.nFiles);
				var b = 0;
				for(var i = min_i; i < max_i; i ++)
				{
					draw_set_color(fontColor2);
					if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					else
					{
						draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
						var si2 = sinVal2 * 0.3;
						var si = sinSize * 2;
						if(global.glSelect3 > 0)
						{
							si2 = 0.3;
							si = 2;
						}
						draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, si2);
						draw_sprite_ext(spr_pick, 0, 18 + 67 + si, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
					}
					if(global.glSelect4 == i)draw_set_color(fontColor1);
					//draw_text(200, ay + 1 + b * 32, global.saveFiles[i]);
					draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.saveFiles_stage[i], 0] + " - " + string(global.saveFiles_seconds[i]));
					draw_text(200, ay + 1 + b * 32 + 7, global.saveFiles[i]);
			
					b ++;
				}
			}
			else
			{
				var ay = 120 - (min(global.nBattleFiles, 5) / 2) * 32;
	
				var sel = global.glSelect4;
				var min_i = max(sel - tempVar4, 0);
				var max_i = min(min_i + 5, global.nBattleFiles);
				var b = 0;
				for(var i = min_i; i < max_i; i ++)
				{
					draw_set_color(fontColor2);
					if(global.glSelect4 != i)draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, 1);
					else
					{
						draw_sprite_ext(spr_menuButtonLarge, 1, 200, ay + b * 32, 1, 1, 0, c_white, 1);
						var si2 = sinVal2 * 0.3;
						var si = sinSize * 2;
						if(global.glSelect3 > 0)
						{
							si2 = 0.3;
							si = 2;
						}
						draw_sprite_ext(spr_menuButtonLarge, 0, 200, ay + b * 32, 1, 1, 0, c_white, si2);
						draw_sprite_ext(spr_pick, 0, 18 + 67 + si, ay + 14 +  b * 32, 1, 1, 0, c_white, 1);
					}
					if(global.glSelect4 == i)draw_set_color(fontColor1);
					draw_text(200, ay + 1 + b * 32 - 7, "Challenge: " + global.STAGE[global.battleFiles_stage[i], 0] + " - " + string(global.battleFiles_seconds[i]));
					draw_text(200, ay + 1 + b * 32 + 7, global.battleFiles[i]);
			
					b ++;
				}
			}
	
			surface_reset_target();
	
			draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
		
		
			if(global.glSelect3 > 0)
			{
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_rectangle(0, 0, global.window_w, global.window_h, 0);
				draw_set_alpha(1);
			}
		
		
			if(global.glSelect3 == 2)
			{
			
				if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
				surface_set_target(surfScreen2);
				draw_clear_alpha(c_black, 0);
			
				draw_sprite(spr_menuMessage, 0, 200, 120);
				draw_set_color(fontColor2);
				if(global.glSelect7 == 1)draw_text(200, 91, "Delete this normal file?");
				else draw_text(200, 91, "Delete this battle file?");
			
				var iy = 65;
			
				draw_sprite(spr_shopConfirmbox, 0, 150, 206 - iy);
				draw_sprite(spr_shopConfirmbox, 0, 250, 206 - iy);
			
				if(global.glSelect5 == 2)
				{
					draw_text(150, 189 - iy, "Yes");
				} else
				{	
					draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
					draw_set_color(fontColor1);
					draw_text(150, 189 - iy, "Yes");
					draw_set_color(fontColor2);
				
					draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202 - iy);
				}
				if(global.glSelect5 == 1)
				{
					draw_text(250, 189 - iy, "No");
				} else
				{	
					draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206 - iy, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
					draw_set_color(fontColor1);
					draw_text(250, 189 - iy, "No");
					draw_set_color(fontColor2);
				
					draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202 - iy);
				}
			
				surface_reset_target();
	
				draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
			}
		}
	}

	if(global.glSelect3 == 1)
	{
		if (!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
		surface_set_target(surfScreen2);
		draw_clear_alpha(c_black, 0);
			
		draw_set_halign(fa_left);
		draw_sprite(spr_superbigMessage, 0, 200 - 126, 120 - 33);
		draw_set_color(fontColor2);
		draw_text(104, 92, "Saving your progress...");
		draw_text(104, 92 + 18, "Please do not turn the power off.");
			
		draw_sprite(spr_loading, tempVar2, 314, 127);
			
				
		surface_reset_target();
	
		draw_surface_ext(surfScreen2, 200 * tempVar3, 0, 1 - tempVar3, 1, 0, c_white, 1);
	}
	
	break;
}

if(showMap)
{	
	draw_set_halign(fa_left);
	
	//overworldchange
	if(gamestate == "map")
	{
		DrawOW();
	}
	
	if(gamestate != "map" && gamestate != "mapwait" && gamestate != "mapunlock")
	{
		var al = 1;
		if(gamestate == "hidemain")al = 1 - opSize4;
		draw_set_color(c_black);
		draw_set_alpha(0.5 * al);
		draw_rectangle(0, 0, 480, 240, 0);
		draw_set_alpha(1);
	}
	if(tempVar4 > 0)
	{
		draw_set_color(c_black);
		draw_set_alpha(1 - (tempVar4 / 45));
		draw_rectangle(0, 0, 480, 240, 0);
		draw_set_alpha(1);
	}
	if(tempVar5 > 0)
	{
		draw_set_color(c_black);
		draw_set_alpha(tempVar5 / 45);
		draw_rectangle(0, 0, 480, 240, 0);
		draw_set_alpha(1);
	}
}
if(gamestate == "changeclass")
{
		var sel = global.glSelect2;
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 5, ds_list_size(classList));
		var b = 0;
		var xi = -18;
		//draw_sprite(spr_itemListsmall, 0, 32 + xi, 17 + b * 18 + yi);
		var ind = 0;
		var bc = c_white;
		
		surface_set_target(surfOptions);
		draw_clear_alpha(c_black, 0);
		draw_set_font(ft_med);
		draw_set_halign(fa_left);
		for(var i = min_i; i < max_i; i ++)
		{
			draw_set_color(fontColor2);
			
			var class = ds_list_find_value(classList, i);
			
			if(sel == i)
			{
				ind = 1;
				draw_set_color(fontColor1);
			
				var r = - 40 + sinSize * 40;
				//show_message(r);
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
				
			}
			else
			{
				draw_set_color(fontColor2);
				bc = c_white;
				ind = 0;
			}
			//draw_sprite(spr_itemListsmall, 0, 32 + xi, 38 + b * 18 + yi);
		    draw_sprite_ext(spr_itemListsmall, ind, 32 + xi, 38 + b * 18, 1, 1, 0, bc, 1);
			
			if(class != undefined && class >= 0)draw_text(39 + xi, 31 + b * 18, global.CLASS[class, global.CHAR[global.glSelect3, 2] * 2]);
			
			draw_set_color(fontColor1);
			if(sel == i)
			{
				var smove = sinSize * 2;
				if(global.glSelect4 == 1)smove = 2;
				draw_sprite_ext(spr_pick, 0, -1 + smove, 44 + b * 18, 1, 1, 0, c_white, 1);
			}

			
		b ++;
	}
	
	surface_reset_target();
	
	var total = 0;
	for(var i = 0; i < 10; i ++)
	{
		if(global.CLASS[global.CHAR[global.glSelect3, 3], 10 + i])
		{
			total ++;
		}
	}
	var a = 0;
	for(var i = 0; i < 10; i ++)
	{
		if(global.CLASS[global.CHAR[global.glSelect3, 3], 10 + i])
		{
			draw_sprite(spr_weaponIcons, i, 77 - (total / 2) * 18 + a * 18, 70);
			a ++;
		}
	}
	
	draw_surface_ext(surfOptions, 0, 52 , 1, 1, 0, c_white, 1);
	if(global.glSelect4)draw_surface_ext(surfOptions, 0, 52, 1, 1, 0, c_black, 0.5);
	DrawclassInfo(ds_list_find_value(classList, global.glSelect2), global.glSelect3);
	
	draw_set_font(ft_med);
	
	var xx = 178;
	var yy = -1;
	var a = 0;
	for(var i = 0; i < 8; i ++)
	{
		var val = global.CHAR[global.glSelect3, 6 + i];

		draw_set_halign(fa_center);
		//var wid = string_width(global.CHAR[charID, 6 + i]);	
		
		draw_sprite(spr_levelupSkill, 0, xx + 10, yy + 29 + a * 18);

		draw_set_color(fontColor1);
		draw_text(xx + 31, yy + 20 + a * 18, global.STAT[i]);
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 76, yy + 20 + a * 18, val);
		
		if(global.CHAR[global.glSelect3, 57] == true)
		{
			draw_sprite(spr_growths, 0, xx + 10 - 43, yy + 29 + a * 18);
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(xx + 31 - 43, yy + 20 + a * 18, string(global.CHAR[global.glSelect3, 14 + i]) + "%");
		}
		
		a ++;
	}
	
	draw_sprite_ext(spr_switchArrow, 0, 269, 99, -1, 1, 0, c_white, 1);
	
	a = 0;
	xx += 132;
	for(var i = 0; i < 8; i ++)
	{
		var val = global.CHAR[100, 6 + i];

		draw_set_halign(fa_center);
		//var wid = string_width(global.CHAR[charID, 6 + i]);	
		
		draw_sprite(spr_levelupSkill, 0, xx + 10, yy + 29 + a * 18);

		draw_set_color(fontColor1);
		draw_text(xx + 31, yy + 20 + a * 18, global.STAT[i]);
		draw_set_color(fontColor2);
		draw_set_halign(fa_right);
		draw_text(xx + 76, yy + 20 + a * 18, string(val + 2));
		
		if(global.CHAR[global.glSelect3, 57] == true)
		{
			draw_sprite(spr_growths, 0, xx + 10 - 43, yy + 29 + a * 18);
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(xx + 31 - 43, yy + 20 + a * 18, string(global.CHAR[100, 14 + i]) + "%");
		}
		
		a ++;
	}
	
	draw_sprite(spr_boxx, 0, 58, yy + 32);
	global.CHAR[global.glSelect3, 3] = ds_list_find_value(classList, global.glSelect2);
	DrawUnit(global.glSelect3, tcindex, tindex, 58 + 2.5, yy + 34, 1, 1, c_white, 1, 0, 3, 0);
	
	
	if(global.glSelect4 == 1)
	{
		var ya = 132;
			
		//draw_sprite(spr_superbigMessage, 0, 200 - 132, ya - 36);
			

			
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		
		var str = "Change to the " + global.CLASS[ds_list_find_value(classList, global.glSelect2), global.CHAR[global.glSelect3, 2] * 2] + " class?";
		MessageBox(str);
		draw_sprite(spr_shopConfirmbox, 0, 150, ya + 2);
		draw_sprite(spr_shopConfirmbox, 0, 250, ya + 2);
		var xi = 236 - string_width(str) / 2;
		
		draw_text(200, ya - 38, str);
			
		if(global.glSelect5 == 2)
		{
			draw_text(150, ya - 15, "Yes");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 150, ya + 2, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(150, ya - 15, "Yes");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 150 - 58 + obj_pers.sinSize * 2, ya - 2);
		}
		if(global.glSelect5 == 1)
		{
			draw_text(250, ya - 15, "No");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 250, ya + 2, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(250, ya - 15, "No");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 250 - 58 + obj_pers.sinSize * 2, ya - 2);
		}
			
			
		draw_set_halign(fa_left);
	}
}
if(gamestate == "changeclass2" || gamestate == "changeclass3")
{
	//draw_sprite_ext(spr_levelupNumber, 0, 220, 12 - 88 + guiTimer * 4.4, 1, 1, 0, c_white, guiTimer / 20);
	var xx = 9, yy = 16;
	draw_sprite(spr_boxx, 0, xx + 240, yy + 32);
	global.CHAR[global.glSelect3, 3] = tempVar9;
	DrawUnit(global.glSelect3, tcindex, tindex, xx + 240 + 2.5, yy + 32 + 2, 1, 1, c_white, 1, 0, 3, 0);
	draw_sprite(spr_boxx, 0, xx + 220 + 80, yy + 32);
	global.CHAR[global.glSelect3, 3] = ds_list_find_value(classList, global.glSelect2);
	DrawUnit(global.glSelect3, tcindex, tindex, xx + 220 + 80 + 2.5, yy + 32 + 2, 1, 1, c_white, 1, 0, 3, 0);
	draw_set_halign(fa_center);
	
	draw_sprite_ext(spr_switchArrow, 0, xx + 288, yy + 50, -1, 1, 0, c_white, 1);

	var port = global.PORT[global.CHAR[global.glSelect3, 1], 0];
	draw_sprite_ext(port, 0, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, c_white, guiTimer / 20);
	if(global.CHAR[global.glSelect3, 37] != -1)
	{
		if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, global.CHAR[global.glSelect3, 38], guiTimer / 20);
	}
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	var ex = 0, aa = 0;
	if(nupshow > 6)ex = nupshow - 6;
	var alph = guiTimer / 20;
	for(var i = ex; i < nupshow; i ++)
	{
		if(gamestate == "changeclass2")alph = nupshowy[i];
		draw_set_alpha(alph);
		var xx = 220 - 4, yy = 88 - 88 + guiTimer * 4.4 + aa * 23 + 64 - nupshowy[i] * 64;
		draw_sprite_ext(spr_statup, 0, xx, yy, 1, 1, 0, c_white, alph);
		var keyword = "increased";
		if(ds_list_find_value(nupVal, i) < 0)keyword = "decreased";
		draw_text(xx + 82, yy - 7, global.STAT[ds_list_find_value(nup, i)] + " " + keyword + " by " + string(ds_list_find_value(nupVal, i)));
		aa ++;
	}
	draw_set_halign(fa_left);
	draw_set_alpha(1);
}
if(gamestate == "shop")
{
	var shopkeeper = global.MAP[global.currentMap, 9];
	draw_sprite(bk_shop, 0, 0, 0);
	
	var vx = 1 - tempVar;
	draw_set_alpha(1);
	
	draw_set_halign(fa_left);
	var stock, inventory, prices, it = -1, price = -1;
	if(global.globalOptions == 2)
	{	
		var sel = global.glSelect;
		var char = ds_list_find_value(global.charList, global.glSelect2);
		if(global.glSelect2 == 100)char = 100;
		if(global.glSelect2 == 1000)char = 1000;
		var uses = 0;
		
		if(char != 1000)
		{
			uses = global.CHAR[char, 50];
		}
		else
		{
			uses = global.resourceBoxAm;
		}
		
		if(selling == 0)
		{
			stock = global.CHAR[shopkeeper, 50];
			inventory = global.CHAR[shopkeeper, 49];
			prices = global.CHAR[shopkeeper, 48];
			it = ds_list_find_value(prices, sel);
		}
		else
		{
			if(char != 1000)inventory = itemList;
			else inventory = global.resourceBox;
		}
		
		draw_set_color(fontColor2);
		
		
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 5, ds_list_size(inventory));
		//if(tchar != 1000)
		var b = 0;
		var yi = 32;
		var xi = 2;
		draw_sprite(spr_shopItems, 0, 32 + xi, 17 + b * 20 + yi);
		yi += 2;
		for(var i = min_i; i < max_i; i ++)
		{
			draw_set_color(fontColor2);
			draw_sprite(spr_shopItem, 0, 32 + xi, 38 + b * 20 + yi);
			var item = ds_list_find_value(inventory, i);
			
			if(sel == i)
			{
				var ss = 0.5 + sinVal2 * 0.5;
				if(global.glSelect3 > 0)ss = 1;
				draw_sprite_ext(spr_shopItem, 1, 32 + xi, 38 + b * 20 + yi, 1, 1, 0, c_white, ss);
				DrawitemInfo(item);
				draw_set_color(fontColor1);
			}
			
			draw_set_font(ft_med);
			if(char != 100 && char != 1000 && CanUse(char, item) == false && global.ITEM[item, 4] != 4 && !(global.ITEM[item, 3] == 0 && global.ITEM[item, 4] == 0) && !(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0))
			{
				draw_set_color(fontColor5);
				draw_text(56 + xi, 32 + b * 20 + yi, global.ITEM[item, 0]);
			} else
			draw_text(56 + xi, 32 + b * 20 + yi, global.ITEM[item, 0]);
			draw_set_color(fontColor2);
			
			draw_set_halign(fa_right);
			
			if(char != 1000)
			{
				if(selling == 1)draw_text(152 + 56 + xi, 32 + b * 20 + yi, ds_list_find_value(nupVal, i));
				else draw_text(152 + 56 + xi, 32 + b * 20 + yi, global.ITEM[item, 2]);
			}
			
			draw_sprite(spr_items, global.ITEM[item, 1], 38 + xi, 40 + b * 20 + yi);
			
			if(selling == 0)
			{
				var stck = ds_list_find_value(stock, i);
				if(stck >= 1000)draw_text(249 + xi, 32 + b * 20 + yi, "∞"); else
				draw_text(248 + xi, 32 + b * 20 + yi, stck);
			
				var sale = false;
				price = ds_list_find_value(prices, i);
				if(price < global.ITEM[item, 5])sale = true;
				if(sale)draw_sprite(spr_saleTag, 0, 35 + xi, 51 + b * 20 + yi);
				if(global.gold >= price)
				{
					if(sale)draw_set_color(fontColor9);
					draw_text(346 + xi, 32 + b * 20 + yi, string(price) + "G");
				}
				else
				{
					draw_sprite(spr_shopItem, 2, 32 + xi, 38 + b * 20 + yi);
					if(sale)draw_set_color(fontColor10); else draw_set_color(fontColor11);
					draw_text(346 + xi, 32 + b * 20 + yi, string(ds_list_find_value(prices, i)) + "G");
				}
			}
			else
			{
				if(char != 1000)
				{
					var use = ds_list_find_value(nupVal, i);
					//show_message(use);
					//price = floor((global.ITEM[ds_list_find_value(itemindexList, i), 5] / 2) * (use / global.ITEM[ds_list_find_value(itemindexList, i), 2]));
					price = global.ITEM[ds_list_find_value(itemList, i), 5] / 2;
					//show_message(price);
					var mult = global.ITEM[ds_list_find_value(itemList, i), 2];
					//show_message(mult);
					if(price != undefined && use != undefined && mult != undefined)
					{
						price = floor((price * use) / mult);
						draw_text(248 + xi, 32 + b * 20 + yi, ds_list_find_value(nup, i));
						if(price > 0)
						{
							draw_text(346 + xi, 32 + b * 20 + yi, string(price) + "G");
						}
						else
						{
							draw_set_color(fontColor11);
							draw_text(346 + xi, 32 + b * 20 + yi, price);
						}
					}
				}
				else
				{
					var stock = ds_list_find_value(uses, i);
					price = floor((global.ITEM[ds_list_find_value(inventory, i), 5] / 2));
					draw_text(248 + xi, 32 + b * 20 + yi, stock);
					if(price > 0)
					{
						draw_text(346 + xi, 32 + b * 20 + yi, string(price) + "G");
					}
					else
					{
						draw_set_color(fontColor11);
						draw_text(346 + xi, 32 + b * 20 + yi, "N/A");
					}
				}
			}
			
			if(sel == i)
			{
				var ab = sinSize * 2;
				if(global.glSelect3 > 0)ab = 2;
				draw_sprite(spr_pick, 0, 18 + xi + ab, 32 + b * 20 + 12 + yi);
			}
			draw_set_halign(fa_left);
			
			b += 1;
		}
		draw_set_color(fontColor2);
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
			
			draw_sprite(spr_bigMessage, 0, 200 - 109, 206 - 31);
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206);
			
			draw_set_color(fontColor2);
			draw_set_halign(fa_center);
			
			if(global.glSelect3 == 2)
			{
				draw_text(150, 189, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202);
			}
			if(global.glSelect3 == 1)
			{
				draw_text(250, 189, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202);
			}
			
			
			draw_set_halign(fa_left);
		}
		
		draw_set_color(fontColor8);
		if(selling == 0)
		{
			if(global.glSelect3 == 0)
			{
				draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
				draw_text(9, - 37 + vx * 36, "Please check our inventory.");
			}
			else
			{
				draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
				draw_text(9, - 37 + vx * 36, "That's " + string(it) + " gold.");
			}
		}
		else
		{
			if(global.glSelect3 == 0)
			{
				draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
				draw_text(9, - 37 + vx * 36, "What are you selling?");
			}
			else
			{
				if(char != 1000)
				{
					var use = ds_list_find_value(nupVal, global.glSelect);
					price = floor((global.ITEM[ds_list_find_value(itemList, global.glSelect), 5] / 2) * (use / global.ITEM[ds_list_find_value(itemList, global.glSelect), 2]));
					draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
					draw_text(9, - 37 + vx * 36, "I'll give you " + string(price) + " gold.");
				}
				else
				{
					price = floor((global.ITEM[ds_list_find_value(inventory, global.glSelect), 5] / 2));
					draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
					draw_text(9, - 37 + vx * 36, "I'll give you " + string(price) + " gold.");
				}
			}
		}
	}
	if(global.globalOptions == 1)
	{	
		draw_set_color(fontColor8);
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		if(selling == 0)draw_text(9, - 37 + vx * 36, "Who are you buying for?");
		else draw_text(9, - 37 + vx * 36, "Who is selling?");
		
		draw_sprite(spr_shopcharInfo, 0, 42, 56);
		draw_sprite(spr_name, 0, 62, 43);
		
		var char = ds_list_find_value(global.charList, global.glSelect2);
		if(global.glSelect2 == ds_list_size(global.charList))char = 100;
		if(global.glSelect2 > ds_list_size(global.charList))char = 1000;
		
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		
		if(char != 100 && char != 1000)
		{	
			draw_text(121, 36, global.CHAR[char, 0]);
		
			draw_set_color(fontColor2);
			draw_set_font(ft_med);
		
			draw_text(121, 58, global.CLASS[global.CHAR[char, 3], global.CHAR[char, 2] * 2]);
		
			draw_text(102, 75.5, global.CHAR[char, 4]);
			draw_text(166, 75.5, global.CHAR[char, 6]);
		
			var amou = 0;
			var a = 0;
			for(var i = 0; i < 10; i ++)
			{
				if(global.CLASS[global.CHAR[char, 3], 10 + i] == true && amou < 3)
				{
					amou ++;
					draw_sprite(spr_weaponIcons, i, 66 + a * 36, 104);
					draw_sprite(spr_rank, global.CHAR[char, 22 + i], 84 + a * 36, 106);
					
		
					var rx = 67.5 + a * 36;
					var ry = 121;
					draw_set_color(c_black);
					draw_rectangle(rx, ry, rx + 24, ry + 2, 0);
					draw_set_color(make_color_rgb(255, 239, 181));
					var xp = global.CHAR[char, 60 + i];
					var xptolvl = -1;
					switch(global.CHAR[char, 22 + i])
					{
						case 0:
						xptolvl = 20;
						break;
	
						case 1:
						xptolvl = 30;
						break;

						case 2:
						xptolvl = 45;
						break;

						case 3:
						xptolvl = 65;
						break;

						case 4:
						xptolvl = 90;
						break;

						case 5:
						xptolvl = -1;
						break;
					}
					//show_message((xp * 24 / xptolvl));
					if(xptolvl != -1)
					{
						if(xp > 0)draw_rectangle(rx, ry, rx + (xp * 24 / xptolvl), ry + 2, 0);
					}
					else draw_rectangle(rx, ry, rx + 24, ry + 2, 0);
					
					a ++;
				}
			}
		} else
		{
			if(char == 100)draw_text(121, 36, "Convoy");
			else draw_text(121, 36, "Resource Box");
		}
		
		draw_set_color(fontColor2);
		
		draw_set_halign(fa_left);
		if(char != 100 && char != 1000)
		{	
			for(var i = 0; i < 5; i ++)
			{	
				draw_sprite(spr_itemList, 0, 44, 133 + i * 18);
			
				var item = ds_list_find_value(global.CHAR[ds_list_find_value(global.charList, global.glSelect2), 49], i);
			
				if(item != undefined)
				{
					draw_sprite(spr_items, global.ITEM[item, 1], 44 + 2, 133 + 2 + i * 18);
					
					if(global.CHAR[char, 56] == i)draw_sprite(spr_equipped, 0, 44 + 2 + 10, 133 + 11 + i * 18);

					draw_text(44 + 18, 133 - 8 + i * 18, global.ITEM[item, 0]);
		
					draw_set_halign(fa_right);
					draw_text(44 + 151, 133 - 8 + i * 18, ds_list_find_value(global.CHAR[ds_list_find_value(global.charList, global.glSelect2), 50], i));
					draw_set_halign(fa_left);
				}
			}
		}

		var sel = global.glSelect2;
		
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 6, ds_list_size(global.charList) + 1 + selling);
		var b = 0;
		for(var i = min_i; i < max_i; i ++)
		{
			var charr = ds_list_find_value(global.charList, i);
			var inventory;
			if(i == ds_list_size(global.charList))charr = 100;
			if(i > ds_list_size(global.charList))charr = 1000;
			if(charr != 100 && charr != 1000)
			{
				inventory = global.CHAR[charr, 49];
			} else
			{
				if(charr == 100)inventory = global.CHAR[100, 49];
				else inventory = global.resourceBox;
			}
			
			if(ds_list_size(inventory) <= 0 && selling == 1)
			{
				draw_sprite_ext(spr_shopchar, 2, 234, 38 + b * 32, 1, 1, 0, c_white, 1);
			} else draw_sprite(spr_shopchar, 0, 234, 38 + b * 32);
			
			if(sel == i && (ds_list_size(inventory) > 0 || selling == 0))
			{
				draw_sprite_ext(spr_shopchar, 1, 234, 38 + b * 32, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			}
			
			if(global.glSelect2 == i)
			{
				draw_sprite_ext(spr_pick, 0, 220 + sinSize * 2, 12 + 38 + b * 32, 1, 1, 0, c_white, 1);
			}
		
			if(i <= ds_list_size(global.charList) - 1)
			{
				if(ds_list_size(inventory) > 0 || selling == 0)
				{
					DrawUnit(charr, tcindex, tindex, 242, 38 + b * 32, 1, 1, c_white, 1, 0, 3, 0);
					draw_text(276, 38 + b * 32, global.CHAR[charr, 0]);
				}
				else
				{
					DrawUnit(charr, tcindex, tindex, 242, 38 + b * 32, 1, 1, c_white, 1, 0, 4, 0);
					draw_set_color(fontColor11);
					draw_text(276, 38 + b * 32, global.CHAR[charr, 0]);
					draw_set_color(fontColor2);
				}
			}
			else
			{
				if(charr == 100)
				{
					if(ds_list_size(inventory) > 0 || selling == 0)
					{
						draw_text(276, 38 + b * 32, "Convoy");
					}
					else
					{
						draw_set_color(fontColor11);
						draw_text(276, 38 + b * 32, "Convoy");
						draw_set_color(fontColor2);
					}
				}
				else
				{
					if(selling == 1)
					{
						if(ds_list_size(inventory) > 0 || selling == 0)
						{
							draw_text(259, 38 + b * 32, "Resource Box");
						}
						else
						{
							draw_set_color(fontColor11);
							draw_text(259, 38 + b * 32, "Resource Box");
							draw_set_color(fontColor2);
						}
					}
				}
			}
			
			b += 1;
		}
	}
	
	draw_sprite_ext(spr_goldIndicator, 2, 392 - 138, 3, 1, 1, 0, c_white, vx);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	draw_set_halign(fa_right);
	draw_text(350, -0.5, global.gold);
	
	draw_set_alpha(vx);
	
	if(global.globalOptions == 0)
	{
		draw_sprite_ext(spr_prepMenu, 0, 248 + tempVar * 150, 48, 1, 1, 0, c_white, vx);
		draw_sprite_ext(spr_prepMenu, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_white, vx);
	
		if(global.glSelect == 0)
		{
			draw_sprite_ext(spr_prepMenu2, 0, 248 + tempVar * 150, 48, 1, 1, 0, c_white, (0.5 + sinVal2 * 0.5) * vx);
			draw_sprite_ext(spr_pick, 0, 236 + sinSize * 2 + tempVar * 150, 48 + 14, 1, 1, 0, c_white, vx);
			draw_set_color(fontColor1);
			draw_text(254 + 72 + tempVar * 150, 48, "Buy");
			draw_set_color(fontColor2);
		} else
		{
			draw_set_color(fontColor2);
			draw_text(254 + 72 + tempVar * 150, 48, "Buy");
		}
		if(global.glSelect == 1)
		{
			draw_sprite_ext(spr_prepMenu2, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_white, (0.5 + sinVal2 * 0.5) * vx);
			draw_sprite_ext(spr_pick, 0, 236 + sinSize * 2 + tempVar * 150, 48 + 14 + 34, 1, 1, 0, c_white, vx);
			draw_set_color(fontColor1);
			draw_text(254 + 72 + tempVar * 150, 48 + 34, "Sell");
			draw_set_color(fontColor2);
		} else
		{
			draw_set_color(fontColor2);
			draw_text(254 + 72 + tempVar * 150, 48 + 34, "Sell");
		}
	
		draw_set_halign(fa_center);
		draw_set_color(fontColor2);
	
		draw_set_halign(fa_left);
	
		draw_set_alpha(1);
	}
}
if(gamestate == "unitshop")
{
	draw_sprite(bk_wii, 0, -6, 0);
	
	var vx = 1 - tempVar;
	draw_set_alpha(1);
	
	draw_set_halign(fa_left);
	var stock, inventory, prices, it = -1, price = -1;

	if(global.globalOptions == 1)
	{		
		draw_sprite(spr_shopcharInfo, 0, 42, 56);
		draw_sprite(spr_name, 0, 62, 43);
		
		var char = ds_list_find_value(global.charList, global.glSelect2);
		
		draw_set_color(fontColor1);
		draw_set_halign(fa_center);
		
		if(char != undefined)
		{	
			draw_text(121, 36, global.CHAR[char, 0]);
		
			draw_set_color(fontColor2);
			draw_set_font(ft_med);
		
			draw_text(121, 58, global.CLASS[global.CHAR[char, 3], global.CHAR[char, 2] * 2]);
		
			draw_text(102, 75.5, global.CHAR[char, 4]);
			draw_text(166, 75.5, global.CHAR[char, 6]);
		
			var a = 0;
			for(var i = 0; i < 10; i ++)
			{
				if(global.CLASS[global.CHAR[char, 3], 10 + i] == true)
				{
					draw_sprite(spr_weaponIcons, i, 66 + a * 36, 104);
					draw_sprite(spr_rank, global.CHAR[char, 22 + i], 84 + a * 36, 106);
					
		
					var rx = 67.5 + a * 36;
					var ry = 121;
					draw_set_color(c_black);
					draw_rectangle(rx, ry, rx + 24, ry + 2, 0);
					draw_set_color(make_color_rgb(255, 239, 181));
					var xp = global.CHAR[char, 60 + i];
					var xptolvl = -1;
					switch(global.CHAR[char, 22 + i])
					{
						case 0:
						xptolvl = 20;
						break;
	
						case 1:
						xptolvl = 30;
						break;

						case 2:
						xptolvl = 45;
						break;

						case 3:
						xptolvl = 65;
						break;

						case 4:
						xptolvl = 90;
						break;

						case 5:
						xptolvl = -1;
						break;
					}
					//show_message((xp * 24 / xptolvl));
					if(xptolvl != -1)
					{
						if(xp > 0)draw_rectangle(rx, ry, rx + (xp * 24 / xptolvl), ry + 2, 0);
					}
					else draw_rectangle(rx, ry, rx + 24, ry + 2, 0);
					
					a ++;
				}
			}
		}
		
		draw_set_color(fontColor2);
		
		draw_set_halign(fa_left);
		if(char != undefined)
		{	
			for(var i = 0; i < 5; i ++)
			{	
				draw_sprite(spr_itemList, 0, 44, 133 + i * 18);
			
				var item = ds_list_find_value(global.CHAR[ds_list_find_value(global.charList, global.glSelect2), 49], i);
			
				if(item != undefined)
				{
					draw_sprite(spr_items, global.ITEM[item, 1], 44 + 2, 133 + 2 + i * 18);

					draw_text(44 + 18, 133 - 8 + i * 18, global.ITEM[item, 0]);
		
					draw_set_halign(fa_right);
					draw_text(44 + 151, 133 - 8 + i * 18, ds_list_find_value(global.CHAR[ds_list_find_value(global.charList, global.glSelect2), 50], i));
					draw_set_halign(fa_left);
				}
			}
		}
		//wawawa

		var sel = global.glSelect2;
		
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 6, ds_list_size(global.charList));
		var b = 0;
		for(var i = min_i; i < max_i; i ++)
		{
			var charr = ds_list_find_value(global.charList, i);
			var inventory;
			if(charr != undefined)
			{
				inventory = global.CHAR[charr, 49];
			} else inventory = global.CHAR[100, 49];
			
			if(charr > 1)
			{
				draw_sprite(spr_shopchar, 0, 234, 38 + b * 32);
				if(sel == i)
				{
					draw_sprite_ext(spr_shopchar, 1, 234, 38 + b * 32, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				}
			}
			else
			{
				draw_sprite(spr_shopchar, 2, 234, 38 + b * 32);
			}
			if(global.glSelect2 == i)
			{
				var sins = sinSize * 2;
				if(global.glSelect3 > 0)sins = 2;
				draw_sprite_ext(spr_pick, 0, 220 + sins, 12 + 38 + b * 32, 1, 1, 0, c_white, 1);
			}
		
			if(i <= ds_list_size(global.charList) - 1)
			{
				if(charr > 1)
				{
					DrawUnit(charr, tcindex, tindex, 242, 38 + b * 32, 1, 1, c_white, 1, 0, 3, 0);
					draw_text(276, 38 + b * 32, global.CHAR[charr, 0]);
				}
				else
				{
					DrawUnit(charr, tcindex, tindex, 242, 38 + b * 32, 1, 1, c_white, 1, 0, 4, 0);
					draw_set_color(fontColor11);
					draw_text(276, 38 + b * 32, global.CHAR[charr, 0]);
					draw_set_color(fontColor2);
				}
			}
			
			b += 1;
		}
		
		if(global.glSelect3 > 0)
		{
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, global.window_w, global.window_h, 0);
			draw_set_alpha(1);
			
			draw_sprite(spr_bigMessage, 0, 200 - 109, 206 - 31);
			
			draw_sprite(spr_shopConfirmbox, 0, 150, 206);
			draw_sprite(spr_shopConfirmbox, 0, 250, 206);
			
			draw_set_color(fontColor2);
			draw_set_halign(fa_center);
			
			if(global.glSelect3 == 2)
			{
				draw_text(150, 189, "Yes");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 150, 206, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(150, 189, "Yes");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 150 - 58 + sinSize * 2, 202);
			}
			if(global.glSelect3 == 1)
			{
				draw_text(250, 189, "No");
			} else
			{	
				draw_sprite_ext(spr_shopConfirmbox, 1, 250, 206, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				draw_text(250, 189, "No");
				draw_set_color(fontColor2);
				
				draw_sprite(spr_pick, 0, 250 - 58 + sinSize * 2, 202);
			}
			
			
			draw_set_halign(fa_left);
		}
		
		draw_set_color(fontColor8);
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		if(global.glSelect3 == 0)
		{
			draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
			draw_text(9, - 37 + vx * 36, "Which unit are you selling?");
		}
		else
		{
			var char = ds_list_find_value(global.charList, global.glSelect2);
			
			var lvlmult = 0.5 * (global.CHAR[char, 4] * 100 + (global.CHAR[char, 4] * global.CHAR[char, 4]) * 10);
					
			var sum = 0;
			for(var i = 14; i < 22; i ++)
			{
				sum += global.CHAR[char, i];
			}
			price = floor(250 + lvlmult + 1.7 * (sum * ((200 + sum) / 200)));
			
			
			draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
			draw_text(9, - 37 + vx * 36, "I'll give you " + string(price) + " gold.");
		}
	}
	
	if(global.globalOptions == 0)
	{
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
		draw_set_halign(fa_right);
		draw_sprite_ext(spr_prepMenu, 0, 248 + tempVar * 150, 48, 1, 1, 0, c_white, vx);
		draw_sprite_ext(spr_prepMenu, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_white, vx);
	
		if(global.glSelect == 0)
		{
			draw_sprite_ext(spr_prepMenu2, 0, 248 + tempVar * 150, 48, 1, 1, 0, c_white, (0.5 + sinVal2 * 0.5) * vx);
			draw_sprite_ext(spr_pick, 0, 236 + sinSize * 2 + tempVar * 150, 48 + 14, 1, 1, 0, c_white, vx);
			draw_set_color(fontColor1);
			draw_text(254 + 72 + tempVar * 150, 48, "Buy");
			draw_set_color(fontColor2);
		} else
		{
			draw_set_color(fontColor2);
			draw_text(254 + 72 + tempVar * 150, 48, "Buy");
		}
		if(ds_list_size(global.charList) > 0)
		{
			if(global.glSelect == 1)
			{
				draw_sprite_ext(spr_prepMenu2, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_white, (0.5 + sinVal2 * 0.5) * vx);
				draw_sprite_ext(spr_pick, 0, 236 + sinSize * 2 + tempVar * 150, 48 + 14 + 34, 1, 1, 0, c_white, vx);
				draw_set_color(fontColor1);
				draw_text(254 + 72 + tempVar * 150, 48 + 34, "Sell");
				draw_set_color(fontColor2);
			} else
			{
				draw_set_color(fontColor2);
				draw_text(254 + 72 + tempVar * 150, 48 + 34, "Sell");
			}
		}
		else
		{
			shader_set(shGray);
			draw_set_color(fontColor2);
			draw_sprite_ext(spr_prepMenu, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_white, vx);
			draw_text(254 + 72 + tempVar * 150, 48 + 34, "Sell");
			draw_sprite_ext(spr_prepMenu, 2, 248 + tempVar * 150, 48 + 34, 1, 1, 0, c_black, vx * 0.3);
			shader_reset();
		}
	
		draw_set_halign(fa_center);
		draw_set_color(fontColor2);
	
		draw_set_halign(fa_left);
	
		draw_set_alpha(1);
	}
	if(global.globalOptions == 2)
	{
		var xx = 46, yy = 7, ay = 24;

		draw_set_font(ft_small);
		draw_set_halign(fa_center);
		draw_set_color(fontColor1);

		draw_sprite(spr_statsAll, 0, xx, yy + ay);
		
		if (!surface_exists(surfPort2))surfPort2 = surface_create(128, 128);
	
		//draw portrait
		surface_set_target(surfPort2);
		draw_clear_alpha(c_black, 0);
	
		DrawPortrait(tempVar5, 1, 0, 0);
	
		gpu_set_blendmode(bm_subtract);
		draw_sprite(spr_trans, 0, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();

		draw_surface_ext(surfPort2, xx + 6 + 128, 18 + ay, -1, 1, 0, c_white, 1);
		draw_sprite(spr_name, 0, xx + 10, 136 + ay);
		if(global.glSelect2 == 0)
		{
			gpu_set_blendmode(bm_add);
			
			draw_sprite_ext(spr_name, 0, xx + 10, 136 + ay, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			
			gpu_set_blendmode(bm_normal);
			
			draw_text(xx + 11 + 58, 136 + ay + 14, "Type your name!");
		}
		if(global.glSelect2 == 1 && global.glSelect6 == 0)
		{
			var str = "";
			switch(global.glSelect3)
			{
				case 0:
				
				str = "Modify class!";
				
				break;
				
				case 1:
				
				str = "Modify level!";
				
				break;
				case 2:
				
				str = "More talent better growths!";
				
				break;
				case 3:
				
				str = "10 gold to reroll!";
				
				break;
			}
			draw_text(xx + 184 + 35, 211, str);
		}
		if(global.glSelect2 == 1 && global.glSelect6 == 1)
		{
			draw_text(xx + 184 + 35, 212, "Set a value!");
		}
		
		draw_text(xx + 184 + 33, 35, "Total gold cost: " + string(tempVar7));
	
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
	
		draw_set_halign(fa_center);
		draw_text(xx + 10 + 58, 136 - 7 + ay, global.CHAR[tempVar5, 0]);
		if(global.glSelect2 == 0)
		{
			var wi = string_width(global.CHAR[tempVar5, 0]) / 2;
			draw_set_font(ft_debug);
			draw_text(xx + 12 + 58 + wi, 147 - 7 + ay, slash);
		}
		draw_set_font(ft_med);
		draw_set_color(fontColor8);
		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		
		draw_set_halign(fa_left);

		draw_sprite(spr_menuTop, 0, 0, - 36 + vx * 36);
		draw_text(9, - 37 + vx * 36, "Customize your unit");

		
		draw_set_halign(fa_center);
		var vv = 38;
		for(var i = 0; i < 4; i ++)
		{
			draw_sprite(spr_shopchar, 0, 195, 64 + 38 * i);
			draw_set_color(fontColor2);
			if(global.glSelect3 == i && global.glSelect2 == 1)
			{
				draw_sprite_ext(spr_shopchar, 1, 195, 64 + i * vv, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
				draw_set_color(fontColor1);
				
				if(global.glSelect6 == 1)
				{
					draw_sprite_ext(spr_switchArrow, 0, 195 - 6 - sinVal2 * 2, 18 + 63 + i * vv, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_switchArrow, 0, 195 + 139 + sinVal2 * 2, 18 + 63 + i * vv, -1, 1, 0, c_white, 1);
				}
			}
			
			switch(i)
			{
				case 0:
				
					draw_text(192 + 70, 64 + i * vv, string(global.CLASS[global.CHAR[tempVar5, 3], global.CHAR[tempVar5, 2] * 2]));
				
				break;
				case 1:
				
					draw_text(192 + 70, 64 + i * vv, "Level: " + string(global.CHAR[tempVar5, 4]));
				
				break;
				case 2:
				
					draw_text(192 + 70, 64 + i * vv, "Talent: " + string(tempVar6));
				
				break;
				case 3:
				
					draw_text(192 + 70, 64 + i * vv, "Reroll Looks");
				
				break;
			}
		}
		draw_set_color(fontColor1);
		draw_sprite(spr_boxx, 0, 358, 116);
		if(global.glSelect2 == 2)
		{
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_boxx, 0, 358, 116, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			gpu_set_blendmode(bm_normal);
		}
		draw_text(375, 117.5, "BUY!");
		
		draw_sprite(spr_boxx, 0, xx + 20 + 32.5, yy + 167 + ay);
		DrawUnit(tempVar5, tcindex, tindex, xx + 25 + 29, yy + 168 + ay, 1, 1, c_white, 1, 0, 3, 0);
		draw_sprite_ext(spr_goldIndicator, 2, 392 - 138, 3, 1, 1, 0, c_white, vx);
	
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
		draw_set_halign(fa_right);
		draw_text(350, -0.5, global.gold);
	
		draw_set_alpha(vx);
	}
}
switch(gamestate)
{
	case "itemdropchoose":
	var rowHeight = 18;
	
	var inventory = global.CHAR[global.OWchar, 49];
	var uses = global.CHAR[global.OWchar, 50];
	var item = ds_list_find_value(inventory, global.glSelect);
	var xx = 24, yy = 0;
	
	DrawitemInfo(item);
	draw_sprite_ext(spr_cannotCarry, 0, 198, 61, 1, 1, 0, c_white, 1);
	
	if (!surface_exists(surfOptions))surfOptions = surface_create(240, 240);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(ft_med);
	for(var i = 0; i < ds_list_size(inventory); i ++)
	{
		var r = 0;
		var bc = c_white;
		var itemm = ds_list_find_value(inventory, i);
		var ind = 0;
		if(global.glSelect == i)
		{
			ind = 1;
			draw_set_color(fontColor1);
			
			var r = - 40 + obj_pers.sinSize * 40;
			//show_message(r);
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
		else
		{
			draw_set_color(fontColor2);
		}
		draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
		
		draw_sprite(spr_items, global.ITEM[itemm, 1], xx + 2, yy + 2 + i * rowHeight);
		


		draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[itemm, 0]);
		
		draw_set_halign(fa_right);
		draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
		draw_set_halign(fa_left);

		
		if(global.CHAR[global.OWchar, 56] == i)
		{
			draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
		}
	}
	
	var xp = 2;
	if(global.glSelect2 == 0)xp = obj_pers.sinSize * 2;
	if(global.glSelect != -1)draw_sprite(spr_pick, 0, xx - rowHeight + xp, 7 + yy + global.glSelect * rowHeight);
	
	surface_reset_target();
	
	if(surface_exists(surfOptions))
	{
		if(global.glSelect2 == 0)
		{
			draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_white, 1);
		}
		else
		{
			draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_white, 1);
			draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_black, 0.5);
		}
	}
	
	if(global.glSelect2 == 1)
	{
		var ya = 132;
			
		//draw_sprite(spr_superbigMessage, 0, 200 - 132, ya - 36);
			
			
		draw_set_color(fontColor2);
		draw_set_halign(fa_center);
		
		var str = "Send     " + global.ITEM[item, 0] + " to the convoy?";
		MessageBox(str);
		draw_sprite(spr_shopConfirmbox, 0, 150, ya + 2);
		draw_sprite(spr_shopConfirmbox, 0, 250, ya + 2);
		var xi = 236 - string_width(str) / 2;
		
		draw_sprite(spr_items, global.ITEM[item, 1], xi, ya - 38 + 8);
		draw_text(200, ya - 38, str);
			
		if(global.glSelect3 == 2)
		{
			draw_text(150, ya - 15, "Yes");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 150, ya + 2, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(150, ya - 15, "Yes");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 150 - 58 + obj_pers.sinSize * 2, ya - 2);
		}
		if(global.glSelect3 == 1)
		{
			draw_text(250, ya - 15, "No");
		} else
		{	
			draw_sprite_ext(spr_shopConfirmbox, 1, 250, ya + 2, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			draw_set_color(fontColor1);
			draw_text(250, ya - 15, "No");
			draw_set_color(fontColor2);
				
			draw_sprite(spr_pick, 0, 250 - 58 + obj_pers.sinSize * 2, ya - 2);
		}
			
			
		draw_set_halign(fa_left);
	}
	
	break;
	
	case "itemdrop":
	
	var item = ds_list_find_value(global.itemDrops, 0);
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen))surfScreen = surface_create(222, 66);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	
	//draw_sprite(spr_bigMessage, 0, 0, 0);
	draw_set_halign(fa_center);
	var text = "You got " + global.ITEM[item, 0];
	MessageBox(text);
	draw_text(194, 102, text)
	draw_sprite(spr_items, global.ITEM[item, 1], 114 + (string_width(text) / 2) + 86, 112);

	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 - guiTimer2 * 200, 0, guiTimer2, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
	
	break;
	
	case "recdrop":
	
	var item = ds_list_find_value(global.recDrops, 0);
	var am = ds_list_find_value(global.recDropsAm, 0);
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen))surfScreen = surface_create(222, 66);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	
	//draw_sprite(spr_bigMessage, 0, 0, 0);
	draw_set_halign(fa_center);
	var text = "You got " + global.ITEM[item, 0];
	MessageBox(text);
	draw_text(182, 102, text)
	draw_sprite(spr_items, global.ITEM[item, 1], 101 + (string_width(text) / 2) + 86, 112);
	draw_text(97 + (string_width(text) / 2) + 86 + 32, 102, "x" + string(am));

	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 - guiTimer2 * 200, 0, guiTimer2, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
	
	break;
	
	case "armyjoin":
	
	var item = ds_list_find_value(global.recDrops, 0);
	var am = ds_list_find_value(global.recDropsAm, 0);
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen))surfScreen = surface_create(222, 66);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	
	//draw_sprite(spr_bigMessage, 0, 0, 0);
	draw_set_halign(fa_center);
	var text = global.CHAR[global.armyJoin, 0] + " has joined your army!";
	MessageBox(text);
	draw_text(200, 102, text)

	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 - guiTimer2 * 200, 0, guiTimer2, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
	
	break;
	
	case "itemconvoy":
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen))surfScreen = surface_create(222, 66);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
		
	
	//draw_sprite(spr_bigMessage, 0, 0, 0);
	draw_set_halign(fa_center);
	draw_set_color(fontColor1);
	var text = "Item sent to the convoy.";
	MessageBox(text);
	draw_text(200, 102, text)

	surface_reset_target();
	
	draw_sprite(bk_shop, 0, 0, 0);	
	draw_sprite_ext(spr_goldIndicator, 2, 392 - 138, 3, 1, 1, 0, c_white, 1);
	
	draw_set_halign(fa_left);
	
	draw_sprite(spr_menuTop, 0, 0, 0);
	draw_text(9, -1, global.ITEM[tempVar11, 0] + " was sent to the convoy.");
	
	draw_set_font(ft_med);
	draw_set_halign(fa_right);
	draw_text(350, -0.5, global.gold);
	draw_surface_ext(surfScreen, 200 - guiTimer2 * 200, 0, guiTimer2, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
	
	break;
}
if(state == "fade" || state == "fadeout")
{
	if(global.currentBackground != -1)
	{
		var backgroundX = 0;
		draw_sprite(global.currentBackground, 0, backgroundX, 0);
	}
	if(tempVar > 0)
	{
		draw_set_color(global.fadeColor);
		draw_set_alpha(tempVar);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
	}
}
if(state == "chapterbegin")
{
	var ind = min(image, 34);
	draw_sprite_ext(spr_stageStart, ind, 0, 0, 1, 1, 0, c_white, 1);
	
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	
	draw_set_font(ft_large);
	draw_text_transformed(200, 107, global.STAGE[global.currentStage, 0], 1.2, 1.2, 0);
	
	draw_set_font(ft_small);
	draw_text(200, 98, "Chapter " + string(global.currentStage + 1));
	
	
	draw_set_halign(fa_left);
	
	draw_set_color(c_black);
	draw_set_alpha(fade - 1);
	draw_rectangle(0, 0, global.window_w, global.window_h, 0);
	draw_set_alpha(1);
}
if(state == "dialogue" || state == "hide" || state == "show" || state == "enddialogue" || state == "nextscenehide")
{
	var boxSprite = spr_dialogueBox;
	if(global.textType == 1)boxSprite = spr_dialogueBox_small;
	
	var xpos = 0, ypos = 0;
	var textboxDirection = -1;
	if(global.textPosition == 1)textboxDirection = 1;
	
	if(global.currentBackground != -1)
	{
		var backgroundX = 0;
		draw_sprite(global.currentBackground, 0, backgroundX, 0);
	}
	
	if(gamestate != "shop" && gamestate != "map" && gamestate != "camp" && gamestate != "unitshop" && global.textPosition == 0)
	{
		draw_sprite_ext(spr_gradient1, 0, 0, 0, 1, 1, 0, c_white, global.gradientAlpha * 0.75);
	}
	
	switch(global.textAlign)
	{
		case -1:
			xpos = 10;
			break;
		case 0:
			xpos = (global.window_w / 2) - sprite_get_width(boxSprite) / 2;
			break;
		case 1:
			xpos = global.window_w - sprite_get_width(boxSprite);
			break;
	}
	switch(global.textPosition)
	{
		case 0:
			ypos = global.window_h - 54;
			break;
		case 1:
			ypos = 0;
			break;
	}
	if(global.textPosition == 0 && global.textType == 0)
	{
		if(global.charDial[0] != -1 && global.CHAR[global.charDial[0], 51] == false)
		{
			if(!surface_exists(surfPort))surfPort = surface_create(256, 256);
			surface_set_target(surfPort);
			draw_clear_alpha(c_black, 0);
			var port = global.PORT[global.CHAR[global.charDial[0], 1], 0];
			if(port != -1)
			{
				draw_sprite_ext(port, global.CHAR[global.charDial[0], 53], 0, 0, 1, 1, 0, c_white, 1);
				
				gpu_set_colorwriteenable(true, true, true, false);
				if(oldAlpha[0] > 0)draw_sprite_ext(port, global.CHAR[global.charDial[0], 55], 0, 0, 1, 1, 0, c_white, oldAlpha[0]);
				draw_sprite_ext(spr_blush1, 0, 102, 92, 1, 1, 0, c_white, global.charBlush[0]);
				gpu_set_colorwriteenable(true, true, true, true);
				if(global.CHAR[global.charDial[0], 2] != -1)
				{
					if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, 0, 0, 1, 1, 0, global.CHAR[global.charDial[0], 38], 1);
				}
			}
	
			surface_reset_target();
			draw_surface_ext(surfPort, 228 - 48 + (48  * global.charAlpha[0]), global.window_h - 256, -1, 1, 0, c_white, global.charAlpha[0]);
			if(global.step[global.currentStep, 0] != global.charDial[0])
			{
				draw_surface_ext(surfPort, 228 - 48 + (48  * global.charAlpha[0]), global.window_h - 256, -1, 1, 0, c_black, global.charAlpha[0] * (global.backgroundcharAlpha) * 0.65);
			}
		}
		if(global.charDial[1] != -1 && global.CHAR[global.charDial[1], 51] == false)
		{
			if(!surface_exists(surfPort))surfPort = surface_create(256, 256);
			surface_set_target(surfPort);
			draw_clear_alpha(c_black, 0);
	
			var port = global.PORT[global.CHAR[global.charDial[1], 1], 0];
			if(port != -1)
			{
				draw_sprite_ext(port, global.CHAR[global.charDial[1], 53], 0, 0, 1, 1, 0, c_white, 1);
				gpu_set_colorwriteenable(true, true, true, false);
				if(oldAlpha[1] > 0)draw_sprite_ext(port, global.CHAR[global.charDial[1], 55], 0, 0, 1, 1, 0, c_white, oldAlpha[1]);
				draw_sprite_ext(spr_blush1, 0, 102, 92, 1, 1, 0, c_white, global.charBlush[1]);
				gpu_set_colorwriteenable(true, true, true, true);
				if(global.CHAR[global.charDial[1], 2] != -1)
				{
					if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, 0, 0, 1, 1, 0, global.CHAR[global.charDial[1], 38], 1);
				}
			}
	
			surface_reset_target();
			draw_surface_ext(surfPort, 172 + 48 - (48  * global.charAlpha[1]), global.window_h - 256, 1, 1, 0, c_white, global.charAlpha[1]);
			if(global.step[global.currentStep, 0] != global.charDial[1])
			{
				draw_surface_ext(surfPort, 172 + 48 - (48  * global.charAlpha[1]), global.window_h - 256, 1, 1, 0, c_black, global.charAlpha[1] * (global.backgroundcharAlpha) * 0.65);
			}
		}
		if(global.charDial[2] != -1 && global.CHAR[global.charDial[2], 51] == false)
		{
			if(!surface_exists(surfPort))surfPort = surface_create(256, 256);
			surface_set_target(surfPort);
			draw_clear_alpha(c_black, 0);
	
			var port = global.PORT[global.CHAR[global.charDial[2], 1], 0];
			if(port != -1)
			{
				draw_sprite_ext(port, global.CHAR[global.charDial[2], 53], 0, 0, 1, 1, 0, c_white, 1);
				gpu_set_colorwriteenable(true, true, true, false);
				if(oldAlpha[2] > 0)draw_sprite_ext(port, global.CHAR[global.charDial[2], 55], 0, 0, 1, 1, 0, c_white, oldAlpha[2]);
				draw_sprite_ext(spr_blush1, 0, 102, 92, 1, 1, 0, c_white, global.charBlush[2]);
				gpu_set_colorwriteenable(true, true, true, true);
				if(global.CHAR[global.charDial[2], 2] != -1)
				{
					if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, 0, 0, 1, 1, 0, global.CHAR[global.charDial[2], 38], 1);
				}
			}
	
			surface_reset_target();
			draw_surface_ext(surfPort, 128 + 48 - (48  * global.charAlpha[2]), global.window_h - 256, 1, 1, 0, c_white, global.charAlpha[2]);
			if(global.step[global.currentStep, 0] != global.charDial[2])
			{
				draw_surface_ext(surfPort, 128 + 48 - (48  * global.charAlpha[2]), global.window_h - 256, 1, 1, 0, c_black, global.charAlpha[2] * (global.backgroundcharAlpha) * 0.65);
			}
		}
	}
	
	var post = true;
	if(global.charDial[0] != -1 && global.CHAR[global.charDial[0], 51] == true)post = false;
	if(global.charDial[1] != -1 && global.CHAR[global.charDial[1], 51] == true)post = false;
	
	//show_message(string(textboxDirection) + ", " + string(global.textboxAlpha));
	//draw_sprite_ext(boxSprite, 0, xpos, ypos, 1, 1, 0, c_white,1);
	draw_sprite_ext(boxSprite, 0, xpos, ypos + ((- 54 * textboxDirection) + (54 * global.textboxAlpha * textboxDirection * global.backgroundcharPos)), 1, 1, 0, c_white, global.textboxAlpha);
	//show_message("fortnite");
	draw_set_font(ft_med);
	draw_set_color(fontColor2);
	
	draw_set_alpha(global.textboxAlpha * (global.backgroundcharPos));
	
	if(post)
	{
		if(global.textPosition == 0)
		{		
			var xoffset = 30;
			var yoffset = 0;
			var spacing = 18;
			if(global.textType == 1)
			{
				xoffset = 11;
				yoffset = -2;
				spacing = 13;
			}
			draw_text_ext(xpos + xoffset, yoffset + ypos - 1 + global.textY * 64, global.step[global.currentStep, 1], spacing, sprite_get_width(boxSprite) - xoffset * 2);
		}
		else
		{
			draw_text_ext(xpos + 80, ypos - 1 + global.textY * 64, global.step[global.currentStep, 1], 18, sprite_get_width(boxSprite) - 100);
		}
	}
	
	if(global.textPosition == 1 && global.textType == 0)
	{
		if(global.charDial[0] != -1)
		{
			
			if(!surface_exists(surfPortsmall))surfPortsmall = surface_create(70, 50);
			surface_set_target(surfPortsmall);
			draw_clear_alpha(c_black, 0);
	
			var port = global.PORT[global.CHAR[global.charDial[0], 1], 0];
			if(port != -1)
			{
				var xxpos = -global.PORT[global.CHAR[global.charDial[0], 1], 1] + 22;
				var yypos = -global.PORT[global.CHAR[global.charDial[0], 1], 2] + 18;
				
				draw_sprite_ext(port, global.CHAR[global.charDial[0], 53], xxpos, yypos, 1, 1, 0, c_white, 1);
				gpu_set_colorwriteenable(true, true, true, false);
				if(oldAlpha[0] > 0)draw_sprite_ext(port, global.CHAR[global.charDial[0], 55], xxpos, yypos, 1, 1, 0, c_white, oldAlpha[0]);
				//draw_sprite_ext(spr_blush1, 0, 102, 92, 1, 1, 0, c_white, global.charBlush[2]);
				gpu_set_colorwriteenable(true, true, true, true);
				if(global.CHAR[global.charDial[0], 2] != -1)
				{
					if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, xxpos, yypos, 1, 1, 0, global.CHAR[global.charDial[0], 38], 1);
				}
			}
			gpu_set_blendmode(bm_subtract);
			draw_sprite(spr_alphaPort, 0, 0, 0);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			draw_surface_ext(surfPortsmall, 74 + xpos + 2, ypos + 2 - 32 + (32  * global.charAlpha[0]), -1, 1, 0, c_white, global.charAlpha[0]);
		}
	}
	
	
	if(global.step[global.currentStep, 0] != -1)
	{
		if(global.textPosition == 0)
		{
			var xxpos = 0;
			if(global.step[global.currentStep, 0] == global.charDial[1])xxpos = 274;
			if(global.textType == 1)xxpos -= 5;
			draw_sprite_ext(spr_dialogueName, 0, 9 + xxpos, global.window_h - 71, 1, 1, 0, c_white, global.textboxAlpha * (global.backgroundcharPos))
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(63 + xxpos, global.window_h - 79, global.CHAR[global.step[global.currentStep, 0], 0]);
			draw_set_halign(fa_left);
		}
		if(global.textPosition == 1)
		{
			var xxpos = 0;
			var yypos = 49;
			if(global.step[global.currentStep, 0] == global.charDial[1])xxpos = 274;
			if(global.textType == 1)xxpos -= 5;
			draw_sprite_ext(spr_dialogueName, 0, 9 + xxpos, yypos, 1, 1, 0, c_white, global.textboxAlpha * (global.backgroundcharPos))
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(63 + xxpos, yypos - 8, global.CHAR[global.step[global.currentStep, 0], 0]);
			draw_set_halign(fa_left);
		}
	}
	draw_set_alpha(1);
	
	if(global.textboxAlpha >= 1 && global.textY == 0)
	{
		var yy = 0;
		if(sinVal > 0.05)yy = sinVal - 0.05;
		draw_sprite(spr_dialogueArrow, 0, xpos + sprite_get_width(boxSprite) - 22, ypos + 32 + yy * 3);
	}
	
	if(global.fadeTimer > 0)
	{
		draw_set_color(global.fadeColor);
		draw_set_alpha(global.fadeTimer / 60);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
	}
}


if(gamestate == "preparationmain" || (gamestate == "saving" && laststate == "preparationmain" && tempVar11 != 100) || gamestate == "hidemain")
{	
	//draw_sprite_ext(spr_preparationsBackground, 0, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);


	
	var yv = 19;
	
	draw_sprite(spr_prepMenu, 0, 200 - 136, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200 - 136, 70 + 33 + yv);
	
	draw_sprite(spr_prepMenu, 0, 200, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200, 70 + 33 + yv);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	
	var a = 0, b = 0;
	for(var i = 0; i < 4; i ++)
	{
		var sel = i;
		if(global.glSelect == sel)
		{
			draw_sprite_ext(spr_prepMenu2, b * 2, 64 + a * 136, 70 + b * 33 + yv, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			draw_sprite(spr_pick, 0, 52 + a * 136 + obj_pers.sinSize * 2, 70 + b * 33 + 14 + yv);
			selec = i;
			draw_set_color(fontColor1);
			draw_text(131 + a * 136, 70 + b * 33 + yv, global.prepText2[sel]);
			draw_set_color(fontColor2);
		}
		else
		draw_text(131 + a * 136, 70 + b * 33 + yv, global.prepText2[sel]);
		
		b += 1;
		if(b >= 2)
		{
			b = 0;
			a ++;
		}
	}
	
	if(tempVar12 == 1)draw_sprite(spr_exclamationMark, 0, 312, 76);
	
	surface_reset_target();
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	
	
	draw_set_color(fontColor1);
	draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.prepDescription2[global.glSelect]);
	
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Preparations");
	
	draw_set_halign(fa_right);
	draw_set_color(fontColor1);
	
	//draw_text(400 - 9, - 37 + (1 - opSize4) * 36, "Victory: " + global.OBJ[global.STAGE[global.currentStage, 1]]);
	
	draw_set_halign(fa_center);
}
if(gamestate == "preparation" || (gamestate == "saving" && laststate == "preparation" && tempVar11 != 100) || gamestate == "hideprep")
{
	//draw_sprite_ext(spr_preparationsBackground, 0, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	
	var yv = - 22;
	
	draw_sprite(spr_prepMenu, 1, 200 - 136, 70 + 33 + yv);
	draw_sprite(spr_prepMenu, 0, 200 - 136, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200 - 136, 70 + 33 * 2 + yv);
	
	draw_sprite(spr_prepMenu, 1, 200, 70 + 33 + yv);
	draw_sprite(spr_prepMenu, 0, 200, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200, 70 + 33 * 2 + yv);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	
	var a = 0, b = 0;
	for(var i = 0; i < 6; i ++)
	{
		var sel = i;
		if(sel >= 3)sel ++;
		if(global.glSelect == sel)
		{
			draw_sprite_ext(spr_prepMenu2, b, 64 + a * 136, 70 + b * 33 + yv, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			draw_sprite(spr_pick, 0, 52 + a * 136 + obj_pers.sinSize * 2, 70 + b * 33 + 14 + yv);
			selec = i;
			draw_set_color(fontColor1);
			draw_text(131 + a * 136, 70 + b * 33 + yv, global.prepText[sel]);
			draw_set_color(fontColor2);
		}
		else
		draw_text(131 + a * 136, 70 + b * 33 + yv, global.prepText[sel]);
		
		b ++;
		if(b >= 3)
		{
			b = 0;
			a ++;
		}
	}
	
	draw_sprite(spr_prepButton, 0, 67, 156);
	draw_sprite(spr_prepButton, 1, 203, 156);
	
	if(global.glSelect == 3)
	{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_prepButton, 0, 67, 156, 1, 1, 0, c_white, 0.4 + obj_pers.sinVal2 * 0.4);
		gpu_set_blendmode(bm_normal);
	}
	if(global.glSelect == 7)
	{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_prepButton, 1, 203, 156, 1, 1, 0, c_white, 0.4 + obj_pers.sinVal2 * 0.4);
		gpu_set_blendmode(bm_normal);
	}
	
	if(tempVar12 == 1)draw_sprite(spr_exclamationMark, 0, 320, 72 - 33);
	
	surface_reset_target();
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	
	
	
	draw_set_color(fontColor1);
	draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.prepDescription[global.glSelect]);
	
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Preparations");
	
	draw_set_halign(fa_right);
	draw_set_color(fontColor1);
	
	draw_text(global.window_w - 9, - 37 + (1 - opSize4) * 36, "Victory: " + global.OBJ[global.STAGE[global.currentStage, 1]]);
	
	draw_set_halign(fa_center);
	
	draw_set_color(c_black);
	draw_set_alpha(gameFade);
	draw_rectangle(0, 0, global.window_w, global.window_h, 0);
	draw_set_alpha(1);
}
if(gamestate == "prepmap")
{
	//draw_sprite_ext(spr_preparationsBackground, 0, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	if(tempVar != noone)
	{
		ShowStats(obj_pers.tempVar);
	}
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	
	var yv = - 22;
	
	draw_sprite(spr_prepMenu, 1, 200 - 136, 70 + 33 + yv);
	draw_sprite(spr_prepMenu, 0, 200 - 136, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200 - 136, 70 + 33 * 2 + yv);
	
	draw_sprite(spr_prepMenu, 1, 200, 70 + 33 + yv);
	draw_sprite(spr_prepMenu, 0, 200, 70 + yv);
	draw_sprite(spr_prepMenu, 2, 200, 70 + 33 * 2 + yv);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	
	var a = 0, b = 0;
	for(var i = 0; i < 6; i ++)
	{
		var sel = i;
		if(sel >= 3)sel ++;
		draw_text(131 + a * 136, 70 + b * 33 + yv, global.prepText[sel]);
		
		b ++;
		if(b >= 3)
		{
			b = 0;
			a ++;
		}
	}
	
	draw_sprite(spr_prepButton, 0, 67, 156);
	draw_sprite(spr_prepButton, 1, 203, 156);
	
	surface_reset_target();
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Preparations");
}
if(gamestate == "prepskills")
{
	draw_sprite_ext(spr_preparationsBackground, 0, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_middle);
	draw_set_color(fontColor1);
	draw_set_font(ft_med);
	
	draw_sprite(spr_name, 0, 52, 68);
		
	var char = ds_list_find_value(global.charList, global.glSelect);
	draw_text(111, 61, global.CHAR[char, 0]);
	
	if(global.CHAR[char, 59] == true)
	{
		draw_sprite(spr_active, 0, 58, 72);
	}

	var eskills = global.CHAR[char, 34];
	var xx = 34, yy = 90;
	for(var i = 0; i < 5; i ++)
	{
		var r = 0;
		var bc = c_white;
		var ind = 0;
		if(global.glSelect2 == i && global.glSelect3 != -1 && global.glSelect4 == 0)
		{
			ind = 1;
			var r = - 40 + obj_pers.sinSize * 40;
			if(global.showOptions == 10)r = 0;
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
		draw_sprite_ext(spr_itemList, ind, xx, yy + i * 18, 1, 1, 0, bc, 1);
	}
	if(ds_list_size(eskills) == 0)
	{
		draw_set_color(fontColor3);
		draw_text(xx + 77, yy - 8, "(No skills equipped)");
	}
	draw_set_halign(fa_left);
	for(var i = 0; i < ds_list_size(eskills); i ++)
	{
		var r = 0;
		var bc = c_white;
		var item = ds_list_find_value(eskills, i);
		var ind = 0;
		if(global.glSelect2 == i && global.glSelect3 != -1 && global.glSelect4 == 0)
		{
			ind = 1;
			draw_set_color(fontColor1);
			
			var r = - 40 + obj_pers.sinSize * 40;
			if(global.showOptions == 10)r = 0;
			//show_message(r);
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
		else
		{
			draw_set_color(fontColor2);
		}
		
		draw_sprite(spr_skills, global.SKILL[item, 2], xx + 2, yy + 2 + i * 18);

		draw_text(xx + 18, yy - 8 + i * 18, global.SKILL[item, 0]);
	}
	
	var len = sinSize * 2;
	if(global.showOptions == 10)len = 2;
	if(global.glSelect3 != -1 && global.glSelect4 == 0)draw_sprite(spr_pick, 0, xx - 19 + len, yy + 4 + global.glSelect2 * 18);
	
	draw_set_color(fontColor2);
	draw_set_halign(fa_left);
	
	if(global.glSelect3 == -1)
	{
		var sel = global.glSelect;
		
		var min_i = max(sel - tempVar2, 0);
		var max_i = min(min_i + 5, ds_list_size(global.charList));
		var b = 0;
		for(var i = min_i; i < max_i; i ++)
		{
			var charr = ds_list_find_value(global.charList, i);
			var skills = global.CHAR[charr, 33];
			
			if(ds_list_size(skills) <= 0)
			{
				draw_sprite_ext(spr_shopchar, 2, 234, 39 + b * 32, 1, 1, 0, c_white, 1);
			} else draw_sprite(spr_shopchar, 0, 234, 39 + b * 32);
			
			if(sel == i && ds_list_size(skills) > 0)
			{
				draw_sprite_ext(spr_shopchar, 1, 234, 39 + b * 32, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			}
			
			if(global.glSelect == i)
			{
				draw_sprite_ext(spr_pick, 0, 220 + sinSize * 2, 12 + 39 + b * 32, 1, 1, 0, c_white, 1);
			}
		

			if(ds_list_size(skills) > 0)
			{
				DrawUnit(charr, tcindex, tindex, 242, 39 + b * 32, 1, 1, c_white, 1, 0, 3, 0);
				draw_text(276, 39 + b * 32, global.CHAR[charr, 0]);
			}
			else
			{
				DrawUnit(charr, tcindex, tindex, 242, 39 + b * 32, 1, 1, c_white, 1, 0, 4, 0);
				draw_set_color(fontColor11);
				draw_text(276, 39 + b * 32, global.CHAR[charr, 0]);
				draw_set_color(fontColor2);
			}
			if(global.CHAR[charr, 59] == true)
			{
				draw_sprite(spr_active, 0, 262, 41 + b * 32);
			}
			
			b += 1;
		}
	}
	else
	{	
		//var eskills = global.CHAR[char, 33];
		var xx = 212, yy = 90;
		draw_sprite_ext(spr_availableSkillsLabel, 0, xx, yy - 23, 1, 1, 0, c_white, 1);
		for(var i = 0; i < 5; i ++)
		{
			draw_sprite_ext(spr_availableSkills, 0, xx, yy + i * 18, 1, 1, 0, c_white, 1);
		}
		if(ds_list_size(nup) == 0)
		{
			draw_set_color(fontColor3);
			draw_text(xx + 19, yy - 8, "(All skills equipped)");
		}
		draw_set_halign(fa_left);
		
		var min_i = max(global.glSelect2 - guiTimer2, 0);
		if(global.glSelect4 == 0)min_i = 0;
		var max_i = min(min_i + 5, ds_list_size(nup) + 1);
		var indd = 0;
		for(var i = min_i; i < max_i; i ++)
		{
			var r = 0;
			var bc = c_white;
			var item = ds_list_find_value(nup, i);
			var ind = 0;
			if(global.glSelect2 == i && global.glSelect4 == 1)
			{
				ind = 1;

				draw_set_color(fontColor1);
			
				var r = - 40 + obj_pers.sinSize * 40;
				if(global.showOptions == 10)r = 0;
				//show_message(r);
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
				
				draw_sprite_ext(spr_availableSkills, ind, xx, yy + indd * 18, 1, 1, 0, bc, 1);
			}
			else
			{
				draw_set_color(fontColor2);
			}
			if(!(ds_list_find_value(nup, i) == undefined))
			{
				draw_sprite(spr_skills, global.SKILL[item, 2], xx + 2, yy + 2 + indd * 18);

				draw_text(xx + 18, yy - 8 + indd * 18, global.SKILL[item, 0]);
			}
			if(ds_list_size(nup) == 0)draw_text(xx + 19, yy - 8, "(All skills equipped)");
			
			if(global.glSelect2 == i)
			{
				var len = sinSize * 2;
				if(global.showOptions == 10)len = 2;
				if(global.glSelect4 == 1)draw_sprite(spr_pick, 0, xx - 19 + len, yy + 4 + indd * 18);
			}
			
			indd ++;
		}
	}
	
	
	
	surface_reset_target();
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_black, 0.5 * (1 - opSize) * (1 - opSize4));
	
		
	if(global.showOptions == 10)
	{	
		//mei
		if (!surface_exists(surfOptions))surfOptions = surface_create(200, 200);
		surface_set_target(surfOptions);
		draw_clear_alpha(c_black, 0);
	
		draw_set_font(ft_med);

		var xx = 24, yy = 0;
		len = 0;
		for(var i = 0; i < global.nOptions; i ++)
		{
		    if(len < string_width(global.options[i]))len = string_width(global.options[i]);
		}
		//show_message(len);

		for(var i = 0; i < global.nOptions; i ++)
		{
			var r = 0;
			var bc = c_white;
			var sprite = spr_button;
			if(global.glSelect5 == i)
			{
				sprite = spr_button2;
				draw_set_color(fontColor1);
			
				var r = - 40 + obj_pers.sinSize * 40;
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
			}
			else
			{
				draw_set_color(fontColor2);
			}
		    draw_sprite_ext(sprite, 0, xx, yy + i * 18, 1, 1, 0, bc, 1);
		    var wid = ceil(len / 3.7);
		    for(var ii = 0; ii < wid; ii ++)
		    {
		        draw_sprite_ext(sprite, 1, 4 + xx + ii * 4, yy + i * 18, 1, 1, 0, bc, 1);
		    }
			opEnd = xx + wid * 4 + 1;
		    draw_sprite_ext(sprite, 2, xx + wid * 4 + 1, yy + i * 18, 1, 1, 0, bc, 1);
		
		    draw_text(xx + 4, yy - 8 + i * 18, global.options[i]);
		}
	
		if(global.glSelect5 != -1)draw_sprite(spr_pick, 0, xx - 18 + obj_pers.sinSize * 2, 7 + yy + global.glSelect5 * 18);
	
		surface_reset_target();
	
		var sx = 216;
		if(global.glSelect4 == 1)sx -= 54;
		/*
		if(global.glSelect2 > 0)
		{
			sx = 138;
		}
		*/
		draw_surface_ext(surfOptions, sx - (1 - opSize) * 34, 90, 1 - opSize, 1, 0, c_white, 1);
	}
	
	draw_set_halign(fa_middle);
	draw_set_color(fontColor1);
	if(gamestate == "prepskills")draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, "Equip and remove skills.");
	
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Equip Skills");
}
if(gamestate == "prepinventory" || gamestate == "prepunits" || gamestate == "prepsupports")
{
	draw_sprite_ext(spr_preparationsBackground, 0, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_left);
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	
	//zxcv
	var min_i = max(global.glSelect2, 0) * 3;
	var nRows = ceil(ds_list_size(global.charList) / 3);
	if(global.glSelect2 > 2)
	{
		if(global.glSelect2 + 5 > nRows)min_i = max(global.glSelect2 - 1, 0) * 3;
		if(global.glSelect2 + 6 > nRows)min_i = max(global.glSelect2 - 2, 0) * 3;
	}
	else
	{
		min_i = 0;
	}
	
	var max_i = min(min_i + 5) * 3;
	
	var a = 0, b = 0;
	for(var i = min_i; i < max_i; i ++)
	{
		var unit = ds_list_find_value(global.charList, i);
		if(unit != undefined)
		{
			draw_sprite(spr_charBox, 0, 18 + a * 121, 33 + b * 35);
		
			var iid = global.glSelect2 * 3 + global.glSelect;
			if(iid == i)
			{
				draw_sprite_ext(spr_charBox, 1, 18 + a * 121, 33 + b * 35, 1, 1, 0, c_white, 0.5 + obj_pers.sinVal2 * 0.5);
			}
		
			draw_text(52 + a * 121, 34 + b * 35, global.CHAR[unit, 0]);
		
			if(gamestate == "prepinventory")
			{
				DrawUnit(unit, tcindex, tindex, 19 + a * 121, 36 + b * 35, 1, 1, c_white, 1, 0, 3, 0);
				if(global.CHAR[unit, 59] == true)draw_sprite(spr_active, 0, 42 + a * 121, 34 + b * 35)
			}
			else if(gamestate == "prepunits")
			{
				if(global.CHAR[unit, 59] == true)
				{
					DrawUnit(unit, tcindex, tindex, 19 + a * 121, 36 + b * 35, 1, 1, c_white, 1, 0, 3, 0);
					draw_sprite(spr_active, 0, 42 + a * 121, 34 + b * 35);
				}
				else
				{
					DrawUnit(unit, tcindex, tindex, 19 + a * 121, 36 + b * 35, 1, 1, c_white, 1, 0, 4, 0);
				}
			} else
			{
				DrawUnit(unit, tcindex, tindex, 19 + a * 121, 36 + b * 35, 1, 1, c_white, 1, 0, 3, 0);
				if(global.CHAR[unit, 40] == 1)draw_sprite(spr_talk, tempVar9, 18 + a * 121 + 2, 37 + b * 35 + 18);
			}

		
			a ++;
			if(a >= 3)
			{
				a = 0;
				b ++;
				if(b > 4)break;
			}
		}
	}
	
	surface_reset_target();
	draw_surface_ext(surfScreen, 200 * opSize4, 0, (1 - opSize4), 1, 0, c_white, 1);
	
	draw_set_halign(fa_middle);
	draw_set_color(fontColor1);
	if(gamestate == "prepinventory")draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.prepDescription[2]);
	else if(gamestate == "prepunits")draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.prepDescription[0])
	else if(gamestate == "prepsupports")draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.prepDescription[4]);
	
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	if(gamestate == "prepinventory")draw_text(9, - 37 + (1 - opSize4) * 36, "Inventory");
	else if(gamestate == "prepunits")
	{
		draw_text(9, - 37 + (1 - opSize4) * 36, "Select Units");
		var nUnits = 0;
		with(obj_unit)
		{
			if(faction == 0)nUnits++;
		}
		draw_set_color(fontColor1);
		draw_text(318 - 9, - 37 + (1 - opSize4) * 36, "Units: " + string(nUnits) + " / " + string(instance_number(obj_spawnAlly)));
	}
	else
	{
		draw_text(9, - 37 + (1 - opSize4) * 36, "Support");
	}

	if(showStats == 1)
	{
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, global.window_w, global.window_h, 0);
		draw_set_alpha(1);
		ShowStats(global.glSelect3);
	}
}
if(gamestate == "supports")
{
	draw_sprite_ext(spr_preparationsBackground, 0, 0, 0, 1, 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	draw_sprite(spr_supportBar, 0, 240 - 170, 33);
	
	if(!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_left);
	
	DrawUnit(global.glSelect3, tcindex, tindex, 240 - 80, 35, 1, 1, c_white, 1, 0, 3, 0);
	draw_set_font(ft_large);
	draw_set_color(fontColor2);
	draw_text(194, 30, global.CHAR[global.glSelect3, 0]);
	
	var sel = global.glSelect2;
		
	var min_i = max(sel - tempVar2, 0);
	var max_i = min(min_i + 3, ds_list_size(nup) - 1);
	var b = 0;
	var len = 33;
	var hei = 67;
	var wid = 76;
	
	for(var i = min_i; i <= max_i; i ++)
	{
		var charr = ds_list_find_value(nup, i);
		//if(charr == global.glSelect3)i ++;
		//if(i >= max_i)break;
			//var inventory = global.CHAR[charr, 49];

			var hasSupports = 0;
			if(global.SUPPORTADV[global.glSelect3, charr])hasSupports = 1;
			if(hasSupports)
			{
				draw_sprite_ext(spr_supportChar, 0, wid, hei + b * len, 1, 1, 0, c_white, 1);
			} else draw_sprite(spr_supportChar, 2, wid, hei + b * len);
			
			if(sel == i && hasSupports)
			{
				draw_sprite_ext(spr_supportChar, 1, wid, hei + b * len, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			}
			
			if(global.glSelect2 == i)
			{
				draw_sprite_ext(spr_pick, 0, wid - 14 + sinSize * 2, 14 + hei + b * len, 1, 1, 0, c_white, 1);
			}
			draw_set_color(fontColor2);
			draw_set_halign(fa_left);
			draw_set_font(ft_large);

			if(hasSupports)
			{
				DrawUnit(charr, tcindex, tindex, wid + 3, hei + b * len + 3, 1, 1, c_white, 1, 0, 3, 0);
				draw_text(wid + 36, hei + b * len - 2, global.CHAR[charr, 0]);
			}
			else
			{
				DrawUnit(charr, tcindex, tindex, wid + 3, hei + b * len + 3, 1, 1, c_white, 1, 0, 4, 0);
				draw_set_color(fontColor11);
				draw_text(wid + 36, hei + b * len - 2, global.CHAR[charr, 0]);
				draw_set_color(fontColor2);
			}
			
			for(var a = 0; a < global.SUPPORTLIMIT[global.glSelect3, charr]; a ++)
			{
				draw_sprite(spr_rank, a + 2, wid + 130 + a * 24, hei + b * len + 14);
				if(a >= global.SUPPORTS[global.glSelect3, charr])draw_sprite_ext(spr_rank, a + 2, wid + 130 + a * 24, hei + b * len + 14, 1, 1, 0, c_black, 0.5);
			}
			
			b += 1;
	}
	
	surface_reset_target();
	
	draw_surface_ext(surfScreen, opSize4 * 200, 0, 1 - opSize4, 1, 0, c_white, 1);
	
	draw_set_color(fontColor8);
	draw_set_font(ft_med);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Support");
	
	draw_set_color(fontColor1);
	draw_set_halign(fa_center);
	draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, "Select a unit.");
}
if(gamestate == "showsupportadv")
{
	if(global.currentBackground != -1)
	{
		var backgroundX = 0;
		draw_sprite(global.currentBackground, 0, backgroundX, 0);
	}
	
	var char1 = global.CHAR[global.glSelect3, 0];
	var char2 = global.CHAR[guiTimer5, 0];
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen2);
	draw_clear_alpha(c_black, 0);
	
	draw_sprite(spr_menuMessage, 0, 200, 120);
	draw_set_halign(fa_left);
	var text = string(char1) + " and " + string(char2);
	draw_text(212 - 92, 120 - 26, text)
	text = "attained support level      .";
	draw_text(212 - 92, 120 - 26 + 18, text)
	draw_sprite(spr_rank, guiTimer3, string_width(text) + 99, 118 + 5);

	surface_reset_target();
	
	draw_surface_ext(surfScreen2, 200 * opSize4, 0, 1 - opSize4, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
}
if(gamestate == "sandynotes" || gamestate == "sandynotes2")
{	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	if(!surface_exists(surfScreen2))surfScreen2 = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen2);
	draw_clear_alpha(c_black, 0);
	
	draw_set_halign(fa_center);
	
	draw_sprite(spr_menuMessage, 0, global.window_w / 2, global.window_h / 2);
	draw_text(global.window_w / 2,global.window_h / 2 - 46, "Build " + buildver + " notes");
	draw_set_font(ft_small);
	draw_set_halign(fa_left);
	draw_text_ext(global.window_w / 2 - 92, global.window_h / 2 - 24, sandynotes, 14, 200);

	surface_reset_target();
	
	draw_surface_ext(surfScreen2, 200 * opSize4, 0, 1 - opSize4, 1, 0, c_white, 1);
	draw_set_halign(fa_left);
}
if(gamestate == "prepitems")
{
	draw_sprite_ext(spr_preparationsBackground, 0, 0, 0, 1, 1, 0, c_white, 1);
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	//draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	trade1xpos = 27;
	trade1ypos = 82;
	var char = global.glSelect3;
	var inventory1 = global.CHAR[char, 49];
	var uses1 = global.CHAR[char, 50];
	var item = ds_list_find_value(inventory1, global.glSelect);
	
	draw_set_font(ft_med);
	
	draw_set_halign(fa_center);
	draw_set_color(fontColor1);
	draw_sprite(spr_name, 0, trade1xpos + 7, trade1ypos - 21);
	draw_text(trade1xpos + 65, trade1ypos - 28, global.CHAR[char, 0]);
	draw_set_halign(fa_left);
	
	if (!surface_exists(surfTradep1))surfTradep1 = surface_create(200, 90);
	surface_set_target(surfTradep1);
	draw_clear_alpha(c_black, 0);
	DrawPortrait(char, -1, 48, 0);
	surface_reset_target();
	
	if (!surface_exists(surfTrade1))surfTrade1 = surface_create(200, 200);
	surface_set_target(surfTrade1);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(ft_med);

	var xx = 24, yy = 1;
	var rowHeight = 18;
	for(var i = 0; i < 5; i ++)
	{
		var r = 0;
		var bc = c_white;
		var ind = 0;
		if(global.glSelect == i && global.glSelect2 == 0)
		{
			ind = 1;
			var r = - 40 + obj_pers.sinSize * 40;
			if(global.showOptions == 10)r = 0;
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
	draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
	}
	if(index1trade != -1 && whotowho == 1)
	{
		draw_sprite_ext(spr_itemList, 1, xx, yy + index1trade * rowHeight, 1, 1, 0, fontColor7, 0.65);
		draw_sprite_ext(spr_pick, 0, xx - rowHeight, 7 + yy + index1trade * rowHeight, 1, 1, 0, c_white, 0.65);
	}
	
	draw_surface_ext(surfTradep1, xx, yy, 1, 1, 0, c_white, 0.2);
	
	if(ds_list_size(inventory1) <= 0)
	{
		draw_set_color(fontColor5);
		draw_set_halign(fa_center);
		draw_text(xx + 70, yy - 8, "(No items)");
		draw_set_halign(fa_left);
	}
	
	for(var i = 0; i < ds_list_size(inventory1); i ++)
	{
		var r = 0;
		var bc = c_white;
		var item = ds_list_find_value(inventory1, i);
		var ind = 0;
		if(global.glSelect == i && global.glSelect2 == 0)
		{
			ind = 1;
			draw_set_color(fontColor1);
			
			var r = - 40 + obj_pers.sinSize * 40;
			//show_message(r);
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
			itemSel = item;
		}
		else
		{
			draw_set_color(fontColor2);
		}
		
		draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
		
		var usable = false;
		if(CanUse(char, item))usable = true;
		if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0 && global.CHAR[global.glSelect3, 4] >= 10 && global.CLASS[global.CHAR[global.glSelect3, 3], 36] < 2)usable = true;
		if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] > 0)usable = true;
		if(usable == true)
		{
			draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
			draw_set_halign(fa_right);
			draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses1, i));
			draw_set_halign(fa_left);
		}
		else
		{
			draw_set_color(fontColor5);
			draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
			draw_set_halign(fa_right);
			draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses1, i));
			draw_set_halign(fa_left);
			draw_set_color(fontColor2);
		}
		
		if(global.CHAR[char, 56] == i)
		{
			draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
		}
	}
		
	var xp = 2;
	if(global.showOptions == 0 || global.showOptions > 10)xp = obj_pers.sinSize * 2;
	
	surface_reset_target();
	
	draw_surface_ext(surfTrade1, trade1xpos + opSize4 * (sprite_get_width(spr_itemList) / 2) - 34, trade1ypos, 1 - opSize4, 1, 0, c_white, 1);

	if(global.showOptions == 11 || global.showOptions == 10)
	{
		draw_sprite_ext(spr_name, 0, trade1xpos + 7, trade1ypos - 21, 1, 1, 0, c_black, 0.6);
		draw_surface_ext(surfTrade1, trade1xpos - (1 - opSize4) * 34, trade1ypos, 1 - opSize4, 1, 0, c_black, 0.6);
	}
	
	if(global.glSelect != -1 && global.glSelect2 == 0)draw_sprite(spr_pick, 0, -34 + trade1xpos + xx - rowHeight + xp, trade1ypos + 7 + yy + global.glSelect * rowHeight);
	if(global.glSelect != -1 && global.glSelect2 == 0 && (global.showOptions == 11 || global.showOptions == 10))draw_sprite_ext(spr_pick, 0, -34 + trade1xpos + xx - rowHeight + xp, trade1ypos + 7 + yy + global.glSelect * rowHeight, 1, 1, 0, c_black, 0.6);
	
	
	
	/////////big
	
	trade2xpos = 190;
	trade2ypos = 82 - 24;
	var name = "";
	if(itemCharSel != -1)
	{
		name = global.CHAR[itemCharSel, 0];
	}
	//var item = ds_list_find_value(inventory1, global.glSelect);
	
	draw_set_font(ft_med);
	
	draw_set_halign(fa_center);
	draw_set_color(fontColor1);
	draw_sprite(spr_name, 0, trade2xpos + 77, trade2ypos - 20);
	draw_text(trade2xpos + 135, trade2ypos - 27, name);
	draw_set_halign(fa_left);
	
	if (!surface_exists(surfTradep2))surfTradep2 = surface_create(200, 90);
	surface_set_target(surfTradep2);
	draw_clear_alpha(c_black, 0);
	if(itemCharSel != -1)DrawPortrait(itemCharSel, 1, 16, 0);
	surface_reset_target();
	
	if (!surface_exists(surfTrade2))surfTrade2 = surface_create(260, 200);
	surface_set_target(surfTrade2);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(ft_med);
	
	draw_sprite(spr_convoyItems, 0, 24, 2);
	
	for(var i = 0; i < 11; i ++)
	{
		draw_sprite(spr_weaponIcons, i, 29 + 18 * i, 6);
		if((global.glSelect2 - 1 == i) || ((opTrade - 1) == i && global.showOptions > 10))
		{
			draw_sprite(spr_weaponIcons2, i, 29 + 18 * i, 6);
		}
	}


	/*
	for(var i = 0; i < 5; i ++)
	{
		var r = 0;
		var bc = c_white;
		var ind = 0;
		if(global.glSelect == i && global.glSelect2 > 0)
		{
			ind = 1;
			var r = - 40 + obj_pers.sinSize * 40;
			if(global.showOptions == 10)r = 0;
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
		draw_sprite_ext(spr_itemListLarge, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
	}
	*/
	var xx = 24, yy = 25;
	var rowHeight = 18;
	/*
	if(index2trade != -1 && whotowho == 1)
	{
		draw_sprite_ext(spr_itemListLarge, 1, xx, yy + index2trade * rowHeight, 1, 1, 0, fontColor7, 0.65);
		draw_sprite_ext(spr_pick, 0, xx - rowHeight, 7 + yy + index2trade * rowHeight, 1, 1, 0, c_white, 0.65);
	}
	*/
	
	var td = 0;
	if(ds_list_size(itemindexList) <= 0)
	{
		for(var i = 0; i < 5; i ++)
		{
			draw_sprite_ext(spr_itemListLarge, 0, xx, yy + i * rowHeight, 1, 1, 0, c_white, 1);
		}
		draw_surface_ext(surfTradep2, xx + 26, yy, 1, 1, 0, c_white, 0.2);
		
		draw_set_color(fontColor5);
		draw_set_halign(fa_center);
		draw_text(xx + 99, yy - 8, "(No items)");
		draw_set_halign(fa_left);
	} else
	{
		var min_i = lastOp - 2;
		if(min_i + 5 > ds_list_size(itemindexList) - 1)
		{
		    min_i = ds_list_size(itemindexList) - 5;
		}
		min_i = max(min_i, 0);
		var a = 0;
		for(var i = min_i; i < min_i + 5; i ++)
		{
			var r = 0;
			var bc = c_white;
			var itemIndex = ds_list_find_value(itemindexList, i);
			var itemChar = ds_list_find_value(itemcharList, i);
			
			var r = 0;
			var bc = c_white;
			var ind = 0;
			if(lastOp == i && global.glSelect2 > 0)
			{
				ind = 1;
				var r = - 40 + obj_pers.sinSize * 40;
				if(global.showOptions == 10)r = 0;
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
				td = a;
			}
			
			draw_sprite_ext(spr_itemListLarge, ind, xx, yy + a * rowHeight, 1, 1, 0, bc, 1);
			if(i >= min_i + 4)draw_surface_ext(surfTradep2, xx + 26, yy, 1, 1, 0, c_white, 0.2);
			
			if(itemIndex != undefined)
			{
				var item = ds_list_find_value(global.CHAR[itemChar, 49], itemIndex);
				var uses = ds_list_find_value(global.CHAR[itemChar, 50], itemIndex);
				var ind = 0;
			
				if(lastOp == i && global.glSelect2 > 0)
				{
					draw_set_color(fontColor1);
				}
				else
				{
					draw_set_color(fontColor2);
				}
		
				draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + a * rowHeight);
				
				var usable = false;
				if(CanUse(char, item))usable = true;
				if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0 && global.CHAR[global.glSelect3, 4] >= 10 && global.CLASS[global.CHAR[global.glSelect3, 3], 36] < 2)usable = true;
				if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] > 0)usable = true;
				if(usable == true)
				{
					draw_text(xx + 18, yy - 8 + a * rowHeight, global.ITEM[item, 0]);
		
					draw_set_halign(fa_right);
					draw_text(xx + 202, yy - 8 + a * rowHeight, uses);
					draw_set_halign(fa_left);
				}
				else
				{
					draw_set_color(fontColor5);
					draw_text(xx + 18, yy - 8 + a * rowHeight, global.ITEM[item, 0]);
		
					draw_set_halign(fa_right);
					draw_text(xx + 202, yy - 8 + a * rowHeight, uses);
					draw_set_halign(fa_left);
					draw_set_color(fontColor2);
				}

				//draw_text(xx + 18, yy - 8 + a * rowHeight, global.ITEM[item, 0]);
		
				if(itemChar != 100 && global.CHAR[itemChar, 56] == itemIndex)
				{
					draw_sprite(spr_equipped, 0, xx + 12, yy + a * rowHeight + 9);
				}
			}
			a ++;
		}
	}
		
	var xp = 2;
	if(global.showOptions == 0 || global.showOptions > 10)xp = obj_pers.sinSize * 2;
	
	surface_reset_target();
	
	draw_surface_ext(surfTrade2, trade2xpos + opSize4 * (sprite_get_width(spr_itemListLarge) / 2) - 34, trade2ypos, 1 - opSize4, 1, 0, c_white, 1);
	
	if(global.showOptions == 12 || global.showOptions == 10)
	{
		draw_surface_ext(surfTrade2, trade2xpos - (1 - opSize4) * 34, trade2ypos, 1 - opSize4, 1, 0, c_black, 0.6);
		draw_sprite_ext(spr_name, 0, trade2xpos + 77, trade2ypos - 20, 1, 1, 0, c_black, 0.6);
	}
	
	if(global.glSelect != -1 && global.glSelect2 > 0)draw_sprite(spr_pick, 0, -34 + trade2xpos + xx - rowHeight + xp, trade2ypos + 7 + yy + td * rowHeight);
	if(global.glSelect != -1 && global.glSelect2 > 0 && (global.showOptions == 12 || global.showOptions == 10))draw_sprite_ext(spr_pick, 0, -34 + trade2xpos + xx - rowHeight + xp, trade2ypos + 7 + yy + td * rowHeight, 1, 1, 0, c_black, 0.6);

	if(global.showOptions == 11)
	{
		var xx = 24, yy = 1;
		draw_sprite_ext(spr_pick, 0, -32 + trade1xpos + xx - rowHeight, trade1ypos + 7 + yy + select1trade * rowHeight, 1, 1, 0, c_white, 0.4);
		draw_sprite_ext(spr_pick, 0, -32 + trade1xpos + xx - rowHeight, trade1ypos + 7 + yy + select1trade * rowHeight, 1, 1, 0, c_black, 0.25);
	}
	if(global.showOptions == 12)
	{
		var xx = 24, yy = 25;
		draw_sprite_ext(spr_pick, 0, -32 + trade2xpos + xx - rowHeight, trade2ypos + 7 + yy + select1trade * rowHeight, 1, 1, 0, c_white, 0.4);
		draw_sprite_ext(spr_pick, 0, -32 + trade2xpos + xx - rowHeight, trade2ypos + 7 + yy + select1trade * rowHeight, 1, 1, 0, c_black, 0.25);
	}
	if(global.showOptions == 10)
	{
		//mei
		if (!surface_exists(surfOptions))surfOptions = surface_create(200, 200);
		surface_set_target(surfOptions);
		draw_clear_alpha(c_black, 0);
	
		draw_set_font(ft_med);

		var xx = 24, yy = 0;
		len = 0;
		for(var i = 0; i < global.nOptions; i ++)
		{
		    if(len < string_width(global.options[i]))len = string_width(global.options[i]);
		}
		//show_message(len);

		for(var i = 0; i < global.nOptions; i ++)
		{
			var r = 0;
			var bc = c_white;
			var sprite = spr_button;
			if(global.glSelect4 == i)
			{
				sprite = spr_button2;
				draw_set_color(fontColor1);
			
				var r = - 40 + obj_pers.sinSize * 40;
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
			}
			else
			{
				draw_set_color(fontColor2);
			}
		    draw_sprite_ext(sprite, 0, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
		    var wid = ceil(len / 3.7);
		    for(var ii = 0; ii < wid; ii ++)
		    {
		        draw_sprite_ext(sprite, 1, 4 + xx + ii * 4, yy + i * rowHeight, 1, 1, 0, bc, 1);
		    }
			opEnd = xx + wid * 4 + 1;
		    draw_sprite_ext(sprite, 2, xx + wid * 4 + 1, yy + i * rowHeight, 1, 1, 0, bc, 1);
		
		    draw_text(xx + 4, yy - 8 + i * rowHeight, global.options[i]);
		}
	
		if(global.glSelect4 != -1)draw_sprite(spr_pick, 0, xx - rowHeight + obj_pers.sinSize * 2, 7 + yy + global.glSelect4 * rowHeight);
	
		surface_reset_target();
	
		var sx = 187;
		if(global.glSelect2 > 0)
		{
			sx = 138;
		}
		draw_surface_ext(surfOptions, sx - (1 - opSize) * 34, 60, 1 - opSize, 1, 0, c_white, 1);
	}

	//blackbar
	
	DrawitemInfo(itemSel);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor8);
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Items");
}

if(gamestate == "saving")
{
	var vx = 1 - tempVar;
	
	if (!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	
	draw_set_halign(fa_left);
	draw_sprite(spr_superbigMessage, 0, 200 - 126, 120 - 33);
	draw_set_color(fontColor2);
	draw_text(104, 92, "Saving your progress...");
	draw_text(104, 92 + 18, "Please do not turn the power off.");
			
	draw_sprite(spr_loading, tempVar2, 314, 127);
	
	surface_reset_target();
	
	draw_surface_ext(surfScreen, 200 * tempVar, 0, vx, 1, 0, c_white, 1);
}
if(gamestate == "shop" || gamestate == "unitshop")
{
	if(tempVar4 > 0)
	{
		draw_set_color(c_black);
		draw_set_alpha((tempVar4 / 45));
		draw_rectangle(0, 0, 480, 240, 0);
		draw_set_alpha(1);
	}
}

if(global.showOptions == 7 && gamestate != "saving")
{
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if(!surface_exists(surfOptions))surfOptions = surface_create(240, 240);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	draw_set_color(fontColor2);
	draw_set_halign(fa_center);
	draw_set_font(ft_med);
	
	for(var i = 0; i < global.menuOptions; i ++)
	{
		draw_set_color(fontColor2);
		if(global.glSelect != i)draw_sprite_ext(spr_menuButton, 0, 24, 0 + i * 32, 1, 1, 0, c_white, 1);
		else
		{
			draw_sprite_ext(spr_menuButton, 1, 24, 0 + i * 32, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menuButton, 0, 24, 0 + i * 32, 1, 1, 0, c_white, obj_pers.sinVal2 * 0.3);
			draw_sprite_ext(spr_pick, 0, 10 + obj_pers.sinSize * 2, 14 +  i * 32, 1, 1, 0, c_white, 1);
		}
		if(global.glSelect == i)draw_set_color(fontColor1);
		draw_text(67 + 24, 1 + i * 32, global.menuText[i]);
	}
	
	surface_reset_target();
	
	draw_surface_ext(surfOptions, 106 + opSize4 * (67 + 24), 104 - (global.menuOptions * 32) / 2, 1 - opSize4, 1, 0, c_white, 1 - opSize4);
	draw_set_color(fontColor1);
	draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.menuDescription[global.glSelect]);
	
	
	draw_set_halign(fa_left);

}
if(global.showOptions == 8)
{
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if(!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	
	draw_set_color(fontColor3);
	
	draw_set_halign(fa_left);
	draw_set_font(ft_med);
	
	draw_set_color(fontColor2);
	
	var min_i = max(global.glSelect2 - tempVar2, 0);
	var max_i = min(min_i + 5, global.menuOptions2);
	var a = 1.5;
	for(var i = min_i; i < max_i; i ++)
	{
		draw_set_halign(fa_left);
		draw_set_color(fontColor2);
		draw_sprite_ext(spr_menuOptions, 0, 24, 0 + a * 32, 1, 1, 0, c_white, 1);
		draw_text(42, -1 + a * 32, global.menuText2[i]);
		
		if(global.glSelect2 == i)
		{
			draw_sprite_ext(spr_pick, 0, 8 + obj_pers.sinSize * 2, 12 +  a * 32, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menuAdjust, 1, 178, 5 + a * 32, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menuAdjust, 0, 178, 5 + a * 32, 1, 1, 0, c_white, obj_pers.sinVal2 * 0.3);
			
			draw_sprite_ext(spr_switchArrow, arrowSelect1, 194 - 10 - obj_pers.sinSize * 0.75, 16 + a * 32, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_switchArrow, arrowSelect1, 322 - 10 + obj_pers.sinSize * 0.75, 16 + a * 32, -1, 1, 0, c_white, 1);
			
			if(arrowSelect1 == 1)
			{
				gpu_set_blendmode(bm_add);
				draw_sprite_ext(spr_switchArrow, arrowSelect1 > 0, 194 - 10 - obj_pers.sinSize * 0.75, 16 + a * 32, 1, 1, 0, c_white, 0.5);
				gpu_set_blendmode(bm_normal);
			}
			if(arrowSelect2 == 1)
			{
				gpu_set_blendmode(bm_add);
				draw_sprite_ext(spr_switchArrow, arrowSelect1, 322 - 10 + obj_pers.sinSize * 0.75, 16 + a * 32, -1, 1, 0, c_white, 0.5);
				gpu_set_blendmode(bm_normal);
			}
		}
		
		draw_set_halign(fa_center);
		if(global.glSelect2 == i)draw_set_color(fontColor1);
		if(global.optionsType[i] == 0) draw_text(178 + 70, -1 + a * 32, global.optionsM[i, global.optionState[i]]);
		else
		{
			draw_set_color(c_black);
			draw_rectangle(146 + 72, 13 + a * 32, 146 + 72 + 63, 19 + a * 32, 0);
			draw_sprite_part(spr_menuSlider, (global.glSelect2 == i), 0, 0, global.optionState[i] * 64 / 100, 6, 146 + 72, 13 + a * 32);
		}
		a ++;
	}
	
	surface_reset_target();
	//draw_set_halign(fa_center);
	
	draw_surface_ext(surfScreen, 24 + opSize4 * 154, 120 - (global.menuOptions2 * 32) / 2, 1 - opSize4, 1, 0, c_white, 1 - opSize4);
	draw_set_color(fontColor1);
	draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, global.menuDescription2[global.glSelect2]);
	
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, global.menuText[global.glSelect]);
	
}
if(gamestate == "controlmapper")
{
	draw_sprite(spr_menuTop, 0, 0, - 36 + (1 - opSize4) * 36);
	draw_sprite(spr_menuBottom, 0, 0, (global.window_h + 4) - (1 - opSize4) * 36);
	
	if(!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	surface_set_target(surfScreen);
	draw_clear_alpha(c_black, 0);
	
	draw_set_color(fontColor3);
	
	draw_set_halign(fa_left);
	draw_set_font(ft_med);
	
	draw_set_color(fontColor2);
	
	var min_i = max(global.glSelect2 - tempVar2, 0);
	var max_i = min(min_i + 5, global.menuOptions3);
	var a = 1.5;
	for(var i = min_i; i < max_i; i ++)
	{
		draw_set_halign(fa_left);
		draw_set_color(fontColor2);
		draw_sprite_ext(spr_menuOptions, 0, 24, 0 + a * 32, 1, 1, 0, c_white, 1);
		draw_text(42, -1 + a * 32, global.menuText3[i]);
		
		if(global.glSelect2 == i)
		{
			draw_sprite_ext(spr_pick, 0, 8 + obj_pers.sinSize * 2, 12 +  a * 32, 1, 1, 0, c_white, 1);
			if(global.glSelect3 == 0)
			{
				//draw_sprite_ext(spr_menuAdjust, 1, 178, 5 + a * 32, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menuAdjust, 1, 178, 5 + a * 32, 1, 1, 0, c_white, 0.15 + 0.2 * sinVal2);
			}
			else
			{
				draw_sprite_ext(spr_menuAdjust, 1, 178, 5 + a * 32, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menuAdjust, 0, 178, 5 + a * 32, 1, 1, 0, c_white, sinVal2 * 0.3);
			}
		}
		
		draw_set_halign(fa_center);
		if(global.glSelect2 == i && global.glSelect3 == 1)draw_set_color(fontColor1);
		var str = keyvar[i];
		if(str == vk_down)str = "Down Key";
		else if(str == vk_up)str = "Up Key";
		else if(str == vk_left)str = "Left Key";
		else if(str == vk_right)str = "Right Key";
		else if(str == vk_shift)str = "Shift";
		else if(str == vk_lshift)str = "Left Shift";
		else if(str == vk_rshift)str = "Right Shift";
		else if(str == vk_lcontrol)str = "Left Ctrl";
		else if(str == vk_rcontrol)str = "Right Ctrl";
		else if(str == vk_control)str = "Ctrl";
		else if(str == vk_enter)str = "Enter";
		else if(str == vk_backspace)str = "Backspace";
		else if(str == vk_escape)str = "Escape";
		else if(str == vk_tab)str = "Tab";
		else if(str == vk_space)str = "Space";
		else if(str == vk_lalt)str = "Left Alt";
		else if(str == vk_ralt)str = "Right Alt";
		else if(str == vk_numpad0)str = "Numpad 0";
		else if(str == vk_numpad1)str = "Numpad 1";
		else if(str == vk_numpad2)str = "Numpad 2";
		else if(str == vk_numpad3)str = "Numpad 3";
		else if(str == vk_numpad4)str = "Numpad 4";
		else if(str == vk_numpad5)str = "Numpad 5";
		else if(str == vk_numpad6)str = "Numpad 6";
		else if(str == vk_numpad7)str = "Numpad 7";
		else if(str == vk_numpad8)str = "Numpad 8";
		else if(str == vk_numpad9)str = "Numpad 9";
		else str = chr(str);
		draw_text(178 + 70, -1 + a * 32, str);
		a ++;
	}
	
	surface_reset_target();
	//draw_set_halign(fa_center);
	
	//draw_surface_ext(surfScreen, 24 + opSize4 * 154, 0, 1 - opSize4, 1, 0, c_white, 1 - opSize4);
	draw_surface_ext(surfScreen, 24 + opSize4 * 154, -8, 1 - opSize4, 1, 0, c_white, 1 - opSize4);
	draw_set_color(fontColor1);
	if(global.glSelect3 == 0)draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, "Select any key to replace.");
	else draw_text(200, (global.window_h - 31) + 36 - (1 - opSize4) * 36, "Press any key to replace the selected key.");
	
	draw_set_halign(fa_left);
	draw_text(9, - 37 + (1 - opSize4) * 36, "Control Mapper (Keyboard)");
}

if(global.debug)
{
	draw_set_halign(fa_left);
	var xx = 0;
	var yy = global.window_h - 70;
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(xx, yy, xx + 400, yy + 70, 0);
	draw_set_font(ft_debug);
	
	draw_set_color(c_white);
	
	var min_i = max(0, global.debugIndex - 5);
	var max_i = global.debugIndex;
	var a = 0;
	for(var i = min_i; i < max_i; i ++)
	{
		var msg = ds_list_find_value(global.debugList, i);
		draw_text(xx + 4, 2 + yy + a * 10, msg);
		a ++;
	}
	
	draw_line(xx + 2, yy + 55, xx + 398, yy + 55);
	draw_set_alpha(0.5);
	draw_line(xx + 2, yy + 55.5, xx + 398, yy + 55.5);
	draw_set_alpha(1);
	
	draw_text(xx + 4, yy + 57, global.debugWrite);
	
	var wif = string_width(string_copy(global.debugWrite, 1, caret))
	if(slash != "") draw_text(xx + 3 + wif, yy + 57, "|");
	//draw_line(x + i, y, x + i, y + h)

	
	
	/*
	if(instance_exists(obj_game))
	{
		with obj_game
		{
			draw_set_halign(fa_left);
			var xx = 400 - 145, yy = 0;
			draw_set_color(c_black);
			draw_set_alpha(0.75);
			draw_rectangle(xx + 1, yy + 1, xx + 145, yy + 62, 0);
			draw_set_alpha(1);
			draw_set_font(ft_debug);
			draw_set_color(c_white);
			draw_rectangle(xx, yy, xx + 145 + 1, yy + 62 + 1, 1);
			draw_text(4 + xx, 1 + yy, "states");
			draw_set_alpha(0.5);
			draw_line(0 + xx, 14.5 + yy, 4 + xx + 142, 14.5 + yy)
			draw_line(0 + xx, 14.5 + yy + 32, 4 + xx + 142, 14.5 + yy + 32);
			draw_set_alpha(1);
			draw_line(0 + xx, 14 + yy, 4 + xx + 142, 14 + yy);
			draw_line(0 + xx, 14 + yy + 32, 4 + xx + 142, 14 + yy + 32);
			draw_text(4 + xx, 5 + 12 + yy, "global: " + state);
			draw_text(4 + xx, 5 + 12 * 2 + yy, "game: " + gamestate);
			draw_text(4 + xx, 13 + 12 * 3 + yy, "f12 to hide - v0.63");
		}
	}
	*/
}

if(global.simpleFadeout > 0)
{
	draw_set_color(c_black);
	draw_set_alpha(global.simpleFadeout / 60);
	draw_rectangle(0, 0, global.window_w, global.window_h, 0);
	draw_set_alpha(1);
}


if(global.debug)
{
	draw_set_font(ft_debug);
	draw_set_color(c_white);
	draw_set_font(ft_med);
	draw_set_halign(fa_left);
	//draw_text(12, 64, "file: " + string(global.currentFile));
	draw_text(12, 96, "obj_pers [state]: " + string(state));
	draw_text(12, 96 + 24, "obj_pers [gamestate]: " + string(gamestate));
	
	if(instance_exists(obj_game))
	{
	draw_set_color(c_white);
	draw_set_font(ft_med);
	draw_set_halign(fa_left);
	draw_text(12, 12, "obj_game [gamestate] " + string(obj_game.gamestate));
	draw_text(12, 24, "obj_game [state] " + string(obj_game.state));
	
	draw_text(12, 24 + 12, "obj_game [guiTimer3] " + string(obj_game.guiTimer3));
	draw_text(12, 24 + 12 * 2, "obj_game [guiTimer4] " + string(obj_game.guiTimer4));
	}
}

	
	
	
	
/*
if(instance_exists(obj_game))
{
draw_set_color(c_white);
draw_set_font(ft_med);
draw_set_halign(fa_left);
draw_text(12, 12, "obj_game [gamestate] " + obj_game.gamestate);
draw_text(12, 24, "obj_game [state] " + obj_game.state);
}
*/
