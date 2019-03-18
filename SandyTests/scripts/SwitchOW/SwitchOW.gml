tcindex = 0;
tindex += 0.1;
if(tindex >= 4)tindex = 0;
if(global.Lshoulder_state == 1)
{
	var tchar = ds_list_find_index(global.charList, global.OWchar);
	var nchar = ds_list_find_value(global.charList, tchar - 1);
	if(nchar != undefined)
	{
		global.OWchar = nchar;
	}
	else
	global.OWchar = ds_list_find_value(global.charList, ds_list_size(global.charList) - 1);
}
if(global.Rshoulder_state == 1)
{
	var tchar = ds_list_find_index(global.charList, global.OWchar);
	var nchar = ds_list_find_value(global.charList, tchar + 1);
	if(nchar != undefined)
	{
		global.OWchar = nchar;
	}
	else
	global.OWchar = ds_list_find_value(global.charList, 0);
}