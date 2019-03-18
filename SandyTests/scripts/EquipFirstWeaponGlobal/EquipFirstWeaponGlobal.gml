var charID = argument[0];
var inventory = global.CHAR[charID, 49];



for(var i = 0; i < ds_list_size(inventory); i ++)
{
	var newitem = ds_list_find_value(inventory, i);
	if(CanUse(charID, newitem))
	{
		EquipGlobal(charID, i);
		exit;
	}
}
