var charID = argument[0].characterID;
var char = argument[0];

var enemy = argument[1];
var cellCheck = argument[2];
//allyenemy = 2 when selecting enemy, 1 when selecting ally
var allyenemy = argument[3];

var newWeapon = global.CHAR[charID, 44];

var availableWeapons = ds_list_create();

for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]); i ++)
{
	var item = ds_list_find_value(global.CHAR[charID, 49], i);
	var check = 0;
	if(global.ITEM[item, 14] < 2 && allyenemy == 2)check = 1;
	if(global.ITEM[item, 14] >= 2 && allyenemy == 1)check = 1;
	if(check && CanUse(global.selectedActor.characterID, item) && CheckRange_weapon(cellCheck, enemy, item))
	{
		ds_list_add(availableWeapons, item);
	}
}

if(ds_list_size(availableWeapons) >= 1)
{
	var currentIndex = global.CHAR[charID, 56];
	if(currentIndex >= ds_list_size(availableWeapons) - 1)currentIndex = -1;
	newWeapon = ds_list_find_value(availableWeapons, currentIndex + 1);
	
	Equip(char, ds_list_find_index(global.CHAR[charID, 49], newWeapon));
}

ds_list_destroy(availableWeapons);