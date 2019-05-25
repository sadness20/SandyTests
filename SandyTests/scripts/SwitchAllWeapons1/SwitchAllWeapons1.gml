var char = argument[0];
var charID = char.characterID;


var attackFrom = argument[1];
var enemy = argument[2];

//var availableWeapons = ds_list_create();

//var linkedIndex = -1;
var ind = global.CHAR[charID, 56];
var lastind = ind;
var dis = FindDistance(attackFrom.gridX, attackFrom.gridY, enemy.gridX, enemy.gridY);

var done = 0;
while(done == 0)
{
	ind --;
	if(ind < 0)ind = ds_list_size(global.CHAR[charID, 49]) - 1;
	
	var item = ds_list_find_value(global.CHAR[charID, 49], ind);
	var check = 0;
	if(allyenemy == 2 && global.ITEM[item, 14] < 2)check = 1;
	if(allyenemy == 1 && global.ITEM[item, 14] >= 2)check = 1;
	if(check && CanUse(global.selectedActor.characterID, item) && dis >= global.ITEM[item, 7] && dis <= global.ITEM[item, 8])
	{
		done = 1;
		break;
	}
}

if(done == 1 && lastind != ind)
{
	Equip(char, ind);
	
	audio_play_sound(sfx_scroll, 0, 0);
}
