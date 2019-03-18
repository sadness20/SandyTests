ds_list_clear(global.charList);

var order = ds_priority_create();

for(var i = 0; i < global.totalChars; i ++)
{
	if(global.CHAR[i, 57] == true)
	{
		ds_priority_add(order, i, global.CHAR[i, 73]);
	}
}
for(var i = 162; i < 162 + global.nrecruited; i ++)
{
	if(global.CHAR[i, 57] == true)
	{
		ds_priority_add(order, i, global.CHAR[i, 73]);
	}
}

while(ds_priority_size(order) > 0)
{
	var char = ds_priority_delete_max(order);
	ds_list_add(global.charList, char);
}
ds_priority_destroy(order);

/*

///add test active chars to list
for(var i = 0; i < global.totalChars; i ++)
{
	if(global.CHAR[i, 59] == true)
	{
		ds_list_add(global.charList, i);
	}
}
for(var i = 162; i < 162 + global.nrecruited; i ++)
{
	if(global.CHAR[i, 59] == true)
	{
		ds_list_add(global.charList, i);
	}
}
///add test recruited chars to list but not active
for(var i = 0; i < global.totalChars; i ++)
{
	if(global.CHAR[i, 59] == false && global.CHAR[i, 57] == true)
	{
		ds_list_add(global.charList, i);
	}
}
for(var i = 162; i < 162 + global.nrecruited; i ++)
{
	if(global.CHAR[i, 59] == false && global.CHAR[i, 57] == true)
	{
		ds_list_add(global.charList, i);
	}
}
*/