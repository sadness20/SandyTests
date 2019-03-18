var char = argument[0];
var target = argument[1];


target.standingNode.occupant = noone;

ds_list_delete(global.faction[target.faction], ds_list_find_index(global.faction[target.faction], target));
target.oldFaction = target.faction;
target.faction = -1;
target.vis = 0;

char.isCarrying = target.characterID;

char.SPD -= 2;
char.MAXSPD -= 2;