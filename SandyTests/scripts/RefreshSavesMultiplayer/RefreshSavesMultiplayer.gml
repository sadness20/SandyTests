var i = 0;
var fileName = file_find_first(working_directory + "\multiplayer_saves\\*.sandyon",fa_directory);
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
