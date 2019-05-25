var char = argument[0];
var charID = char;
var type = 0;
if(char > 200)
{
	charID = char.characterID;
	type = 1;
}
if(char < 0)exit;

var xx = 46, yy = 14, ay = -6;

draw_set_font(ft_small);
draw_set_color(fontColor1);
draw_set_halign(fa_center);
var nTabs = 3;
if(ds_list_size(nup) <= 0)nTabs = 2;
for(var i = 0; i < nTabs; i ++)
{
	draw_sprite(spr_page, 0, 200 + ((i - nTabs / 2) * 42) / 2, 220 + ay);
	draw_text(209 + ((i - nTabs / 2) * 42) / 2, 216 + ay, (i + 1));
	
	if(global.glSelect7 == i)
	{
		draw_set_alpha(0.75);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_page, 0, 200 + ((i - nTabs / 2) * 42) / 2, 220 + ay, 1, 1, 0, c_white, 0.75);
		draw_text(209 + ((i - nTabs / 2) * 42) / 2, 216 + ay, (i + 1));
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	}
}
draw_set_halign(fa_left);
	
draw_sprite(spr_changeTab, 0, xx - 2, 120 + ay);
draw_sprite(spr_changeTab, 0, xx + 311, 120 + ay);

draw_sprite(spr_arrowTab, 0, xx + 311 + obj_pers.sinVal2 * 2, 120 + ay);
draw_sprite_ext(spr_arrowTab, 0, xx - 2 - obj_pers.sinVal2 * 2, 120 + ay, -1, 1, 0, c_white, 1);

gpu_set_blendmode(bm_add);
if(global.leftKey_state > 0 && global.leftKey_state < 8 && global.glSelect9 == 0) draw_sprite_ext(spr_changeTab, 0, xx - 2, 120 + ay, 1, 1, 0, c_white, 0.75);
if(global.rightKey_state > 0 && global.rightKey_state < 8 && global.glSelect9 == 0) draw_sprite_ext(spr_changeTab, 0, xx + 311, 120 + ay, 1, 1, 0, c_white, 0.75);
draw_sprite_ext(spr_arrowTab, 0, xx + 311 + obj_pers.sinVal2 * 2, 120 + ay, 1, 1, 0, c_white, 0.75);
draw_sprite_ext(spr_arrowTab, 0, xx - 2 - obj_pers.sinVal2 * 2, 120 + ay, -1, 1, 0, c_white, 0.75);
gpu_set_blendmode(bm_normal);
	
draw_sprite(spr_statsAll, 0, xx, yy + ay);
//draw_sprite(spr_cancel, 0, xx + 278, yy + 8);

