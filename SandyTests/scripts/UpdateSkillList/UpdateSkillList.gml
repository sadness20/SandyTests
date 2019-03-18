var charID = argument[0];

ds_list_clear(obj_pers.skillList);
if(global.CHAR[charID, 74] != -1)ds_list_add(obj_pers.skillList, global.CHAR[charID, 74]);

if(instance_exists(obj_game))
{
	with(obj_unit)
	{
		if(characterID == charID)
		{
			if(isCarrying != noone)ds_list_add(obj_pers.skillList, 35);
		}
	}
}

for(var i = 0; i < ds_list_size(global.CHAR[charID, 34]); i ++)
{
	ds_list_add(obj_pers.skillList, ds_list_find_value(global.CHAR[charID, 34], i));
}