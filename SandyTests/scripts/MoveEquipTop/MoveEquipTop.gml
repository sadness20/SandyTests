
var charID = argument[0];
var inventory = global.CHAR[charID, 49];
var uses = global.CHAR[charID, 50];

var oldUses = ds_list_find_value(uses, global.CHAR[charID, 56]);
var oldItem = ds_list_find_value(inventory, global.CHAR[charID, 56]);
var oldinrange = -1;
if(global.CHAR[charID, 56] != -1 && instance_exists(obj_game))oldinrange = obj_game.weaponinrange[global.CHAR[charID, 56]];

if(global.CHAR[charID, 56] != -1 && global.CHAR[charID, 56] != 0)
{						
	ds_list_delete(inventory, global.CHAR[charID, 56]);
	ds_list_delete(uses, global.CHAR[charID, 56]);
	if(global.CHAR[charID, 56] != -1 && instance_exists(obj_game))obj_game.weaponinrange[global.CHAR[charID, 56]] = obj_game.weaponinrange[0];
							
	ds_list_insert(inventory, 0, oldItem);
	ds_list_insert(uses, 0, oldUses);
	if(global.CHAR[charID, 56] != -1 && instance_exists(obj_game))obj_game.weaponinrange[0] = oldinrange;
	global.CHAR[charID, 56] = 0; //weapon inventory link
}