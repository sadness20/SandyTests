var i = 0;
var fileName = file_find_first(working_directory + "\saves\\*.sandy",fa_directory);
global.nFiles = 0;

while(fileName != "")
{
	global.saveFiles[i] = string_delete(fileName, string_length(fileName) - 5, 6);
	if(global.saveFiles[i] != "null")
	{
		i += 1;
		global.nFiles ++;
	}
	
	fileName = file_find_next();
}


i = 0;
fileName = file_find_first(working_directory + "\saves\\*.battle1",fa_directory);
global.nBattleFiles = 0;

while(fileName != "")
{
	global.battleFiles[i] = string_delete(fileName, string_length(fileName) - 7, 8);
	if(global.battleFiles[i] != "null")
	{
		i += 1;
		global.nBattleFiles ++;
	}
	
	fileName = file_find_next();
}


for(var i = 0; i < global.nFiles; i ++)
{
	var file = working_directory + "\saves\\" + string(global.saveFiles[i]) + ".sandyh";
	//show_message(string(file));
	if(file_exists(file))
	{
		var buf;
		buf = buffer_load(file);
	
		global.seconds = buffer_read(buf, buffer_u32);
		global.lastStage = buffer_read(buf, buffer_u8);
		global.gameType = buffer_read(buf, buffer_u8);
		
		//show_message(global.seconds);
	
		global.saveFiles_seconds[i] = TimeFormat(global.seconds);
		global.saveFiles_stage[i] = global.lastStage;

		buffer_delete(buf);
	}
}
for(var i = 0; i < global.nBattleFiles; i ++)
{
	var file = working_directory + "\saves\\" + string(global.battleFiles[i]) + ".battleh";
	if(file_exists(file))
	{
		var buf;
		buf = buffer_load(file);
	
		global.seconds = buffer_read(buf, buffer_u32);
		global.lastStage = buffer_read(buf, buffer_u8);
		global.gameType = buffer_read(buf, buffer_u8);
		
		//show_message(global.seconds);
	
		global.battleFiles_seconds[i] = TimeFormat(global.seconds);
		global.battleFiles_stage[i] = global.lastStage;
		
		buffer_delete(buf);
	}
}