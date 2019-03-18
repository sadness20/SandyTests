var charID = argument[0];
if(charID < 0)
show_message(argument[1]);


if(argument[1] == 0)
{
	if(global.Ykey_state == 1)
	{
		if(gamestate == "showstats")gamestate = "select"; else
		{
			tempVar = noone;
			global.glSelect6 = -1;
		}
		audio_play_sound(sfx_back, 0, 0);
		exit;
	}
	if(global.Bkey_state == 1)
	{
		if(global.glSelect6 == 0)
		{
			if(gamestate == "showstats")gamestate = "select"; else
			{
				tempVar = noone;
				global.glSelect6 = -1;
			}
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
		else
		{
			global.glSelect6 = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
	}
}
else
{
	if(global.Ykey_state == 1)
	{
		global.Ykey_state = 2;
		showStats = 0;
		audio_play_sound(sfx_back, 0, 0);
		exit;
	}
	if(global.Bkey_state == 1)
	{
		global.Bkey_state = 2;
		if(global.glSelect6 == 0)
		{
			showStats = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
		else
		{
			global.glSelect6 = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
	}
}
var nTabs = 3;
if(ds_list_size(obj_pers.nup) <= 0)nTabs = 2;
var inventory = global.CHAR[charID, 49];
var skills = obj_pers.skillList;
if(global.controlsType > 0)
{
	if(global.glSelect9 == 0)
	{
		if(global.rightKey_state == 1)
		{
			if(global.glSelect7 < nTabs - 1)global.glSelect7 ++; else global.glSelect7 = 0;
			audio_play_sound(sfx_scroll, 0, 0);
			global.glSelect6 = 0;
		}
		if(global.leftKey_state == 1)
		{
			if(global.glSelect7 > 0)global.glSelect7 --; else global.glSelect7 = nTabs - 1;
			audio_play_sound(sfx_scroll, 0, 0);
			global.glSelect6 = 0;
		}
	}
	else if(global.glSelect7 == 0)
	{
		if(global.leftKey_state == 1 || (global.leftKey_state mod 4 == 0 && global.leftKey_state > 15))
		{
			if(global.glSelect8 > 0)
			{
				global.glSelect8 --;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else if(ds_list_size(inventory) > 0)
			{
				//global.glSelect8 = ds_list_size(inventory) - 1;
				global.glSelect9 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect7 > 0)global.glSelect7 --; else global.glSelect7 = nTabs - 1;
				audio_play_sound(sfx_scroll, 0, 0);
				global.glSelect6 = 0;
			}
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 4 == 0 && global.rightKey_state > 15))
		{
			if(global.glSelect8 < ds_list_size(skills) - 1)
			{
				global.glSelect8 ++;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect7 < nTabs - 1)global.glSelect7 ++; else global.glSelect7 = 0;
				global.glSelect6 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			
		}
	}
	else
	{
		if(global.rightKey_state == 1)
		{
			if(global.glSelect7 < nTabs - 1)global.glSelect7 ++; else global.glSelect7 = 0;
			audio_play_sound(sfx_scroll, 0, 0);
			global.glSelect6 = 0;
		}
		if(global.leftKey_state == 1)
		{
			if(global.glSelect7 > 0)global.glSelect7 --; else global.glSelect7 = nTabs - 1;
			audio_play_sound(sfx_scroll, 0, 0);
			global.glSelect6 = 0;
		}
	}
}



var xx = 46 + 290 - 182;
var yy = 14 + 52;
for(var i = 0; i < ds_list_size(inventory); i ++)
{
	if(global.controlsType == 0 && global.glSelect8 != i && global.mxv > xx + 24 && global.mxv < xx + 182 && global.myv > yy + i * 19 && global.myv < yy + i * 19 + 19)
	{
		global.glSelect8 = i;
		audio_play_sound(sfx_scroll, 0, 0);
	}
	if(global.glSelect8 == i)
	{
		if(global.Akey_state == 1 && global.glSelect6 == 0 && global.glSelect9 == 0 && global.glSelect7 == 0)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			global.glSelect6 = 1;
			exit;
		}
	}
}
for(var i = 0; i < ds_list_size(skills); i ++)
{
	if(global.glSelect8 == i)
	{
		if(global.Akey_state == 1 && global.glSelect6 == 0 && global.glSelect9 == 1 && global.glSelect7 == 0)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			global.glSelect6 = 1;
			exit;
		}
	}
}

if(global.controlsType > 0 && global.glSelect7 == 0)
{
	if(global.glSelect9 == 0)
	{
		if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
		{
			if(global.glSelect8 > 0)
			{
				global.glSelect8 --;
			}
			else if(ds_list_size(skills) > 0)
			{
				global.glSelect8 = ds_list_size(skills) - 1;
				global.glSelect9 = 1;
			}
			else
			{
				global.glSelect8 = ds_list_size(inventory) - 1;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
		{
			if(global.glSelect8 < ds_list_size(inventory) - 1)
			{
				global.glSelect8 ++;
			}
			else if(ds_list_size(skills) > 0)
			{
				global.glSelect8 = 0;
				global.glSelect9 = 1;
			}
			else
			{
				global.glSelect8 = 0;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
	else
	{
		if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
		{
			if(global.glSelect8 > 0)
			{
				global.glSelect8 --;
			}
			else if(ds_list_size(inventory) > 0)
			{
				global.glSelect8 = ds_list_size(inventory) - 1;
				global.glSelect9 = 0;
			}
			else
			{
				global.glSelect8 = ds_list_size(skills) - 1;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
		{
			if(global.glSelect8 < ds_list_size(skills) - 1)
			{
				global.glSelect8 ++;
			}
			else if(ds_list_size(inventory) > 0)
			{
				global.glSelect8 = 0;
				global.glSelect9 = 0;
			}
			else
			{
				global.glSelect8 = 0;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
}