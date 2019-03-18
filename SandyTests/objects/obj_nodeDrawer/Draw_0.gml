/// @description Insert description here
// You can write your code in this editor

if((global.phase == 0 && obj_game.state == "game" && obj_game.gamestate != "attack" && obj_game.gamestate != "showobj" && obj_game.gamestate != "showobj2") || obj_pers.gamestate == "prepmap")
{
	if(global.hoverNode != noone && (global.showOptions == 0 || global.showOptions == 3 || global.showOptions == 6))
	{
		xTo = global.hoverNode.gridX * global.gridSize;
		yTo = global.hoverNode.gridY * global.gridSize;
		
		if(global.target != noone)
		{
			xTo = global.target.gridX * global.gridSize;
			yTo = global.target.gridY * global.gridSize;
		}
		if(global.targetOp != noone)
		{
			xTo = global.targetOp.gridX * global.gridSize;
			yTo = global.targetOp.gridY * global.gridSize;
		}
		draw_sprite_ext(sprite_index, 0, x + 16, y + 17, 1 + sin(obj_pers.selectSize) / 10, 1 + sin(obj_pers.selectSize) / 10, image_angle, obj_game.col, 1);
		draw_sprite_ext(sprite_index, 1, x + 16, y + 17, 1 + sin(obj_pers.selectSize) / 10, 1 + sin(obj_pers.selectSize) / 10, image_angle, obj_game.col2, 1);
	}
	/*
	if(global.hoverNode != noone && global.showOptions == 3)
	{
		var xTo = -1, yTo = -1;
		if(global.target != noone)
		{
			xTo = global.target.occupant.x;
			yTo = global.target.occupant.y;
		}
		if(xTo != -1)
		{
			draw_sprite_ext(sprite_index, 0, xTo + 16, yTo + 17, 1 + sin(obj_pers.selectSize) / 10, 1 + sin(obj_pers.selectSize) / 10, image_angle, obj_game.col, 1);
			draw_sprite_ext(sprite_index, 1, xTo + 16, yTo + 17, 1 + sin(obj_pers.selectSize) / 10, 1 + sin(obj_pers.selectSize) / 10, image_angle, obj_game.col2, 1);
		}
	
	*/
}