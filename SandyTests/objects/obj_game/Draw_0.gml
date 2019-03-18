/// @description Insert description here
// You can write your code in this editor6

if(global.target != noone && gamestate != "attack" && gamestate != "chooseweapon")
{
	
	switch(allyenemy)
	{
		case 2:
		{
			draw_sprite(spr_swords, 0, 16 + global.target.gridX * global.gridSize, -10 + global.target.gridY * global.gridSize - sin(obj_pers.selectSize) * 2 + global.target.occupant.vy);
		}
		break;
		case 1:
		{
			draw_sprite(spr_pairup, 0, 16 + global.target.gridX * global.gridSize, -12 + global.target.gridY * global.gridSize - sin(obj_pers.selectSize) * 2 + global.target.occupant.vy);
		}
		break;
	}
	
}

if(inCombat == 1 && global.showAnimations == true)
{
	/*
	draw_sprite_ext(spr_woods2, 0, global.combatXpos - xview * 0.3, global.combatYpos, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_woods1, 0, -92 + global.combatXpos - xview * 0.6, global.combatYpos, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_woods0, 0, global.combatXpos - xview, global.combatYpos, 1, 1, 0, c_white, 1);
	*/
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(camera_get_view_x(global.camera),camera_get_view_y(global.camera), camera_get_view_x(global.camera) + global.wid, camera_get_view_y(global.camera) + global.hei, 0);
	draw_set_alpha(1);
	
	if (!surface_exists(surfCombat))surfCombat = surface_create(global.window_w, global.window_h);
	surface_set_target(surfCombat);
	draw_clear_alpha(c_black, 0);
	
	//show_message(global.MAP[global.currentMap, 11]);
	if(global.combatDistance > 1)
	{
		draw_sprite(spr_battleback2, global.MAP[global.currentMap, 11], (global.wid / global.zoom) / 2 - 64, (global.hei / global.zoom) / 2+ 8);
		draw_sprite(spr_battleback2, global.MAP[global.currentMap, 11], (global.wid / global.zoom) / 2 + 64, (global.hei / global.zoom) / 2 + 8);
	}
	else
	{
		draw_sprite(spr_battleback, global.MAP[global.currentMap, 11], (global.wid / global.zoom) / 2, (global.hei / global.zoom) / 2 + 8);
	}
	//draw_sprite_ext(global.char1.SPRITE, global.char1.index, global.combatXpos + 64, global.combatYpos + 180, 2, 2, 0, c_white, 1);
	surface_reset_target();
	
	draw_surface_ext(surfCombat, camera_get_view_x(global.camera) + ((global.wid / global.zoom) / 2) - ((global.wid / global.zoom) / 2) * (cbSizeX), camera_get_view_y(global.camera) + ((global.hei / global.zoom) / 2) - ((global.hei / global.zoom) / 2) * (cbSizeY) , cbSizeX, cbSizeY, 0, c_white, cbAlpha);
	
	if(global.char1 != noone && global.char2 != noone && state != "endcombatfadein")
	{
		if(global.char1.xscale < global.char2.xscale)
		{
			with global.char1
			{
				var xxscale = 1, xx = 0;
				if(cindex == 0)
				{
					xxscale = -1;
				}
				if(vis > 0)
				{
					if(transformID == -1)DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale * xxscale, yscale, c_white, alpha, faction, 0, combatvy);
					else DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale, yscale, c_white, alpha, faction, 5, combatvy);
					
				}
			}
		}
		with global.char2
		{
			if(vis > 0)
			{
				if(transformID == -1)DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale, yscale, c_white, alpha, faction, 0, combatvy);
				else DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale, yscale, c_white, alpha, faction, 5, combatvy);
			}
		}
		if(global.char1.xscale >= global.char2.xscale)
		{
			with global.char1
			{
				var xxscale = 1, xx = 0;
				if(cindex == 0)
				{
					xxscale = -1;
				}
				if(vis > 0)
				{
					if(transformID == -1)DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale * xxscale, yscale, c_white, alpha, faction, 0, combatvy);
					else DrawUnit(characterID, cindex, index, xpr + cx, ypr + cy + combatvy, xscale * xxscale, yscale, c_white, alpha, faction, 5, combatvy);
				}
			}
		}
	}
}