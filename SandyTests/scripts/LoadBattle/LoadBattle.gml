var file = working_directory + "\saves\\" + string(argument[0]) + ".battle1";
if(file_exists(file))
{
	var buf;
	buf = buffer_load(file);
	
	LoadInfo(buf);
	
	global.currentMap = buffer_read(buf, buffer_u8);
	global.currentRegion = buffer_read(buf, buffer_u8);
	global.currentStage = buffer_read(buf, buffer_u8);
	//var room = buffer_read(buf, buffer_u8);
	
	global.simpleFadeout = 60;
	global.simpleFadeoutsp = 2;
	
	room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
	
	obj_pers.alarm[9] = 1;

	buffer_delete(buf);
	return 1;
} else return 0;