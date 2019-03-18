var itemIndex = argument[0];
var charID = argument[1];

var inventory = global.CHAR[charID, 49];
var list = global.CHAR[charID, 50];
var uses = ds_list_find_value(list, itemIndex);
var item = ds_list_find_value(inventory, itemIndex);

uses --;
ds_list_replace(list, itemIndex, uses);

if(uses <= 0)
{
	ds_list_delete(inventory, itemIndex);
	ds_list_delete(list, itemIndex);
	
	if(itemIndex < global.CHAR[charID, 56])
	{
		global.CHAR[charID, 56] --;
	}
	
	if(global.CHAR[charID, 44] == item && global.CHAR[charID, 56] == itemIndex)
	{
		global.CHAR[charID, 44] = -1;
		UpdateStatsGlobal(charID);
	}
}