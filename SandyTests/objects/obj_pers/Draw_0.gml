/// @description Insert description here
// You can write your code in this editor
if(showMap)
{
	var map = global.REGION[global.currentRegion, 1];
	var xA =  0, yA = 0;
	draw_sprite(map, 0, xA, yA);
	draw_set_halign(fa_middle);
	
	
	if(ds_list_size(global.mapUnlock) > 0)
	{
		var mapSize = guiTimer5 / 60;
		var mapAlpha = 0.55 * (guiTimer5 / 60);
		var ind = 0;
		var map = tempVar11;
		if(global.MAP[map, 10] == 2 || global.MAP[map, 10] == 4)ind = 1;
		if(global.MAP[map, 10] == 3)ind = 2;
		
		draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.4 + sinVal2 * 0.1) * mapSize, (0.4 + sinVal2 * 0.1) * mapSize, 0, c_white, 1 * mapAlpha);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.8 + sinVal2 * 0.2) * mapSize, (0.8 + sinVal2 * 0.2) * mapSize, 0, c_white, 0.3 * mapAlpha);
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.8 + sinVal2 * 0.2) * mapSize, (0.8 + sinVal2 * 0.2) * mapSize, 0, c_white, 0.5 * mapAlpha);
	}
	
	
	for(var i = 0; i < ds_list_size(global.REGION[global.currentRegion, 2]); i ++)
	{
		var map = ds_list_find_value(global.REGION[global.currentRegion, 2], i);
		if(global.MAP[map, 8] == true)
		{
			var mapSize = 1;
			var mapAlpha = 0.55;
			var ind = 0;
			
			if(global.MAP[map, 10] == 2 || global.MAP[map, 10] == 4)ind = 1;
			if(global.MAP[map, 10] == 3)ind = 2;
			
			//draw_text(global.MAP[map, 6] + xA, global.MAP[map, 7] + 4 + yA, global.MAP[map, 10]);
			
			if(tempVar13 == i)
			{
				mapSize = 1.5;
				mapAlpha = 1;
				draw_set_font(ft_large);
				draw_set_color(c_black);
				draw_text(global.MAP[map, 6] + xA, global.MAP[map, 7] + 6 + yA, global.MAP[map, 0]);
				draw_set_color(c_white);
				draw_text(global.MAP[map, 6] + 1 + xA, global.MAP[map, 7] + 7 + yA, global.MAP[map, 0]);
			}
			else
			{
				draw_set_alpha(mapAlpha);
				draw_set_font(ft_small);
				draw_set_color(c_black);
				draw_text(global.MAP[map, 6] + xA, global.MAP[map, 7] + 4 + yA, global.MAP[map, 0]);
				draw_set_color(c_white);
				draw_text(global.MAP[map, 6] + 1 + xA, global.MAP[map, 7] + 5 + yA, global.MAP[map, 0]);
				draw_set_alpha(1);
			}
			draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.4 + sinVal2 * 0.1) * mapSize, (0.4 + sinVal2 * 0.1) * mapSize, 0, c_white, 1 * mapAlpha);
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.8 + sinVal2 * 0.2) * mapSize, (0.8 + sinVal2 * 0.2) * mapSize, 0, c_white, 0.3 * mapAlpha);
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(spr_stageSelect, ind, global.MAP[map, 6] + xA, global.MAP[map, 7] + yA, (0.8 + sinVal2 * 0.2) * mapSize, (0.8 + sinVal2 * 0.2) * mapSize, 0, c_white, 0.5 * mapAlpha);
		}
	}
}