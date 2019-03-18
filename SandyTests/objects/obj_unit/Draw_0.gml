/// @description Insert description here
// You can write your code in this editor
/*
if(obj_game.inCombat == 0 && vis)
{
	var yr = 0;
	if(terrainBonus == 3)yr -= 8;
	if(usedTurn == 0 || (partner != noone && pairLead == 0))
	{
		if(partner != noone && pairLead == 0)
		{
			DrawUnit(characterID, cindex, index, x + xx, y + yy + ypr + vy - 2 + yr, xscale, yscale, c_white, alpha, faction, 2, vy);
		}
		else DrawUnit(characterID, cindex, index, x + xx, y + yy + ypr + vy - 2 + yr, xscale, yscale, c_white, alpha, faction, 0, vy);
	}
	else
	{
		DrawUnit(characterID, cindex, index, x + xx, y + yy + ypr + vy - 2 + yr, xscale, yscale, c_white, alpha, faction, 1, vy);
	}
}
*/
//draw_text(x, y, ds_list_size(global.CHAR[characterID, 49]));
//draw_sprite(spr_grid32, 0, standingNode.gridX * global.gridSize, standingNode.gridY * global.gridSize);


if(obj_game.inCombat == 0 && vis)
{
	yy = 0;
	if(terrainBonus == 3)yy -= 7;
	if(usedTurn == 0)
	{
		DrawUnit(characterID, cindex, index, x + xx, y + yy + ypr + vy - 2, xscale, yscale, c_white, alpha, faction, 0, vy);
	}
	else
	{
		DrawUnit(characterID, cindex, index, x + xx, y + yy + ypr + vy - 2, xscale, yscale, c_white, alpha, faction, 1, vy);
	}
	if(isBoss)draw_sprite(spr_boss, 0, x + 2, y + 16 + vy + ypr);
	if(debuffed)draw_sprite(spr_debuffIcon, 0, x + 19, y + 14 + vy + ypr + obj_pers.sinVal2 * 1.5);
	
	draw_sprite(spr_hpbar, 4, x + 5, y + 30 + vy + ypr);
	draw_sprite_part(spr_hpbar, 3, 0, 0, HPD * 22 / MAXHP, 6, x + 5, y + 30 + vy + ypr);
	draw_sprite_part(spr_hpbar, faction, 0, 0, HP * 22 / MAXHP, 6, x + 5, y + 30 + vy + ypr);
}

//draw_text(x, y, equipAfter);