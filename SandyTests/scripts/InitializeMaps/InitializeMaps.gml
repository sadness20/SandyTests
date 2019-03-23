for(var i = 0; i < 50; i ++)
{
	global.MAP[i, 0] = "";
	for(var ii = 0; ii < 17; ii ++)
	{
		global.MAP[i, ii] = 0;
	}
}


var val = 0;
global.MAP[val, 0] = "Sandy Jail"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 7; //climate
global.MAP[val, 5] = 60; //darkness
global.MAP[val, 6] = 870 //map X
global.MAP[val, 7] = 132; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = rm_sandyjail; //stageID/shopkeeper
global.MAP[val, 10] = 3; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = -1; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);


val = 1;
global.MAP[val, 0] = "Workshop"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 7; //climate
global.MAP[val, 5] = 80; //darkness
global.MAP[val, 6] = 754; //map X
global.MAP[val, 7] = 97; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = rm_workshop; //stageID/shopkeeper
global.MAP[val, 10] = 3; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = -1; //music pack
global.MAP[val, 13] = 7; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);


val = 2;
global.MAP[val, 0] = "Shoppy"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 808; //map X
global.MAP[val, 7] = 114; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 101; //shopkeeper
global.MAP[val, 10] = 2; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 0; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = -1; //map width
global.MAP[val, 16] = -1; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 3;
global.MAP[val, 0] = "Barracks"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 846; //map X
global.MAP[val, 7] = 64; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 102; //shopkeeper
global.MAP[val, 10] = 4; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 1; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 4;
global.MAP[val, 0] = "Arena"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = 0; //room
global.MAP[val, 4] = 2; //climate
global.MAP[val, 5] = 80; //darkness
global.MAP[val, 6] = 693; //map X
global.MAP[val, 7] = 100; //map Y
global.MAP[val, 8] = false; //unlocked
global.MAP[val, 9] = 4; //stageID/shopkeeper
global.MAP[val, 10] = 5; //type
global.MAP[val, 11] = 1; //terraintype
global.MAP[val, 12] = 0; //music pack
global.MAP[val, 13] = 7; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 5;
global.MAP[val, 0] = "Graveyard"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = 14; //room
global.MAP[val, 4] = 6; //climate
global.MAP[val, 5] = 100; //darkness
global.MAP[val, 6] = 583; //map X
global.MAP[val, 7] = 72; //map Y
global.MAP[val, 8] = false; //unlocked
global.MAP[val, 9] = 5; //stageID/shopkeeper
global.MAP[val, 10] = 1; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 1; //music pack
global.MAP[val, 13] = 8; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 6;
global.MAP[val, 0] = "Plains"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = 12; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 50; //darkness
global.MAP[val, 6] = 830; //map X
global.MAP[val, 7] = 174; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 7; //stageID/shopkeeper
global.MAP[val, 10] = 1; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 5; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 20; //map width
global.MAP[val, 16] = 22; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 7;
global.MAP[val, 0] = "Junkyard"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 690; //map X
global.MAP[val, 7] = 50; //map Y
global.MAP[val, 8] = false; //unlocked
global.MAP[val, 9] = 103; //shopkeeper
global.MAP[val, 10] = 2; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 0; //music pack
global.MAP[val, 13] = 7; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = -1; //map width
global.MAP[val, 16] = -1; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);


val = 8;
global.MAP[val, 0] = "Wasteland"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = 16; //room
global.MAP[val, 4] = 1; //climate
global.MAP[val, 5] = 50; //darkness
global.MAP[val, 6] = 630; //map X
global.MAP[val, 7] = 86; //map Y
global.MAP[val, 8] = false; //unlocked
global.MAP[val, 9] = 8; //stageID/shopkeeper
global.MAP[val, 10] = 6; //type
global.MAP[val, 11] = 2; //terraintype
global.MAP[val, 12] = 3; //music pack
global.MAP[val, 13] = 4; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 25; //map width
global.MAP[val, 16] = 22; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);


//ROOMS
global.ROOM[0] = rm_map;
global.ROOM[1] = rm_camp;
global.ROOM[2] = rm_workshop;
global.ROOM[3] = rm_sandyjail;
global.ROOM[4] = rm_Arena_grass1;
global.ROOM[5] = rm_Arena_grass2;
global.ROOM[6] = rm_Arena_fairy1;
global.ROOM[7] = rm_Arena_fairy2;
global.ROOM[8] = rm_Arena_cold1;
global.ROOM[9] = rm_Arena_cold2;
global.ROOM[10] = rm_sandyplains;
global.ROOM[11] = rm_prologue;
global.ROOM[12] = rm_sandyplains2;
global.ROOM[13] = rm_escape;
global.ROOM[14] = rm_spooky;
global.ROOM[15] = rm_grove;
global.ROOM[16] = rm_wastelands;
global.ROOM[17] = rm_wastelands2;
