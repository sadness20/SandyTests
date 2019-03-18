var dir = argument[0];

if(dir != cdir)
{
	cdir = dir;
			
	var st = (index - cindex);
			
	if(dir == 180)cindex = 4 * 1;
	if(dir == 0)cindex = 4 * 2;
	if(dir == 270)cindex = 4 * 3;
	if(dir == 90)cindex = 4 * 4;
			
	index = cindex + st;
}
		
if(state != "combat delay")
{
	footstepTimer ++;
	if(footstepTimer > global.CLASS[global.CHAR[characterID, 3], 8])
	{
		with(obj_unit)
		{
			footstepTimer = 0;
		}
		audio_play_sound(global.CLASS[global.CHAR[characterID, 3], 7], 0, 0);
		footstepTimer = 0;
	}
	var xx = 0, yy = 0;
	if(footstepTimer == 0 && global.CLASS[global.CHAR[characterID, 3], 5] == 0)
	{
		if(dir == 0 || dir == 180)yy = -1;
		if(dir == 90 || dir == 270)xx = -1;
		part_type_orientation(global.ptstep,dir,dir,0,0,0);
		part_particles_create(global.psmain,x + 16 + xx,y + 24 + yy,global.ptstep,1);
	}
	if(footstepTimer == 4 && global.CLASS[global.CHAR[characterID, 3], 5] == 0)
	{
		if(dir == 0 || dir == 180)yy = 1;
		if(dir == 90 || dir == 270)xx = 1;
		part_type_orientation(global.ptstep,dir,dir,0,0,0);
		part_particles_create(global.psmain,x + 16 + xx,y + 24 + yy,global.ptstep,1);
	}
}
		
index += 0.175;
if(index >= cindex + 4)
{
	index = cindex;
}