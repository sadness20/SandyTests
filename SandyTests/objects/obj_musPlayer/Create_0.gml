/// @description Insert description here
// You can write your code in this editor

global.musInfo[0, 0] = global.MUSICPACK[global.MAP[global.currentMap, 12], 1];
global.musInfo[0, 1] = global.MUSICPACK[global.MAP[global.currentMap, 12], 2];
global.musInfo[0, 2] = -1;

global.musInfo[1, 0] = global.MUSICPACK[global.MAP[global.currentMap, 12], 3];
global.musInfo[1, 1] = global.MUSICPACK[global.MAP[global.currentMap, 12], 4];
global.musInfo[1, 2] = 7.8;

ablaze = -1;
global.currentMusic = 0;
audio = -1;
lastTime = 0;
lastTime2 = 0;
/*
global.currentMusic = 0;
audio = audio_play_sound(global.musInfo[global.currentMusic, 0], 0, 0);
ablaze = 0;
*/

//audio_play_sound(sfx_wind1, 0, 1);