for(var ii = 0; ii < 10; ii ++)
{
	weaponinrange[ii] = false;
}
for(var ii = 0; ii < 10; ii ++)
{
	skillinrange[ii] = false;
}
global.opSelect = -1;
						
var targetFaction = ds_list_create();
						
for(var i = 0; i < ds_list_size(global.faction[0]); i ++)
{
	var unit = ds_list_find_value(global.faction[0], i);
	ds_list_add(targetFaction, unit);
}
for(var i = 0; i < ds_list_size(global.faction[2]); i ++)
{
	var unit = ds_list_find_value(global.faction[2], i);
	ds_list_add(targetFaction, unit);
}
							
for(var i = 0; i < ds_list_size(targetFaction); i ++)
{
	var enemy = ds_list_find_value(targetFaction, i);
	var dis = FindDistance(global.selectedActor.gridX, global.selectedActor.gridY, enemy.gridX, enemy.gridY);
							
	for(var ii = 0; ii < ds_list_size(global.CHAR[global.selectedActor.characterID, 49]); ii ++)
	{
		var item = ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], ii);
		if(global.ITEM[item, 14] == 2 && enemy.HP < enemy.MAXHP && dis >= global.ITEM[item, 7] && dis <= global.ITEM[item, 8] && CanUse(global.selectedActor.characterID, item))
		{
			weaponinrange[ii] = true;
			if(global.opSelect == -1)global.opSelect = ii;
		}
	}
}
						
						
ds_list_destroy(targetFaction);
weaponsinrange = 0;
for(var i = 0; i < 10; i ++)
{
	if(weaponinrange[i] == true)weaponsinrange ++;
}