var index1 = argument[0];
var index2 = argument[1];
var senderID = argument[2];
var receiverID = argument[3];

var inventory1 = global.CHAR[senderID, 49];
var uses1 = global.CHAR[senderID, 50];
var inventory2 = global.CHAR[receiverID, 49];
var uses2 = global.CHAR[receiverID, 50];

var item1 = ds_list_find_value(inventory1, index1);
var itemuses1 = ds_list_find_value(uses1, index1);
var item2 = ds_list_find_value(inventory2, index2);
var itemuses2 = ds_list_find_value(uses2, index2);

if(item1 != undefined && itemuses1 != undefined)
{
	ds_list_delete(inventory1, index1);
	ds_list_delete(uses1, index1);
}
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
	if(global.CHAR[senderID, 56]  != -1 && index1 < global.CHAR[senderID, 56])
	{
		global.CHAR[senderID, 56] --;
	}
}
if(item1 != undefined && itemuses1 != undefined)
{
	ds_list_insert(inventory2, index2, item1);
	ds_list_insert(uses2, index2, itemuses1);
}

if(global.CHAR[senderID, 56] == index1)
{
	global.CHAR[senderID, 56] = -1;
	global.CHAR[senderID, 44] = -1;
	
}
if(global.CHAR[receiverID, 56] == index2)
{
	global.CHAR[receiverID, 56] = -1;
	global.CHAR[receiverID, 44] = -1;
}
if(senderID != 100 && global.CHAR[senderID, 44] == -1)
{
	EquipFirstWeaponGlobal(senderID);
}
if(receiverID != 100 && global.CHAR[receiverID, 44] == -1)
{
	EquipFirstWeaponGlobal(receiverID);
}