var char = argument[0];
var node = argument[1];

var currentTerrain = char.terrainBonus;
char.atkbuff -= global.terrainmod[currentTerrain, 0]; //atkmod
char.defbuff -= global.terrainmod[currentTerrain, 1]; //defmod
char.hitbuff -= global.terrainmod[currentTerrain, 2]; //hitmod
char.critbuff -= global.terrainmod[currentTerrain, 3]; //critmod
char.avobuff -= global.terrainmod[currentTerrain, 4]; //avomod

currentTerrain = node.type;
char.atkbuff += global.terrainmod[currentTerrain, 0]; //atkmod
char.defbuff += global.terrainmod[currentTerrain, 1]; //defmod
char.hitbuff += global.terrainmod[currentTerrain, 2]; //hitmod
char.critbuff += global.terrainmod[currentTerrain, 3]; //critmod
char.avobuff += global.terrainmod[currentTerrain, 4]; //avomod
char.terrainBonus = currentTerrain;

//if(node.type == 3)char.yy = - 7; else char.yy = 0;



/*
char.atkbuff_area = 0;
char.defbuff_area = 0;
char.hitbuff_area = 0;
char.critbuff_area = 0;
char.avobuff_area = 0;
char.spbuff_area = 0;
*/


with(obj_unit)
{
	atkbuff_area = 0;
	defbuff_area = 0;
	hitbuff_area = 0;
	critbuff_area = 0;
	avobuff_area = 0;
	spbuff_area = 0;
	
	speedbuff_area = 0;
	luckbuff_area = 0;
	skillbuff_area = 0;
}

with(obj_unit)
{
	for(var i = 0; i < ds_list_size(global.CHAR[characterID, 34]); i ++)
	{
		var skillID = ds_list_find_value(global.CHAR[characterID, 34], i);
		if(global.SKILL[skillID, 4] == 4)
		{
			for(var ii = 0; ii < ds_list_size(global.faction[faction]); ii ++)
			{
				var tar = ds_list_find_value(global.faction[faction], ii);
				var tarID = tar.characterID;
				var nn = standingNode;
				if(id == char)nn = node;
				var dis = FindDistance(nn.gridX, nn.gridY, tar.gridX, tar.gridY);
			
				if(global.CHAR[tarID, 2] == 1 && dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && tar != id)
				{
					for(var iii = 0; iii < 4; iii ++)
					{
						var subtype = global.SKILL[skillID, 5 + iii];
						var might = global.SKILL[skillID, 12 + iii];
					
						if(subtype != -1)
						{
							switch(subtype)
							{		
								case 0:
				
								atkbuff_area += might;
				
								break;
								case 1:
				
								defbuff_area += might;
				
								break;
								case 2:
				
								hitbuff_area += might;
				
								break;
								case 3:
				
								critbuff_area += might;
				
								break;
								case 4:
				
								avobuff_area += might;
				
								break;
								case 5:
				
								spbuff_area += might;
				
								break;
							}
						}
					}
				}
			}
		}
		if(global.SKILL[skillID, 4] == 5)
		{
			for(var ii = 0; ii < ds_list_size(global.faction[faction]); ii ++)
			{
				var tar = ds_list_find_value(global.faction[faction], ii);
				var tarID = tar.characterID;
				var nn = standingNode;
				if(id == char)nn = node;
				var dis = FindDistance(nn.gridX, nn.gridY, tar.gridX, tar.gridY);
			
				if(global.CHAR[tarID, 2] == 0 && dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && tar != id)
				{
					for(var iii = 0; iii < 4; iii ++)
					{
						var subtype = global.SKILL[skillID, 5 + iii];
						var might = global.SKILL[skillID, 12 + iii];
					
						if(subtype != -1)
						{
							switch(subtype)
							{		
								case 0:
				
								atkbuff_area += might;
				
								break;
								case 1:
				
								defbuff_area += might;
				
								break;
								case 2:
				
								hitbuff_area += might;
				
								break;
								case 3:
				
								critbuff_area += might;
				
								break;
								case 4:
				
								avobuff_area += might;
				
								break;
								case 5:
				
								spbuff_area += might;
				
								break;
								case 9:
				
								skillbuff_area += might;
				
								break;
								case 10:
				
								speedbuff_area += might;
				
								break;
								case 11:
				
								luckbuff_area += might;
				
								break;
							}
						}
					}
				}
			}
		}
		if(global.SKILL[skillID, 4] == 3)
		{
			for(var ii = 0; ii < ds_list_size(global.faction[faction]); ii ++)
			{
				var tar = ds_list_find_value(global.faction[faction], ii);
				var tarID = tar.characterID;
				var nn = standingNode;
				if(id == char)nn = node;
				var dis = FindDistance(nn.gridX, nn.gridY, tar.gridX, tar.gridY);
			
				if(dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && tar != id)
				{
					for(var iii = 0; iii < 4; iii ++)
					{
						var subtype = global.SKILL[skillID, 5 + iii];
						var might = global.SKILL[skillID, 12 + iii];
					
						if(subtype != -1)
						{
							switch(subtype)
							{		
								case 0:
				
								tar.atkbuff_area += might;
				
								break;
								case 1:
				
								tar.defbuff_area += might;
				
								break;
								case 2:
				
								tar.hitbuff_area += might;
				
								break;
								case 3:
				
								tar.critbuff_area += might;
				
								break;
								case 4:
				
								tar.avobuff_area += might;
				
								break;
								case 5:
				
								tar.spbuff_area += might;
				
								break;
								case 9:
				
								skillbuff_area += might;
				
								break;
								case 10:
				
								speedbuff_area += might;
				
								break;
								case 11:
				
								luckbuff_area += might;
				
								break;
							}
						}
					}
				}
			}
		}
		if(global.SKILL[skillID, 4] == 6)
		{
			for(var ii = 0; ii < ds_list_size(global.faction[faction]); ii ++)
			{
				var tar = ds_list_find_value(global.faction[faction], ii);
				var tarID = tar.characterID;
				var nn = standingNode;
				if(id == char)nn = node;
				var dis = FindDistance(nn.gridX, nn.gridY, tar.gridX, tar.gridY);
			
				var mu = false;
				if(global.CLASS[global.CHAR[tarID, 3], 15] || global.CLASS[global.CHAR[tarID, 3], 16] || global.CLASS[global.CHAR[tarID, 3], 17])mu = true;
				if(mu && dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && tar != id)
				{
					for(var iii = 0; iii < 4; iii ++)
					{
						var subtype = global.SKILL[skillID, 5 + iii];
						var might = global.SKILL[skillID, 12 + iii];
					
						if(subtype != -1)
						{
							switch(subtype)
							{		
								case 0:
				
								atkbuff_area += might;
				
								break;
								case 1:
				
								defbuff_area += might;
				
								break;
								case 2:
				
								hitbuff_area += might;
				
								break;
								case 3:
				
								critbuff_area += might;
				
								break;
								case 4:
				
								avobuff_area += might;
				
								break;
								case 5:
				
								spbuff_area += might;
				
								break;
								case 9:
				
								skillbuff_area += might;
				
								break;
								case 10:
				
								speedbuff_area += might;
				
								break;
								case 11:
				
								luckbuff_area += might;
				
								break;
							}
						}
					}
				}
			}
		}
	}
}

