/// @description Insert description here
// You can write your code in this editor

//draw_text(4, 44 + 16, global.opSelect3);
//draw_text(4, 44 + 16 * 2, global.hoverNode);

/*
for(var i = 0; i < 8; i ++)
{
	if(global.pathArray[i] != noone)draw_text(4, 44 + i * 16, string(global.pathArray[i].x) + ", " + string(global.pathArray[i].y));
}
*/
/*
if(gamestate == "chardeathwait")
{
	var port = global.PORT[global.CHAR[global.char1.characterID, 1], 0];
	draw_sprite_ext(port, 0, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, c_white, guiTimer / 20);
	if(global.CHAR[global.char1.characterID, 37] != -1)
	{
		if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, global.CHAR[global.char1.characterID, 38], guiTimer / 20);
	}
}
*/
var val1 = 0, val2 = 0, val3 = 0;
var rowHeight = 18;

if(gamestate == "showstats")
{
	with obj_pers ShowStats(global.selectedActor);
	exit;
}
if(gamestate == "showobj")
{
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	var gu = min(guiStep, 1);
	draw_rectangle(0, 120 - 34 - gu * 4, 400, 120 + 34 + gu * 4, 0);
	draw_set_alpha(1);
	
	draw_set_font(ft_large);
	draw_set_color(c_black);
	draw_text_transformed(guiTimer + 3 + 12, 122 - 37 + 3, "VICTORY", 1, 1, 0);
	
	draw_text_transformed(global.window_w - guiTimer + 3, 120 - 14 + 3, global.OBJ[global.STAGE[global.currentStage, 1]], 1.25, 1.25, 0);
	
	draw_set_color(c_white);
	draw_text_transformed(guiTimer + 12, 122 - 37, "VICTORY", 1, 1, 0);
	
	draw_text_transformed(global.window_w - guiTimer, 120 - 14, global.OBJ[global.STAGE[global.currentStage, 1]], 1.25, 1.25, 0);
	
	draw_set_font(ft_med);
}
if(gamestate == "showobj2")
{
	draw_set_color(c_black);
	var gu = min(guiStep, 1);
	draw_set_alpha(0.6 * (1 - gu));
	draw_rectangle(0, 120 - 36 + gu * 4, 400, 120 + 36 - gu * 4, 0);
	draw_set_alpha(1);
}

if(global.transitionCombat > 0 && state == "game")
{
	global.transitionCombat++;
	for(var i = 0; i < 10; i ++)
	{
		var size = (1 + (i / 20) * (global.transitionCombat / 60)) / 2;
		if(surface_exists(application_surface))
		{
			var xx = (global.wid / 4) - 0.5 * (surface_get_width(application_surface) * size);
			var yy = (global.hei / 4) - 0.5 * (surface_get_height(application_surface) * size);
			draw_surface_ext(application_surface, xx, yy, size, size, 0, c_white, global.transitionCombat / 90);
		}
	}
}

if(global.transitionCombat > 0)
{
	draw_set_color(c_black);
	draw_set_alpha(global.transitionCombat / 60);
	draw_rectangle(0, 0, global.wid, global.hei, 0);
	draw_set_alpha(1);
}

if(obj_pers.tempVar7 > 0 && global.optionState[7] == 1)
{
	draw_set_halign(fa_left);
	draw_set_font(ft_med);
	
	obj_pers.tempVar8 ++;
	
	if(obj_pers.tempVar7 == 1)
	{
		if(obj_pers.tempVar6 < 10)obj_pers.tempVar6 ++;
	}
	else
	{
		if(obj_pers.tempVar6 > 0)obj_pers.tempVar6 --;
	}
	if(obj_pers.tempVar6 <= 0)
	{
		obj_pers.tempVar7 = 0;
	}
	


	draw_set_color(c_black);
	draw_set_alpha(obj_pers.tempVar6 / 10);
	draw_rectangle(0, 0, global.wid, global.hei, 0);
	
	if(obj_pers.tempVar8 mod 30 == 0)
	{
		if(dot == "")dot = ".";
		else if(dot == ".")dot = "..";
		else dot = "";
	}
	//asdfasdf
	draw_set_color(c_white);

	if(state != "chardeathwait" && state != "chardeathwait0" && state != "levelup" && state != "leveluphide")draw_text(global.window_w - 74, global.window_h - 30, "Skipping." + dot);
	draw_set_alpha(1);
}

if(global.showXP > 0)
{
	if (!surface_exists(surfOptions))surfOptions = surface_create(240, 240);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	var char = global.charlevelup;
	
	draw_sprite(spr_levelupbar, 0, 0, 16);
	draw_sprite(spr_leveluparrow, 0, 71 + global.CHAR[char.characterID, 5], 20);

	with char DrawUnit(characterID, cindex, index, 0, 6, 1, 1, c_white, 1, faction, 3, 0);
	
	draw_set_color(make_color_rgb(219, 182, 132));
	draw_rectangle(68, 25, 68 + global.CHAR[char.characterID, 5], 23 + 10, 0);
	draw_set_color(make_color_rgb(172, 129, 91));
	draw_rectangle(67, 24, 67 + global.CHAR[char.characterID, 5], 23 + 9, 0);
	draw_set_color(make_color_rgb(66, 8, 0));
	draw_rectangle(66, 23, 66 + global.CHAR[char.characterID, 5], 23 + 8, 0);


	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	draw_set_halign(fa_right);
	draw_text(95 + global.CHAR[char.characterID, 5], 10, global.CHAR[char.characterID, 5]);
	draw_set_halign(fa_left);
	surface_reset_target();
	
	draw_surface_ext(surfOptions, (global.window_w / 2) - 102.5 * (1 - cbSize2), (global.window_h / 2) - 16, 1 - cbSize2, 1, 0, c_white, 1);
}