if(global.glSelect7 < 2)
{
	if (!surface_exists(surfPort2))surfPort2 = surface_create(128, 128);
	
	//draw portrait
	surface_set_target(surfPort2);
	draw_clear_alpha(c_black, 0);
	
	DrawPortrait(charID, 1, 0, 0);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite(spr_trans, 0, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	draw_surface_ext(surfPort2, xx + 6 + 128, 24 + ay, -1, 1, 0, c_white, 1);
	if(type == 1)draw_sprite(spr_name, char.faction, xx + 10, 142 + ay);
	else draw_sprite(spr_name, 0, xx + 10, 142 + ay);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	
	draw_set_halign(fa_center);
	//draw_text(xx + 10 + 58, 142 - 7 + ay, global.CHAR[charID, 0] + "[" + string(charID) + "]");
	draw_text(xx + 10 + 58, 142 - 7 + ay, global.CHAR[charID, 0] + "[" + string(charID) + "]");

	var yr = -4;
	draw_sprite(spr_2stats, 0, xx + 10, 166 + yr + ay);
	draw_sprite(spr_2stats, 0, xx + 10, 166 + 18 + yr + ay);
	draw_text(xx + 27, 158 + yr + ay, "Atk");
	draw_text(xx + 27, 158 + 18 + yr + ay, "Hit");
	draw_text(xx + 27 + 56, 158 + yr + ay, "Crit");
	draw_text(xx + 27 + 56, 158 + 18 + yr + ay, "Avo");	
	
	//draw_sprite(spr_skill, 0, xx + 128 + 16, 166 + yr);
	
	
	
	draw_set_halign(fa_right);
	
	if(type == 1)
	{
		draw_text(xx + 66, 158 + yr + ay, char.ATK);
		draw_text(xx + 66, 158 + 18 + yr + ay, char.HIT);
		draw_text(xx + 66 + 56, 158 + yr + ay, char.CRIT);
		draw_text(xx + 66 + 56, 158 + 18 + yr + ay, char.AVO);
	}
	else
	{
		draw_text(xx + 66, 158 + yr + ay, global.CHAR[charID, 45]);
		draw_text(xx + 66, 158 + 18 + yr + ay, global.CHAR[charID, 46]);
		draw_text(xx + 66 + 56, 158 + yr + ay, global.CHAR[charID, 47]);
		draw_text(xx + 66 + 56, 158 + 18 + yr + ay, global.CHAR[charID, 48]);
	}
	
	draw_set_halign(fa_left);
	
	
	yr += 4;
	var a = 0;
	
	draw_sprite(spr_rankbox, 0, xx + 10, 166 + yr + 33 + ay);
	yr ++;
	
	var amou = 0;
	for(var i = 0; i < 10; i ++)
	{
		if(global.CLASS[global.CHAR[charID, 3], 10 + i] == true && amou < 3)
		{
			amou ++;
			draw_sprite(spr_weaponIcons, i, 6 + xx + 13 + a * 36, 166 + yr + 34 + ay);
			draw_sprite(spr_rank, global.CHAR[charID, 22 + i], 6 + xx + 29 + a * 36, 168 + yr + 34 + ay);
		
			var rx = xx + 20.5 + a * 36;
			var ry = 166 + yr + 50 + ay;
			draw_set_color(c_black);
			draw_rectangle(rx, ry, rx + 24, ry + 2, 0);
			draw_set_color(make_color_rgb(255, 239, 181));
			var xp = global.CHAR[charID, 60 + i];
			var xptolvl = -1;
			switch(global.CHAR[charID, 22 + i])
			{
				case 0:
				xptolvl = 10;
				break;
	
				case 1:
				xptolvl = 15;
				break;

				case 2:
				xptolvl = 25;
				break;

				case 3:
				xptolvl = 35;
				break;

				case 4:
				xptolvl = 50;
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

	draw_set_color(fontColor1);
}
else
{
	draw_sprite(spr_supportBar, 0, 240 - 170, 33);
	
	//if(!surface_exists(surfScreen))surfScreen = surface_create(global.window_w, global.window_h);
	//surface_set_target(surfScreen);
	//draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_left);
	
	if(char.isGhost == 0)DrawUnit(charID, tcindex, tindex, 240 - 80, 36, 1, 1, c_white, 1, 0, 3, 0);
	else DrawUnit(charID, tcindex, tindex, 240 - 80, 36, 1, 1, c_white, 1, 0, 6, 0);
	draw_set_font(ft_large);
	draw_set_color(fontColor2);
	draw_text(194, 30, global.CHAR[charID, 0]);
	
	var sel = 0;
		
	var min_i = max(sel - tempVar2, 0);
	var max_i = min(min_i + 3, ds_list_size(nup) - 1);
	var b = 0;
	var len = 33;
	var hei = 67;
	var wid = 76;
	
	for(var i = min_i; i <= max_i; i ++)
	{
		var charr = ds_list_find_value(nup, i);
		//if(charr == global.glSelect7)i ++;
		//if(i >= max_i)break;
			//var inventory = global.CHAR[charr, 49];

			var hasSupports = 0;
			if(global.SUPPORTADV[charID, charr])hasSupports = 1;
			if(hasSupports)
			{
				draw_sprite_ext(spr_supportChar, 0, wid, hei + b * len, 1, 1, 0, c_white, 1);
			} else draw_sprite(spr_supportChar, 2, wid, hei + b * len);
			
			if(sel == i && hasSupports)
			{
				draw_sprite_ext(spr_supportChar, 1, wid, hei + b * len, 1, 1, 0, c_white, 0.5 + sinVal2 * 0.5);
			}
			
			if(global.glSelect6 == i)
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
			
			var rx = wid + 128;
			var ry = hei + 30;
			draw_set_color(c_black);
			draw_rectangle(rx, ry, rx + global.SUPPORTLIMIT[charID, charr] * 21.5, ry + 2, 0);
			draw_set_color(make_color_rgb(255, 239, 181));
			var widd = ((min(global.SUPPORTXP[charID, charr], 20) / 20) + global.SUPPORTS[charID, charr]) * 21.5;
			if(widd > global.SUPPORTLIMIT[charID, charr] * 21.5)widd = global.SUPPORTLIMIT[charID, charr] * 21.5;
			if(widd > 0)draw_rectangle(rx, ry, rx + widd, ry + 2, 0);
			draw_set_alpha(0.5);
			draw_set_color(c_black);
			draw_rectangle(rx - 1, ry - 1, rx + global.SUPPORTLIMIT[charID, charr] * 21.5 + 0.5, ry + 2.5, 1);
			draw_rectangle(rx - 1.5, ry - 1.5, rx + global.SUPPORTLIMIT[charID, charr] * 21.5 + 1, ry + 3, 1);
			draw_set_alpha(1);
			
			for(var a = 0; a < global.SUPPORTLIMIT[charID, charr]; a ++)
			{
				draw_sprite(spr_rank, a + 2, wid + 130 + a * 24, hei + b * len + 14);
				if(a >= global.SUPPORTS[charID, charr])draw_sprite_ext(spr_rank, a + 2, wid + 130 + a * 24, hei + b * len + 14, 1, 1, 0, c_black, 0.5);
			}
			
			b += 1;
	}
	
	//surface_reset_target();
	
	//draw_surface_ext(surfScreen, opSize4 * 200, 0, 1 - opSize4, 1, 0, c_white, 1);
}
if(global.glSelect7 == 0)
{
	draw_set_halign(fa_center);
	draw_sprite(spr_sp, 0, xx + 116 + 92 + 16, 166 + yr + 33 + ay);
	draw_text(xx + 130 + 16 + 92, 167 + yr + 26 + ay, "SP");
	draw_set_halign(fa_right);
	if(type == 1)draw_text(xx + 142 + 64 + 92, 167 + yr + 26 + ay, string(char.SP) + " / " + string(char.MAXSP));
	else draw_text(xx + 142 + 64 + 92, 167 + yr + 26 + ay, string(global.CHAR[charID, 70]) + " / " + string(global.CHAR[charID, 70]));
	draw_set_halign(fa_left);
	
	var inventory = global.CHAR[charID, 49];
	var useslist = global.CHAR[charID, 50];
	
	for(var i = 0; i < 5; i ++)
	{
		draw_sprite(spr_weaponName2, 0, xx + 290, yy + 52 + i * 19 + ay);
		if(global.glSelect9 == 0 && global.glSelect8 == i && ds_list_size(inventory) > 0)
		{
			draw_sprite_ext(spr_weaponName2, 0, xx + 290, yy + 52 + i * 19 + ay, 1, 1, 0, make_color_rgb(255, 45, 15), 0.35 + 0.25 * obj_pers.sinVal2);
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
			if(CanUse(charID, item))usable = true;
			if(type == 1 && global.ITEM[item, 3] == 0 && global.ITEM[item, 4] == 0 && char.HP < char.MAXHP)usable = true;
			if(global.ITEM[item, 3] == 3 && global.CHAR[charID, 4] >= 10 && global.CLASS[global.CHAR[charID, 3], 36] < 2)usable = true;
			//show_message(usable);
			
			if(type == 1 && char.faction == 1)
			{
				if(i > 0)
				{
					draw_set_color(fontColor12);
				}
				draw_text(xx + 155, yy + 45 + i * 19 + ay, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 284, yy + 45 + i * 19 + ay, uses);
				
				draw_set_color(fontColor2);
			}
			else
			{
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
			}
		
			if(global.CHAR[charID, 56] == i)
			{
				draw_sprite(spr_equipped, 0, xx + 146, yy + 54 + i * 19 + 9 + ay);
			}
			draw_set_halign(fa_left);
		}
	}
	
	var skills = obj_pers.skillList;
	
	draw_set_halign(fa_left);
	
	draw_sprite(spr_weaponName, 0, xx + 134, yy + 10 + ay);
	draw_set_font(ft_med);
	draw_set_color(fontColor2);
	draw_text(xx + 140, yy + 3 + ay, global.CLASS[global.CHAR[charID, 3], global.CHAR[charID, 2] * 2]);
	
	draw_set_halign(fa_right);
	
	draw_text(xx + 284, yy + 4 + ay, "LV " + string(global.CHAR[charID, 4]));
	
	draw_set_halign(fa_left);
	
	draw_sprite(spr_infobig, 0, xx + 124, yy + 29 + ay);
	
	draw_sprite(spr_infosmall, 0, xx + 124 + 82, yy + 29 + ay);
	draw_sprite(spr_infosmall, 0, xx + 124 + 82 + 46, yy + 29 + ay);
	
	draw_set_font(ft_small);
	
	draw_text(xx + 129, yy + 24 + ay, "HP ");
	draw_text(xx + 129 + 83, yy + 24 + ay, "XP ");
	draw_sprite(spr_movement, 0, xx + 127 + 83 + 52, yy + 33 + ay);
	//draw_text(xx + 131 + 89 + 44, yy + 23, "EXP " + string(global.CHAR[charID, 5]));
	
	draw_set_halign(fa_right);
	
	if(type == 1)
	{
		draw_text(xx + 202, yy + 24 + ay, string(char.HP) + " / " + string(char.MAXHP));
		draw_text(xx + 128 + 118, yy + 24 + ay, string(global.CHAR[charID, 5]));
		draw_text(xx + 129 + 163, yy + 24 + ay, string(char.MP));
	}
	else
	{
		draw_text(xx + 202, yy + 24 + ay, string(global.CHAR[charID, 6]) + " / " + string(global.CHAR[charID, 6]));
		draw_text(xx + 128 + 118, yy + 24 + ay, string(global.CHAR[charID, 5]));
		draw_text(xx + 129 + 163, yy + 24 + ay, string(global.CHAR[charID, 32]));
	}
	
	draw_set_halign(fa_left);
	if(global.glSelect6 == 1)
	{
		if(global.glSelect9 == 0)
		{
			DrawitemInfobox(ds_list_find_value(inventory, global.glSelect8), xx + sprite_get_width(spr_statsAll) / 4, yy + sprite_get_height(spr_statsAll) / 4 + ay);
		}
		if(global.glSelect9 == 1)
		{
			DrawskillInfobox(ds_list_find_value(skills, global.glSelect8), xx + sprite_get_width(spr_statsAll) / 4, yy + sprite_get_height(spr_statsAll) / 4 + ay);
		}
	}
	draw_sprite(spr_boxx, 0, xx + 245.5, yy + 150 + ay);
	if(type == 1)
	{
		with char
		{
			if(isGhost == 0)DrawUnit(characterID, cindex, index, xx + 248, yy + 151 + ay, 1, 1, c_white, 1, faction, 3, 0);
			else DrawUnit(characterID, cindex, index, xx + 248, yy + 151 + ay, 1, 1, c_white, 1, faction, 6, 0);
		}
	}
	else DrawUnit(charID, tcindex, tindex, xx + 248, yy + 151 + ay, 1, 1, c_white, 1, 0, 3, 0);
	
	for(var i = 0; i < ds_list_size(skills); i ++)
	{
		var skill = ds_list_find_value(skills, i);
		var xc = 0, yc = 0;
		
		switch(i)
		{
			case 1:
				xc += 24;
			break;
			case 2:
				xc += 48;
			break;
			case 3:
				xc += 72;
			break;
			case 4:
				yc += 24;
			break;
			case 5:
				yc += 24;
				xc += 24;
			break;
		}
		
		draw_sprite(spr_page, 0, xx + 150 - 2 + xc, yy + 151 - 2 + yc);
		draw_sprite(spr_skills, global.SKILL[skill, 2], xx + 150 + xc, yy + 151 + yc);
		
		if(global.glSelect8 == i && global.glSelect9 == 1)
		{
			gpu_set_blendmode(bm_add);
			draw_sprite(spr_page, 0, xx + 150 - 2 + xc, yy + 151 - 2 + yc);
			gpu_set_blendmode(bm_normal);
		}
		
	}
}
if(global.glSelect7 == 1)
{
	xx += 173;
	yy += 7;
	var a = 0, val = 0;

	for(var i = 0; i < 8; i ++)
	{
		if(type == 1)
		{
			var oval = global.CHAR[charID, 6 + i];
		
			switch(i)
			{
				case 0:
					val = char.MAXHP - oval;
				break;
				case 1:
					val = char.STR - oval;
				break;
				case 2:
					val = char.MAG - oval;
				break;
				case 3:
					val = char.SKILL - oval + char.skillbuff_area;
				break;
				case 4:
					val = char.SPD - oval + char.speedbuff_area;
				break;
				case 5:
					val = char.LCK - oval + char.luckbuff_area;
				break;
				case 6:
					val = char.DEF - oval;
				break;
				case 7:
					val = char.RES - oval;
				break;
			}
		
			draw_set_halign(fa_center);
			//var wid = string_width(global.CHAR[charID, 6 + i]);	
		
			draw_sprite(spr_levelupSkill, 0, xx + 10, yy + 29 + a * 18 + ay);
			if(val != 0)
			{
				draw_set_color(c_white);
				var ind = 0;
				if(val < 0)ind = 1;
				draw_sprite(spr_statMod, ind, xx + 85, yy + 30 + a * 18 + ay);
				var sym = "+";
				if(val < 0)sym = "";
				draw_text(xx + 98, yy + 20 + a * 18 + ay, sym + string(val));
			}
			draw_set_color(fontColor1);
			draw_text(xx + 31, yy + 20 + a * 18 + ay, global.STAT[i]);
			draw_set_color(fontColor2);
			draw_set_halign(fa_right);
			draw_text(xx + 76, yy + 20 + a * 18 + ay, oval);
		}
		else
		{
			var oval = global.CHAR[charID, 6 + i];

		
			draw_set_halign(fa_center);
			//var wid = string_width(global.CHAR[charID, 6 + i]);	
		
			draw_sprite(spr_levelupSkill, 0, xx + 10, yy + 29 + a * 18 + ay);

			draw_set_color(fontColor1);
			draw_text(xx + 31, yy + 20 + a * 18 + ay, global.STAT[i]);
			draw_set_color(fontColor2);
			draw_set_halign(fa_right);
			draw_text(xx + 76, yy + 20 + a * 18 + ay, oval);
		}
			
		if(global.CHAR[charID, 57] == true)
		{
			draw_sprite(spr_growths, 0, xx + 10 - 43, yy + 29 + a * 18 + ay);
			draw_set_color(fontColor1);
			draw_set_halign(fa_center);
			draw_text(xx + 31 - 43, yy + 20 + a * 18 + ay, string(global.CHAR[charID, 14 + i]) + "%");
		}
		
		a ++;
	}
}
draw_set_halign(fa_left);