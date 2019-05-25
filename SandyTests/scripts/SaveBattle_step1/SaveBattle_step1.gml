var name = argument[0];

var buf;
buf = buffer_create(65536, buffer_grow, 1);

//show_message(ds_list_size(global.faction[0]));
buffer_write(buf, buffer_u8, ds_list_size(global.faction[0]));
for(var i = 0; i < ds_list_size(global.faction[0]); i ++)
{
	var char = ds_list_find_value(global.faction[0], i);
	with char SaveCharInfo(buf, char);
}
buffer_write(buf, buffer_u8, ds_list_size(global.faction[1]));
for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
{
	var char = ds_list_find_value(global.faction[1], i);
	with char SaveCharInfo(buf, char);
}
buffer_write(buf, buffer_u8, ds_list_size(global.faction[2]));
for(var i = 0; i < ds_list_size(global.faction[2]); i ++)
{
	var char = ds_list_find_value(global.faction[2], i);
	with char SaveCharInfo(buf, char);
}

buffer_write(buf, buffer_u8, instance_number(obj_spawnTurn));
with(obj_spawnTurn)
{
	buffer_write(buf, buffer_u8, characterID);
	buffer_write(buf, buffer_u8, gridX);
	buffer_write(buf, buffer_u8, gridY);
}

buffer_write(buf, buffer_u8, instance_number(obj_chestMarker));
with(obj_chestMarker)
{
	buffer_write(buf, buffer_u8, gridX);
	buffer_write(buf, buffer_u8, gridY);
	
	buffer_write(buf, buffer_s16, sceneID);
	buffer_write(buf, buffer_u8, opened);
	
	for(var i = 0; i < 5; i ++)
	{
		buffer_write(buf, buffer_s16, itemReward[i]);
	}
}
buffer_write(buf, buffer_u8, instance_number(obj_houseMarker));
with(obj_houseMarker)
{
	buffer_write(buf, buffer_u8, gridX);
	buffer_write(buf, buffer_u8, gridY);
	
	buffer_write(buf, buffer_s16, sceneID);
	buffer_write(buf, buffer_u8, visited);
	
	for(var i = 0; i < 5; i ++)
	{
		buffer_write(buf, buffer_s16, itemReward[i]);
	}
}

buffer_write(buf, buffer_u8, global.nSpawns);
buffer_write(buf, buffer_u8, global.nTurn);
buffer_write(buf, buffer_u8, global.activeCharacters);
buffer_write(buf, buffer_u8, global.currentTurn);


//buffer_write(buf, buffer_bool, global.rangeToggle);
//buffer_write(buf, buffer_bool, global.enemyUpdated);
buffer_write(buf, buffer_bool, global.canRewind);


buffer_write(buf, buffer_u8, obj_game.triggerScene);
buffer_write(buf, buffer_u8, obj_game.reinScene);
buffer_write(buf, buffer_u16, obj_game.cx);
buffer_write(buf, buffer_u16, obj_game.cy);

buffer_write(buf, buffer_string, obj_pers.laststate);

buffer_write(buf, buffer_u16, obj_globalLight.skycolor);
buffer_write(buf, buffer_u16, obj_globalLight.skyintensity);

buffer_write(buf, buffer_u8, obj_pers.cid);



/*
with(obj_node)
{
	buffer_write(buf, buffer_u8, marked);
	buffer_write(buf, buffer_u8, marked2);
	buffer_write(buf, buffer_u8, marked3);
	buffer_write(buf, buffer_u8, marked4);
}
*/

/*
for(var i = 0; i < 24; i ++)
{
	buffer_write(buf, buffer_u8, global.spawn[i]);
}
*/
//global.hoverUnit = noone;


//repopulate faction lists

buffer_save(buf, working_directory + "\saves\\" + string(name) + ".battle2");
buffer_delete(buf);