
/// @description Insert description here
// You can write your code in this editor

var anim = 0;

combatvy += vspd;
if(combatvy < 0 && global.CLASS[global.CHAR[characterID, 3], 6] == 0)vspd += 0.3;
if(combatvy >= 0)vspd = 0;


switch(state)
{
	case "preparation":
	{
		cindex = 0;
		cdir = -1;
		//footstepTimer = 0;
	
		index += 0.1;
		if(index >= 4)index = 0;
	}
	break;
	case "create":
		
		/*
		if(faction > 0)
		{
			
			if(characterID == 9)
			{
				AddItem(characterID, 11);
			} else
			if(characterID == 5)
			{
				AddItem(characterID, 5);
			}
			else if(characterID == 6)
			{
				AddItem(characterID, 7);
			}
			else
			{
				AddItem(characterID, 3);
			}
			
			EquipFirstWeapon(id);
			MoveEquipTop(characterID);
		}
		*/
		
		vy = global.CLASS[global.CHAR[characterID, 3], 5];
		
		MAXMP = global.CHAR[characterID, 32];
		MP = MAXMP;
	
		MAXHP = global.CHAR[characterID, 6];
		HP = MAXHP;
		
		MAXSP = global.CHAR[characterID, 70];
		SP = MAXSP;
		
		
		//set stats
		
		MAXSTR = global.CHAR[characterID, 7]; //str
		STR = MAXSTR;
		MAXMAG = global.CHAR[characterID, 8]; //mag
		MAG = MAXMAG;
		MAXSKILL = global.CHAR[characterID, 9]; //skill
		SKILL = MAXSKILL;
		MAXSPD = global.CHAR[characterID, 10]; //spd
		SPD = MAXSPD;
		MAXLCK = global.CHAR[characterID, 11]; //lck
		LCK = MAXLCK;
		MAXDEF = global.CHAR[characterID, 12] ; //def
		DEF = MAXDEF;
		MAXRES = global.CHAR[characterID, 13]; //res
		RES = MAXRES;
		
		for(var i = 0; i < ds_list_size(global.CHAR[characterID, 34]); i ++)
		{
			var skill = ds_list_find_value(global.CHAR[characterID, 34], i);
			if(global.SKILL[skill, 4] == 50)hasSkill[global.SKILL[skill, 5]] = 1;
		}
		
		UpdateStatsSwitch();
		//if(standingNode != -1)TerrainBonus(id, standingNode);
		
		//show_message(characterID);
		CalcRanges(id, 1);
		//show_message(characterID);
		var wep = global.CHAR[characterID, 44];
		if(wep != -1 && global.ITEM[wep, 14] < 2 && CanUse(characterID, wep))lastWeapon = global.CHAR[characterID, 56];
		
		if(characterID == 1)
		{
			lightpower=150;
			lightalpha=40;
			lightcolor=make_color_rgb(160, 255, 235);
			lightjitter=0;

			lightxpos=0;
			lightypos=-30;

			lighttype=spr_light;
		}
		
		state = "preparation";
		
		break;
	case "idle":
		cindex = 0;
		cdir = -1;
		footstepTimer = 0;
		x = gridX * global.gridSize;
		y = gridY * global.gridSize;
	
		index += 0.1;
		if(index >= 4)index = 0;
		break;
		
	case "selected":
		cindex = 20;
		cdir = -1;
		footstepTimer = 0;
	
		index += 0.175;
		if(index >= 24)index = 20;
		break;
		
	case "begin path":
		path_start(movementPath, global.CLASS[global.CHAR[characterID, 3], 9], 0, true);

		state = "moving";
		break;
	case "moving":
	{
		depth = -y + 24;
		
		MoveAnimate(direction);
		
		break;
	}
	case "rein":
	{
		direction = point_direction(x, y, gridX * global.gridSize, gridY * global.gridSize);
		speed = global.CLASS[global.CHAR[characterID, 3], 9];
		
		if(point_distance(x, y, gridX * global.gridSize, gridY * global.gridSize) <= speed)
		{
			speed = 0;
			state = "create";
			x = gridX * global.gridSize;
			y = gridY * global.gridSize;
			
			obj_pers.tempVar11 = 0;

			with obj_game gamestate = "reinnext";
			if(obj_game.reinScene == 1)obj_game.reinScene = 2;
		}
		
		MoveAnimate(direction);
		
		break;
	}
	case "combat delay":
	{
		MoveAnimate(direction);
		
		delay ++;
		if(delay > 20)
		{
			state = "idle";
			BeginCombat(cTarget, id);
			
			delay = 0;
		}
		
		break;
	}
	case "begin attack":
	{
		var anim = global.ITEM[weapon, 9];
		var subtype = global.ITEM[weapon, 15];
		htlg = 0;
		
		if(calc == false)
		{
			calc = true;
			var crit = floor(random(101));
			if(crit < CRITd)
			{
				critd = true;
				maxhitLag = 15 + htlg;
			}else critd = false;
			if(global.optionState[4] == 1)
			{
				var hit1 = 1 + floor(random(100));
				var hit2 = 1 + floor(random(100));
				var dodge = (hit1 + hit2) / 2;
			} else
			{
				var dodge = 1 + floor(random(100));
			}
			if(dodge <= HITd)
			{
				dodged = false;
			}else dodged = true;
		}
		
		var check = false;
		if(anim == 10)
		{
			htlg = 5;
		}
		if(anim == 10 && subtype == 10 && target.combatvy >= 0)
		{
			check = true;
		}
		var minDis = 14;
		var spdMult = 1.5;
		if(anim == 20 && subtype == 0 && transformID == -1)
		{
			spdMult *= 0.5;
			transformID = global.TRA[global.ITEM[weapon, 16], 0];
			if(!(global.phase == 1 && global.optionState[7] == 1))audio_play_sound(sfx_magic1, 0, 0);
			var spfx = instance_create_depth(cx + 16, cy + 16 + combatvy, -7000, obj_combatFX2);
			spfx.sprite_index = spr_electricSpell;
		}
		if(combatvy < 0 && anim == 0 && target.combatvy >= 0)check = true;
		if(combatvy < 0 && global.ITEM[weapon, 4] != 14 && check)
		{
			combatvy += 3;
		}
		var dis = abs(cx - target.cx);
		if(anim == 1 || anim == 10)
		{
			minDis = 102;
			spdMult = 0.75;
		}
		if(initCombatfx != -1)
		{
			switch(initCombatfx)
			{
				case 2:
					if(!(global.phase == 1 && global.optionState[7] == 1))
					{
						var xc = 0;
						if(global.char1 == id)xc = 32; else xc = -32;
						if(!(global.phase == 1 && global.optionState[7] == 1))audio_play_sound(sfx_vantage, 0, 0);
						var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
						spfx.sprite_index = spr_vantage;
						spfx.y += 16;
						if(global.char1 == id)
						{
							spfx.xscale = 50;
							spfx.yscale = 50;
							spfx.x -= 16;
						}
						if(global.char2 == id)
						{
							spfx.xscale = -50;
							spfx.yscale = 50;
							spfx.x += 16;
						}
					}
				break;
			}
			var xc = 0;
			spfx = instance_create_depth(cx + 10 + xc, cy + combatvy + 4, -7100, obj_skillFX);
			spfx.image_index = initCombatfx;
			audio_play_sound(sfx_magic1, 0, 0);
			
			initCombatfx = -1;
		}
		if(global.combatDistance == 1 && (anim == 1 || anim == 10))
		{
			returnMult = 0.1;
			minDis = 90;
			if(dis < minDis && !(global.phase == 1 && global.optionState[7] == 1))
			{
				if(global.char1 == id)
				{
					cx -= moveSpeed * spdMult * 0.5;
					MoveAnimate(0);
					if(skid)MoveAnimate(90);
				}
				else
				{
					cx += moveSpeed * spdMult * 0.5;
					MoveAnimate(180);
					if(skid)MoveAnimate(90);
				}
			}
			else
			{
				state = "attacking";
				cindex = 8;
				index = 8;
				mySpell = -1;
				hitLag = -1;
				
				maxhitLag = 5 + htlg;
			}
		}
		else
		{
			returnMult = 1;
			if(dis > minDis && !(global.phase == 1 && global.optionState[7] == 1))
			{
				if(global.char1 == id)
				{
					cx += moveSpeed * spdMult;
					MoveAnimate(0);
					if(skid)MoveAnimate(90);
				}
				else
				{
					cx -= moveSpeed * spdMult;
					MoveAnimate(180);
					if(skid)MoveAnimate(90);
				}
				if(dis < minDis + 64 && target.combatvy < 0 && combatvy >= 0)vspd = target.combatvy / 8;
				if(anim == 0 && dis < minDis + 32 && target.state == "idle" && dodged == true)
				{
					with target
					{
						state = "startdodge";
						index = 16;
					}
				}
			}
			else
			{
				state = "attacking";
				cindex = 8;
				index = 8;
				mySpell = -1;
				hitLag = -1;
				maxhitLag = 5 + htlg;
			}
		}
		break;
	}
	case "attacking":
	{
		var anim = global.ITEM[weapon, 9];
		var subtype = global.ITEM[weapon, 15];
		var dis = abs(cx - target.cx);
		var item = global.ITEM[weapon, 16];
		if(!(global.phase == 1 && global.optionState[7] == 1))
		{
			if(anim == 1 && mySpell == -1)
			{
				mySpell = instance_create_depth(cx, cy + combatvy + 10, -6000, item);
				if(global.char1 == id)mySpell.hspd = 7; else mySpell.hspd = -7;
				mySpell.vspd = -0.75 + ((target.combatvy) / 15) - (combatvy / 15);
			
				if(global.ITEM[weapon, 4] == 13)
				{
					mySpell.image_index = global.ITEM[weapon, 1];
				}
			}
			if(anim == 10 && mySpell == -1)
			{
				if(subtype == 10)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					/*
					audio_play_sound(sfx_magic1, 0, 0);
					var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_iceSpell;
					*/
				}
				if(subtype == 11)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					/*
					audio_play_sound(sfx_magic1, 0, 0);
					var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_electricSpell;
					*/
				}
				if(subtype == 12)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					mySpell.particle = global.ITEM[weapon, 21];
					mySpell.hspd = lengthdir_x(4.5, mySpell.dir);
					mySpell.vspd = lengthdir_y(4.5, mySpell.dir);
				/*
					audio_play_sound(sfx_magic1, 0, 0);
					var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_fireSpell;
					*/
				}
				if(subtype == 13)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					mySpell.particle = global.ITEM[weapon, 21];
					mySpell.hspd = lengthdir_x(4.5, mySpell.dir);
					mySpell.vspd = lengthdir_y(4.5, mySpell.dir);
				/*
					audio_play_sound(sfx_magic1, 0, 0);
					var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_darkSpell;
					*/
				}
				if(subtype == 14)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					mySpell.particle = global.ITEM[weapon, 21];
					mySpell.hspd = lengthdir_x(10, mySpell.dir);
					mySpell.vspd = lengthdir_y(10, mySpell.dir);
				}
				if(subtype == 15)
				{
					mySpell = instance_create_depth(target.cx + 16, target.cy + 16 + target.combatvy, -6000, item);
					mySpell.origin=id;
					/*
					audio_play_sound(sfx_magic1, 0, 0);
					var spfx = instance_create_depth(cx + 16 + xc, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_electricSpell;
					*/
				}
				if(subtype == 16)
				{
					var xc = 0;
					if(global.char1 == id)xc = 32; else xc = -32;
					mySpell = instance_create_depth(cx + xc, cy + 16 + combatvy, -6000, item);
					mySpell.dir = point_direction(cx, cy + combatvy, target.cx, target.cy + target.combatvy);
					mySpell.origin=id;
					mySpell.particle = global.ITEM[weapon, 21];
					mySpell.hspd = lengthdir_x(12, mySpell.dir);
					mySpell.vspd = lengthdir_y(12, mySpell.dir);
				}
			}
		}
		with mySpell
		{
			var rng = 12, dodgerng = 48;
			if(anim == 10)
			{
				rng = 32;
				dodgerng = 64;
			}
			
			if(other.hitLag == -1 && x > other.target.cx + 16 - rng && x < other.target.cx + 16 + rng)
			{
				col = true;
				other.hitLag = other.maxhitLag;
			}
			if(other.hitLag == -1 && x > other.target.cx + 16 - dodgerng && x < other.target.cx + 16 + dodgerng && other.target.state == "idle" && other.dodged == true)
			{
				with other.target
				{
					state = "startdodge";
					index = 16;
				}
			}
		}
		if(anim == 0 && hitLag == -1)hitLag = maxhitLag;
		if(anim == 20 && hitLag == -1)hitLag = maxhitLag;
		if((anim == 1 || anim == 10) && mySpell != -1)
		{
			if(mySpell.life > 15)
			{
			var dis = abs(cx - target.cx);
			var dis2 = startdis;
			if(nattacks > 1)dis2 = 32;
			if(dis < dis2)
			{
				if(global.char1 == id)
				{
					cx -= moveSpeed * 3;
					MoveAnimate(180);
				}
				else
				{
					cx += moveSpeed * 3;
					MoveAnimate(0);
				}
			}
			else
			{
				cindex = 0;
				cdir = -1;
				footstepTimer = 0;
	
				index += 0.1;
				if(index >= 4)index = 0;
			}
		}
		else
		{
			cindex = 0;
			cdir = -1;
			footstepTimer = 0;
	
			index += 0.1;
			if(index >= 4)index = 0;
			

		}
		}
		if(hitLag > 0 || (global.phase == 1 && global.optionState[7] == 1))
		{
			mySpell.stop = true;
			hitLag --;
			if((hitLag == maxhitLag - htlg - 2) || (global.phase == 1 && global.optionState[7] == 1))
			{
				if(global.phase == 1 && global.optionState[7] == 1)state = "return";
				if(anim == 0)index = 12;
				var damage = ATKd;
				if(dodged == false)
				{
					//weaponxp
					if(faction == 0)WeaponXP(characterID, 1);
					
					if(critd == true)damage *= 3;
					
					//HIT ACTIVATED SKILLS
					for(var i = 0; i < 2; i ++)
					{
						var cbSkill = combatSkill;
						if(i == 1)cbSkill = global.ITEM[weapon, 22];
						if(cbSkill != -1)
						{
							if(global.SKILL[cbSkill, 4] == 0)
							{
								for(var i = 0; i < 4; i ++)
								{
									var subtype = global.SKILL[cbSkill, 5 + i];
									var might = global.SKILL[cbSkill, 12 + i];
								
									switch(subtype)
									{
										case 0:
									
											if(!(global.phase == 1 && global.optionState[7] == 1))
											{
												audio_play_sound(sfx_sol, 0, 0);
												var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
												spfx.sprite_index = spr_sol;
												spfx.image_speed = 1.5;
											}
									
											if(HP < MAXHP)
											{
												var hea = damage;
												if(hea > target.HP)hea = target.HP;
											
												var num = floor(hea * (might / 100));
												if(HP + num >= MAXHP)num = MAXHP - HP;
												HP += num;
												
												if(!(global.phase == 1 && global.optionState[7] == 1))
												{
													var a = instance_create_depth(cx - 16, cy + combatvy + 8, -7000, obj_number);
													a.number = string(num);
													a.sprite_index = spr_numberheal;
												}
											}
									
											break;
									
										case 1:
									
											if(!(global.phase == 1 && global.optionState[7] == 1))
											{
												audio_play_sound(sfx_astra, 0, 0);
												var spfx = instance_create_depth(target.cx + 16 + irandom_range(-12, 12), target.cy + target.combatvy + 16 + irandom_range(-12, 12), -7000, obj_combatFX);
												spfx.sprite_index = spr_damage4;
												spfx.image_speed = 1.5;
												spfx.xscale = 35;
												spfx.yscale = 35;
											}
										
											break;
										
										case 2:
									
											if(!(global.phase == 1 && global.optionState[7] == 1))
											{
												audio_play_sound(sfx_luna, 0, 0);
												var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
												spfx.sprite_index = spr_luna;
												spfx.image_speed = 1.5;
												if(global.char2 == id)spfx.xscale *= -1;
											}
										
											break;
										case 20:
										
											if(damage > 0 && target.isBoss == 0)
											{
												target.allure = might;
												if(!(global.phase == 1 && global.optionState[7] == 1))
												{
													audio_play_sound(sfx_allure, 0, 0);
													var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
													spfx.sprite_index = spr_allure;
													spfx.image_speed = 1.5;
												}
											}
											
											break;
										case 21:
										
											if(damage >= target.HP)
											{
												target.captured = 1;
												if(!(global.phase == 1 && global.optionState[7] == 1))
												{
													audio_play_sound(sfx_capture, 0, 0);
													var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
													spfx.sprite_index = spr_capture;
													spfx.image_speed = 1.5;
												}
											}
										
										break;
										case 22: //weapon heal
									
											if(!(global.phase == 1 && global.optionState[7] == 1))
											{
												audio_play_sound(sfx_sol, 0, 0);
												var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
												spfx.sprite_index = spr_sol;
												spfx.image_speed = 1.5;
											}
									
											if(HP < MAXHP)
											{
												var num = floor(MAXHP * (global.ITEM[weapon, 33] / 100));
												if(HP + num = MAXHP)num = MAXHP - HP;
												HP += num;
												
												if(!(global.phase == 1 && global.optionState[7] == 1))
												{
													var a = instance_create_depth(cx - 16, cy + combatvy + 8, -7000, obj_number);
													a.number = string(num);
													a.sprite_index = spr_numberheal;
												}
											}
									
											break;
										case 23:
									
											if(!(global.phase == 1 && global.optionState[7] == 1))
											{
												audio_play_sound(sfx_luna, 0, 0);
												var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
												spfx.sprite_index = spr_luna;
												spfx.image_speed = 1.5;
											}
										
											break;
									}
								}
							}
							if(global.SKILL[cbSkill, 4] == 11)
							{
								for(var i = 0; i < 4; i ++)
								{
									var subtype = global.SKILL[cbSkill, 5 + i];
									var might = global.SKILL[cbSkill, 12 + i];
									
									with target AddBuff(subtype, might, 3, 100 + i + cbSkill * 10, 0, 1);
									//show_message(DEF);
								}
								if(!(global.phase == 1 && global.optionState[7] == 1))
								{
									audio_play_sound(sfx_debuff, 0, 0);
									var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX);
									spfx.sprite_index = spr_debuff;
									spfx.image_speed = 1.5;
									spfx.xscale = 50;
									spfx.yscale = 50;
								}
							}
						}
					}
					
					if(damage > target.HP)damage = target.HP;
					target.HP -= damage;
					damagedealt += damage;
					//
					
					if(damage > 0)
					{
						//DAGGERS
						if(critd == true)
						{
							if(adva == 1)AddSP(id, 2);
							if(!(global.phase == 1 && global.optionState[7] == 1))
							{
								audio_play_sound(sfx_crit, 0, 0);
								var a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 8, -7000, obj_number);
								a.number = string(damage);
								a.crit = critd;
								a.sprite_index = spr_numbercrit;
				
								a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -6000, obj_combatFX);
								a.sprite_index = global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 0];
								a.xscale = (50 + damage / 2) * 1.5;
								a.yscale = a.xscale;
								a.xscale *= global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 1];
								a.yscale *= global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 1];
								if(global.char2 == id)a.xscale *= -1;
							}
							with target
							{
								hitStun = 30;
								xpr = -1;
								ypr = 1;
							}
						}
						else
						{
							if(adva == 1)AddSP(id, 1);
							if(!(global.phase == 1 && global.optionState[7] == 1))
							{
								audio_play_sound(sfx_hit, 0, 0);
								var a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 8, -6000, obj_number);
								a.number = string(damage);
				
								a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -6000, obj_combatFX);
								a.sprite_index = global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 0];
								a.xscale = 50 + damage / 2;
								a.yscale = a.xscale;
								a.xscale *= global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 1];
								a.yscale *= global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 1];
								if(global.char2 == id)a.xscale *= -1;
							}
							with target
							{
								hitStun = 20;
								xpr = -0.75;
								ypr = 0.75;
							}
						}
					}
					else
					{
						if(!(global.phase == 1 && global.optionState[7] == 1))
						{
							audio_play_sound(sfx_block, 0, 0);
							var a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 8, -6000, obj_miss);
							a.sprite_index = spr_nodamage;
						
							a = instance_create_depth(target.cx + 32, target.cy + target.combatvy + 16, -6000, obj_combatFX);
							a.sprite_index = spr_block;
							if(global.char1 == id)
							{
								a.image_xscale = -1;
								a.x -= 16;
								a.image_angle -= 8;
							} else a.image_angle += 8;
						}
					}
					
					if(global.CHAR[characterID, 56] != -1)DecreaseUses(global.CHAR[characterID, 56], id);
					if(anim == 10 && subtype == 11 && !(global.phase == 1 && global.optionState[7] == 1))audio_play_sound(sfx_hitLightning,0,0);
				}
				else if (!(global.phase == 1 && global.optionState[7] == 1))
				{
					audio_play_sound(sfx_miss, 0, 0);
					var a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 8, -6000, obj_miss);
				}
			}
		}
		else
		{
			if(anim == 0)
			{
				if(global.char1 == id)cx += moveSpeed * 3; else cx -= moveSpeed * 3;
			}
		}
		
		if(hitLag == 0)
		{
			state = "return";
			if(mySpell != -1 && (anim == 1 || (anim == 10 && subtype == 12)))with mySpell instance_destroy();
			if(global.char1 == id)
			{
				cindex = 4;
				index = 4;
			}
			else
			{
				cindex = 8;
				index = 8;
			}
		}
		break;
	}
	case "return":
	{
		if(combatvy > global.CLASS[global.CHAR[characterID, 3], 6])combatvy -= 3;
		var dis = abs(cx - target.cx);
		var dis2 = startdis;
		if(nattacks > 1)
		{
			dis2 = 32;
			if(global.combatDistance > 1)
			{
				dis2 = startdis;
			}
			returnMult = 0.25;
		}
		if(dis < dis2 - 6 && !(global.phase == 1 && global.optionState[7] == 1))
		{
			if(global.char1 == id)
			{
				cx -= moveSpeed * 3 * returnMult;
				MoveAnimate(180);
			}
			else
			{
				cx += moveSpeed * 3 * returnMult;
				MoveAnimate(0);
			}
			if(skid)MoveAnimate(90);
		}
		else if(dis > dis2 + 6 && combatvy <= global.CLASS[global.CHAR[characterID, 3], 6] && !(global.phase == 1 && global.optionState[7] == 1))
		{
			if(global.char1 == id)
			{
				cx += moveSpeed * 3 * returnMult;
				MoveAnimate(0);
			}
			else
			{
				cx -= moveSpeed * 3 * returnMult;
				MoveAnimate(180);
			}
			if(skid)MoveAnimate(90);
		} else if (combatvy <= global.CLASS[global.CHAR[characterID, 3], 6] || (global.phase == 1 && global.optionState[7] == 1))
		{
			if(transformID != -1)
			{
				transformID = -1;
				if(!(global.phase == 1 && global.optionState[7] == 1))
				{
					var spfx = instance_create_depth(cx + 16, cy + 16 + combatvy, -7000, obj_combatFX2);
					spfx.sprite_index = spr_electricSpell;
				}
			}
			cindex = 0;
			cdir = -1;
			footstepTimer = 0;
	
			index += 0.1;
			if(index >= 4)index = 0;
		
			if(global.combatType == 0)
			{
				if(target.HP > 0)
				{
					state = "idle";
					if(nattacks > 1)
					{
						nattacks --;
						global.nextAction = 0;
						skid = true;
					}
					else
					{
						skid = false;
						nturns --;
						nattacks = maxattacks;
						if(target.nturns > 0)
						{
							global.currentTurn = target;
							if(global.phase == 1 && global.optionState[7] == 1)global.nextAction = 0;
							else global.nextAction = 60;
						}
						else if(nturns > 0)
						{
							if(global.phase == 1 && global.optionState[7] == 1)global.nextAction = 0;
							else global.nextAction = 60;
						}
						else
						{
							obj_game.state = "endingcombat";
							if(global.phase == 1 && global.optionState[7] == 1)obj_game.cbTimer = 0;
							else obj_game.cbTimer = 30;
						}
					}
				}
				else if(target.HP <= 0 && target.hitStun == 0 && target.state == "idle")
				{
					with target state = "dieBlink";
					obj_game.whoDied = target.faction;
					state = "idle";
				}
			}
			else
			{
				obj_game.state = "endingcombat";
				obj_game.cbTimer = 30;
				state = "idle";
			}
		}
		break;
	}
	case "dieBlink":
		dieTimer ++;
		cindex = 0;
		index = global.CLASS[global.CHAR[characterID, 3], 18];
		if((dieTimer mod 5) == 0)vis = !vis;
		if(dieTimer >= 40 || (global.phase == 1 && global.optionState[7] == 1))
		{
			dieTimer = 0;
			vis = 2;
			state = "dieFade";
			if(!(global.phase == 1 && global.optionState[7] == 1))audio_play_sound(sfx_death, 0, 0);
		}
	break;
	case "dieFade":
	{
		vis = 2;
		alpha -= 1 / 30;
		if(alpha <= 0 || (global.phase == 1 && global.optionState[7] == 1))
		{
			vis = 0;
			state = "die";
		}
	}
	break;
	case "die":
	{
		state = "dead";
		obj_game.state = "endingcombat";
		obj_game.cbTimer = 1;
	}
	break;
	case "startdodge":
	{
		dodgeType = 0;
		state = "startdodge2";
		if(dodgeType == 0)
		{
			index = 16;
		} else index = 12;
	}
	break;
	case "startdodge2":
	{
		if(dodgeType == 0)
		{
			cindex = 16;
			cdir = -1;
			footstepTimer = 0;
			
			index += 0.175;
			if(!(global.phase == 1 && global.optionState[7] == 1))
			{
				if(xscale > 0.8)xscale -= 1 / 20;
				yscale = xscale;
			}
			if(index >= 18)
			{
				index = 0;
				state = "dodge";
			}
		}
		else
		{
			cindex = 12;
			cdir = -1;
			footstepTimer = 0;
	
			index += 0.175;
			if(!(global.phase == 1 && global.optionState[7] == 1))
			{
				if(xscale < 1.2)xscale += 1 / 20;
				yscale = xscale;
			}
			if(index >= 14)
			{
				index = 0;
				state = "dodge";
			}
		}
	}
	break;
	case "dodge":
	{
		if(!(global.phase == 1 && global.optionState[7] == 1))
		{
			if(dodgeType == 0)
			{
				if(xscale < 1)xscale += 1 / 20;
			} else if(xscale > 1)xscale -= 1 / 20;
			yscale = xscale;
		}
		cindex = 0;
		cdir = -1;
		footstepTimer = 0;
	
		index += 0.175;
		if(index >= 2)
		{
			index = 0;
			state = "idle";
			xscale = 1;
			yscale = 1;
		}
	}
	break;
	case "begin heal":
	{
		var anim = global.ITEM[weapon, 9];
		var dis = abs(cx - target.cx);
		if(anim == 0)
		{
			if(global.combatDistance > 1)minDis = 100; else minDis = 60;
			if(dis > minDis && !(global.phase == 1 && global.optionState[7] == 1))
			{
				if(global.char1 == id)
				{
					cx += moveSpeed * 0.5;
					MoveAnimate(0);
				}
				else
				{
					cx -= moveSpeed * 0.5;
					MoveAnimate(180);
				}
			}
			else
			{
				state = "healing";
				cindex = 8;
				index = 8;
				mySpell = -1;
				hitLag = -1;
				
				maxhitLag = 5 + htlg;
			}
		}
	}
	break;
	case "healing":
	{
		if(anim == 0 && mySpell == -1)
		{				
			if(faction == 0)WeaponXP(characterID, 1);
			
			if(!(global.phase == 1 && global.optionState[7] == 1))
			{
				audio_play_sound(sfx_heal, 0, 0);
				var spfx = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 16, -7000, obj_combatFX2);
				spfx.sprite_index = global.FX[global.ITEM[global.CHAR[characterID, 44], 6], 0];
			}
			
			var damage = ATK;
			if(target.HP + damage > target.MAXHP)damage = target.MAXHP - target.HP;
			target.HP += damage;
			damagehealed += damage;
			if(!(global.phase == 1 && global.optionState[7] == 1))
			{
				var a = instance_create_depth(target.cx + 16, target.cy + target.combatvy + 8, -7000, obj_number);
				a.number = string(damage);
				a.sprite_index = spr_numberheal;
			}
			
			DecreaseUses(global.CHAR[characterID, 56], id);
		}
		
		returnMult = 0.15;
		state = "return";
	}
	break;
}

