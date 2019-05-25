gridX = floor(x / global.gridSize);
gridY = floor(y / global.gridSize);
x = gridX * global.gridSize;
y = gridY * global.gridSize;
global.map[gridX, gridY].occupant = id;
standingNode = global.map[gridX, gridY];
	
characterID = 2;
faction = 1;

isBoss = 1;

global.CHAR[characterID, 6] = 400; //hp
global.CHAR[characterID, 7] = 35; //str
global.CHAR[characterID, 8] = 35; //mag
global.CHAR[characterID, 9] = 35; //skill
global.CHAR[characterID, 10] = 35; //spd
global.CHAR[characterID, 11] = 35; //lck
global.CHAR[characterID, 12] = 125; //def
global.CHAR[characterID, 13] = 125; //res