if(state == "levelup" || state == "leveluphide")
{
	draw_sprite_ext(spr_levelupNumber, 0, 220, 12 - 88 + guiTimer * 4.4, 1, 1, 0, c_white, guiTimer / 20);
	draw_set_color(fontColor1);
	draw_set_font(ft_bigNum);
	draw_set_halign(fa_center);
	var alp = 0;
	if(guiTimer4 > 30)alp = guiTimer4 - 30;
	if(alp > 60)alp = 60;
	draw_set_alpha(alp / 60);
	draw_text(302, 15 - 88 + guiTimer * 4.4, global.CHAR[global.charlevelup.characterID, 4]);
	draw_set_alpha(1 - (alp / 60));
	draw_text(302, 15 - 88 + guiTimer * 4.4, string(global.CHAR[global.charlevelup.characterID, 4] - 1));
	var port = global.PORT[global.CHAR[global.charlevelup.characterID, 1], 0];
	draw_sprite_ext(port, 0, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, c_white, guiTimer / 20);
	if(global.CHAR[global.charlevelup.characterID, 37] != -1)
	{
		if(sprite_get_number(port) > 1)draw_sprite_ext(port, 1, - 220 + guiTimer2 * 12.8 , 0, 1, 1, 0, global.CHAR[global.charlevelup.characterID, 38], guiTimer / 20);
	}
	
	draw_set_color(fontColor2);
	draw_set_font(ft_med);
	var ex = 0, aa = 0;
	if(nupshow > 6)ex = nupshow - 6;
	var alph = guiTimer / 20;
	for(var i = ex; i < nupshow; i ++)
	{
		if(state == "levelup")alph = nupshowy[i];
		draw_set_alpha(alph);
		var xx = 220 - 4, yy = 100 - 88 + guiTimer * 4.4 + aa * 23 + 64 - nupshowy[i] * 64;
		draw_sprite_ext(spr_statup, 0, xx, yy, 1, 1, 0, c_white, alph);
		draw_text(xx + 82, yy - 7, global.STAT[ds_list_find_value(nup, i)] + " increased by " + string(ds_list_find_value(nupVal, i)));
		aa ++;
	}
	draw_set_halign(fa_left);
	draw_set_alpha(1);
}
switch(state)
{
	case "weaponbreak":
		draw_set_color(fontColor2);
		draw_set_font(ft_med);
		if(!surface_exists(surfBroke))surfBroke = surface_create(222, 66);
		surface_set_target(surfBroke);
		draw_clear_alpha(c_black, 0);
	
		draw_sprite(spr_broke, 0, 0, 0);
		draw_set_halign(fa_center);
		draw_text(90, 14, global.ITEM[global.itemBreak, 0] + "     broke.")
		draw_sprite(spr_items, global.ITEM[global.itemBreak, 1], -29 + 90 + string_width(global.ITEM[global.itemBreak, 0]) / 2, 31 - 10);

		surface_reset_target();
	
		draw_surface_ext(surfBroke, 200 - 90 + 0.5 * (180 - (180 * guiTimer4)), 120 - 31, guiTimer4, 1, 0, c_white, 1);
		draw_set_halign(fa_left);
		break;
		
	case "enemycapture":
	
		draw_set_color(fontColor2);
		draw_set_font(ft_med);
		if(!surface_exists(surfStats))surfStats = surface_create(global.window_w, global.window_h);
		surface_set_target(surfStats);
		draw_clear_alpha(c_black, 0);
	
		//draw_sprite(spr_bigMessage, 0, 0, 0);
		draw_set_halign(fa_center);
		var text = global.CHAR[enemycapture, 0] + " has been captured.";
		MessageBox(text);
		draw_text(200, 102, text)
		

		surface_reset_target();
	
		draw_surface_ext(surfStats, 200 - guiTimer4 * 200, 0, guiTimer4, 1, 0, c_white, 1);
		draw_set_halign(fa_left);
		break;
		
	case "itemdrop":

		var item = ds_list_find_value(global.itemDrops, 0);
	
		draw_set_color(fontColor2);
		draw_set_font(ft_med);
		if(!surface_exists(surfStats))surfStats = surface_create(222, 66);
		surface_set_target(surfStats);
		draw_clear_alpha(c_black, 0);
		
	
		//draw_sprite(spr_bigMessage, 0, 0, 0);
		draw_set_halign(fa_center);
		var text = "You got " + global.ITEM[item, 0];
		MessageBox(text);
		draw_text(194, 102, text)
		draw_sprite(spr_items, global.ITEM[item, 1], 115 + (string_width(text) / 2) + 86, 112);

		surface_reset_target();
	
		draw_surface_ext(surfStats, 200 - guiTimer4 * 200, 0, guiTimer4, 1, 0, c_white, 1);
		draw_set_halign(fa_left);
	
		break;
		
	
		
	case "skillgain":

		var skill = skillGained;
	
		draw_set_color(fontColor2);
		draw_set_font(ft_med);
		if(!surface_exists(surfStats))surfStats = surface_create(global.window_w, global.window_h);
		surface_set_target(surfStats);
		draw_clear_alpha(c_black, 0);
	
		//draw_sprite(spr_bigMessage, 0, 0, 0);
		draw_set_halign(fa_center);
		var text = global.CHAR[charbox, 0] + " learned " + global.SKILL[skill, 0];
		MessageBox(text);
		draw_text(200 - 6, 102, text)
		draw_sprite(spr_skills, global.SKILL[skill, 2], 115 + (string_width(text) / 2) + 86, 112);
		

		surface_reset_target();
	
		draw_surface_ext(surfStats, 200 - guiTimer4 * 200, 0, guiTimer4, 1, 0, c_white, 1);
		draw_set_halign(fa_left);
	
		break;
		
	case "weaponrank":

		var skill = skillGained;
	
		draw_set_color(fontColor2);
		draw_set_font(ft_med);
		if(!surface_exists(surfStats))surfStats = surface_create(global.window_w, global.window_h);
		surface_set_target(surfStats);
		draw_clear_alpha(c_black, 0);
	
		//draw_sprite(spr_bigMessage, 0, 0, 0);
		draw_set_halign(fa_center);
		var text = "Weapon rank advanced to ";
		MessageBox(text);
		draw_text(194, 102, text)
		draw_sprite(spr_weaponIcons, weaponadvancetype, 115 - 24 + (string_width(text) / 2) + 86, 112);
		draw_sprite(spr_rank, weaponadvancerank, 114 - 24 + 18 + (string_width(text) / 2) + 86, 114);

		surface_reset_target();
	
		draw_surface_ext(surfStats, 200 - guiTimer4 * 200, 0, guiTimer4, 1, 0, c_white, 1);
		draw_set_halign(fa_left);
	
		break;
		
	case "itemdropchoose":
	
		var inventory = global.CHAR[global.char1.characterID, 49];
		var uses = global.CHAR[global.char1.characterID, 50];
		var item = ds_list_find_value(inventory, global.opSelect);
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
			if(global.opSelect == i)
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

		
			if(global.CHAR[global.char1.characterID, 56] == i)
			{
				draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
			}
		}
	
		var xp = 2;
		if(global.opSelect2 == 0)xp = obj_pers.sinSize * 2;
		if(global.opSelect != -1)draw_sprite(spr_pick, 0, xx - rowHeight + xp, 7 + yy + global.opSelect * rowHeight);
	
		surface_reset_target();
	
		if(surface_exists(surfOptions))
		{
			if(global.opSelect2 == 0)
			{
				draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_white, 1);
			}
			else
			{
				draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_white, 1);
				draw_surface_ext(surfOptions, 38 - (1 - opSize4) * 34, 64, 1 - opSize4, 1, 0, c_black, 0.5);
			}
		}
	
		if(global.opSelect2 == 1)
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
			
			if(global.opSelect3 == 2)
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
			if(global.opSelect3 == 1)
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
}


if(global.phase == 1 && global.optionState[7] == 1)
{
	exit;
}

