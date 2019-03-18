var itemIndex = argument[0];
var char = argument[1];
var charID = char.characterID;

var inventory = global.CHAR[charID, 49];
var list = global.CHAR[charID, 50];
var uses = ds_list_find_value(list, itemIndex);
var item = ds_list_find_value(inventory, itemIndex);

//show_message(uses);
uses --;
ds_list_replace(list, itemIndex, uses);
//show_message(uses);

if(uses <= 0)
{
	ds_list_delete(inventory, itemIndex);
	ds_list_delete(list, itemIndex);
	
	if(itemIndex < global.CHAR[charID, 56])
	{
		global.CHAR[charID, 56] --;
	}
	if(char.equipAfter != -1 && itemIndex < char.equipAfter)
	{
		equipAfter--;
	}
	
	if(global.CHAR[charID, 44] == item && global.CHAR[charID, 56] == itemIndex)
	{
		global.CHAR[charID, 44] = -1;
		global.CHAR[charID, 56] = -1;
		//CalcRanges(char, 1);
		with char
		{
			UpdateStatsSwitch();
		
			nturns = 0;
			nattacks = 0;
		}
		if(char.faction == 0)global.itemBreak = item;
	}
}