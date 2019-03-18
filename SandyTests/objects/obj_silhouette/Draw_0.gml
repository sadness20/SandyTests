/// @description Insert description here
// You can write your code in this editor
if !instance_exists(origin) instance_destroy(); else
{
	surfXPos=origin.x;
	surfYPos=origin.y;

	if!surface_exists(silSurf) //Create surface
	{
	    silSurf=surface_create(38,38); //Dimensions = player sprite dimensions
	}
	surface_set_target(silSurf);//draw to silhouetteSurf
	draw_clear_alpha(c_black,0); //clear surface
	
	var silColor = c_white;
	if(origin.faction == 0)silColor = c_blue; else
	if(origin.faction == 1)silColor = c_red; else
	if(origin.faction == 2)silColor = c_green;
	
	var yr = 0;
	if(origin.terrainBonus == 3)yr -= 8;

	with obj_rockwall_down {if (depth<other.origin.depth)with origin DrawUnit(characterID, cindex, index, x + xx - other.surfXPos, y + yy + ypr + vy - 2 + yr - other.surfYpos, xscale, yscale, c_white, alpha, faction, 0, vy);};
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha); //Important blend mode to draw the silhouette
	gpu_set_fog(1,silColor,0,0); //This set's the color of your silhouette
	//with origin draw_sprite_ext(sprite_index,image_index,x-other.surfXPos,y-other.surfYPos,image_xscale,image_yscale,0,-1,0.5);   
	with origin DrawUnit(characterID, cindex, index, x + xx - other.surfXPos, y + yy + ypr + vy - 2 + yr - other.surfYpos, xscale, yscale, c_white, alpha, faction, 0, vy);
	draw_set_alpha(0);
	draw_rectangle(x,y,38,38,0);
	draw_set_alpha(1);
	gpu_set_fog(0,silColor,0,0); //Stop coloring the sprite   
	gpu_set_blendmode(bm_normal); //reset blend mode
	surface_reset_target();//reset draw target

	draw_surface_ext(silSurf,surfXPos,surfYPos,1,1,0,-1,1); //the the silhouette surface
}