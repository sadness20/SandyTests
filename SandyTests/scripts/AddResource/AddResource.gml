var item = argument[0];
var stack = argument[1];

var index = -1;

for(var i = 0; i < ds_list_size(global.resourceBox); i ++)
{
	if(ds_list_find_value(global.resourceBox, i) == item)
	{
		index = i;
		break;
	}
}

if(index == -1)
{
	ds_list_add(global.resourceBox, item);
	ds_list_add(global.resourceBoxAm, stack);
}
else
{
	var amount = ds_list_find_value(global.resourceBoxAm, index);
	ds_list_delete(global.resourceBoxAm, index);
	ds_list_insert(global.resourceBoxAm, index, amount + stack);
}