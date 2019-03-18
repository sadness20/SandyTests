var index1 = argument[0];
var index2 = argument[1];
var char = argument[2];
var charID = char.characterID;

var inventory = global.CHAR[charID, 49];
var uses = global.CHAR[charID, 50];

var tempItem = ds_list_find_value(inventory, index1);
var tempUses = ds_list_find_value(uses, index1);
var tempItem2 = ds_list_find_value(inventory, index2);
var tempUses2 = ds_list_find_value(uses, index2);

if(tempItem != undefined && tempItem2 != undefined)
{

	ds_list_delete(inventory, index1);
	ds_list_delete(uses, index1);

	ds_list_insert(inventory, index1, tempItem2);
	ds_list_insert(uses, index1, tempUses2);
	
	ds_list_delete(inventory, index2);
	ds_list_delete(uses, index2);

	ds_list_insert(inventory, index2, tempItem);
	ds_list_insert(uses, index2, tempUses);
	
}



if(global.CHAR[char.characterID, 56] == index1)
{
	global.CHAR[char.characterID, 56] = -1;
	global.CHAR[char.characterID, 44] = -1;
	
}
if(global.CHAR[char.characterID, 56] == index2)
{
	global.CHAR[char.characterID, 56] = -1;
	global.CHAR[char.characterID, 44] = -1;
}
if(global.CHAR[char.characterID, 44] == -1)
{
	with char EquipFirstWeapon(id);
	with char UpdateStatsSwitch();
	with char AttackableCells(char.standingNode, char);
	with char UpdateOptions();
	
}
