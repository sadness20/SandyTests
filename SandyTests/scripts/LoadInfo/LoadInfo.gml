var buf = argument[0];

for(var ii = 0; ii < 50; ii ++)
{
	global.MAP[ii, 3] = buffer_read(buf, buffer_s8);
	global.MAP[ii, 4] = buffer_read(buf, buffer_s8);
	global.MAP[ii, 5] = buffer_read(buf, buffer_u16);
	global.MAP[ii, 10] = buffer_read(buf, buffer_s8);
	global.MAP[ii, 8] = buffer_read(buf, buffer_bool);
	global.MAP[ii, 12] = buffer_read(buf, buffer_s8);
}

global.gold = buffer_read(buf, buffer_u16);
global.gamelevel = buffer_read(buf, buffer_u16);
global.totalChars = buffer_read(buf, buffer_u8);
global.nprisoners = buffer_read(buf, buffer_u8);
global.nrecruited = buffer_read(buf, buffer_u8);

global.OWchar = buffer_read(buf, buffer_u8);
global.nCustom = buffer_read(buf, buffer_u16);
global.seconds = buffer_read(buf, buffer_u32);

global.lastStage = buffer_read(buf, buffer_u8);
obj_pers.tempVar13 = buffer_read(buf, buffer_u8);
global.gameType = buffer_read(buf, buffer_u8);

//LOAD MAPS
	
for(var i = 200; i < 200 + global.nCustom; i ++)
{
	global.ITEM[i, 0] = buffer_read(buf, buffer_string);
	global.ITEM[i, 1] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 2] = buffer_read(buf, buffer_u16);
	global.ITEM[i, 3] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 4] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 5] = buffer_read(buf, buffer_u32);
	global.ITEM[i, 6] = buffer_read(buf, buffer_u8);
	
	global.ITEM[i, 7] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 8] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 9] = buffer_read(buf, buffer_u8);
	
	global.ITEM[i, 10] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 11] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 12] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 13] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 14] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 15] = buffer_read(buf, buffer_u8);
	
	global.ITEM[i, 16] = buffer_read(buf, buffer_s8);
	
	global.ITEM[i, 17] = buffer_read(buf, buffer_string);
	
	global.ITEM[i, 18] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 19] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 20] = buffer_read(buf, buffer_s8);
	
	global.ITEM[i, 21] = buffer_read(buf, buffer_u8);
	
	global.ITEM[i, 22] = buffer_read(buf, buffer_s8);
	
	global.ITEM[i, 23] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 24] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 25] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 26] = buffer_read(buf, buffer_s8);
	global.ITEM[i, 27] = buffer_read(buf, buffer_s8);
	
	global.ITEM[i, 28] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 29] = buffer_read(buf, buffer_u8);
	
	global.ITEM[i, 30] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 31] = buffer_read(buf, buffer_u8);
	global.ITEM[i, 32] = buffer_read(buf, buffer_u8);
		
	global.ITEM[i, 33] = buffer_read(buf, buffer_s8);
}
	
ds_list_clear(global.resourceBox);
ds_list_clear(global.resourceBoxAm);
for(var ii = 0; ii < 30; ii ++)
{
	var s1 = buffer_read(buf, buffer_s16);
	if(s1 != -1)ds_list_add(global.resourceBox, s1);
}
for(var ii = 0; ii < 30; ii ++)
{
	var s1 = buffer_read(buf, buffer_s16);
	if(s1 != -1)ds_list_add(global.resourceBoxAm, s1);
}
	
for(var i = 0; i < global.menuOptions2; i ++)
{
	global.optionState[i] = buffer_read(buf, buffer_u8);
}
audio_master_gain(global.optionState[3] / 100);
	
if(global.CHAR[100, 49] != -1 && global.CHAR[100, 49] != 0)ds_list_clear(global.CHAR[100, 49]); else global.CHAR[100, 49] = ds_list_create();
for(var ii = 0; ii < 200; ii ++)
{
	var s1 = buffer_read(buf, buffer_s16);
	if(global.CHAR[100, 49] != -1)
	{
		if(s1 != -1)ds_list_add(global.CHAR[100, 49], s1);
	}
}
if(global.CHAR[100, 50] != -1 && global.CHAR[100, 50] != 0)ds_list_clear(global.CHAR[100, 50]); else global.CHAR[100, 50] = ds_list_create();
for(var ii = 0; ii < 200; ii ++)
{
	var s1 = buffer_read(buf, buffer_s16);
	if(global.CHAR[100, 50] != -1)
	{
		if(s1 != -1)ds_list_add(global.CHAR[100, 50], s1);
	}
}
	
for(var i = 0; i < global.totalChars; i ++)
{
	for(var ii = 0; ii < global.totalChars; ii ++)
	{
		global.SUPPORTS[i, ii] = buffer_read(buf, buffer_u8);
		global.SUPPORTXP[i, ii] = buffer_read(buf, buffer_u8);
		global.SUPPORTLIMIT[i, ii] = buffer_read(buf, buffer_u8);
		global.SUPPORTADV[i, ii] = buffer_read(buf, buffer_bool);
	}
}

