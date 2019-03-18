var index1 = argument[0];
var index2 = argument[1];
var sender = argument[2];
var receiver = argument[3];

var inventory1 = global.CHAR[sender.characterID, 49];
var uses1 = global.CHAR[sender.characterID, 50];
var inventory2 = global.CHAR[receiver.characterID, 49];
var uses2 = global.CHAR[receiver.characterID, 50];

var item1 = ds_list_find_value(inventory1, index1);
var itemuses1 = ds_list_find_value(uses1, index1);
var item2 = ds_list_find_value(inventory2, index2);
var itemuses2 = ds_list_find_value(uses2, index2);

ds_list_delete(inventory1, index1);
ds_list_delete(uses1, index1);
if(item2 != undefined && itemuses2 != undefined)
{
	//show_message(item2);
	ds_list_insert(inventory1, index1, item2);
	ds_list_insert(uses1, index1, itemuses2);
	
	ds_list_delete(inventory2, index2);
	ds_list_delete(uses2, index2);
}
else
{
	if(global.CHAR[sender.characterID, 56]  != -1 && index1 < global.CHAR[sender.characterID, 56])
	{
		global.CHAR[sender.characterID, 56] --;
	}
}
ds_list_insert(inventory2, index2, item1);
ds_list_insert(uses2, index2, itemuses1);

if(global.CHAR[sender.characterID, 56] == index1)
{
	global.CHAR[sender.characterID, 56] = -1;
	global.CHAR[sender.characterID, 44] = -1;
	
}
if(global.CHAR[receiver.characterID, 56] == index2)
{
	global.CHAR[receiver.characterID, 56] = -1;
	global.CHAR[receiver.characterID, 44] = -1;
}
if(global.CHAR[sender.characterID, 44] == -1)
{
	with sender EquipFirstWeapon(id);
	with sender UpdateStatsSwitch();
	with sender AttackableCells(sender.standingNode, sender);
	with sender UpdateOptions();
	
}
if(global.CHAR[receiver.characterID, 44] == -1)
{
	with receiver EquipFirstWeapon(id);
	with receiver UpdateStatsSwitch();
	with receiver AttackableCells(receiver.standingNode, receiver);
	with receiver UpdateOptions();
}