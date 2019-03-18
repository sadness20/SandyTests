var type = argument[0];
var sel = argument[1];
						
ds_list_clear(itemindexList);
ds_list_clear(itemcharList);
			
for(var i = 0; i < global.totalChars; i ++)
{
	if(global.CHAR[i, 57] == true && sel != i)
	{
		for(var ii = 0; ii < ds_list_size(global.CHAR[i, 49]); ii ++)
		{
			var item = ds_list_find_value(global.CHAR[i, 49], ii);
			if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 4] == type)
			{
				ds_list_add(itemindexList, ii);
				ds_list_add(itemcharList, i);
			}
			if(global.ITEM[item, 4] < 10 && type == -1)
			{
				ds_list_add(itemindexList, ii);
				ds_list_add(itemcharList, i);
			}
		}
	}
}
for(var i = 162; i < 180; i ++)
{
	if(global.CHAR[i, 57] == true && sel != i)
	{
		for(var ii = 0; ii < ds_list_size(global.CHAR[i, 49]); ii ++)
		{
			var item = ds_list_find_value(global.CHAR[i, 49], ii);
			if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 4] == type)
			{
				ds_list_add(itemindexList, ii);
				ds_list_add(itemcharList, i);
			}
			if(global.ITEM[item, 4] < 10 && type == -1)
			{
				ds_list_add(itemindexList, ii);
				ds_list_add(itemcharList, i);
			}
		}
	}
}
for(var ii = 0; ii < ds_list_size(global.CHAR[100, 49]); ii ++)
{
	if(global.CHAR[100, 57] == true && sel != 100)
	{
		var item = ds_list_find_value(global.CHAR[100, 49], ii);
		if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 4] == type)
		{
			ds_list_add(itemindexList, ii);
			ds_list_add(itemcharList, 100);
		}
		if(global.ITEM[item, 4] < 10 && type == -1)
		{
			ds_list_add(itemindexList, ii);
			ds_list_add(itemcharList, 100);
		}
	}
}