obj_pers.state = "idle";
obj_pers.gamestate = "hideprep";
with obj_game
{
	//audio_play_sound(sfx_showOptions, 0, 0);
	state = "game";
	gamestate = "showobj";
	guiTimer = global.window_w + 200;
	guiTimer2 = 0;
	guiStep = 0;
	
	
	audio_sound_gain(musPreparation, 0, 1000);
	alarm[6] = 120;
				
	with(obj_spawnAlly)
	{
		instance_destroy();
	}
	
	global.glSelect = 0;
	global.glSelect2 = 0;
}