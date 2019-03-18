/// @description Insert description here
// You can write your code in this editor
//global.phase = global.newTurn;
obj_pers.tempVar8 = 0;

if(global.phase > 0)
{
	with obj_musPlayer
	{
		lastTime2 = 0;
		event_user(4);
	}
}
else with obj_musPlayer event_user(3);
