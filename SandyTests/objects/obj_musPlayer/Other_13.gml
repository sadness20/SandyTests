/// @description Insert description here
// You can write your code in this editor

//resume normal
global.currentMusic = 0;

audio_stop_sound(global.musInfo[global.currentMusic, 0]);
audio = audio_play_sound(global.musInfo[global.currentMusic, 0], 0, 1);

audio_sound_gain(global.musInfo[global.currentMusic, 0], global.optionState[2] / 100, 750);
audio_sound_set_track_position(audio, lastTime);

ablaze = 0;