var charID = argument[0];
var skill = argument[1];
ds_list_add(global.CHAR[charID, 33], skill);

if(ds_list_size(global.CHAR[charID, 34]) < 5)
{
	ds_list_add(global.CHAR[charID, 34], skill);
}