if(state == "combat" || state == "endingcombat" || (reusable1 == 0 && ((state == "showxp" && inCombat) || state == "endcombat" || state == "endcombatwait")))
{
	draw_sprite(spr_combatinfo, global.char1.faction, -1, global.window_h - 72);
	//draw_sprite(spr_combatinfo2, 0, 0, 192 - 15);
	
	draw_set_font(ft_med);
	if(global.char1.combatSkill != -1)
	{
		draw_sprite_ext(spr_showSkill, 0, 0, 55, 1, 0.5, 0, c_white, 0.8);
		draw_sprite(spr_skills, global.SKILL[global.char1.combatSkill, 2], 4, 38);
		draw_set_color(c_black);
		draw_text(20, 28, global.SKILL[global.char1.combatSkill, 0]);
		draw_set_color(c_white);
		draw_text(20 + 1, 28 + 1, global.SKILL[global.char1.combatSkill, 0]);
	}
	if(global.char2.combatSkill != -1)
	{
		draw_sprite_ext(spr_showSkill, 0, global.window_w, 55, -1, 0.5, 0, c_white, 0.8);
		draw_sprite(spr_skills, global.SKILL[global.char2.combatSkill, 2], global.window_w - 18, 38);
		draw_set_halign(fa_right);
		draw_set_color(c_black);
		draw_text(global.window_w - 20, 28, global.SKILL[global.char2.combatSkill, 0]);
		draw_set_color(c_white);
		draw_text(global.window_w - 20 + 1, 28 + 1, global.SKILL[global.char2.combatSkill, 0]);
	}
	draw_set_halign(fa_left);
	draw_set_color(fontColor1);
	draw_set_font(ft_rsmall);
	draw_text(4, global.window_h - 77, "HIT");
	draw_text(4, global.window_h - 77 + 12.5, "DMG");
	draw_text(4, global.window_h - 77 + 12.5 * 2, "CRT");
	
	draw_set_halign(fa_right);
	
	if(global.CHAR[global.char1.characterID, 44] != -1 && global.char1.weaponType != 2 && global.char1.showdamage == 1)
	{
		draw_text(56, global.window_h - 77, string(min(global.char1.HITd, 100)));
		if(global.char1.effectiveDamage == 1)draw_set_color(fontColor6);
		draw_text(56, global.window_h - 77 + 12.5, global.char1.ATKd);
		draw_set_color(fontColor1);
		draw_text(56, global.window_h - 77 + 12.5 * 2, string(min(global.char1.CRITd, 100)));
	}
	else
	{
		draw_text(56, global.window_h - 77, "---");
		draw_text(56, global.window_h - 77 + 12.5, "---");
		draw_text(56, global.window_h - 77 + 12.5 * 2, "---");
	}
	
	draw_set_font(ft_large);
	
	draw_set_color(fontColor2);
	
	draw_set_halign(fa_center);
	draw_text(22, global.window_h - 37, floor(global.char1.HPD));
	draw_set_halign(fa_left);
	
	draw_set_font(ft_med);
	
	if(global.CHAR[global.char1.characterID, 44] != -1)
	{
		draw_sprite(spr_items, global.ITEM[global.CHAR[global.char1.characterID, 44], 1], 66, global.window_h - 50);
		draw_text(84, global.window_h - 59, global.ITEM[global.CHAR[global.char1.characterID, 44], 0]);
	}
	else
	{
		draw_text(84 - 16, global.window_h - 59, "Unarmed");
	}
	
	var xpos = 46, ypos = global.window_h - 20;
	var xx = 0, yy = 0;
	if(global.char1.MAXHP > 50)ypos += 5;
	for(var i = 0; i < min(global.char1.MAXHP, 100); i ++)
	{
	    draw_sprite(spr_hp, 3, xpos + xx * 3, ypos - yy * 9);
	    xx += 1;
	    if(xx >= 50)
	    {
	        xx = 0;
	        yy += 1;
	    }
	}
	xx = 0;
	yy = 0;
	for(var i = 0; i < min(global.char1.HPD, 100); i ++)
	{
	    draw_sprite(spr_hp, 0, xpos + xx * 3, ypos - yy * 9);
	    xx += 1;
	    if(xx >= 50)
	    {
	        xx = 0;
	        yy += 1;
	    }
	}
	if(global.char1.HPD > 100)
	{
		xx = 0;
		yy = 0;
		for(var i = 0; i < min(global.char1.HPD - 100, 100); i ++)
		{
		    draw_sprite(spr_hp, 1, xpos + xx * 3, ypos - yy * 9);
		    xx += 1;
		    if(xx >= 50)
		    {
		        xx = 0;
		        yy += 1;
		    }
		}
	}
	if(global.char1.MAXHP > 100)
	{
		xx = 0;
		yy = 0;
		for(var i = 0; i < min(global.char1.MAXHP - 100, 100); i ++)
		{
		    draw_sprite(spr_hp, 3, xpos + xx * 3, ypos - yy * 9);
		    xx += 1;
		    if(xx >= 50)
		    {
		        xx = 0;
		        yy += 1;
		    }
		}
	}
	
	draw_sprite(spr_name, global.char1.faction, 2, 8);
	draw_sprite(spr_name, global.char2.faction, global.window_w - 120, 8);
	
	draw_set_halign(fa_center);
	
	draw_set_color(fontColor1);
	draw_set_font(ft_med);
	
	draw_text(61, 1, global.CHAR[global.char1.characterID, 0]);
	draw_text(global.window_w - 61, 1, global.CHAR[global.char2.characterID, 0]);
	
	
	var xp = -1 + global.window_w;
	
	draw_sprite_ext(spr_combatinfo, global.char2.faction, xp + 1, global.window_h - 72, -1, 1, 0, c_white, 1);
	//draw_sprite(spr_combatinfo2, 0, 0, 192 - 15);
	
	draw_set_halign(fa_right);
	
	draw_set_color(fontColor1);
	draw_set_font(ft_rsmall);
	draw_text(xp - 4, global.window_h - 77, "HIT");
	draw_text(xp - 4, global.window_h - 77 + 12.5, "DMG");
	draw_text(xp - 4, global.window_h - 77 + 12.5 * 2, "CRT");
	
	draw_set_halign(fa_left);
	
	if(global.CHAR[global.char2.characterID, 44] != -1 && global.char2.weaponType != 2 && global.char2.showdamage == 1)
	{
		draw_text(xp - 56, global.window_h - 77, string(min(global.char2.HITd, 100)));
		if(global.char2.effectiveDamage == 1)draw_set_color(fontColor6);
		draw_text(xp - 56, global.window_h - 77 + 12.5, global.char2.ATKd);
		draw_set_color(fontColor1);
		draw_text(xp - 56, global.window_h - 77 + 12.5 * 2, string(min(global.char2.CRITd, 100)));
	}
	else
	{
		draw_text(xp - 56, global.window_h - 77, "---");
		draw_text(xp - 56, global.window_h - 77 + 12.5, "---");
		draw_text(xp - 56, global.window_h - 77 + 12.5 * 2, "---");
	}
	
	draw_set_font(ft_large);
	
	draw_set_color(fontColor2);
	
	draw_set_halign(fa_center);
	draw_text(xp - 22, global.window_h - 37, floor(global.char2.HPD));
	draw_set_halign(fa_right);
	
	draw_set_font(ft_med);
	
	if(global.CHAR[global.char2.characterID, 44] != -1)
	{
		draw_sprite(spr_items, global.ITEM[global.CHAR[global.char2.characterID, 44], 1], xp - 66 - 16, global.window_h - 50);
		draw_text(xp - 84, global.window_h - 59, global.ITEM[global.CHAR[global.char2.characterID, 44], 0]);
	}
	else
	{
		draw_text(xp - 84 + 16, global.window_h - 59, "Unarmed");
	}
	draw_set_halign(fa_left);
	
	var xpos = xp - 46, ypos = global.window_h - 20;
	var xx = 0, yy = 0;
	if(global.char2.MAXHP > 50)ypos += 5;
	for(var i = 0; i < min(global.char2.MAXHP, 100); i ++)
	{
	    draw_sprite(spr_hp, 3, xpos - xx * 3, ypos - yy * 9);
	    xx += 1;
	    if(xx >= 50)
	    {
	        xx = 0;
	        yy += 1;
	    }
	}
	xx = 0;
	yy = 0;
	for(var i = 0; i < min(global.char2.HPD, 100); i ++)
	{
	    draw_sprite(spr_hp, 0, xpos - xx * 3, ypos - yy * 9);
	    xx += 1;
	    if(xx >= 50)
	    {
	        xx = 0;
	        yy += 1;
	    }
	}
	if(global.char2.MAXHP > 100)
	{
		xx = 0;
		yy = 0;
		for(var i = 0; i < min(global.char2.MAXHP - 100, 100); i ++)
		{
		    draw_sprite(spr_hp, 3, xpos - xx * 3, ypos - yy * 9);
		    xx += 1;
		    if(xx >= 50)
		    {
		        xx = 0;
		        yy += 1;
		    }
		}
	}
	if(global.char2.HPD > 100)
	{
		xx = 0;
		yy = 0;
		for(var i = 0; i < min(global.char2.HPD - 100, 100); i ++)
		{
		    draw_sprite(spr_hp, 1, xpos - xx * 3, ypos - yy * 9);
		    xx += 1;
		    if(xx >= 50)
		    {
		        xx = 0;
		        yy += 1;
		    }
		}
	}
}

