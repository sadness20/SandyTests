
var file = working_directory + "\saves\\" + string(argument[0]) + ".battle2";
if(file_exists(file))
{
	var buf;
	buf = buffer_load(file);

	
	global.hoverUnit = noone;

	for(var i = 0; i < 3; i ++)
	{
		ds_list_clear(global.faction[i]);
	}
	
	for(xx = 0; xx < global.mapWidth; xx ++)
	{
		for(yy = 0; yy < global.mapHeight; yy ++)
		{
			global.map[xx, yy].occupant = noone;
		}
	}
	with(obj_unit)
	{
		instance_destroy();
	}
	with(obj_spawnAlly)
	{
		instance_destroy();
	}
	
	var f1 = buffer_read(buf, buffer_u8);
	//show_message(f1);
	var fchar = -1;
	for(var i = 0; i < f1; i ++)
	{
		var char = instance_create_depth(0, 0, 0, obj_unit);
		LoadCharInfo(buf, char);
		if(fchar == -1)fchar = char;
		with char
		{
			faction = 0;
			UpdateStatsSwitch();
			ds_list_add(global.faction[0], id);
			state = "idle";
			x = gridX * global.gridSize;
			y = gridY * global.gridSize;
		
			global.map[gridX, gridY].occupant = id;
			standingNode = global.map[gridX, gridY];
		}
	}
	var f2 = buffer_read(buf, buffer_u8);
	for(var i = 0; i < f2; i ++)
	{
		var char = instance_create_depth(0, 0, 0, obj_unit);
		LoadCharInfo(buf, char);
		
		with char
		{
			faction = 1;
			UpdateStatsSwitch();
			ds_list_add(global.faction[1], id);
			state = "idle";
			x = gridX * global.gridSize;
			y = gridY * global.gridSize;
		
			//show_message(gridX);
			//show_message(gridY);
			if(global.map[gridX, gridY] != noone)
			{
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
			}
		}
	}
	var f3 = buffer_read(buf, buffer_u8);
	for(var i = 0; i < f3; i ++)
	{
		var char = instance_create_depth(0, 0, 0, obj_unit);
		LoadCharInfo(buf, char);
		
		with char
		{
			faction = 2;
			UpdateStatsSwitch();
			ds_list_add(global.faction[2], id);
			state = "idle";
			x = gridX * global.gridSize;
			y = gridY * global.gridSize;
		
			global.map[gridX, gridY].occupant = id;
			standingNode = global.map[gridX, gridY];
		}
	}
	
	var nSpawns = buffer_read(buf, buffer_u8);
	for(var i = 0; i < nSpawns; i ++)
	{
		var charID = buffer_read(buf, buffer_u8);
		var xpos = buffer_read(buf, buffer_u8);
		var ypos = buffer_read(buf, buffer_u8);
		with(obj_spawnTurn)
		{
			if(gridX == xpos && gridY == ypos)
			{
				characterID = charID;
			}
		}
	}
	
	var nChests = buffer_read(buf, buffer_u8);
	for(var i = 0; i < nChests; i ++)
	{
		var xpos = buffer_read(buf, buffer_u8);
		var ypos = buffer_read(buf, buffer_u8);
		
		var ssceneID = buffer_read(buf, buffer_s16);
		var oopened = buffer_read(buf, buffer_u8);
		
		with(obj_chestMarker)
		{
			if(gridX == xpos && gridY == ypos)
			{
				sceneID = ssceneID;
				opened = oopened;
				for(var i = 0; i < 5; i ++)
				{
					itemReward[i] = buffer_read(buf, buffer_s16);
				}
				if(opened)
				{
					alarm[0] = 1;
				}
			}
		}
	}
	var nHouses = buffer_read(buf, buffer_u8);
	for(var i = 0; i < nHouses; i ++)
	{
		var xpos = buffer_read(buf, buffer_u8);
		var ypos = buffer_read(buf, buffer_u8);
		
		var ssceneID = buffer_read(buf, buffer_s16);
		var vvisited = buffer_read(buf, buffer_u8);
		
		with(obj_houseMarker)
		{
			if(gridX == xpos && gridY == ypos)
			{
				sceneID = ssceneID;
				visited = vvisited;
				for(var i = 0; i < 5; i ++)
				{
					itemReward[i] = buffer_read(buf, buffer_s16);
				}
			}
		}
	}
	
	global.nSpawns = buffer_read(buf, buffer_u8);
	global.nTurn = buffer_read(buf, buffer_u8);
	global.activeCharacters = buffer_read(buf, buffer_u8);
	global.currentTurn = buffer_read(buf, buffer_u8);
	
	//global.rangeToggle = buffer_read(buf, buffer_bool);
	//global.enemyUpdated = buffer_read(buf, buffer_bool);
	global.canRewind = buffer_read(buf, buffer_bool);
	
	obj_game.triggerScene = buffer_read(buf, buffer_u8);
	obj_game.reinScene = buffer_read(buf, buffer_u8);
	obj_game.cx = buffer_read(buf, buffer_u16);
	obj_game.cy = buffer_read(buf, buffer_u16);
	
	SnapCamera(obj_game.cx, obj_game.cy);
	
	obj_pers.laststate = buffer_read(buf, buffer_string);
	
	obj_globalLight.skycolor = buffer_read(buf, buffer_u16);
	obj_globalLight.skyintensity = buffer_read(buf, buffer_u16);
	
	obj_pers.cid = buffer_read(buf, buffer_u8);
	
	//buffer_write(buf, buffer_string, obj_pers.laststate);
	
	/*
	with(obj_node)
	{
		marked = buffer_read(buf, buffer_u8);
		marked2 = buffer_read(buf, buffer_u8);
		marked3 = buffer_read(buf, buffer_u8);
		marked4 = buffer_read(buf, buffer_u8);
	}
	*/

	//repopulate faction lists
	
	obj_game.gamestate = "select";
	obj_game.state = "game";
	obj_pers.gamestate = "idle";
	obj_pers.state = "idle";
	
	with obj_game MapCreate();
	StopMus();
	
	with obj_musPlayer event_user(1);
	with(obj_globalLight)
	{
		ambientsfx = global.CLIMATE[global.MAP[global.currentMap, 4], 2];
		if(ambientsfx != -1)audio_play_sound(ambientsfx, 0, 1);
	}

	buffer_delete(buf);
	return 1;
} else return 0;