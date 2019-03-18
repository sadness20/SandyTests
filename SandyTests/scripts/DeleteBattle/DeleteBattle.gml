//var name = argument[0];
var file = working_directory + "\saves\\" + string(argument[0]) + ".battle1";
if(file_exists(file))
{

	file_delete(file);
	var file2 = working_directory + "\saves\\" + string(argument[0]) + ".battle2";
	file_delete(file2);

	return 1;
} else return 0;