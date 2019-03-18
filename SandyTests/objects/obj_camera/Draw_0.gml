/// @description Insert description here
// You can write your code in this editor


if(global.transitionCombat <= 0 && obj_game.inCombat == 0)
{
	draw_set_alpha(0.08);
	draw_set_color(gridColor);
	for(var i = 0; i <= global.mapWidth; i += 1)
	{
		draw_line(i * global.gridSize, 0, i * global.gridSize, global.mapHeight * global.gridSize);
	}
	for(var i = 0; i <= global.mapHeight; i += 1)
	{
		draw_line(0, i * global.gridSize, global.mapWidth * global.gridSize, i * global.gridSize);
	}
	
	draw_set_alpha(0.08);
	draw_set_color(gridColor);
	for(var i = 0; i <= global.mapWidth; i += 1)
	{
		draw_line(i * global.gridSize - 0.5, 0, i * global.gridSize - 0.5, global.mapHeight * global.gridSize);
	}
	for(var i = 0; i <= global.mapHeight; i += 1)
	{
		draw_line(0, i * global.gridSize - 0.5, global.mapWidth * global.gridSize, i * global.gridSize - 0.5);
	}

	draw_set_alpha(1);
}
