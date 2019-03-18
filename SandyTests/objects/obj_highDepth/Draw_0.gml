with obj_game
{
	switch(gamestate)
	{
	    case "selected":
	    {
	        if(global.pathDraw > 1)
	        {
		        for(var i = 1; i < global.pathDraw - 1; i ++)
		        {
		            var node = global.pathArray[i];
            
		            var pastcurrent = global.pathArray[i - 1];
		            var current = global.pathArray[i];
		            var nextcurrent = global.pathArray[i + 1];
            
		            var ind = 0;
					if(nextcurrent == noone || current == noone)exit;
			        var dir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
			        var dir2 = point_direction(nextcurrent.x, nextcurrent.y, current.x, current.y);
            
		            if((dir == 90 && dir2 == 270) || dir == 270 && dir2 == 90)
		            {
		            ind = 2;
		            } else
		            if((dir == 0 && dir2 == 180) || dir == 180 && dir2 == 0)
		            {
		            ind = 1;
		            } else
		            if(dir == 180 && dir2 == 270) || (dir == 270 && dir2 == 180)
		            {
		            ind = 6;
		            } else
		            if(dir == 0 && dir2 == 270) || (dir == 270 && dir2 == 0)
		            {
		            ind = 5;
		            } else
		            if(dir == 180 && dir2 == 90) || (dir2 == 180 && dir == 90)
		            {
		            ind = 3;
		            } else
		            if(dir == 0 && dir2 == 90) || (dir2 == 0 && dir == 90)
		            {
		            ind = 4;
		            }
            
		            draw_sprite_ext(spr_arrow, ind, node.gridX * global.gridSize + global.gridSize / 2, node.gridY * global.gridSize + global.gridSize / 2, 1, 1, 0, c_white, 0.75);
		        }
		        var current = global.pathArray[global.pathDraw - 1];
		        var pastcurrent = global.pathArray[global.pathDraw - 2];
		        var pdir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
		        draw_sprite_ext(spr_arrow, 0, current.gridX * global.gridSize + global.gridSize / 2, current.gridY * global.gridSize + global.gridSize / 2, 1, 1, pdir, c_white, 0.75);
			
				if(pdir != tcdir)
				{
					tcdir = pdir;
			
					var st = (tindex - tcindex);
			
					if(pdir == 180)tcindex = 4 * 1;
					if(pdir == 0)tcindex = 4 * 2;
					if(pdir == 270)tcindex = 4 * 3;
					if(pdir == 90)tcindex = 4 * 4;
		
					tindex = tcindex + st;
				}

				tindex += 0.175;
				if(tindex >= tcindex + 4)
				{
					tindex = tcindex;
				}
				
				with global.selectedActor DrawUnit(characterID, other.tcindex, other.tindex,  current.gridX * global.gridSize + xpr, current.gridY * global.gridSize + ypr + vy - 2, 1, 1, c_white, 0.75, faction, 0, vy);
			
				var current = global.pathArray[1];
		        var pastcurrent = global.pathArray[0];
		        var pdir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
				var xx = 0, yy = 0;
				if(pdir == 0)xx = 7;
				if(pdir == 180)
				{
					xx = -7;
					yy ++;
				}
				if(pdir == 90)
				{
					yy = -7;
					xx --;
				}
				if(pdir == 270)yy = 7; 
				draw_sprite_ext(spr_arrow, 7, xx + pastcurrent.gridX * global.gridSize + global.gridSize / 2, yy + pastcurrent.gridY * global.gridSize + global.gridSize / 2, 1, 1, pdir, c_white, 0.75);
			}
			if(global.target != noone)
			{
				var cell = global.target;
				var indd = 1;
				if(allyenemy == 1)indd = 5;
				draw_sprite_ext(spr_grid32, indd, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
			}
	    }
	    break;
		case "select target":
		{
			if(global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] < 2)
			{
				for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.cellAttack); i ++)
				{
					var cell = ds_list_find_value(global.selectedActor.standingNode.cellAttack, i);
					var dis = FindDistance(cell.gridX, cell.gridY, global.selectedActor.gridX, global.selectedActor.gridY);
					
					if(dis >= global.selectedActor.minRange && dis <= global.selectedActor.maxRange)
					{
						if(global.target != cell)draw_sprite_ext(spr_grid32, 2, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
						else draw_sprite_ext(spr_grid32, 1, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
					}
				}
			}
			if(global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] >= 2)
			{
				for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.cellHeal); i ++)
				{
					var cell = ds_list_find_value(global.selectedActor.standingNode.cellHeal, i);
					var dis = FindDistance(cell.gridX, cell.gridY, global.selectedActor.gridX, global.selectedActor.gridY);
					
					if(dis >= global.selectedActor.minRange && dis <= global.selectedActor.maxRange)
					{
						if(global.target != cell)draw_sprite_ext(spr_grid32, 6, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
						else draw_sprite_ext(spr_grid32, 5, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
					}
				}
			}
			/*
			if(global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] >= 2)
			{
				for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.cellHeal); i ++)
				{
					var cell = ds_list_find_value(global.selectedActor.standingNode.cellHeal, i);
					var dis = FindDistance(cell.gridX, cell.gridY, global.selectedActor.gridX, global.selectedActor.gridY);
				
					if(dis >= global.selectedActor.minRangeAlly && dis <= global.selectedActor.minRangeAlly)
					{
						if(global.target != cell)draw_sprite_ext(spr_grid32, 6, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
						else draw_sprite_ext(spr_grid32, 5, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
					}
				}
			}
			*/
		}
		break;
		case "trading":
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var cell = ds_list_find_value(tradersList, i);
				if(global.targetOp != cell)draw_sprite_ext(spr_grid32, 6, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
				else draw_sprite_ext(spr_grid32, 5, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
			}
		}
		break;
	}
	
	if(gamestate == "select target dir")
	{
		if(global.pathDraw > 1)
	        {
		        for(var i = 1; i < global.pathDraw - 1; i ++)
		        {
		            var node = global.pathArray[i];
            
		            var pastcurrent = global.pathArray[i - 1];
		            var current = global.pathArray[i];
		            var nextcurrent = global.pathArray[i + 1];
            
		            var ind = 0;
            
		            var dir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
		            var dir2 = point_direction(nextcurrent.x, nextcurrent.y, current.x, current.y);
            
		            if((dir == 90 && dir2 == 270) || dir == 270 && dir2 == 90)
		            {
		            ind = 2;
		            } else
		            if((dir == 0 && dir2 == 180) || dir == 180 && dir2 == 0)
		            {
		            ind = 1;
		            } else
		            if(dir == 180 && dir2 == 270) || (dir == 270 && dir2 == 180)
		            {
		            ind = 6;
		            } else
		            if(dir == 0 && dir2 == 270) || (dir == 270 && dir2 == 0)
		            {
		            ind = 5;
		            } else
		            if(dir == 180 && dir2 == 90) || (dir2 == 180 && dir == 90)
		            {
		            ind = 3;
		            } else
		            if(dir == 0 && dir2 == 90) || (dir2 == 0 && dir == 90)
		            {
		            ind = 4;
		            }
            
		            draw_sprite_ext(spr_arrow, ind, node.gridX * global.gridSize + global.gridSize / 2, node.gridY * global.gridSize + global.gridSize / 2, 1, 1, 0, c_white, 0.75);
		        }
		        var current = global.pathArray[global.pathDraw - 1];
		        var pastcurrent = global.pathArray[global.pathDraw - 2];
		        var pdir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
		        draw_sprite_ext(spr_arrow, 0, current.gridX * global.gridSize + global.gridSize / 2, current.gridY * global.gridSize + global.gridSize / 2, 1, 1, pdir, c_white, 0.75);
			
				if(pdir != tcdir)
				{
					tcdir = pdir;
			
					var st = (tindex - tcindex);
			
					if(pdir == 180)tcindex = 4 * 1;
					if(pdir == 0)tcindex = 4 * 2;
					if(pdir == 270)tcindex = 4 * 3;
					if(pdir == 90)tcindex = 4 * 4;
		
					tindex = tcindex + st;
				}

				tindex += 0.175;
				if(tindex >= tcindex + 4)
				{
					tindex = tcindex;
				}

				with global.selectedActor DrawUnit(characterID, other.tcindex, other.tindex,  current.gridX * global.gridSize + xpr, current.gridY * global.gridSize + ypr + vy - 2, 1, 1, c_white, 0.75, faction, 0, vy);
			
				var current = global.pathArray[1];
		        var pastcurrent = global.pathArray[0];
		        var pdir = point_direction(pastcurrent.x, pastcurrent.y, current.x, current.y);
				var xx = 0, yy = 0;
				if(pdir == 0)xx = 7;
				if(pdir == 180)xx = -7;
				if(pdir == 90)yy = -7; 
				if(pdir == 270)yy = 7; 
				draw_sprite_ext(spr_arrow, 7, xx + pastcurrent.gridX * global.gridSize + global.gridSize / 2, yy + pastcurrent.gridY * global.gridSize + global.gridSize / 2, 1, 1, pdir, c_white, 0.75);
			}
			var indd = 1;
			if(allyenemy == 1)indd = 5;
			if(global.target != noone)
			{
				var cell = global.target;
				if(global.hoverNode == global.target)draw_sprite_ext(spr_grid32, indd, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
				else draw_sprite_ext(spr_grid32, indd + 1, cell.gridX * global.gridSize, cell.gridY * global.gridSize, 1, 1, 0, c_white, 0.5 + obj_pers.sinSize / 4);
			}
	    }
}