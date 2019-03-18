var amb = argument[0];

lastAmb = ambMap;

if(lastAmb != -1)audio_sound_gain(lastAmb, 0, 1000);
alarm[6] = 120;
ambMap = audio_play_sound(amb, 0, 1);
audio_sound_gain(ambMap, 0, 0);
audio_sound_gain(ambMap, global.optionState[2] / 100, 1000);

