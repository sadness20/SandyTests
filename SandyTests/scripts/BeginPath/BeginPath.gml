var targetNode = global.pathArray[global.pathDraw - 1];
global.map[global.selectedActor.gridX, global.selectedActor.gridY].occupant = noone;
		
global.selectedActor.gridX = targetNode.gridX;
global.selectedActor.gridY = targetNode.gridY;
global.selectedActor.standingNode = targetNode;
global.selectedActor.state = "begin path";
TerrainBonus(global.selectedActor, targetNode);
		
targetNode.occupant = global.selectedActor;

global.unitMoving = global.selectedActor;


AttackableCells(global.selectedActor.standingNode, global.selectedActor);
global.selectedActor.moved = true;

if(global.phase == 1 && global.optionState[7] == 1)
{
	global.selectedActor.x = targetNode.x;
	global.selectedActor.y = targetNode.y;
	
	with global.selectedActor
	{
		state = "idle";
		global.unitMoving = noone;
		depth = -y + 26;
		
		if(cTarget != noone)
		{
			state = "combat delay";
			delay = 100;
		}
		else
		{
			ChangeGameState("ainew_wait");
			//show_message("endturn");
			EndTurn(id);
		}
	}
	
	exit;
}
for(var i = 0; i < global.pathDraw; i ++)
{
	var current = global.pathArray[i];
	//if(current == noone)show_message(i);
	path_add_point(global.selectedActor.movementPath, current.x, current.y, 100);
}
global.selectedActor.MP -= targetNode.G;
obj_game.refundMP = targetNode.G;

		
//CleanNodes();
//global.selectedActor = noone;