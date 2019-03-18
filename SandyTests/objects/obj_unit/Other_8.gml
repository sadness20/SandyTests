/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
path_clear_points(movementPath);
state = "idle";
global.unitMoving = noone;
depth = -y + 26;

if(faction == 0)
{
	OpenOptions();
	global.opSelect4 = 0;

	if(obj_game.gamestate == "attack")
	{
		BeginCombat(global.selectedActor, global.target.occupant);
		global.showOptions = 0;
	}
}
if(faction > 0)
{
	if(cTarget != noone)
	{
		state = "combat delay";
		delay = 0;
	}
	else
	{
		ChangeGameState("ainew_wait");
		CheckRallies(id);
	}
}