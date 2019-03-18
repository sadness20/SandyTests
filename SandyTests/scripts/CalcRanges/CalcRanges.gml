var char = argument[0];
var charID = char.characterID;

char.minRangeDamage = 9999;
char.minRangeAlly = 9999;
char.maxRangeDamage = 0;
char.maxRangeAlly = 0;
var allowHeal = argument[1];

if(global.CHAR[charID, 56] != -1)
{
	for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]); i ++)
	{
		var item = ds_list_find_value(global.CHAR[charID, 49], i);
		if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 14] < 2 && CanUse(charID, item))
		{
			var item = ds_list_find_value(global.CHAR[charID, 49], i);
			if(char.minRangeDamage > global.ITEM[item, 7])char.minRangeDamage = global.ITEM[item, 7];
			if(char.maxRangeDamage < global.ITEM[item, 8])char.maxRangeDamage = global.ITEM[item, 8];
		}
		if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 14] >= 3 && CanUse(charID, item))
		{
			var item = ds_list_find_value(global.CHAR[charID, 49], i);
			if(char.minRangeAlly > global.ITEM[item, 7])char.minRangeAlly = global.ITEM[item, 7];
			if(char.maxRangeAlly < global.ITEM[item, 8])char.maxRangeAlly = global.ITEM[item, 8];
		}
		if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 14] == 2 && allowHeal && CanUse(charID, item))
		{
			var item = ds_list_find_value(global.CHAR[charID, 49], i);
			if(char.minRangeAlly > global.ITEM[item, 7])char.minRangeAlly = global.ITEM[item, 7];
			if(char.maxRangeAlly < global.ITEM[item, 8])char.maxRangeAlly = global.ITEM[item, 8];
		}
	}
}