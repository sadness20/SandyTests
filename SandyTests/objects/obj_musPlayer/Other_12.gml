/// @description Insert description here
// You can write your code in this editor
if(ablaze != -1 && audio != -1)
{
	audio_sound_gain(global.musInfo[global.currentMusic, ablaze], 0, 700);
	if(global.currentMusic == 0)lastTime = audio_sound_get_track_position(audio); else lastTime2 = audio_sound_get_track_position(audio);
	alarm[0] = 45;
	obj_game.alarm[1] = -1;
	audio = -1;
}