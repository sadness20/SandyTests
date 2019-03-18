gridX = floor(x / global.gridSize);
gridY = floor(y / global.gridSize);
x = gridX * global.gridSize;
y = gridY * global.gridSize;
global.map[gridX, gridY].occupant = id;
standingNode = global.map[gridX, gridY];
	
characterID = 59;
faction = 1;

isBoss = 1;

isBoss = 1;

global.CHAR[characterID, 0] = "Bax K. Goru";
global.CHAR[characterID, 1] = 31;
global.CHAR[characterID, 2] = 0;

global.CHAR[characterID, 37] = 6; //hair ID
global.CHAR[characterID, 38] = make_color_rgb(110, 90, 62); //hair color
global.CHAR[characterID, 39] = make_color_rgb(70, 40, 25); //eye color

ds_list_clear(global.CHAR[characterID, 49]);
ds_list_clear(global.CHAR[characterID, 50]);

AddItem(characterID, 23);

//Equip(characterID, 0);

AddItem(characterID, 12);
AddItem(characterID, 20);

AddSkill(characterID, 21);