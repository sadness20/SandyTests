var buf = argument[0];

for(var ii = 0; ii < 50; ii ++)
{
	buffer_write(buf, buffer_s8, global.MAP[ii, 3]); //save room id
	buffer_write(buf, buffer_s8, global.MAP[ii, 4]); //save climate
	buffer_write(buf, buffer_u16, global.MAP[ii, 5]); //save darkness
	buffer_write(buf, buffer_s8, global.MAP[ii, 10]); //save type
	buffer_write(buf, buffer_bool, global.MAP[ii, 8]); //save whether it's unlocked or not
	buffer_write(buf, buffer_s8, global.MAP[ii, 12]); //save type
}

buffer_write(buf, buffer_u16, global.gold);
buffer_write(buf, buffer_u16, global.gamelevel);
buffer_write(buf, buffer_u8, global.totalChars);
buffer_write(buf, buffer_u8, global.nprisoners);
buffer_write(buf, buffer_u8, global.nrecruited);

buffer_write(buf, buffer_u8, global.OWchar);
buffer_write(buf, buffer_u16, global.nCustom);
buffer_write(buf, buffer_u32, global.seconds);

buffer_write(buf, buffer_u8, global.lastStage);
buffer_write(buf, buffer_u8, obj_pers.tempVar13);
buffer_write(buf, buffer_u8, global.gameType);

//SAVE MAPS


for(var i = 200; i < 200 + global.nCustom; i ++)
{
	buffer_write(buf, buffer_string, global.ITEM[i, 0]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 1]);
	buffer_write(buf, buffer_u16, global.ITEM[i, 2]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 3]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 4]);
	buffer_write(buf, buffer_u32, global.ITEM[i, 5]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 6]);
	
	buffer_write(buf, buffer_u8, global.ITEM[i, 7]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 8]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 9]);
	
	buffer_write(buf, buffer_u8, global.ITEM[i, 10]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 11]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 12]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 13]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 14]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 15]);
	
	buffer_write(buf, buffer_s8, global.ITEM[i, 16]);
	
	buffer_write(buf, buffer_string, global.ITEM[i, 17]);
	
	buffer_write(buf, buffer_s8, global.ITEM[i, 18]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 19]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 20]);
	
	buffer_write(buf, buffer_u8, global.ITEM[i, 21]);
	
	buffer_write(buf, buffer_s8, global.ITEM[i, 22]);
	
	buffer_write(buf, buffer_s8, global.ITEM[i, 23]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 24]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 25]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 26]);
	buffer_write(buf, buffer_s8, global.ITEM[i, 27]);
	
	buffer_write(buf, buffer_u8, global.ITEM[i, 28]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 29]);
	
	buffer_write(buf, buffer_u8, global.ITEM[i, 30]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 31]);
	buffer_write(buf, buffer_u8, global.ITEM[i, 32]);
	
	buffer_write(buf, buffer_s8, global.ITEM[i, 33]);
}

for(var ii = 0; ii < 30; ii ++)
{
	var s1 = -1;
	s1 = ds_list_find_value(global.resourceBox, ii);
	if(s1 == undefined)s1 = -1;
	buffer_write(buf, buffer_s16, s1);
}
for(var ii = 0; ii < 30; ii ++)
{
	var s1 = -1;
	s1 = ds_list_find_value(global.resourceBoxAm, ii);
	if(s1 == undefined)s1 = -1;
	buffer_write(buf, buffer_s16, s1);
}

for(var i = 0; i < global.menuOptions2; i ++)
{
	buffer_write(buf, buffer_u8, global.optionState[i]);
}

for(var ii = 0; ii < 200; ii ++)
{
	var s1 = -1;
	if(global.CHAR[100, 49] != -1)s1 = ds_list_find_value(global.CHAR[100, 49], ii);
	if(s1 == undefined)s1 = -1;
	buffer_write(buf, buffer_s16, s1);
}
for(var ii = 0; ii < 200; ii ++)
{
	var s1 = -1;
	if(global.CHAR[100, 50] != -1)s1 = ds_list_find_value(global.CHAR[100, 50], ii);
	if(s1 == undefined)s1 = -1;
	buffer_write(buf, buffer_s16, s1);
}

for(var i = 0; i < global.totalChars; i ++)
{
	for(var ii = 0; ii < global.totalChars; ii ++)
	{
		buffer_write(buf, buffer_u8, global.SUPPORTS[i, ii]);
		buffer_write(buf, buffer_u8, global.SUPPORTXP[i, ii]);
		buffer_write(buf, buffer_u8, global.SUPPORTLIMIT[i, ii]);
		buffer_write(buf, buffer_bool, global.SUPPORTADV[i, ii]);
	}
}

