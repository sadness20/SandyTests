/*
var val = 0;
global.MAP[val, 0] = "Shoppy"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 827 //map X
global.MAP[val, 7] = 101; //map Y
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

val = 1;
global.MAP[val, 0] = "Prologue"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = rm_prologue; //room
global.MAP[val, 4] = 3; //climate
global.MAP[val, 5] = 40; //darkness
global.MAP[val, 6] = 847; //map X
global.MAP[val, 7] = 160; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 0; //stageID/shopkeeper
global.MAP[val, 10] = 1; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 0; //music pack
global.MAP[val, 13] = -1; //flag value
global.MAP[val, 14] = -1; //flag type, 0 = stage
global.MAP[val, 15] = 20; //map width
global.MAP[val, 16] = 22; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 2;
global.MAP[val, 0] = "Escape"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = rm_escape; //room
global.MAP[val, 4] = 3; //climate
global.MAP[val, 5] = 90; //darkness
global.MAP[val, 6] = 800; //map X
global.MAP[val, 7] = 182; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 1; //stageID/shopkeeper
global.MAP[val, 10] = 1; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 2; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 32; //map width
global.MAP[val, 16] = 24; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 3;
global.MAP[val, 0] = "Sandy Jail"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 7; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 754; //map X
global.MAP[val, 7] = 97; //map Y
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

val = 4;
global.MAP[val, 0] = "Grove of Solitude"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = rm_grove; //room
global.MAP[val, 4] = 3; //climate
global.MAP[val, 5] = 80; //darkness
global.MAP[val, 6] = 888; //map X
global.MAP[val, 7] = 74; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 6; //stageID/shopkeeper
global.MAP[val, 10] = 1; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 3; //music pack
global.MAP[val, 13] = -1; //flag value
global.MAP[val, 14] = -1; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 5;
global.MAP[val, 0] = "Workshop"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 7; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 760; //map X
global.MAP[val, 7] = 34; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = rm_workshop; //stageID/shopkeeper
global.MAP[val, 10] = 3; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = -1; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = 40; //map width
global.MAP[val, 16] = 20; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);

val = 6;
global.MAP[val, 0] = "Junkyard"; //name
global.MAP[val, 1] = 0; //region
global.MAP[val, 2] = 0; //location
global.MAP[val, 3] = -1; //room
global.MAP[val, 4] = 0; //climate
global.MAP[val, 5] = 120; //darkness
global.MAP[val, 6] = 698 //map X
global.MAP[val, 7] = 47; //map Y
global.MAP[val, 8] = true; //unlocked
global.MAP[val, 9] = 103; //shopkeeper
global.MAP[val, 10] = 2; //type
global.MAP[val, 11] = 0; //terraintype
global.MAP[val, 12] = 0; //music pack
global.MAP[val, 13] = 0; //flag value
global.MAP[val, 14] = 0; //flag type, 0 = stage
global.MAP[val, 15] = -1; //map width
global.MAP[val, 16] = -1; //map height
if(global.MAP[val, 1] != -1)ds_list_add(global.REGION[global.MAP[val, 1], 2], val);












global.CHAR[global.nChars, 0] = "Evinya"; //name
global.CHAR[global.nChars, 1] = 12; //portrait ID
global.CHAR[global.nChars, 2] = 1; //gender

global.CHAR[global.nChars, 3] = 3; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 28; //hp
global.CHAR[global.nChars, 7] = 9; //str
global.CHAR[global.nChars, 8] = 13; //mag
global.CHAR[global.nChars, 9] = 8; //skill
global.CHAR[global.nChars, 10] = 10; //spd
global.CHAR[global.nChars, 11] = 13; //lck
global.CHAR[global.nChars, 12] = 9; //def
global.CHAR[global.nChars, 13] = 11; //res

global.CHAR[global.nChars, 14] = 70; //hpgrowth
global.CHAR[global.nChars, 15] = 45; //strgrowth
global.CHAR[global.nChars, 16] = 70; //maggrowth
global.CHAR[global.nChars, 17] = 45; //skillgrowth
global.CHAR[global.nChars, 18] = 50; //spdgrowth
global.CHAR[global.nChars, 19] = 70; //lckgrowth
global.CHAR[global.nChars, 20] = 25; //defgrowth
global.CHAR[global.nChars, 21] = 50; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 7; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(205, 106, 90); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(110, 63, 63); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = false; //recruited
global.CHAR[global.nChars, 58] = false; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 3;

global.CHAR[global.nChars, 0] = "Meeerrpe"; //name
global.CHAR[global.nChars, 1] = 29; //portrait ID
global.CHAR[global.nChars, 2] = 1; //gender

global.CHAR[global.nChars, 3] = 22; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 17; //hp
global.CHAR[global.nChars, 7] = 0; //str
global.CHAR[global.nChars, 8] = 5; //mag
global.CHAR[global.nChars, 9] = 4; //skill
global.CHAR[global.nChars, 10] = 6; //spd
global.CHAR[global.nChars, 11] = 5; //lck
global.CHAR[global.nChars, 12] = 3; //def
global.CHAR[global.nChars, 13] = 6; //res

global.CHAR[global.nChars, 14] = 65; //hpgrowth
global.CHAR[global.nChars, 15] = 20; //strgrowth
global.CHAR[global.nChars, 16] = 6; //maggrowth
global.CHAR[global.nChars, 17] = 50; //skillgrowth
global.CHAR[global.nChars, 18] = 50; //spdgrowth
global.CHAR[global.nChars, 19] = 80; //lckgrowth
global.CHAR[global.nChars, 20] = 15; //defgrowth
global.CHAR[global.nChars, 21] = 55; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 7; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 6; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(198, 137, 141); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(53, 39, 29); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = false; //recruited
global.CHAR[global.nChars, 58] = false; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 4;

global.CHAR[global.nChars, 0] = "Eggs"; //name
global.CHAR[global.nChars, 1] = 28; //portrait ID
global.CHAR[global.nChars, 2] = 1; //gender

global.CHAR[global.nChars, 3] = 6; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 17; //hp
global.CHAR[global.nChars, 7] = 4; //str
global.CHAR[global.nChars, 8] = 4; //mag
global.CHAR[global.nChars, 9] = 5; //skill
global.CHAR[global.nChars, 10] = 6; //spd
global.CHAR[global.nChars, 11] = 8; //lck
global.CHAR[global.nChars, 12] = 2; //def
global.CHAR[global.nChars, 13] = 2; //res

global.CHAR[global.nChars, 14] = 40; //hpgrowth
global.CHAR[global.nChars, 15] = 30; //strgrowth
global.CHAR[global.nChars, 16] = 80; //maggrowth
global.CHAR[global.nChars, 17] = 70; //skillgrowth
global.CHAR[global.nChars, 18] = 70; //spdgrowth
global.CHAR[global.nChars, 19] = 90; //lckgrowth
global.CHAR[global.nChars, 20] = 20; //defgrowth
global.CHAR[global.nChars, 21] = 40; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 10; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(255, 226, 129); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(36, 66, 154); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 5;

global.CHAR[global.nChars, 0] = "Mark"; //name
global.CHAR[global.nChars, 1] = 30; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 0; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 28; //hp
global.CHAR[global.nChars, 7] = 9; //str
global.CHAR[global.nChars, 8] = 13; //mag
global.CHAR[global.nChars, 9] = 8; //skill
global.CHAR[global.nChars, 10] = 10; //spd
global.CHAR[global.nChars, 11] = 13; //lck
global.CHAR[global.nChars, 12] = 9; //def
global.CHAR[global.nChars, 13] = 11; //res

global.CHAR[global.nChars, 14] = 70; //hpgrowth
global.CHAR[global.nChars, 15] = 45; //strgrowth
global.CHAR[global.nChars, 16] = 70; //maggrowth
global.CHAR[global.nChars, 17] = 45; //skillgrowth
global.CHAR[global.nChars, 18] = 50; //spdgrowth
global.CHAR[global.nChars, 19] = 70; //lckgrowth
global.CHAR[global.nChars, 20] = 25; //defgrowth
global.CHAR[global.nChars, 21] = 50; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 8; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(100, 80, 60); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(60, 150, 60); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = false; //recruited
global.CHAR[global.nChars, 58] = false; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}


global.nChars = 6;

global.CHAR[global.nChars, 0] = "Lukas"; //name
global.CHAR[global.nChars, 1] = 27; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 32; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 18; //hp
global.CHAR[global.nChars, 7] = 4; //str
global.CHAR[global.nChars, 8] = 0; //mag
global.CHAR[global.nChars, 9] = 3; //skill
global.CHAR[global.nChars, 10] = 4; //spd
global.CHAR[global.nChars, 11] = 3; //lck
global.CHAR[global.nChars, 12] = 4; //def
global.CHAR[global.nChars, 13] = 1; //res

global.CHAR[global.nChars, 14] = 95; //hpgrowth
global.CHAR[global.nChars, 15] = 65; //strgrowth
global.CHAR[global.nChars, 16] = 10; //maggrowth
global.CHAR[global.nChars, 17] = 55; //skillgrowth
global.CHAR[global.nChars, 18] = 50; //spdgrowth
global.CHAR[global.nChars, 19] = 50; //lckgrowth
global.CHAR[global.nChars, 20] = 60; //defgrowth
global.CHAR[global.nChars, 21] = 15; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 7; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 8; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(145, 73, 84); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(100, 40, 32); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = false; //recruited
global.CHAR[global.nChars, 58] = false; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = 1 + global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 7;

global.CHAR[global.nChars, 0] = "Lakki"; //name
global.CHAR[global.nChars, 1] = 32; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 35; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 21; //hp
global.CHAR[global.nChars, 7] = 6; //str
global.CHAR[global.nChars, 8] = 2; //mag
global.CHAR[global.nChars, 9] = 8; //skill
global.CHAR[global.nChars, 10] = 6; //spd
global.CHAR[global.nChars, 11] = 4; //lck
global.CHAR[global.nChars, 12] = 6; //def
global.CHAR[global.nChars, 13] = 2; //res

global.CHAR[global.nChars, 14] = 80; //hpgrowth
global.CHAR[global.nChars, 15] = 60; //strgrowth
global.CHAR[global.nChars, 16] = 10; //maggrowth
global.CHAR[global.nChars, 17] = 60; //skillgrowth
global.CHAR[global.nChars, 18] = 65; //spdgrowth
global.CHAR[global.nChars, 19] = 30; //lckgrowth
global.CHAR[global.nChars, 20] = 50; //defgrowth
global.CHAR[global.nChars, 21] = 20; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 7; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(42, 184, 130); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(24, 77, 77); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = 1 + global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 8;

global.CHAR[global.nChars, 0] = "Bones"; //name
global.CHAR[global.nChars, 1] = 33; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 28; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 21; //hp
global.CHAR[global.nChars, 7] = 2; //str
global.CHAR[global.nChars, 8] = 7; //mag
global.CHAR[global.nChars, 9] = 7; //skill
global.CHAR[global.nChars, 10] = 5; //spd
global.CHAR[global.nChars, 11] = 6; //lck
global.CHAR[global.nChars, 12] = 6; //def
global.CHAR[global.nChars, 13] = 3; //res

global.CHAR[global.nChars, 14] = 70; //hpgrowth
global.CHAR[global.nChars, 15] = 10; //strgrowth
global.CHAR[global.nChars, 16] = 65; //maggrowth
global.CHAR[global.nChars, 17] = 35; //skillgrowth
global.CHAR[global.nChars, 18] = 35; //spdgrowth
global.CHAR[global.nChars, 19] = 50; //lckgrowth
global.CHAR[global.nChars, 20] = 60; //defgrowth
global.CHAR[global.nChars, 21] = 40; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 8; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(200, 50, 50); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(100, 30, 30); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 9;

global.CHAR[global.nChars, 0] = "Shang"; //name
global.CHAR[global.nChars, 1] = 34; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 34; //class
global.CHAR[global.nChars, 4] = 3; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 27; //hp
global.CHAR[global.nChars, 7] = 9; //str
global.CHAR[global.nChars, 8] = 0; //mag
global.CHAR[global.nChars, 9] = 7; //skill
global.CHAR[global.nChars, 10] = 5; //spd
global.CHAR[global.nChars, 11] = 4; //lck
global.CHAR[global.nChars, 12] = 6; //def
global.CHAR[global.nChars, 13] = 1; //res

global.CHAR[global.nChars, 14] = 85; //hpgrowth
global.CHAR[global.nChars, 15] = 60; //strgrowth
global.CHAR[global.nChars, 16] = 10; //maggrowth
global.CHAR[global.nChars, 17] = 50; //skillgrowth
global.CHAR[global.nChars, 18] = 40; //spdgrowth
global.CHAR[global.nChars, 19] = 30; //lckgrowth
global.CHAR[global.nChars, 20] = 40; //defgrowth
global.CHAR[global.nChars, 21] = 15; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 1; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 14; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(208, 200, 191); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(65, 48, 48); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 10;


global.CHAR[global.nChars, 0] = "Marceline"; //name
global.CHAR[global.nChars, 1] = 26; //portrait ID
global.CHAR[global.nChars, 2] = 1; //gender

global.CHAR[global.nChars, 3] = 36; //class
global.CHAR[global.nChars, 4] = 18; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 30; //hp
global.CHAR[global.nChars, 7] = 10; //str
global.CHAR[global.nChars, 8] = 10; //mag
global.CHAR[global.nChars, 9] = 10; //skill
global.CHAR[global.nChars, 10] = 10; //spd
global.CHAR[global.nChars, 11] = 10; //lck
global.CHAR[global.nChars, 12] = 10; //def
global.CHAR[global.nChars, 13] = 10; //res

global.CHAR[global.nChars, 14] = 70; //hpgrowth
global.CHAR[global.nChars, 15] = 60; //strgrowth
global.CHAR[global.nChars, 16] = 0; //maggrowth
global.CHAR[global.nChars, 17] = 60; //skillgrowth
global.CHAR[global.nChars, 18] = 80; //spdgrowth
global.CHAR[global.nChars, 19] = 20; //lckgrowth
global.CHAR[global.nChars, 20] = 25; //defgrowth
global.CHAR[global.nChars, 21] = 50; //resgrowth

global.CHAR[global.nChars, 22] = 5; //swordrank
global.CHAR[global.nChars, 23] = 5; //lancerank
global.CHAR[global.nChars, 24] = 5; //axerank
global.CHAR[global.nChars, 25] = 5; //daggerrank
global.CHAR[global.nChars, 26] = 5; //bowrank
global.CHAR[global.nChars, 27] = 5; //darktome 
global.CHAR[global.nChars, 28] = 5; //lighttome
global.CHAR[global.nChars, 29] = 5; //animaatome
global.CHAR[global.nChars, 30] = 5; //staffrank
global.CHAR[global.nChars, 31] = 5; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 2; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 11; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(45, 45, 45); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(150, 30, 30); //eye color

global.CHAR[global.nChars, 40] = 1; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 11;
*/