if(hitStun > 0)
{
	hitStun --;
	if(hitStun mod 3 == 0)
	{
		xpr *= -1;
		ypr *= -1;
	}
}
else
{
	xpr = 0;
	ypr = 0;
}

if(HPD != HP && snapHP == 0)
{
	snapHP = ceil(HP - HPD);
	tickTimer = 30 / abs(snapHP);
	tickAmount = 1;
	tickTimerCeil = ceil(tickTimer);
	if(tickTimer < 1)tickAmount = 1 / tickTimer;
}
if(tickTimerCeil > 0)
{
	if(obj_game.gamestate == "itemheal" || obj_game.gamestate == "fortheal" || obj_game.state == "endheal")
	{
		if(obj_game.sfxTimer > 0)obj_game.sfxTimer --;
	}
	tickTimerCeil--;
	if(tickTimerCeil == 0)
	{
		if(obj_game.sfxTimer == 0)
		{
			if(obj_game.gamestate == "itemheal" || obj_game.gamestate == "fortheal" || obj_game.state == "endheal")audio_play_sound(sfx_xp, 0, 0);
			obj_game.sfxTimer = 5;
		}
		HPD += tickAmount * sign(snapHP);
		if(HPD < 0)HPD = 0;
		if(HPD != HP)
		{
			tickTimerCeil = ceil(tickTimer);
		}
		else
		{
			snapHP = 0;
			HPD = HP;
			tickTimerCeil = -1;
		}
	}
}