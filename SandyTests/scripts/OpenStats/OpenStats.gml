if(global.Ykey_state == 1)
{
	global.Ykey_state = 2;
	global.glSelect6 = 0;
	global.glSelect7 = 0;
	global.glSelect8 = 0;
	global.glSelect9 = 0;
	global.glSelect3 = ds_list_find_value(global.charList, global.glSelect2 * 3 + global.glSelect);
	UpdateSkillList(global.glSelect3);
	showStats = 1;  
	audio_play_sound(sfx_showOptions, 0, 0);
}
if(showStats == 1)ShowStatsControls(global.glSelect3, 1);