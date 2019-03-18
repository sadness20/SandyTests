gridX = floor(x / global.gridSize);
gridY = floor(y / global.gridSize);
x = gridX * global.gridSize;
y = gridY * global.gridSize;
global.map[gridX, gridY].occupant = id;
standingNode = global.map[gridX, gridY];
	
characterID = 55;
faction = 1;