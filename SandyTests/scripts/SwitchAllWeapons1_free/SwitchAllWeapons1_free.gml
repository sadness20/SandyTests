var char = argument[0];
var charID = char.characterID;

//var availableWeapons = ds_list_create();

//var linkedIndex = -1;
var ind = global.CHAR[charID, 56];
var lastind = ind;

var done = 0;
while(done == 0)
{
	ind --;
	if(ind < 0)ind = ds_list_size(global.CHAR[charID, 49]) - 1;
	
	var item = ds_list_find_value(global.CHAR[charID, 49], ind);
	var check = 0;
	if(targetLis == 1 && global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] >= 2)check = 1;
	if(targetLis == 2 && global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] < 2)check = 1;
	if(global.ITEM[item, 4] >= 10 && weaponinrange[ind] && check)
	{
		done = 1;
		break;
	}
}

if(done == 1 && lastind != ind)
{
	Equip(char, ind);
	
	AttackableCells(global.selectedActor.standingNode, global.selectedActor);
	MarkRed(global.selectedActor);
	audio_play_sound(sfx_scroll, 0, 0);
}

if(global.target != noone && CheckRange_weapon(char, global.target, global.CHAR[charID, 44], 0) == false)
{
	global.target = noone;
}