/// @description Insert description here
// You can write your code in this editor
if(state != "action" && state != "tomap")
{
	if(place_meeting(x, y, obj_campExit))
	{
		draw_sprite(spr_actionBox, 0, x - camera_get_view_x(global.camera) + 14, y - camera_get_view_y(global.camera) - 6);
	}

	if(place_meeting(x, y, obj_prisonerTalk))
	{
		draw_sprite(spr_actionBox, 1, x - camera_get_view_x(global.camera) + 14, y - camera_get_view_y(global.camera) - 6);
	}
	if(instance_exists(obj_mysticorb))
	{
		if(point_distance(x + 16, y, obj_mysticorb.x, obj_mysticorb.y - 4) < 40)
		{
			draw_sprite(spr_actionBox, 1, x - camera_get_view_x(global.camera) + 14, y - camera_get_view_y(global.camera) - 6);
		}
	}
	if(instance_exists(obj_storagebox))
	{
		if(point_distance(x + 16, y, obj_storagebox.x, obj_storagebox.y) < 16)
		{
			draw_sprite(spr_actionBox, 1, x - camera_get_view_x(global.camera) + 14, y - camera_get_view_y(global.camera) - 6);
		}
	}
}