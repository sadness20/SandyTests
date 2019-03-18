/// @description Insert description here
// You can write your code in this editor


if(global.transitionCombat <= 0 && obj_game.inCombat == 0 && global.controlsType > 0 && (obj_game.state == "game" || obj_game.state == "preparation"))
{
	if(global.Rshoulder_state == 1 && global.debug == false)
	{
		if(global.targetZoom < 2)global.targetZoom += 0.5; else global.targetZoom = 1;
	}
	if(global.zoom > global.targetZoom) global.zoom -= 1 / 20;
	if(global.zoom < global.targetZoom) global.zoom += 1 / 20;
	camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
}

var camerawid = (global.wid / global.zoom) / 2;
var camerahei = (global.hei / global.zoom) / 2;

if(obj_pers.tempVar7 == 1 && global.optionState[7] == 1)exit;

if(global.optionState[5] == 1)
{
	if(obj_game.state == "game" || obj_game.state == "preparation" || obj_game.state == "idle")
	{
		var dis = point_distance(x, y, xTo, yTo);
		var dir = point_direction(x, y, xTo, yTo);
		var spd = 0;
	
		if(global.controlsType == 0)
		{
			spd = median(0, dis / 5, 15)
		}
		if(global.controlsType > 0)
		{
			spd = median(0, dis / 10, 20)
			if(obj_game.gamestate == "select" || obj_game.gamestate == "selected" || obj_game.gamestate == "fortheal")
			{
				spd = median(0, dis / 20, 12)
			}
		}
		var cond = true;
		if(obj_game.gamestate == "prepmap" && obj_game.tempVar != noone)cond = false;
		if(cond && global.transitionCombat <= 0 && obj_game.gamestate != "showstats" && global.showOptions < 7)
		{
			if(global.phase == 0 || obj_game.gamestate == "prepmap")
			{
				if(global.controlsType == 0)
				{
					var xm = 0, ym = 0;
					if(keyboard_check(ord("D")) && !keyboard_check(ord("A")))xm = 1;
					if(keyboard_check(ord("A")) && !keyboard_check(ord("D")))xm = -1;
					if(keyboard_check(ord("S")) && !keyboard_check(ord("W")))ym = 1;
					if(keyboard_check(ord("W")) && !keyboard_check(ord("S")))ym = -1;
			
					if(mouse_check_button_pressed(mb_middle))
					{
						holdX = mouse_x;
						holdY = mouse_y;
					}
			
					if(mouse_check_button(mb_middle))
					{
						xTo = x + (holdX - mouse_x);
						yTo = y + (holdY - mouse_y);
					}

					if(xm != 0)xTo = x + lengthdir_x(global.scrollSpeed, radtodeg(arctan2(-ym, xm)));
					if(ym != 0)yTo = y + lengthdir_y(global.scrollSpeed, radtodeg(arctan2(-ym, xm)));

					if(global.selectedActor != noone && keyboard_check(vk_space))
					{
						xTo = global.selectedActor.x + 16;
						yTo = global.selectedActor.y + 32;
					}
				}
				if(global.target != noone && obj_game.gamestate == "select target dir")
				{
					xTo = global.target.x + 16;
					yTo = global.target.y + 32;
				}
				if(obj_game.gamestate == "chooseweapon" || obj_game.gamestate == "trading" || obj_game.gamestate == "tradewindow")
				{
					xTo = global.selectedActor.x + 16;
					yTo = global.selectedActor.y + 32;
				}
			}
			else if(global.selectedActor != noone)
			{
				xTo = global.selectedActor.x + 16;
				yTo = global.selectedActor.y + 32;
			}
			if(obj_game.healUnit != noone)
			{
				xTo = obj_game.healUnit.x + 16;
				yTo = obj_game.healUnit.y + 32;
			}
		} else spd = median(0, dis / 20, 8);
	
		if (global.transitionCombat <= 0)
		{
			if(x < 96)x = 96;
			if(y < 32)y = 32;
			if(x > room_width - 96)x = room_width - 96;
			if(y > room_height + 64)y = room_height + 64;
			camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
		}
		
		if(dis >= 0.5)
		{
			x += lengthdir_x(spd, dir);
			y += lengthdir_y(spd, dir);
		}
		if(global.transitionCombat > 0)
		{
			x = global.combatX;
			y = global.combatY;
			camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
		}
	}

	if(obj_game.inCombat == 1)
	{
		var dis = point_distance(x, y, xTo, yTo);
		var dir = point_direction(x, y, xTo, yTo);
		var spd = median(0, dis / 5, 10)
		if(dis >= 0.5)
		{
			x += lengthdir_x(spd, dir);
			y += lengthdir_y(spd, dir);
		}
	
		xTo = global.combatX;
		yTo = global.combatY;

		camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
	}
}
else
{
	if(obj_game.state == "game" || obj_game.state == "preparation")
	{
		if(global.camTarget != noone)
		{
			var dis = point_distance(x, y, global.camTarget.x, global.camTarget.y);
			var dir = point_direction(x, y, global.camTarget.x, global.camTarget.y);
			var spd = median(0, dis / 20, 12);

			if(dis >= 0.5)
			{
				x += lengthdir_x(spd, dir);
				y += lengthdir_y(spd, dir);
			}
		}
		else
		{
			if(global.phase == 0)
			{
				var xoff = 80, yoff = 50, spd = 0;
				if(xTo > x + xoff)
				{
					spd = (xTo - (x + xoff)) * 0.1;
					if(spd > 0.5)x += spd;
				}
				if(xTo < x - xoff)
				{
					spd = (xTo - (x - xoff)) * 0.1;
					if(spd < -0.5)x += spd;
				}
				if(yTo > y + yoff)
				{
					spd = (yTo - (y + yoff)) * 0.1;
					if(spd > 0.5)y += spd;
				}
				if(yTo < y - yoff)
				{
					spd = (yTo - (y - yoff)) * 0.1;
					if(spd < -0.5)y+= spd;
				}
			}
			else
			{
				if(global.selectedActor != noone)
				{
					var dis = point_distance(x, y, global.selectedActor.x, global.selectedActor.y);
					var dir = point_direction(x, y, global.selectedActor.x, global.selectedActor.y);
					var spd = median(0, dis / 5, 15)

					if(dis >= 0.5)
					{
						x += lengthdir_x(spd, dir);
						y += lengthdir_y(spd, dir);
					}
				}
			}
		}



		if (global.transitionCombat <= 0)
		{
			if(x < 96)x = 96;
			if(y < 32)y = 32;
			if(x > room_width - 96)x = room_width - 96;
			if(y > room_height + 64)y = room_height + 64;
			camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
		}
		else
		{
			x = global.combatX;
			y = global.combatY;
			camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
		}
	
	}

	if(obj_game.inCombat == 1)
	{
		var dis = point_distance(x, y, xTo, yTo);
		var dir = point_direction(x, y, xTo, yTo);
		var spd = median(0, dis / 5, 10)
		if(dis >= 0.5)
		{
			x += lengthdir_x(spd, dir);
			y += lengthdir_y(spd, dir);
		}
	
		xTo = global.combatX;
		yTo = global.combatY;
		
		camera_set_view_pos(global.camera, x - camerawid, y - camerahei);
	}
}