for(var i = 0; i < 70; i ++)
{
	global.CHAR[i, 0] = buffer_read(buf, buffer_string);
	global.CHAR[i, 1] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 2] = buffer_read(buf, buffer_bool);
	
	global.CHAR[i, 3] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 4] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 5] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 6] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 7] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 8] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 9] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 10] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 11] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 12] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 13] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 14] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 15] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 16] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 17] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 18] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 19] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 20] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 21] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 22] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 23] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 24] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 25] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 26] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 27] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 28] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 29] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 30] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 31] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 32] = buffer_read(buf, buffer_u8);
	
	if(global.CHAR[i, 33] != -1)ds_list_clear(global.CHAR[i, 33]); else global.CHAR[i, 33] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 33] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 33], s1);
		}
	}
	if(global.CHAR[i, 34] != -1)ds_list_clear(global.CHAR[i, 34]); else global.CHAR[i, 34] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 34] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 34], s1);
		}
	}
	
	global.CHAR[i, 35] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 36] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 37] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 38] = buffer_read(buf, buffer_u32);
	global.CHAR[i, 39] = buffer_read(buf, buffer_u32);

	global.CHAR[i, 40] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 41] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 42] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 43] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 44] = buffer_read(buf, buffer_s16);
	
	global.CHAR[i, 45] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 46] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 47] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 48] = buffer_read(buf, buffer_u8);
	
	if(global.CHAR[i, 49] != -1)ds_list_clear(global.CHAR[i, 49]); else global.CHAR[i, 49] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 49] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 49], s1);
		}
	}
	if(global.CHAR[i, 50] != -1)ds_list_clear(global.CHAR[i, 50]); else global.CHAR[i, 50] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 50] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 50], s1);
		}
	}
	
	global.CHAR[i, 51] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 52] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 53] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 54] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 55] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 56] = buffer_read(buf, buffer_s8);
	
	global.CHAR[i, 57] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 58] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 59] = buffer_read(buf, buffer_bool);
	
	global.CHAR[i, 60] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 61] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 62] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 63] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 64] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 65] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 66] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 67] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 68] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 69] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 70] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 71] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 72] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 73] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 74] = buffer_read(buf, buffer_s16);
}
for(var i = 101; i < 150; i ++)
{
	if(global.CHAR[i, 48] != -1)ds_list_clear(global.CHAR[i, 48]); else global.CHAR[i, 48] = ds_list_create();
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 48] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 48], s1);
		}
	}
	if(global.CHAR[i, 49] != -1)ds_list_clear(global.CHAR[i, 49]); else global.CHAR[i, 49] = ds_list_create();
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 49] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 49], s1);
		}
	}
	if(global.CHAR[i, 50] != -1)ds_list_clear(global.CHAR[i, 50]); else global.CHAR[i, 50] = ds_list_create();
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 50] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 50], s1);
		}
	}
}
	
for(var i = 150; i < 180; i ++)
{
	global.CHAR[i, 0] = buffer_read(buf, buffer_string);
	global.CHAR[i, 1] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 2] = buffer_read(buf, buffer_bool);
	
	global.CHAR[i, 3] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 4] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 5] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 6] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 7] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 8] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 9] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 10] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 11] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 12] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 13] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 14] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 15] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 16] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 17] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 18] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 19] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 20] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 21] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 22] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 23] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 24] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 25] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 26] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 27] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 28] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 29] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 30] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 31] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 32] = buffer_read(buf, buffer_u8);
	
	if(global.CHAR[i, 33] != -1)ds_list_clear(global.CHAR[i, 33]); else global.CHAR[i, 33] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 33] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 33], s1);
		}
	}
	if(global.CHAR[i, 34] != -1)ds_list_clear(global.CHAR[i, 34]); else global.CHAR[i, 34] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 34] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 34], s1);
		}
	}
	
	global.CHAR[i, 35] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 36] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 37] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 38] = buffer_read(buf, buffer_u32);
	global.CHAR[i, 39] = buffer_read(buf, buffer_u32);

	global.CHAR[i, 40] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 41] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 42] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 43] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 44] = buffer_read(buf, buffer_s16);
	
	global.CHAR[i, 45] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 46] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 47] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 48] = buffer_read(buf, buffer_u8);
	
	if(global.CHAR[i, 49] != -1)ds_list_clear(global.CHAR[i, 49]); else global.CHAR[i, 49] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 49] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 49], s1);
		}
	}
	if(global.CHAR[i, 50] != -1)ds_list_clear(global.CHAR[i, 50]); else global.CHAR[i, 50] = ds_list_create();
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = buffer_read(buf, buffer_s16);
		if(global.CHAR[i, 50] != -1)
		{
			if(s1 != -1)ds_list_add(global.CHAR[i, 50], s1);
		}
	}
	
	global.CHAR[i, 51] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 52] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 53] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 54] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 55] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 56] = buffer_read(buf, buffer_s8);
	
	global.CHAR[i, 57] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 58] = buffer_read(buf, buffer_bool);
	global.CHAR[i, 59] = buffer_read(buf, buffer_bool);
	
	global.CHAR[i, 60] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 61] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 62] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 63] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 64] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 65] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 66] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 67] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 68] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 69] = buffer_read(buf, buffer_u8);
	
	global.CHAR[i, 70] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 71] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 72] = buffer_read(buf, buffer_s8);
	global.CHAR[i, 73] = buffer_read(buf, buffer_u8);
	global.CHAR[i, 74] = buffer_read(buf, buffer_s16);
}