with (obj_unit)
{
	UpdateStats(id, -1);
}
/*
for(var i = 0; i < ds_list_size(global.CHAR[char.characterID, 34]); i ++)
{
	var skillID = ds_list_find_value(global.CHAR[char.characterID, 34], i);
	if(global.SKILL[skillID, 4] == 3)
	{
		for(var ii = 0; ii < ds_list_size(global.faction[char.faction]); ii ++)
		{
			var tar = ds_list_find_value(global.faction[char.faction], ii);
			var tarID = tar.characterID;
			var dis = FindDistance(char.gridX, char.gridY, tar.gridX, tar.gridY);
			if(dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && char.characterID != global.selectedActor)
			{
				for(var iii = 0; iii < 4; iii ++)
				{
					var subtype = global.SKILL[skillID, 5 + iii];
					var might = global.SKILL[skillID, 12 + iii];
								
					switch(subtype)
					{		
						case 0:
				
						tar.atkbuff_area += might;
				
						break;
						case 1:
				
						tar.defbuff_area += might;
				
						break;
						case 2:
				
						tar.hitbuff_area += might;
				
						break;
						case 3:
				
						tar.critbuff_area += might;
				
						break;
						case 4:
				
						tar.avobuff_area += might;
				
						break;
						case 5:
				
						tar.spbuff_area += might;
				
						break;
					}
					UpdateStats(tar);
				}
			}
		}
	}
}
*/


/*
for(var i = 0; i < ds_list_size(global.faction[char.faction]); i ++)
{
	var tar = ds_list_find_value(global.faction[char.faction], i);
	var tarID = tar.characterID;
	for(var ii = 0; ii < ds_list_size(global.CHAR[tarID, 34]); ii ++)
	{
		var skillID = ds_list_find_value(global.CHAR[tarID, 34], ii);
		if(global.SKILL[skillID, 4] == 3)
		{
			var dis = FindDistance(char.gridX, char.gridY, tar.gridX, tar.gridY);
			if(dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && char.characterID != global.selectedActor)
			{
				for(var iii = 0; iii < 4; iii ++)
				{
					var subtype = global.SKILL[skillID, 5 + iii];
					var might = global.SKILL[skillID, 12 + iii];
								
					switch(subtype)
					{		
						case 0:
				
						char.atkbuff_area += might;
				
						break;
						case 1:
				
						char.defbuff_area += might;
				
						break;
						case 2:
				
						char.hitbuff_area += might;
				
						break;
						case 3:
				
						char.critbuff_area += might;
				
						break;
						case 4:
				
						char.avobuff_area += might;
				
						break;
						case 5:
				
						char.spbuff_area += might;
				
						break;
					}
				}
			}
		}
		if(global.SKILL[skillID, 4] == 4 && global.CHAR[tarID, 2] == 1)
		{
			var dis = FindDistance(char.gridX, char.gridY, tar.gridX, tar.gridY);
			if(dis >= global.SKILL[skillID, 9] && dis <= global.SKILL[skillID, 10] && char.characterID != global.selectedActor)
			{
				for(var iii = 0; iii < 4; iii ++)
				{
					var subtype = global.SKILL[skillID, 5 + iii];
					var might = global.SKILL[skillID, 12 + iii];
								
					switch(subtype)
					{		
						case 0:
				
						char.atkbuff_area += might;
				
						break;
						case 1:
				
						char.defbuff_area += might;
				
						break;
						case 2:
				
						char.hitbuff_area += might;
				
						break;
						case 3:
				
						char.critbuff_area += might;
				
						break;
						case 4:
				
						char.avobuff_area += might;
				
						break;
						case 5:
				
						char.spbuff_area += might;
				
						break;
					}
				}
			}
		}
	}
}

UpdateStats(char);
*/