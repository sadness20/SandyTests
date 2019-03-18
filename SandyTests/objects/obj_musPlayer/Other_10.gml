/// @description Insert description here
// You can write your code in this editor

//play ablaze

if(ablaze != 1)
{
	var time = audio_sound_get_track_position(audio);

	audio_sound_gain(global.musInfo[global.currentMusic, 0], 0, 1000);
	audio_sound_gain(global.musInfo[global.currentMusic, 1], 0, 0);
	audio_stop_sound(global.musInfo[global.currentMusic, 1]);
	
	audio_sound_gain(global.musInfo[global.currentMusic, 1], global.optionState[2] / 100, 1000);

	audio = audio_play_sound(global.musInfo[global.currentMusic, 1], 0, 1);
	audio_sound_set_track_position(audio, time);

	ablaze = 1;
}