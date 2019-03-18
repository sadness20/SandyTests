CleanNodes();
var faction = argument[0];

var list = -1;
if(faction != -1)list = global.faction[faction];
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
	if(global.phase == 1 || global.phase == 2)
	{
		obj_game.currentEnemy ++;
		with obj_game ChangeGameState("ainew_chooseai");
		if(global.phase == 1 && global.optionState[7] == 1)obj_game.chooseTimer = 0;
		else obj_game.chooseTimer = obj_game.chooseTi;
	}
}
else
{
	global.newTurn = 0;
	if(global.phase == 0)
	{
		if(ds_list_size(global.faction[2]) > 0)
		{
			global.newTurn = 2;
			obj_game.gamestate = "newturn";
		}
		else
		{
			global.newTurn = 1;
			obj_game.gamestate = "newturn";
		}
	}
	else if(global.phase == 1)
	{
		global.newTurn = 0;
		obj_game.gamestate = "aitoend";
	}
	else
	{
		global.newTurn = 1;
		obj_game.gamestate = "newturn";
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