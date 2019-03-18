var charID = argument[0];
var item = argument[1];

var inventory = global.CHAR[charID, 49];
var uses = global.CHAR[charID, 50];
if(ds_list_size(inventory) >= 5)
{
	//add to convoy because full
	ds_list_add(global.CHAR[100, 49], item);
	ds_list_add(global.CHAR[100, 50], global.ITEM[item, 2]);
	
	if(obj_pers.gamestate == "shop" && charID != 100)
	{
		obj_pers.tempVar11 = item;
		obj_pers.gamestate = "itemconvoy";
		obj_pers.guiTimer2 = 0;
		obj_pers.guiTimer = 0;
	}
}
else
{
	ds_list_add(inventory, item);
	ds_list_add(uses, global.ITEM[item, 2]);
}