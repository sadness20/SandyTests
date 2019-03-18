/// @description Insert description here
// You can write your code in this editor
//change volume
if(global.currentMusic != -1)
{
	audio_sound_gain(global.musInfo[global.currentMusic, 0], global.optionState[2] / 100, 250);
}