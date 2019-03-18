/// @description Insert description here
// You can write your code in this editor
depth = -y + 8;

if(free && alarm[0] == -1)
{
	alarm[0] = 10;
}
if(dis)
{
	alp -= 1 / 60;
	powerMult -= 1 / 60;
}
if(alp < 0)
{
	instance_destroy();
}

switch(state)
{
	case "idle":
	
		cindex = fr;
		footstepTimer = fr;
	
		index += 0.1;
		if(index >= fr + 4)index = fr;
		
	break;
	
	case "moving":
	
	cindex = fr;
	footstepTimer = 0;
	
	index += 0.2;
	if(index >= fr + 4)index = fr;
	
	var moveFriction = movespeed / 12;
	hspd = sign(hspd) * median(0, abs(hspd) - moveFriction, abs(hspd));
	vspd = sign(vspd) * median(0, abs(vspd) - moveFriction * 0.85, abs(vspd * 0.85));
    
	var mySpeed = sqrt(abs(hspd * hspd) + abs(vspd * vspd));

	if(mySpeed <= 0)
	{
	    state = "idle";
		fr = 0;
		index = 0;
		cindex = 0;
	}

	var angle = radtodeg(arctan2(-ydir, xdir));

	var ms = movespeed;
	var accel = movespeed / 6;
	if(xdir != 0 && abs(hspd) < ms) hspd += lengthdir_x(accel, angle);
	if(ydir != 0 && abs(vspd) < ms) vspd += lengthdir_y(accel, angle);

	if(!place_meeting(x + hspd, y, obj_solid_parent))
	{
	    x += hspd;
	}
	if(!place_meeting(x, y + vspd, obj_solid_parent))
	{
	    y += vspd;
	}
	
	break;
}

if(global.debug)exit;

xdir = 0;
ydir = 0;
if(hmove > 0)
{
	state = "moving";
	
	if(fr != 8)
	{
		fr = 8;
		index = 8;
		cindex = 8;
	}
	xdir = 1;
}
if(hmove < 0)
{
	state = "moving";
	
	if(fr != 4)
	{
		fr = 4;
		index = 4;
		cindex = 4;
	}
	xdir = -1;
}
if(vmove < 0)
{
	state = "moving";
	
	if(fr != 16 && xdir == 0)
	{
		fr = 16;
		index = 16;
		cindex = 16;
	}
	ydir = -1;
}
if(vmove > 0)
{
	state = "moving";
	
	if(fr != 12 && xdir == 0)
	{
		fr = 12;
		index = 12;
		cindex = 12;
	}
	ydir = 1;
}