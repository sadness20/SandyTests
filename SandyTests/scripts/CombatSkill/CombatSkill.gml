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
					initCombatfx = skill;
				}
				
				break;
			}
		}
	}
	if(global.SKILL[skill, 4] == 13 && global.phase == faction)
	{
		var ch1node = global.char1.standingNode;
		
		UpdatePosition(global.char1, global.char2.standingNode);
		UpdatePosition(global.char2, ch1node);
		
		if(!(global.phase == 1 && global.optionState[7] == 1))
		{
			audio_play_sound(sfx_transpose, 0, 0);
		
			var spfx = instance_create_depth(global.char1.x + 16, global.char1.y + 8, -7000, obj_combatFX2);
			spfx.sprite_index = spr_transpose;
			spfx.xscale = 50;
			spfx.yscale = 50;
		
			var spfx = instance_create_depth(global.char2.x + 16, global.char2.y + 8, -7000, obj_combatFX2);
			spfx.sprite_index = spr_transpose;
			spfx.xscale = 50;
			spfx.yscale = 50;
		}
	}
	/*
	if(global.SKILL[skill, 4] == 14 && global.phase == faction)
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
					initCombatfx = skill;
				}
				
				break;
			}
		}
	}
	*/
}