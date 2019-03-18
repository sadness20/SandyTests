var charID = argument[0];
var item = argument[1];

if(item != undefined && global.ITEM[item, 3] == 2 && global.ITEM[item, 4] >= 10 && global.CHAR[charID, 12 + global.ITEM[item, 4]] >= global.ITEM[item, 20] && global.CLASS[global.CHAR[charID, 3], global.ITEM[item, 4]] == true)
{
	return true;
} else return false;