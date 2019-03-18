

var charID = argument[0];
var index = argument[1];

if(global.CHAR[charID, 56] == index)
{
	global.CHAR[charID, 44] = -1;
	global.CHAR[charID, 56] = -1;
}

if(global.CHAR[charID, 56] > index && global.CHAR[charID, 56] != -1)
{
	global.CHAR[charID, 56] --;
}
							
ds_list_delete(global.CHAR[charID, 49], index);
ds_list_delete(global.CHAR[charID, 50], index);
