var char = argument[0];
var charID = char.characterID;
var skillUse = -1;
for(var i = 0; i < ds_list_size(global.CHAR[charID, 34]); i ++)
{
	var skill = ds_list_find_value(global.CHAR[charID, 34], i);
	if(global.SKILL[skill, 4] == 1 && char.SP >= global.SKILL[skill, 3] - char.spbuff_area)
	{
		if(global.SKILL[skill, 5] == 0)
		{
			with(obj_unit)
			{
				if(char.faction == faction && usedTurn == 0)
				{
					var dis = FindDistance(gridX, gridY, char.gridX, char.gridY);
					if(dis >= global.SKILL[skill, 9] && dis <= global.SKILL[skill, 10] && char != id)
					{
						skillUse = skill;
						break;
					}
				}
			}
		}
		if(global.SKILL[skill, 5] > 0)
		{
			with(obj_unit)
			{
				if(char.faction == faction)
				{
					var dis = FindDistance(gridX, gridY, char.gridX, char.gridY);
					if(dis >= global.SKILL[skill, 9] && dis <= global.SKILL[skill, 10] && char != id)
					{
						if(standingNode.marked > 0)skillUse = skill;
						break;
					}
				}
			}
		}
	}
}
if(skillUse != -1)
{
	if(global.SKILL[skillUse, 4] == 1)
	{
		//rally
		audio_play_sound(global.SKILL[skillUse, 16], 0, 0);
							
		with(obj_unit)
		{
			var dis = FindDistance(gridX, gridY, char.gridX, char.gridY);
			//if(faction == char.faction)show_message(dis);
			if(faction == char.faction && dis >= global.SKILL[skillUse, 9] && dis <= global.SKILL[skillUse, 10] && id != char)
			{
				for(var a = 0; a < 4; a ++)
				{
					var subtype = global.SKILL[skillUse, 5 + a];
					var might = global.SKILL[skillUse, 12 + a];
										
					switch(subtype)
					{
						case 0:
											
						if(usedTurn == 0)
						{
							AddBuff(8, might, 1, skillUse, 0, 0);
											
							var spfx = instance_create_depth(x + 16, y + 26, -7000, obj_combatFX);
							spfx.sprite_index = spr_wind;
							spfx.image_speed = 1.5;
							spfx.xscale = 50;
							spfx.yscale = 50;
							spfx.image_alpha = 0.5;
						}
											
						break;
											
						case 1:
											
						AddBuff(1, might, 1, skillUse, 0, 0);
											
						var spfx = instance_create_depth(x + 16, y + 26, -7000, obj_combatFX);
						spfx.sprite_index = spr_fire;
						spfx.image_speed = 1;
						spfx.xscale = 100;
						spfx.yscale = 100;
						spfx.image_alpha = 0.5;

						break;
											
						case 2:
											
						AddBuff(5, might, 2, skillUse, 0, 0);
											
						var spfx = instance_create_depth(x + 16, y + 16, -7000, obj_combatFX3);
						spfx.sprite_index = spr_sandiness;
						spfx.image_speed = 1;
						spfx.xscale = 100;
						spfx.yscale = 100;
						spfx.lightpower=200;
						spfx.lightalpha=50;
						spfx.lightcolor=make_color_rgb(255, 190, 215);

						break;
											
					}
				}
			}
		}
		char.SP -= max(0, global.SKILL[skillUse, 3] - char.spbuff - char.spbuff_area);
		with obj_game
		{
			ChangeGameState("ainew_skillwait");
			guiTimer = 40;
		}
		//EndTurn(char);				
		//audio_play_sound(sfx_select, 0, 0);
	}
} else EndTurn(char);