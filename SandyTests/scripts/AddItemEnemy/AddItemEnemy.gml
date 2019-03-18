var charID = argument[0];
var item = argument[1];

var inventory = global.CHAR[charID, 49];
var uses = global.CHAR[charID, 50];
if(ds_list_size(inventory) < 5)
{
	ds_list_add(inventory, item);
	ds_list_add(uses, global.ITEM[item, 2]);
}