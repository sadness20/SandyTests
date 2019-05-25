gridX = floor(x / global.gridSize);
gridY = floor(y / global.gridSize);
x = gridX * global.gridSize;
y = gridY * global.gridSize;
global.map[gridX, gridY].occupant = id;
standingNode = global.map[gridX, gridY];
	
characterID = 52;
faction = 1;

isGhost = 1;

global.CHAR[characterID, 0] = "Malefic Vision"; //name
global.CHAR[characterID, 1] = 45; //portrait ID
global.CHAR[characterID, 2] = 1; //portrait ID
global.CHAR[characterID, 4] = 30; //portrait ID
global.CHAR[characterID, 35] = 0; //face type
global.CHAR[characterID, 36] = 0; //eyes type
global.CHAR[characterID, 37] = 11; //hair ID
global.CHAR[characterID, 38] = make_color_rgb(255, 235, 215); //hair color
global.CHAR[characterID, 39] = make_color_rgb(94, 120, 161); //eye color
global.CHAR[characterID, 43] = 5; //Accessory ID

ds_list_clear(global.CHAR[characterID, 34]);

ds_list_clear(global.CHAR[characterID, 49]);
ds_list_clear(global.CHAR[characterID, 50]);
AddItemEnemy(characterID, 105);

Equip(id, 0);
//CalcRanges()

global.CHAR[characterID, 6] = 100; //hp
global.CHAR[characterID, 7] = 25; //str
global.CHAR[characterID, 8] = 25; //mag
global.CHAR[characterID, 9] = 30; //skill
global.CHAR[characterID, 10] = 30; //spd
global.CHAR[characterID, 11] = 30; //lck
global.CHAR[characterID, 12] = 125; //def
global.CHAR[characterID, 13] = 125; //res

global.CHAR[characterID, 22] = 5; //swordrank
global.CHAR[characterID, 23] = 5; //lancerank
global.CHAR[characterID, 24] = 5; //axerank
global.CHAR[characterID, 25] = 5; //daggerrank
global.CHAR[characterID, 26] = 5; //bowrank
global.CHAR[characterID, 27] = 5; //darktome 
global.CHAR[characterID, 28] = 5; //lighttome
global.CHAR[characterID, 29] = 5; //animaatome
global.CHAR[characterID, 30] = 5; //staffrank
global.CHAR[characterID, 31] = 5; //stonerank

RefreshChar(id);
