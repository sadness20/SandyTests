for(var i = 0; i < ds_list_size(global.CHAR[characterID, 34]); i ++)
{
	var skill = ds_list_find_value(global.CHAR[characterID, 34], i);
	if(global.SKILL[skill, 4] == 4)
	{
		for(var i = 0; i < 4; i ++)
		{
			var subtype = global.SKILL[skill, 5 + i];
			var might = global.SKILL[skill, 12 + i];
			
			switch(subtype)
			{
				case 0:
				
				if(global.phase != faction && HP < floor(MAXHP * (might / 100)))
				{
					global.currentTurn = id;
					initCombatfx = global.SKILL[skill, 2];
				}
				
				break;
			}
		}
	}
	if(global.SKILL[skill, 4] == 72 && global.phase == !faction)
	{
		var pivot = global.char1.standingNode;
		var startingNode = global.char2.standingNode;
		var xdis = global.char2.standingNode.gridX - pivot.gridX;
		var ydis = global.char2.standingNode.gridY - pivot.gridY;
		var xpos = pivot.gridX - xdis;
		var ypos = pivot.gridY - ydis;
		
		startingNode.occupant = noone;
		
		if(xpos >= 0 && ypos >= 0 && xpos < global.mapWidth && ypos < global.mapHeight)
		{
			var targetCell = global.map[xpos, ypos];
			
			if(targetCell.type != 4 && targetCell.type != 5 && targetCell.passable)
			{
				if(targetCell.occupant != noone)
				{
					var occup = targetCell.occupant;
				
					startingNode.occupant = occup.id;
					occup.standingNode = startingNode;
					occup.gridX = startingNode.gridX;
					occup.gridY = startingNode.gridY;
					occup.x = occup.gridX * global.gridSize;
					occup.y = occup.gridY * global.gridSize;
				
					var spfx = instance_create_depth(targetCell.x + 16, targetCell.y + 8, -7000, obj_combatFX2);
					spfx.sprite_index = spr_transpose;
					spfx.xscale = 50;
					spfx.yscale = 50;
				
					if(occup.faction == 1)
					{
						var spfx = instance_create_depth(targetCell.x + 16, targetCell.y + 8 - 64, -7000, obj_combatFX2);
						spfx.sprite_index = spr_electrify;
						spfx.xscale = 50;
						spfx.yscale = 50;
					
						AddBuff(6, -99, 2, 1000, 0, 0);
						AddBuff(7, -99, 2, 1001, 0, 0);
					
						audio_play_sound(sfx_hitLightning, 0, 0);
					}
				}
			
				targetCell.occupant = global.char2.id;
				global.char2.id.standingNode = targetCell;
				global.char2.id.gridX = targetCell.gridX;
				global.char2.id.gridY = targetCell.gridY;
				global.char2.id.x = global.char2.id.gridX * global.gridSize;
				global.char2.id.y = global.char2.id.gridY * global.gridSize;
			}
		}
		
		
		
		audio_play_sound(sfx_transpose, 0, 0);
		
		var spfx = instance_create_depth(startingNode.x + 16, startingNode.y + 8, -7000, obj_combatFX2);
		spfx.sprite_index = spr_transpose;
		spfx.xscale = 50;
		spfx.yscale = 50;
	}
}