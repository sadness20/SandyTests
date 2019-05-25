/// @description Insert description here
// You can write your code in this editor
depth = -y + 8;

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

	if(mySpeed <= 0.1)
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

if(state != "action" && state != "tomap")
{
	with obj_pers
	{
		if(global.Xkey_state == 1)
		{
			other.state = "action";
			gamestate = "preparationmain";
			laststate = "preparationmain";
			global.glSelect = 0;
			CheckSupports();
			audio_play_sound(sfx_showOptions, 0, 0);
			exit;
		}
		if(global.Ykey_state == 1)
		{
			other.state = "action";
			global.showOptions = 7;

			tempVar15 = gamestate;
			gamestate = "showmenu";
			global.glSelect = 0;
			global.glSelect2 = 0;
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			closeoptions = false;
			audio_play_sound(sfx_showOptions, 0, 0);
					
			global.menuOptions = 0;
					
			global.menuText[global.menuOptions] = "Options";
			global.menuDescription[global.menuOptions] = "Adjust game options.";
			global.menuOptions ++;
			
			global.menuText[global.menuOptions] = "Controls";
			global.menuDescription[global.menuOptions] = "Open the control mapper.";
			global.menuOptions ++;
					
					
			exit;
		}
	}
	
	if(global.rightKey_state > 0)
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
	if(global.leftKey_state > 0)
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
	if(global.upKey_state > 0)
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
	if(global.downKey_state > 0)
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

	if(place_meeting(x, y, obj_campExit))
	{
		if(global.Akey_state == 1)
		{
			state = "tomap";
			with obj_pers
			{
				StopAmb();
				ResetDialogue();
				sys_SetBackgroundFade(-2, 1000, 1000, 500, c_black);
				state = "dialogue";
			}
		}
	}
	if(place_meeting(x, y, obj_prisonerTalk))
	{
		if(global.Akey_state == 1)
		{
			var pr = instance_nearest(x, y, obj_prisonerTalk);
			target = pr.char;
			obj_pers.tempVar14 = pr.char.characterID;
			state = "action";
			audio_play_sound(sfx_showOptions, 0, 0);
			with obj_pers
			{
				gamestate = "sandyjail_interact";
				tempVar = 1;
				
				global.glSelect3 = 0;
				global.glSelect4 = 0;
				global.glSelect5 = 0;
			}
		}
	}
	if(instance_exists(obj_mysticorb))
	{
		if(point_distance(x + 16, y, obj_mysticorb.x, obj_mysticorb.y - 4) < 40)
		{
			if(global.Akey_state == 1)
			{
				state = "action";
				audio_play_sound(sfx_showOptions, 0, 0);
				with obj_pers
				{
					gamestate = "orb_interact";
					tempVar = 1;
				
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					global.glSelect5 = 0;
				}
			}
		}
	}
	if(instance_exists(obj_storagebox))
	{
		if(point_distance(x + 16, y, obj_storagebox.x, obj_storagebox.y) < 16)
		{
			if(global.Akey_state == 1)
			{
				state = "action";
				audio_play_sound(sfx_showOptions, 0, 0);
				with obj_pers
				{
					gamestate = "chest_interact";
					tempVar = 1;
					tempVar2 = 0;
				
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					global.glSelect5 = 0;
				}
			}
		}
	}
}
else
{
	fr = 0;
	index = 0;
	cindex = 0;
		
	cindex = fr;
	footstepTimer = fr;
	
	index += 0.1;
	if(index >= fr + 4)index = fr;
}