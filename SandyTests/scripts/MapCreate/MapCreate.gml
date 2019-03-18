with (obj_node)
{
	tempObject = instance_position(x + global.gridSize / 2, y + global.gridSize / 2, obj_terrain);
	if(tempObject)
	{
		switch(tempObject.type)
		{
			case 1: //wall
				passable = false;
				cost = 100;
			
				break;
			case 2: //trees
				passable = true;
				cost = 2;
				break;
		}
		//sprite_index = tempObject.sprite_index;
		type = tempObject.type;
	
		//with tempObject instance_destroy();
	}
	tempObject = instance_position(x + global.gridSize / 2, y + global.gridSize / 2, obj_level);
	if(tempObject)
	{
		level = tempObject.level;
	}
}
		
//with (obj_terrain) instance_destroy();
with(obj_treeMarker)instance_destroy();
		