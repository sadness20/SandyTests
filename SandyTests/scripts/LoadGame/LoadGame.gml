//var name = argument[0];
var file = working_directory + "\saves\\" + string(argument[0]) + ".sandy";
//show_message(string(file));
if(file_exists(file))
{
	var buf;
	buf = buffer_load(file);
	
	LoadInfo(buf);
	CharListOrder();

	buffer_delete(buf);
	return 1;
} else return 0;