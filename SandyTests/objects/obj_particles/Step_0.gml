/// @description Insert description here
// You can write your code in this editor

if(global.currentMap != -1 && global.optionState[6])
{
	if (global.CLIMATE[global.MAP[global.currentMap, 4], 1] != -1)
	{
	    part_particles_create(global.psmain,camera_get_view_x(global.camera)-(global.window_w * 2) / global.zoom - 128+random((global.window_w * 2) / global.zoom+256),-256+(global.window_h * 2) / global.zoom,global.CLIMATE[global.MAP[global.currentMap, 4], 1],1);
	    //part_particles_create(global.psmain,view_xview-512+random(view_wview+256),-256+view_yview,global.ptSnow,1);
	    //part_particles_create(global.psmain,view_xview-512+random(view_wview+256),-256+view_yview,global.ptSnow2,1);
	    //part_particles_create(global.psmain,view_xview-512+random(view_wview+256),-256+view_yview,global.ptSnow2,1);
	}
	for(var i = 0; i < 2; i ++)
	{
		var particle1 = global.CLIMATE[global.MAP[global.currentMap, 4], 3 + i];
		if (particle1 != -1 && par[i] == 1)
		{
			switch(particle1)
			{
				case 0:
					repeat(40)
					{
					    instance_create_depth(camera_get_view_x(global.camera) - 64 + random((global.window_w * 2) / global.zoom + 128), camera_get_view_y(global.camera) + random((global.window_h * 2) / global.zoom), -8000, obj_raindrop);
					}
					par[i] = 0;
				break;
				case 1:
					repeat(40)
					{
					    instance_create_depth(camera_get_view_x(global.camera) - 64 + random((global.window_w * 2) / global.zoom + 128), camera_get_view_y(global.camera) + random((global.window_h * 2) / global.zoom), -8000, obj_snow);
					}
					par[i] = 0;
				break;
				case 2:
					alarm[0] = 5;
					par[i] = 0;
				break;
			}
		}
	}
}