if(global.transitionCombat > 0 || state = "combat")exit;

//draw_set_color(c_white);

if(global.hoverNode != noone)
{
	col = c_blue;
	val1 = 100 * (1 + (obj_pers.sinSize / 3));
	val2 = 100 * (1 + (obj_pers.sinSize / 3));
	val3 = 180 * (1 + (obj_pers.sinSize / 3));
	col2 = make_color_rgb(val1, val2, val3);
}


//draw_set_font(ft_med);

if(opSize < 1 && state == "game")
{
	if (!surface_exists(surfOptions))surfOptions = surface_create(200, 200);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	draw_set_halign(fa_left);
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
		if(global.opSelect4 == i)
		{
			sprite = spr_button2;
			draw_set_color(fontColor1);
			
			var r = - 40 + obj_pers.sinSize * 40;
			//show_message(r);
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
		
		if(global.options[i] == "Open" || global.options[i] == "Visit")
		{
			if(global.opSelect4 == i)draw_set_color(fontColor9); else draw_set_color(fontColor6);
		}
	    draw_text(xx + 4, yy - 8 + i * rowHeight, global.options[i]);
	}
	
	if(global.opSelect4 != -1)draw_sprite(spr_pick, 0, xx - rowHeight + obj_pers.sinSize * 2, 7 + yy + global.opSelect4 * rowHeight);
	
	surface_reset_target();
	
	
	draw_surface_ext(surfOptions, 260 - (1 - opSize) * 34, 120 - (global.nOptions * rowHeight) / 2, 1 - opSize, 1, 0, c_white, 1);
}
if(opSize2 < 1 && global.selectedActor != noone)
{
	if (!surface_exists(surfPort))surfPort = surface_create(128, 100);
	
	//draw portrait
	if(guiTimer > 0)guiTimer -= 1 / 5;
	
	surface_set_target(surfPort);
	draw_clear_alpha(c_black, 0);
	/*
	var port = global.PORT[global.CHAR[global.selectedActor.characterID, 1], 0];
	draw_sprite(port, 0, -56, -42);
	if(sprite_get_number(port) > 1)
	{
		draw_sprite_ext(port, 1, -56, -42, 1, 1, 0, global.CHAR[global.selectedActor.characterID, 38], 1);
	}
	*/
	DrawPortrait(global.selectedActor.characterID, 1, 0, 0);
	surface_reset_target();
	
	var drag = 120;

	draw_surface_ext(surfPort, 240 - 16 + guiTimer * drag, 8, 1, 1, 0, c_white, 1 - guiTimer);
	draw_sprite_ext(spr_name, global.selectedActor.faction, 240 + guiTimer * drag, 108, 1, 1, 0, c_white, 1 - guiTimer);
		
	//showstats
	draw_set_halign(fa_right);
	
	draw_set_color(fontColor2);
	draw_set_font(ft_medNum);
	draw_set_alpha(1 - guiTimer);
	if(gamestate == "chooseweapon")
	{
		draw_sprite_ext(spr_stats2, 0, 226 + guiTimer * drag, 130, 1, 1, 0, c_white, 1 - guiTimer);
		draw_text(292 + guiTimer * drag, 128, global.selectedActor.ATK);
		draw_text(292 + guiTimer * drag, 145, global.selectedActor.HIT);
		draw_text(360 + guiTimer * drag, 128, global.selectedActor.CRIT);
		draw_text(360 + guiTimer * drag, 145, global.selectedActor.AVO);
	}
	else
	if(gamestate == "chooseskills")
	{
		draw_set_font(ft_med);
		draw_sprite_ext(spr_hpHeal, 0, 131 + 226 + guiTimer * drag, 129, 1, 1, 0, c_white, 1 - guiTimer);
		draw_text(277 + guiTimer * drag, 124, "SP");
		draw_text(333 + guiTimer * drag, 124, string(global.selectedActor.SP) + " / " + string(global.selectedActor.MAXSP));
	}
	else
	{
		draw_sprite_ext(spr_stats2, 0, 226 + guiTimer * drag, 130, 1, 1, 0, c_white, 1 - guiTimer);
		draw_text(292 + guiTimer * drag, 128, global.selectedActor.ATK);
		draw_text(292 + guiTimer * drag, 145, global.selectedActor.HIT);
		draw_text(360 + guiTimer * drag, 128, global.selectedActor.CRIT);
		draw_text(360 + guiTimer * drag, 145, global.selectedActor.AVO);
	}
	
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	//
	
	var inventory = global.CHAR[global.selectedActor.characterID, 49];
	var uses = global.CHAR[global.selectedActor.characterID, 50];
	var cell = -1;
	var item = -1;
	
	if(gamestate == "chooseskills")
	{
		inventory = obj_pers.skillList;
	}
	
	if(gamestate == "chooseweapon")
	{
		cell = global.target;
	}
	
	if(global.opSelect != -1)
	{
		item = ds_list_find_value(inventory, global.opSelect);
		if(gamestate != "chooseskills")DrawitemInfo(item);
		else DrawskillInfo(item, global.selectedActor.characterID);
	}
	
	draw_set_halign(fa_left);
	//
	draw_set_font(ft_large);
	
	draw_set_halign(fa_center);
	draw_set_color(fontColor1);
	draw_set_alpha(1 - guiTimer);
	draw_text(240 + 62 + guiTimer * drag, 98, global.CHAR[global.selectedActor.characterID, 0]);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	
	if (!surface_exists(surfOptions))surfOptions = surface_create(200, 200);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(ft_med);
	if(gamestate == "chooseskills")
	{
		var len = 0;
		for(var i = 0; i < ds_list_size(inventory); i ++)
		{
			var lenn = 0;
			var item = ds_list_find_value(inventory, i);
			lenn = string_width(global.SKILL[item, 0]);
			if(lenn > len)len = lenn;
		}
		var wid = floor(len / 7) + 9;
	}
	
	var xx = 24, yy = 0;
	for(var i = 0; i < ds_list_size(inventory); i ++)
	{
		var r = 0;
		var bc = c_white;
		var item = ds_list_find_value(inventory, i);
		var ind = 0;
		if(global.opSelect == i)
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
		
		
		if(gamestate == "chooseweapon")
		{
			draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
			draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
			//uouo
			if(weaponinrange[i] == true)
			{
			    draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
			}
			else
			{
				draw_set_color(fontColor5);
				draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
				draw_set_color(fontColor2);
			}
		}
		else if(gamestate == "chooseskills")
		{
			var sprr = spr_itemResizable;
			if(ind == 1)sprr = spr_itemResizable2;
			draw_sprite_ext(sprr, 0, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
			for(var ii = 0; ii < wid; ii ++)
			{
			    draw_sprite_ext(sprr, 1, xx + 7 + ii * 7, yy + i * rowHeight, 1, 1, 0, bc, 1);
			}
			draw_sprite_ext(sprr, 2, xx + wid * 7 + 7, yy + i * rowHeight, 1, 1, 0, bc, 1);
		
			draw_sprite(spr_skills, global.SKILL[item, 2], xx + 2, yy + 2 + i * rowHeight);
			//uouo
			var sp = max(0, global.SKILL[item, 3] - global.selectedActor.spbuff - global.selectedActor.spbuff_area);
			if(skillinrange[i] == true)
			{
			    draw_text(xx + 20, yy - 8 + i * rowHeight, global.SKILL[item, 0]);
		
				draw_set_halign(fa_right);
				if(global.SKILL[item, 3] > 0)draw_text(xx + 70 + len, yy - 8 + i * rowHeight, string(sp) + " SP"); else draw_text(xx + 70 + len, yy - 8 + i * rowHeight, "- ");
				draw_set_halign(fa_left);
			}
			else
			{
				draw_set_color(fontColor5);
				draw_text(xx + 20, yy - 8 + i * rowHeight, global.SKILL[item, 0]);
		
				draw_set_halign(fa_right);
				if(global.SKILL[item, 3] > 0)draw_text(xx + 70 + len, yy - 8 + i * rowHeight, string(sp) + " SP"); else draw_text(xx + 70 + len, yy - 8 + i * rowHeight, "- ");
				draw_set_halign(fa_left);
				draw_set_color(fontColor2);
			}
		}
		else if(gamestate == "chooseaugment")
		{
			draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
			draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
			var usable = false;
			if(global.SKILL[global.skillSelected, 13] == global.ITEM[item, 4])usable = true;
			if(usable == true)
			{
			    draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
			}
			else
			{
				draw_set_color(fontColor5);
				draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
				draw_set_color(fontColor2);
			}
		} else
		{
			draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
			draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
			var usable = false;
			if(global.ITEM[item, 4] >= 10 && CanUse(global.selectedActor.characterID, item) == true)usable = true;
			if(global.ITEM[item, 3] == 0 && global.ITEM[item, 4] == 0 && global.selectedActor.HP < global.selectedActor.MAXHP)usable = true;
			//if(global.ITEM[item, 3] == 3 && global.CLASS[global.selectedActor.characterID)
			if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0 && global.CHAR[global.selectedActor.characterID, 4] >= 10 && global.CLASS[global.CHAR[global.selectedActor.characterID, 3], 36] < 2)usable = true;
			if(usable == true)
			{
			    draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
			}
			else
			{
				draw_set_color(fontColor5);
				draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
				draw_set_color(fontColor2);
			}
		}
		
		/*
		if(obj_game.gamestate == "chooseweapon")
		{
			shader_set(shGray);
			if(global.ITEM[item, 4] >= 10 && weaponinrange[i] == false)
			{
				draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
			
				draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
			    draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
				draw_set_halign(fa_right);
				draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses, i));
				draw_set_halign(fa_left);
				
				draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, c_black, 0.5);
			}
		
			shader_reset();
		}
		*/
		
		if(global.CHAR[global.selectedActor.characterID, 56] == i && gamestate != "chooseskills")
		{
			draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
		}
	}
	
	var xp = 2;
	if(global.itemOptions == 0)xp = obj_pers.sinSize * 2;
	if(global.opSelect != -1)draw_sprite(spr_pick, 0, xx - rowHeight + xp, 7 + yy + global.opSelect * rowHeight);
	
	surface_reset_target();
	
	if(surface_exists(surfOptions))draw_surface_ext(surfOptions, 38 - (1 - opSize2) * 34, 72, 1 - opSize2, 1, 0, c_white, 1);
	
	if(opSize3 < 1)
	{
		draw_surface_ext(surfOptions, 38 - (1 - opSize2) * 34, 72, 1 - opSize2, 1, 0, c_black, 0.5);
		draw_set_halign(fa_left);
		
		if (!surface_exists(surfItems))surfItems = surface_create(200, 200);
		surface_set_target(surfItems);
		draw_clear_alpha(c_black, 0);
	
		draw_set_font(ft_med);

		var xx = 24, yy = 0;
		len = 0;
		for(var i = 0; i < global.nOptions2; i ++)
		{
		    if(len < string_width(global.options2[i]))len = string_width(global.options2[i]);
		}
		//show_message(len);

		for(var i = 0; i < global.nOptions2; i ++)
		{
			var r = 0;
			var bc = c_white;
			var sprite = spr_button;
			if(global.opSelect2 == i)
			{
				sprite = spr_button2;
				draw_set_color(fontColor1);
			
				var r = - 40 + obj_pers.sinSize * 40;
				//show_message(r);
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
		
		    draw_text(xx + 4, yy - 8 + i * rowHeight, global.options2[i]);
		}
	
		if(global.opSelect2 != -1)draw_sprite(spr_pick, 0, xx - rowHeight + obj_pers.sinSize * 2, 7 + yy + global.opSelect2 * rowHeight);
	
		surface_reset_target();
	
	
		draw_surface_ext(surfItems, 197 - (1 - opSize3) * 34, 72, 1 - opSize3, 1, 0, c_white, 1);
	}
}

if(global.showOptions == 3)
{
	if (!surface_exists(surfPort2))surfPort2 = surface_create(128, 128);
	
	//draw portrait
	surface_set_target(surfPort2);
	draw_clear_alpha(c_black, 0);
	DrawPortrait(global.selectedActor.characterID, 1, 0, 0);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite(spr_trans, 0, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	draw_surface_ext(surfPort2, 6 + 128 + xd, 26, -1, 1, 0, c_white, 1);
	draw_sprite(spr_name, global.selectedActor.faction, 12 + xd, 3);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	
	draw_set_halign(fa_center);
	draw_text(7 + xd + 63, - 4, global.CHAR[global.selectedActor.characterID, 0]);
	
	
	draw_set_color(fontColor2);
	draw_set_font(ft_medNum);
	
	var arrowWid = 16;
	
	draw_sprite(spr_weaponName, 0, 1 + xd + arrowWid, 151);
	
	if(weaponsinrange <= 1)shader_set(shGray);
	draw_sprite(spr_switchWeapon, 0, 4 + xd + arrowWid - 10, 151 + 10);
	draw_sprite(spr_switchWeapon, 0, xd + arrowWid + 10 + 156, 151 + 10);
	
	if(global.controlsType == 0)
	{
		var sinn = obj_pers.sinSize;
		if(weaponsinrange <= 1)sinn = 0;
		draw_sprite(spr_switchArrow, 0, 3 + xd + arrowWid - 10 - sinn * 0.75, 151 + 10);
		draw_sprite_ext(spr_switchArrow, 1, 1 + xd + arrowWid + 10 + 156 + sinn * 0.75, 151 + 10, -1, 1, 0, c_white, 1);
	}
	else
	{
		draw_sprite(spr_lettersSwitch, 0, 4 + xd + arrowWid - 10, 151 + 9);
		draw_sprite(spr_lettersSwitch, 1, 4 + xd + arrowWid + 10 + 153, 151 + 10);
	}
	if(weaponsinrange > 1)
	{
		if(arrowSelect1 > 0)
		{
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_switchWeapon, arrowSelect1 - 1, 4 + xd + arrowWid - 10, 151 + 10, 1, 1, 0, c_white, 0.5);
			if(arrowSelect1 == 1)draw_sprite_ext(spr_switchArrow, 0, 3 + xd + arrowWid - 10 - obj_pers.sinSize * 0.75, 151 + 10, 1, 1, 0, c_white, 0.5);
			gpu_set_blendmode(bm_normal);
		}
		if(arrowSelect2 > 0)
		{
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_switchWeapon, arrowSelect2 - 1, xd + arrowWid + 10 + 156, 151 + 10, 1, 1, 0, c_white, 0.5);
			if(arrowSelect2 == 1)draw_sprite_ext(spr_switchArrow, 1, 1 + xd + arrowWid + 10 + 156 + obj_pers.sinSize * 0.75, 151 + 10, -1, 1, 0, c_white, 0.5);
			gpu_set_blendmode(bm_normal);
		}
	}
	else
	{
		draw_sprite_ext(spr_switchWeapon, 0, 4 + xd + arrowWid - 10, 151 + 10, 1, 1, 0, c_black, 0.3);
		draw_sprite_ext(spr_switchWeapon, 0, xd + arrowWid + 10 + 156, 151 + 10, 1, 1, 0, c_black, 0.3);
		shader_reset();
	}
	
	
	draw_set_halign(fa_left);
	draw_set_font(ft_med);
	
	draw_set_color(fontColor2);
	var item = global.CHAR[global.selectedActor.characterID, 44];
	if(item != -1)
	{
		draw_sprite(spr_items, global.ITEM[item, 1], xd + 5 + arrowWid, 153);
		
		if(global.selectedActor.adva == 0)draw_sprite(spr_disadvantage, indVal, 8 + xd + 5 + arrowWid, 153 + 6 + obj_pers.sinVal2 * 2);
		if(global.selectedActor.adva == 1)draw_sprite(spr_advantage, indVal, 8 + xd + 5 + arrowWid, 153 + 5 +  obj_pers.sinVal2 * 2);
		
		draw_text(22 + arrowWid, 144, global.ITEM[item, 0]);
		
		draw_set_halign(fa_right);
		draw_text(152 + arrowWid, 144, ds_list_find_value(global.CHAR[global.selectedActor.characterID, 50], global.CHAR[global.selectedActor.characterID, 56]));
		draw_set_halign(fa_left);
	}
	else
	{
		draw_text(22 - 16 + arrowWid, 144, "Unarmed");
	}
	
	if(global.selectedActor.weaponType < 2)
	{
		draw_set_halign(fa_center);
		//draw_set_font(ft_med);
		draw_sprite(spr_stats1, 0, xd, 172);
		if(global.target == noone)
		{
			if(global.CHAR[global.selectedActor.characterID, 44] != -1)
			{
				if(global.selectedActor.effectiveDamage == 1)draw_set_color(fontColor6);
				draw_text(24 + xd + 63, 168, global.selectedActor.ATK);
				draw_set_color(fontColor2);
				draw_text(24 + xd + 63, 168 + 17, string(min(global.selectedActor.HIT, 100)) + "%");
				draw_text(24 + xd + 63, 168 + 17 * 2, string(min(global.selectedActor.CRIT, 100)) + "%");
			}
			else
			{
				draw_text(24 + xd + 63, 166.5, "---");
				draw_text(24 + xd + 63, 166 + 17, "---");
				draw_text(24 + xd + 63, 166 + 17 * 2, "---");
			}
		}
		else 
		if(global.target.occupant != noone)
		{
			if(global.CHAR[global.selectedActor.characterID, 44] != -1 && global.cellDistance >= global.selectedActor.minRange && global.cellDistance <= global.selectedActor.maxRange)
			{
				if(global.selectedActor.effectiveDamage == 1)draw_set_color(fontColor6);
				draw_text(24 + xd + 63, 168, global.selectedActor.ATKd);
				draw_set_color(fontColor2);
				draw_text(24 + xd + 63, 168 + 17, string(min(global.selectedActor.HITd, 100)) + "%");
				draw_text(24 + xd + 63, 168 + 17 * 2, string(min(global.selectedActor.CRITd, 100)) + "%");
				
				//var ta = global.selectedActor.nattacks + (global.selectedActor.maxattacks * (global.selectedActor.nturns - 1));
				var ta = global.selectedActor.nattacks * global.selectedActor.nturns;
				if(global.selectedActor.tempVar)ta = global.selectedActor.nattacks + (global.selectedActor.maxattacks * (global.selectedActor.nturns - 1));
				
				if(global.selectedActor.mind >= 0)
				{
					draw_sprite(spr_x2, global.selectedActor.mind, 16 + xd + 63 + string_width(global.selectedActor.ATKd)/2 + 12, 180);
					draw_set_color(c_white);
					draw_set_font(ft_rsmall);
					draw_text(25 + xd + 63 + string_width(global.selectedActor.ATKd)/2 + 12, 172.5, "x" + string(ta));
				}
			}
			else
			{
				draw_text(24 + xd + 63, 166.5, "---");
				draw_text(24 + xd + 63, 166 + 17, "---");
				draw_text(24 + xd + 63, 166 + 17 * 2, "---");
			}
			
		}
	
		draw_set_color(fontColor1);
		draw_set_font(ft_bigNum);
		
		draw_set_halign(fa_center);
	
		draw_text(32 + xd + 128, 166, global.selectedActor.HP);
	}
	
	if(global.target != noone)
	{
		var char = global.target.occupant;
		
		surface_set_target(surfPort2);
		draw_clear_alpha(c_black, 0);
		DrawPortrait(char.characterID, 1, 0, 0);
	
		gpu_set_blendmode(bm_subtract);
		draw_sprite(spr_trans, 0, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();

		draw_surface_ext(surfPort2, global.window_w - 6 - 128 - xd, 26, 1, 1, 0, c_white, 1);
		draw_sprite(spr_name, char.faction, global.window_w - 136 - xd, 3);
	
		
		draw_set_font(ft_med);
		draw_set_color(fontColor1);
	
		draw_set_halign(fa_center);
		draw_text(global.window_w - 76 - xd, -4, global.CHAR[char.characterID, 0]);
			
		if(global.selectedActor.weaponType < 2)
		{	
			draw_sprite(spr_weaponName2, 0, global.window_w - xd, 151);
			draw_sprite(spr_stats3, 0, global.window_w - xd, 172);
		
			draw_set_color(fontColor2);
			//draw_set_font(ft_medNum);
		
			if(char.weaponType < 2 && global.CHAR[char.characterID, 44] != -1 && global.cellDistance >= char.minRange && global.cellDistance <= char.maxRange)
			{
				if(char.effectiveDamage == 1)draw_set_color(fontColor6);
				draw_text(global.window_w - 24 - xd - 63, 168, char.ATKd);
				draw_set_color(fontColor2);
				draw_text(global.window_w - 24 - xd - 63, 168 + 17, string(min(char.HITd, 100)) + "%");
				draw_text(global.window_w - 24 - xd - 63, 168 + 17 * 2, string(min(char.CRITd, 100)) + "%");
				
				//var ta = char.nattacks + (char.maxattacks * (char.nturns - 1));
				var ta = char.nattacks * char.nturns;
				if(char.tempVar)ta = char.nattacks + (char.maxattacks * (char.nturns - 1));
				
				if(char.mind >= 0)
				{
					draw_sprite(spr_x2, char.mind,  global.window_w - 27 - xd - 67 + string_width(global.target.occupant.ATKd)/2 + 10, 180);
					draw_set_color(c_white);
					draw_set_font(ft_rsmall);
					draw_text(global.window_w - 18 - xd - 67 + string_width(global.target.occupant.ATKd)/2 + 10, 172.5, "x" + string(ta));
				}
			}
			else
			{
				draw_text(global.window_w - 24 - xd - 63, 166.5, "---");
				draw_text(global.window_w - 24 - xd - 63, 166 + 17, "---");
				draw_text(global.window_w - 24 - xd - 63, 166 + 17 * 2, "---");
			}
		
			
		
		
			draw_set_color(fontColor1);
			draw_set_font(ft_bigNum);
	
			draw_text(global.window_w - 32 - xd - 128, 166, char.HP);
		
			draw_set_font(ft_med);
	
			draw_set_halign(fa_left);
			draw_set_color(fontColor2);
			var item = global.CHAR[global.target.occupant.characterID, 44];
			if(item != -1)
			{
				draw_sprite(spr_items, global.ITEM[item, 1], global.window_w - xd - 152, 153);
				draw_text(global.window_w - 134 + xd, 144, global.ITEM[item, 0]);
				
						
				if(char.adva == 0)draw_sprite(spr_disadvantage, indVal, 8 + global.window_w - xd - 152, 153 + 6 + obj_pers.sinVal2 * 2);
				if(char.adva == 1)draw_sprite(spr_advantage, indVal, 8 + global.window_w - xd - 152, 153 + 5 +  obj_pers.sinVal2 * 2);
				
				draw_set_halign(fa_right);
				draw_text(global.window_w - 4 + xd, 144, ds_list_find_value(global.CHAR[char.characterID, 50], global.CHAR[char.characterID, 56]));
			}
			else
			{
				draw_set_halign(fa_right);
				draw_text(global.window_w - 22 + xd + 16, 144, "Unarmed");
			}
		}
		else
		{
			draw_sprite(spr_hpHeal, 0, global.window_w - 12 - xd, 151);
			draw_sprite(spr_hpHeal, 0, global.window_w - 12 - xd, 151 + 26);
			draw_sprite(spr_arrowHeal, 0, global.window_w - 70 - xd, 151 + 21);
			
			draw_set_color(fontColor2);
			draw_set_font(ft_med);
			
			draw_set_halign(fa_left);
			draw_text(global.window_w - 114 - xd, 146, "HP");
			draw_text(global.window_w - 114 - xd, 146 + 26, "HP");
			
			draw_set_font(ft_large);
			draw_set_halign(fa_center);
			
			draw_text(global.window_w - 56 - xd, 142, string(char.HP) + " / " + string(char.MAXHP));
			
			var afterHeal = char.HP + global.selectedActor.ATK;
			if(afterHeal > char.MAXHP)afterHeal = char.MAXHP;
			draw_text(global.window_w - 56 - xd, 142 + 26, string(afterHeal) + " / " + string(char.MAXHP));
		}
	}
	draw_set_halign(fa_left);
}

if(gamestate == "select" || gamestate == "selected" || obj_pers.gamestate == "prepmap")
{
	if(global.hoverNode != noone)
	{
		var type = global.hoverNode.type;
		draw_sprite(spr_mapinfo, 0, 0, 0);
		draw_set_color(fontColor1);
		draw_set_font(ft_small);
		draw_set_halign(fa_right);
	
		draw_text(25, 15, string(global.terrainmod[type, 1]));
		draw_text(25 + 33, 15, string(global.terrainmod[type, 4]));
		draw_text(25 + 33 * 2, 15, string(global.terrainmod[type, 5]));
	
		draw_set_font(ft_large);
		draw_set_halign(fa_center);
		draw_set_color(fontColor2);
		draw_text(46, - 10, global.terrainmod[type, 6]);
	}
	
	draw_set_halign(fa_left);
	
	if(global.hoverNode != noone && global.hoverNode.occupant != noone)
	{
		draw_set_halign(fa_left);
		draw_set_color(fontColor1);
		var w = global.window_w;
		var char = global.hoverNode.occupant;
		draw_sprite(spr_charinfo, char.faction, w, 0);
		draw_text(w - 196, - 9, "LV");
		draw_set_halign(fa_right);
		draw_text(w - 154, - 9, global.CHAR[char.characterID, 4]);
		draw_set_halign(fa_left);
		draw_text(w - 146, - 9, global.CHAR[char.characterID, 0]);
		
		if(global.CHAR[char.characterID, 44] != -1)
		{
			draw_set_color(fontColor2);
			draw_sprite(spr_items, global.ITEM[global.CHAR[char.characterID, 44], 1], w - 202, 22); 
			draw_text(w - 185, 9, global.ITEM[global.CHAR[char.characterID, 44], 0]); 
		}
		else
		{
			draw_set_color(fontColor2);
			draw_text(w - 196, 9, "Unarmed"); 
		}
	}
}


if(global.showOptions == 5)
{
	var inventory1 = global.CHAR[global.selectedActor.characterID, 49];
	var uses1 = global.CHAR[global.selectedActor.characterID, 50];
	
	var inventory2 = global.CHAR[global.targetOp.occupant.characterID, 49];
	var uses2 = global.CHAR[global.targetOp.occupant.characterID, 50];
	
	trade1xpos = 48;
	trade1ypos = 72;
	trade2xpos = 400 - 28 - 154;
	trade2ypos = 72;

	
	draw_set_halign(fa_left);
	//
	draw_set_font(ft_med);
	
	draw_set_halign(fa_center);
	draw_set_color(fontColor1);
	draw_sprite(spr_name, global.selectedActor.faction, trade1xpos + 7, trade1ypos - 21);
	draw_text(trade1xpos + 65, trade1ypos - 28, global.CHAR[global.selectedActor.characterID, 0]);
	
	draw_set_halign(fa_left);
	
	if (!surface_exists(surfTradep1))surfTradep1 = surface_create(200, 90);
	surface_set_target(surfTradep1);
	draw_clear_alpha(c_black, 0);
	DrawPortrait(global.selectedActor.characterID, -1, 32, 0);
	surface_reset_target();
	
	if (!surface_exists(surfTrade1))surfTrade1 = surface_create(200, 200);
	surface_set_target(surfTrade1);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(ft_med);

	var xx = 24, yy = 0;
	for(var i = 0; i < 5; i ++)
	{
		var r = 0;
		var bc = c_white;
		var ind = 0;
		if(global.opSelect == i && global.opSelect2 == 0)
		{
			ind = 1;
			var r = - 40 + obj_pers.sinSize * 40;
			var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
		}
		 draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
	}
	if(index1trade != -1 && whotowho == 0)
	{
		draw_sprite_ext(spr_itemList, 1, xx, yy + index1trade * rowHeight, 1, 1, 0, fontColor7, 0.65);
		draw_sprite_ext(spr_pick, 0, xx - rowHeight, 7 + yy + index1trade * rowHeight, 1, 1, 0, c_white, 0.65);
	}
	draw_surface_ext(surfTradep1, xx, yy, 1, 1, 0, c_white, 0.2);
	for(var i = 0; i < ds_list_size(inventory1); i ++)
	{
		var r = 0;
		var bc = c_white;
		var item = ds_list_find_value(inventory1, i);
		var ind = 0;
		if(global.opSelect == i && global.opSelect2 == 0)
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
		
		draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);
		

		draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
		draw_set_halign(fa_right);
		draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses1, i));
		draw_set_halign(fa_left);
		
		if(global.CHAR[global.selectedActor.characterID, 56] == i)
		{
			draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
		}
	}
	
	var xp = 2;
	if(global.itemOptions == 0)xp = obj_pers.sinSize * 2;
	if(global.opSelect != -1 && global.opSelect2 == 0)draw_sprite(spr_pick, 0, xx - rowHeight + xp, 7 + yy + global.opSelect * rowHeight);
	
	surface_reset_target();
	
	draw_surface_ext(surfTrade1, trade1xpos - (1 - opSize4) * 34, trade1ypos, 1 - opSize4, 1, 0, c_white, 1);

	if(global.targetOp != noone)
	{
		var char = global.targetOp.occupant;
		
		//draw_set_halign(fa_left);
		//
		draw_set_font(ft_med);
	
		draw_set_halign(fa_center);
		draw_set_color(fontColor1);
		draw_sprite(spr_name, char.faction, trade2xpos + 7, trade2ypos - 21);
		draw_text(trade2xpos + 65, trade2ypos - 28, global.CHAR[char.characterID, 0]);
		draw_set_halign(fa_left);
	
		if (!surface_exists(surfTradep2))surfTradep2 = surface_create(200, 90);
		surface_set_target(surfTradep2);
		draw_clear_alpha(c_black, 0);
		DrawPortrait(char.characterID, 1, 0, 0);
		surface_reset_target();
	
		if (!surface_exists(surfTrade2))surfTrade2 = surface_create(260, 200);
		surface_set_target(surfTrade2);
		draw_clear_alpha(c_black, 0);
	
		draw_set_font(ft_med);

		var xx = 24, yy = 0;
		for(var i = 0; i < 5; i ++)
		{
			var r = 0;
			var bc = c_white;
			var ind = 0;
			if(global.opSelect == i && global.opSelect2 == 1)
			{
				ind = 1;
				var r = - 40 + obj_pers.sinSize * 40;
				var bc = make_color_rgb(255, 255 + r * 0.8, 255 + r);
			}
			 draw_sprite_ext(spr_itemList, ind, xx, yy + i * rowHeight, 1, 1, 0, bc, 1);
		}
		if(index1trade != -1 && whotowho == 1)
		{
			draw_sprite_ext(spr_itemList, 1, xx, yy + index1trade * rowHeight, 1, 1, 0, fontColor7, 0.65);
			draw_sprite_ext(spr_pick, 0, xx - rowHeight, 7 + yy + index1trade * rowHeight, 1, 1, 0, c_white, 0.65);
		}
		draw_surface_ext(surfTradep2, xx, yy, 1, 1, 0, c_white, 0.2);
		for(var i = 0; i < ds_list_size(inventory2); i ++)
		{
			var r = 0;
			var bc = c_white;
			var item = ds_list_find_value(inventory2, i);
			var ind = 0;
			if(global.opSelect == i && global.opSelect2 == 1)
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
		
			draw_sprite(spr_items, global.ITEM[item, 1], xx + 2, yy + 2 + i * rowHeight);

			draw_text(xx + 18, yy - 8 + i * rowHeight, global.ITEM[item, 0]);
		
			draw_set_halign(fa_right);
			draw_text(xx + 151, yy - 8 + i * rowHeight, ds_list_find_value(uses2, i));
			draw_set_halign(fa_left);
		
			if(global.CHAR[char.characterID, 56] == i)
			{
				draw_sprite(spr_equipped, 0, xx + 12, yy + i * rowHeight + 9);
			}
		}
		
		var xp = 2;
		if(global.itemOptions == 0)xp = obj_pers.sinSize * 2;
		if(global.opSelect != -1 && global.opSelect2 == 1)draw_sprite(spr_pick, 0, xx - rowHeight + xp, 7 + yy + global.opSelect * rowHeight);
	
		surface_reset_target();
	
		draw_surface_ext(surfTrade2, trade2xpos - (1 - opSize4) * 34, trade2ypos, 1 - opSize4, 1, 0, c_white, 1);

	}
	if(global.opSelect != -1)
	{
		var item = -1;
		if(global.opSelect2 == 0 && global.selectedActor != noone)
		{
			item = ds_list_find_value(inventory1, global.opSelect);
			DrawitemInfo(item);
		}
		if(global.opSelect2 == 1 && global.targetOp != noone && global.targetOp.occupant != noone)
		{
			item = ds_list_find_value(inventory2, global.opSelect);
			DrawitemInfo(item);
		}
	}
}


if((gamestate == "itemheal" || gamestate == "fortheal" || state == "endheal") && healUnit != noone)
{
	if(!surface_exists(surfOptions))surfOptions = surface_create(240, 240);
	surface_set_target(surfOptions);
	draw_clear_alpha(c_black, 0);
	
	draw_sprite(spr_healBox, 0, 2, 13);
	draw_sprite(spr_name, healUnit.faction, 39, 2);
	
	draw_set_font(ft_med);
	draw_set_color(fontColor1);
	
	draw_set_halign(fa_center);
	draw_text(99, -5, global.CHAR[healUnit.characterID, 0]);
	
	draw_set_font(ft_large);

	draw_set_halign(fa_center);
	draw_text(18, 17, floor(healUnit.HPD));
	draw_set_halign(fa_left);
	
	DrawHealth(healUnit, 38, 33);
	
	surface_reset_target();
	
	draw_surface_ext(surfOptions, 100 + opSize4 * 100, 108, 1 - opSize4, 1, 0, c_white, 1);
	
	
}


