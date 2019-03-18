if(global.step[global.currentStep, 2] != -1)
{
	charCome[0] = global.step[global.currentStep, 2];
	//global.charDial[0] = global.step[global.currentStep, 2];
}
if(global.step[global.currentStep, 3] != -1)
{
	charCome[1] = global.step[global.currentStep, 3];
	//global.charDial[1] = global.step[global.currentStep, 3];
}
if(global.step[global.currentStep, 4] != -1 && global.step[global.currentStep, 5] == -1)
{
	sys_SetBackground(global.step[global.currentStep, 4]);
}
if(global.step[global.currentStep, 5] != -1)
{
	sys_SetBackgroundFade(global.step[global.currentStep, 4], global.step[global.currentStep, 5], global.step[global.currentStep, 6], global.step[global.currentStep, 7], global.step[global.currentStep, 8]);
}
if(global.step[global.currentStep, 11] != -1)
{
	global.charLeave[1] = 1;
}
if(global.step[global.currentStep, 12] != -1)
{
	global.charLeave[0] = 1;
}
if(global.step[global.currentStep, 13] != -1)
{
	obj_pers.lastAudio = obj_pers.vnAudio;
	if(obj_pers.lastAudio != -1)
	{
		audio_sound_gain(obj_pers.lastAudio, 0, global.step[global.currentStep, 14] * 500)
		obj_pers.alarm[0] = 300;
	}
	
	obj_pers.vnAudio = audio_play_sound(global.step[global.currentStep, 13], 0, 1);
	audio_sound_gain(obj_pers.vnAudio, 0, 0);
	audio_sound_gain(obj_pers.vnAudio, global.optionState[2] / 100, global.step[global.currentStep, 14] * 1000);
	
	
}
if(global.step[global.currentStep, 15] != -1)
{
	obj_pers.lastAudio = obj_pers.vnAudio;
	if(obj_pers.lastAudio != -1)
	{
		audio_sound_gain(obj_pers.lastAudio, 0, global.step[global.currentStep, 15] * 1000)
		obj_pers.alarm[0] = 300;
	}
}

if(global.step[global.currentStep, 18] != -1)
{
	obj_pers.lastAmbient = obj_pers.vnAmbient;
	if(obj_pers.lastAmbient != -1)
	{
		audio_sound_gain(obj_pers.lastAmbient, 0, global.step[global.currentStep, 19] * 500)
		obj_pers.alarm[1] = 300;
	}
	
	obj_pers.vnAmbient = audio_play_sound(global.step[global.currentStep, 18], 0, 1);
	audio_sound_gain(obj_pers.vnAmbient, 0, 0)
	audio_sound_gain(obj_pers.vnAmbient, 1, global.step[global.currentStep, 19] * 1000)
}
if(global.step[global.currentStep, 20] != -1)
{
	obj_pers.lastAmbient = obj_pers.vnAmbient;
	if(obj_pers.lastAmbient != -1)
	{
		audio_sound_gain(obj_pers.lastAmbient, 0, global.step[global.currentStep, 20] * 1000)
		obj_pers.alarm[1] = 300;
	}
}
if(global.step[global.currentStep, 21] != -1)
{
	global.charLeave[0] = 1;
	charCome[0] = global.step[global.currentStep, 21];
}
if(global.step[global.currentStep, 22] != -1)
{
	global.charLeave[1] = 1;
	charCome[1] = global.step[global.currentStep, 22];
}



var post = true;
if(global.charDial[0] != -1 && global.CHAR[global.charDial[0], 51] == true)post = false;
if(global.charDial[1] != -1 && global.CHAR[global.charDial[1], 51] == true)post = false;
if(post)
{
	if(global.step[global.currentStep, 16] != -1)
	{
		var char = global.step[global.currentStep, 16];
		global.charTarBlush[char] = global.step[global.currentStep, 17];
	}

	if(global.step[global.currentStep, 9] != -1)
	{
		global.CHAR[global.step[global.currentStep, 9], 55] = global.CHAR[global.step[global.currentStep, 9], 53];
		global.CHAR[global.step[global.currentStep, 9], 53] = global.step[global.currentStep, 10];
		for(var i = 0; i < 3; i ++)
		{
			if(global.charDial[i] == global.step[global.currentStep, 9])
			{
				oldAlpha[i] = 1;
			}
		}
	}
}