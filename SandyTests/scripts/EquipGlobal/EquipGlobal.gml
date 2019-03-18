var charID = argument[0];
var index = argument[1];

var inventory = global.CHAR[charID, 49];
var uses = global.CHAR[charID, 50];

var item = ds_list_find_value(inventory, index);
							
//var temp = weaponinrange[0];

/*
weaponinrange[0] = weaponinrange[index];
weaponinrange[index] = temp;
*/
if(item != undefined)
{						
	global.CHAR[charID, 44] = item;
	global.CHAR[charID, 56] = index; //weapon inventory link

	UpdateStatsGlobal(charID);
}