for(var i = 0; i < 70; i ++)
{
	buffer_write(buf, buffer_string, global.CHAR[i, 0]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 1]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 2]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 3]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 4]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 5]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 6]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 7]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 8]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 9]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 10]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 11]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 12]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 13]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 14]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 15]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 16]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 17]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 18]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 19]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 20]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 21]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 22]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 23]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 24]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 25]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 26]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 27]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 28]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 29]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 30]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 31]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 32]);
	

	
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 33] != -1)s1 = ds_list_find_value(global.CHAR[i, 33], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 34] != -1)s1 = ds_list_find_value(global.CHAR[i, 34], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 35]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 36]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 37]);
	buffer_write(buf, buffer_u32, global.CHAR[i, 38]);
	buffer_write(buf, buffer_u32, global.CHAR[i, 39]);

	buffer_write(buf, buffer_u8, global.CHAR[i, 40]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 41]);
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 42]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 43]);
	buffer_write(buf, buffer_s16, global.CHAR[i, 44]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 45]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 46]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 47]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 48]);
	
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 49] != -1)s1 = ds_list_find_value(global.CHAR[i, 49], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 50] != -1)s1 = ds_list_find_value(global.CHAR[i, 50], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	
	buffer_write(buf, buffer_bool, global.CHAR[i, 51]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 52]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 53]);
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 54]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 55]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 56]);
	
	buffer_write(buf, buffer_bool, global.CHAR[i, 57]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 58]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 59]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 60]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 61]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 62]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 63]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 64]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 65]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 66]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 67]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 68]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 69]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 70]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 71]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 72]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 73]);
	buffer_write(buf, buffer_s16, global.CHAR[i, 74]);
}

for(var i = 101; i < 150; i ++)
{
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 48] != -1)s1 = ds_list_find_value(global.CHAR[i, 48], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 49] != -1)s1 = ds_list_find_value(global.CHAR[i, 49], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 50; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 50] != -1)s1 = ds_list_find_value(global.CHAR[i, 50], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
}

for(var i = 150; i < 180; i ++)
{
	buffer_write(buf, buffer_string, global.CHAR[i, 0]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 1]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 2]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 3]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 4]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 5]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 6]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 7]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 8]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 9]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 10]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 11]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 12]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 13]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 14]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 15]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 16]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 17]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 18]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 19]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 20]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 21]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 22]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 23]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 24]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 25]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 26]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 27]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 28]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 29]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 30]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 31]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 32]);
	
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 33] != -1)s1 = ds_list_find_value(global.CHAR[i, 33], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 34] != -1)s1 = ds_list_find_value(global.CHAR[i, 34], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 35]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 36]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 37]);
	buffer_write(buf, buffer_u32, global.CHAR[i, 38]);
	buffer_write(buf, buffer_u32, global.CHAR[i, 39]);

	buffer_write(buf, buffer_u8, global.CHAR[i, 40]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 41]);
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 42]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 43]);
	buffer_write(buf, buffer_s16, global.CHAR[i, 44]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 45]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 46]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 47]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 48]);
	
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 49] != -1)s1 = ds_list_find_value(global.CHAR[i, 49], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	for(var ii = 0; ii < 20; ii ++)
	{
		var s1 = -1;
		if(global.CHAR[i, 50] != -1)s1 = ds_list_find_value(global.CHAR[i, 50], ii);
		if(s1 == undefined)s1 = -1;
		buffer_write(buf, buffer_s16, s1);
	}
	
	buffer_write(buf, buffer_bool, global.CHAR[i, 51]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 52]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 53]);
	
	buffer_write(buf, buffer_s8, global.CHAR[i, 54]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 55]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 56]);
	
	buffer_write(buf, buffer_bool, global.CHAR[i, 57]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 58]);
	buffer_write(buf, buffer_bool, global.CHAR[i, 59]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 60]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 61]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 62]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 63]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 64]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 65]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 66]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 67]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 68]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 69]);
	
	buffer_write(buf, buffer_u8, global.CHAR[i, 70]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 71]);
	buffer_write(buf, buffer_s8, global.CHAR[i, 72]);
	buffer_write(buf, buffer_u8, global.CHAR[i, 73]);
	buffer_write(buf, buffer_s16, global.CHAR[i, 74]);
}