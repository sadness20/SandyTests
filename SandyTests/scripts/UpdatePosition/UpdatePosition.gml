var char = argument[0];
var tarNode = argument[1];

tarNode.occupant = char;
char.standingNode = tarNode;
char.gridX = tarNode.gridX;
char.gridY = tarNode.gridY;
char.x = char.gridX * global.gridSize;
char.y = char.gridY * global.gridSize;