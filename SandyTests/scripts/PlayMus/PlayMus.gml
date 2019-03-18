var mus = argument[0];

lastMus = musMap;

if(lastMus != -1)audio_sound_gain(lastMus, 0, 1000);
alarm[3] = 120;
musMap = audio_play_sound(mus, 0, 1);
audio_sound_gain(musMap, 0, 0);
audio_sound_gain(musMap, global.optionState[2] / 100, 1000);

