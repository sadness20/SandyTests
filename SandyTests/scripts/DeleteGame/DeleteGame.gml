//var name = argument[0];
var file = working_directory + "\saves\\" + string(argument[0]) + ".sandy";
if(file_exists(file))
{

	file_delete(file);

	return 1;
} else return 0;