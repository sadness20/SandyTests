var unit = argument[0];
unit.usedTurn = 1;
unit.MP = unit.MAXMP;
obj_game.refundMP = 0;
unit.moved = false;

unit.state = "idle";
unit.index = 0;

CleanNodes();


var list = global.faction[unit.faction];
var over = true;
for(var i = 0; i < ds_list_size(list); i ++)
{
	var char = (ds_list_find_value(list, i));
	if(char.usedTurn == 0)
	{
		over = false;
		break;
	}
}
//CleanMarked();
with (obj_node)
{
	marked2 = 0;
	marked3 = 0;
}
if(over == false)
{
	if(global.phase == 0)
	{
		for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
		{
			var char = ds_list_find_value(global.faction[1], i);
			UpdateNodesmarked(char.standingNode, char);
			
			if(char.markRange == true)
			{
				UpdateNodesmarked_single(char.standingNode, char);
			}
		}
	}
	else
	{
		//show_message("nextenemy");
		obj_game.currentEnemy ++;
		with obj_game ChangeGameState("ainew_chooseai");
		if(global.phase == 1 && global.optionState[7] == 1)obj_game.chooseTimer = 0;
		else obj_game.chooseTimer = obj_game.chooseTi;
	}
}
else
{
	global.newTurn = 0;
	if(unit.faction == 0)
	{
		if(ds_list_size(global.faction[2]) > 0)
		{
			global.newTurn = 2;
			with obj_game ChangeGameState("newturn");
		}
		else
		{
			global.newTurn = 1;
			with obj_game ChangeGameState("newturn");
		}
	}
	else if(unit.faction == 1)
	{
		global.newTurn = 0;
		with obj_game ChangeGameState("aitoend");
	}
	else
	{
		global.newTurn = 1;
		with obj_game ChangeGameState("newturn");
	}
	//with instance_create_layer(0, 0, "back", obj_phase) index = global.newTurn;
	with obj_musPlayer event_user(2);
	
	global.phase = global.newTurn;
	with(obj_unit)
	{
		usedTurn = 0;
		canAttack = 1;
		endturnType = 0;
	}
	
	
	//obj_game.alarm[1] = 100;
}