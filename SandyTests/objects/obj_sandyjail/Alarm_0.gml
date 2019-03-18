/// @description Insert description here
// You can write your code in this editor

var cID = 150;
with(obj_cell)
{
	if(global.CHAR[cID, 0] != "error")
	{
		var pr = instance_create_depth(x, y, -y + 16, obj_prisoner);
		pr.characterID = cID;
		
		with instance_nearest(pr.x, pr.y, obj_prisonerTalk)
		{
			char = pr.id;
		}
	}
	cID ++;
}

with(obj_prisonerTalk)
{
	if(char == noone)instance_destroy();
}