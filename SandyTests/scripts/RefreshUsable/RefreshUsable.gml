var char = argument[0];
var charID = char.characterID;
var dis = argument[1];

for(var i = 0; i < 10; i ++)
{
	weaponinrange[i] = false;
}
//blah
if(allyenemy == 2)
{
	for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]);i ++)
	{
		var item = ds_list_find_value(global.CHAR[charID, 49], i);
		if(CanUse(charID, item) && dis >= global.ITEM[item, 7] && dis <= global.ITEM[item, 8] && global.ITEM[item, 14] < 2)
		{
			weaponinrange[i] = true;
		}
	}
}
if(allyenemy == 1)
{
	for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]);i ++)
	{
		var item = ds_list_find_value(global.CHAR[charID, 49], i);
		var canHeal = 0;
		if(global.target.occupant.HP < global.target.occupant.MAXHP)canHeal = 1;
		if(canHeal && CanUse(charID, item) && dis >= global.ITEM[item, 7] && dis <= global.ITEM[item, 8] && global.ITEM[item, 14] >= 2)
		{
			weaponinrange[i] = true;
		}
	}
}
weaponsinrange = 0;
for(var i = 0; i < 10; i ++)
{
	if(weaponinrange[i] == true)weaponsinrange++;
}