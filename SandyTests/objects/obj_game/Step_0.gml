/// @description Insert description here
// You can write your code in this editor

indVal += 0.5;
if(indVal > 100)indVal = 0;

if(scrollTimer > 0)scrollTimer --;

if(global.debug)exit;

if(global.controlsType == 0)
{
	global.mxv = device_mouse_x_to_gui(0) * (camera_get_view_width(view_camera[0]) / view_wport) * 2;
	global.myv = device_mouse_y_to_gui(0) * (camera_get_view_height(view_camera[0]) / view_hport) * 2;
}

if(global.controlsType == 0)
{
	global.mx = mouse_x;
	global.my = mouse_y;
}

if(global.controlsType == 0)
{
	cx = floor(global.mx / global.gridSize);
	cy = floor(global.my / global.gridSize);
}
if((state == "game" || state == "preparation")&& global.controlsType > 0 && (global.phase == 0 || (obj_pers.gamestate == "prepmap" && obj_pers.tempVar == noone)))
{
	var ccx = cx, ccy = cy;
	
	if(gamestate == "select" || gamestate == "selected" || (obj_pers.gamestate == "prepmap" && obj_pers.tempVar == noone))
	{
		var lastNode = noone;
		if(ccx < 0 || ccy < 0 || ccx > global.mapWidth - 1 || ccy > global.mapHeight - 1)
		{
		    lastNode = noone;
		}
		else
		{
		    lastNode = global.map[ccx, ccy];
		}
		
		if(global.upKey_state <= 0 && global.downKey_state <= 0 && global.rightKey_state <= 0 && global.leftKey_state <= 0)
		{
			moveKey = 0;
			vcheck = 0;
			hcheck = 0;
		}
		if(moveKey > 0)moveKey --;
		if(moveKey == 0)
		{
			//var hcheck = max(lPri, rPri);
			//var vcheck = max(uPri, dPri);
			var mi = global.minkeySpeed;
			//if(hcheck > 0 && vcheck > 0)mi = floor(global.minkeySpeed / 2);
			if(global.upKey_state > 0 && ccy > 0 && vcheck == 0)
			{
				ccy --;
				vcheck = 1;
				hcheck = 0;
				moveKey = median(mi, (12 - floor(global.upKey_state / 2)), global.maxkeySpeed);
				//audio_play_sound(sfx_scrollMap, 0, 0);
			} else 
			if(global.downKey_state > 0 && ccy < global.mapHeight - 1 && vcheck == 0)
			{
				ccy ++;
				vcheck = 1;
				hcheck = 0;
				dPri = 1;
				moveKey = median(mi, (12 - floor(global.downKey_state / 2)), global.maxkeySpeed);
				//audio_play_sound(sfx_scrollMap, 0, 0);
			} else
			if(global.leftKey_state > 0 && ccx > 0 && hcheck == 0)
			{
				ccx --;
				vcheck = 0;
				hcheck = 1;
				moveKey = median(mi, (12 - floor(global.leftKey_state / 2)), global.maxkeySpeed);
				//audio_play_sound(sfx_scrollMap, 0, 0);
			} else
			if(global.rightKey_state > 0 && ccx < global.mapWidth - 1 && hcheck == 0)
			{
				ccx ++;
				vcheck = 0;
				hcheck = 1;
				moveKey = median(mi, (12 - floor(global.rightKey_state / 2)), global.maxkeySpeed);
				//audio_play_sound(sfx_scrollMap, 0, 0);
			} else
			{
				vcheck = 0;
				hcheck = 0;
			}
		}
		obj_camera.xTo = ccx * global.gridSize + 16;
		obj_camera.yTo = ccy * global.gridSize + 16;
	}
	
	var testNode = noone;
	if(ccx < 0 || ccy < 0 || ccx > global.mapWidth - 1 || ccy > global.mapHeight - 1)
	{
	    testNode = noone;
	}
	else
	{
	    testNode = global.map[ccx, ccy];
	}
	if(gamestate == "select" || (obj_pers.gamestate == "prepmap" && obj_pers.tempVar == noone))
	{
		if(global.lockKeys == 0)
		{
			cx = ccx;
			cy = ccy;
		}
	}
	if(gamestate == "selected")
	{
		if(testNode != noone && lastNode != noone && testNode.occupant == noone && lastNode.color == 1 && (testNode.color == 2 || testNode.color == 6) && areaIn == 0 && moveKey < 10 && lastNode != testNode)
		{
			global.lockKeys = 1;
			global.lockAxis = 0;
			var hh = max(global.rightKey_state, global.leftKey_state);
			var vv = max(global.upKey_state, global.downKey_state);
			if(hh > vv)global.lockAxis = 0; else global.lockAxis = 1;
			areaIn = 1;
		}
		if(testNode != noone && lastNode != noone && areaIn == 1 && lastNode.color == 1 && testNode.color == 1 && lastNode != testNode)
		{
			areaIn = 0;
		}
		
		if(global.lockKeys == 0)
		{
			cx = ccx;
			cy = ccy;
		}
	
	
		if(testNode != noone && testNode.occupant != noone && testNode.occupant.faction == 1 && moveKey < 10 && lastNode != testNode)
		{
			global.lockKeys = 1;
			global.lockAxis = 0;
			var hh = max(global.rightKey_state, global.leftKey_state);
			var vv = max(global.upKey_state, global.downKey_state);
			if(hh > vv)global.lockAxis = 0; else global.lockAxis = 1;
			areaIn = 1;
		}
	}
}


if((global.phase == 0 && state == "game") || obj_pers.gamestate == "prepmap")
{
	if((gamestate == "select" || gamestate == "selected" || obj_pers.gamestate == "prepmap") && global.Xkey_state == 1)
	{
		if(global.rangeToggle == false)
		{
			if(global.enemyUpdated)
			{
				with (obj_node)
				{
					marked2 = 0;
				}
				for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
				{
					var char = ds_list_find_value(global.faction[1], i);
					UpdateNodesmarked(char.standingNode, char);
				}
				global.enemyUpdated = false;
			}
			global.rangeToggle = true;
		}
		else
		{
			global.rangeToggle = false;
		}
	}
	if((gamestate == "select" || gamestate == "selected" || obj_pers.gamestate == "prepmap") && global.Lshoulder_state == 1)
	{
		if(global.selectedActor != noone)
		{
			tabIndex = ds_list_find_index(global.faction[global.phase], global.selectedActor);
			
			global.selectedActor.index = 0;
			global.selectedActor.state = "idle";
				
			global.target = noone;
			//global.selectedActor = noone;
		}
		var startTab = tabIndex;
		var newActor = noone;
		var a = 0;
		while(newActor == noone)
		{
			if(startTab == tabIndex && a != 0)break;
			a ++;
			tabIndex++;
			if(tabIndex >= ds_list_size(global.faction[tabFaction]))
			{
				tabIndex = 0;
			}
			var ac = ds_list_find_value(global.faction[tabFaction], tabIndex);
			if(ac != undefined && instance_exists(ac) && ac.usedTurn == false)
			{
				newActor = ac;
				break;
			}
		}
		
		if(newActor != noone)
		{
			global.hoverNode = newActor.standingNode;
			cx = global.hoverNode.gridX;
			cy = global.hoverNode.gridY;
			
			obj_camera.xTo = newActor.x + 16;
			obj_camera.yTo = newActor.y + 32;
				
			audio_play_sound(sfx_scroll, 0, 0);
			global.selectedActor = noone;
	
			CleanNodes();

			if(obj_pers.gamestate != "prepmap")gamestate = "select";
			
		}
	}
	
	var testNode = noone;
	if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
    {
        testNode = noone;
    }
    else
    {
        testNode = global.map[cx, cy];
    }
	
	if((gamestate == "select" || obj_pers.gamestate == "prepmap")&& global.hoverNode != noone && global.hoverNode.occupant != noone)
	{
		if(global.Akey_state > 0 || global.Bkey_state > 0)
		{
			tabFaction = global.hoverNode.occupant.faction;
		}
	}
	
	if(global.hoverUnit != noone && testNode != global.hoverUnit)
	{
		CleanNodes();
		global.hoverUnit = noone;
	}
	var cont = 0;
	if(gamestate == "select" && testNode != noone && testNode.occupant != noone && testNode.occupant.faction == 1 && global.showOptions == 0 && global.transitionCombat <= 0)cont = 1;
	if(obj_pers.gamestate == "prepmap" && testNode != noone && testNode.occupant != noone)cont = 1;
	if(cont)
	{
		if(global.hoverUnit != testNode && testNode.occupant.faction == 1)UpdateNodesView(testNode, testNode.occupant);
		if(global.hoverUnit != testNode && testNode.occupant.faction == 0)UpdateNodes(testNode, testNode.occupant);
		global.hoverUnit = testNode;
		if(global.Akey_state == 1 && testNode.occupant.faction == 1 && gamestate != "showstats")
		{
			if(testNode.occupant.markRange == true)
			{
				testNode.occupant.markRange = false;
				with(obj_node)
				{
					marked3 = 0;
				}
				with(obj_unit)
				{
					if(faction == 1 && markRange == true)UpdateNodesmarked_single(standingNode, id);
				}
			}
			else
			{
				testNode.occupant.markRange = true;
				UpdateNodesmarked_single(testNode, testNode.occupant);
			}
		}
	}
	
	if(global.target != noone && gamestate == "select target dir")
	{
		if(weaponsinrange > 1)
		{
			if((mouse_wheel_down() && global.controlsType == 0) || global.Xkey_state == 1)
			{
				SwitchAllWeapons1(global.selectedActor, global.cellAttack, global.target);
				arrowSelect1 = 2;
				alarm[3] = 5;
			}
			if((mouse_wheel_up() && global.controlsType == 0)|| global.Ykey_state == 1)
			{
				SwitchAllWeapons(global.selectedActor, global.cellAttack, global.target);
				arrowSelect2 = 2;
				alarm[4] = 5;
			}
		}
		
		var arrowWid = 16;
		if(global.controlsType == 0)
		{
			arrowSelect1 = 0;
			arrowSelect2 = 0;
			if(global.mxv >= 4 + xd + arrowWid - 20 && global.mxv <= 4 + xd + arrowWid && global.myv >= 161 - 10 && global.myv <= 161 + 10)
			{
				if(weaponsinrange > 1)
				{
					arrowSelect1 = 1;
					if(mouse_check_button(mb_left))arrowSelect1 = 2;
					if(mouse_check_button_pressed(mb_left))SwitchAllWeapons1(global.selectedActor, global.cellAttack, global.target);
				}
				else
				{
					if(mouse_check_button_pressed(mb_left))audio_play_sound(sfx_error, 0, 0);
				}
			}
			if(global.mxv >= 156 + xd + arrowWid && global.mxv <= 156 + xd + arrowWid + 20 && global.myv >= 161 - 10 && global.myv <= 161 + 10)
			{
				if(weaponsinrange > 1)
				{
					arrowSelect2 = 1;
					if(mouse_check_button(mb_left))arrowSelect2 = 2;
					if(mouse_check_button_pressed(mb_left))SwitchAllWeapons(global.selectedActor, global.cellAttack, global.target);
				}
				else
				{
					if(mouse_check_button_pressed(mb_left))audio_play_sound(sfx_error, 0, 0);
				}
			}
		}
	}
	if(gamestate == "select target")
	{
		var arrowWid = 16;
		arrowSelect1 = 0;
		arrowSelect2 = 0;
		
		if(global.controlsType == 0)
		{
			if(global.mxv >= 4 + xd + arrowWid - 20 && global.mxv <= 4 + xd + arrowWid && global.myv >= 161 - 10 && global.myv <= 161 + 10)
			{
				if(weaponsinrange > 1)
				{
					arrowSelect1 = 1;
					if(mouse_check_button(mb_left))arrowSelect1 = 2;
					if(mouse_check_button_pressed(mb_left))SwitchAllWeapons1_free(global.selectedActor, global.cellAttack, global.target);
				}
				else if(mouse_check_button_pressed(mb_left))audio_play_sound(sfx_error, 0, 0);
			}
			if(global.mxv >= 156 + xd + arrowWid && global.mxv <= 156 + xd + arrowWid + 20 && global.myv >= 161 - 10 && global.myv <= 161 + 10)
			{
				if(weaponsinrange > 1)
				{
					arrowSelect2 = 1;
					if(mouse_check_button(mb_left))arrowSelect2 = 2;
					if(mouse_check_button_pressed(mb_left))SwitchAllWeapons_free(global.selectedActor, global.cellAttack, global.target);
				} else if(mouse_check_button_pressed(mb_left))audio_play_sound(sfx_error, 0, 0);
			}
		}
		
		if(weaponsinrange > 1)
		{
			if((mouse_wheel_down() && global.controlsType == 0) || global.Xkey_state == 1)
			{
				SwitchAllWeapons1_free(global.selectedActor, global.cellAttack, global.target);
				arrowSelect1 = 2;
				alarm[3] = 5;
			}
			if((mouse_wheel_up() && global.controlsType == 0)|| global.Ykey_state == 1)
			{
				SwitchAllWeapons_free(global.selectedActor, global.cellAttack, global.target);
				arrowSelect2 = 2;
				alarm[4] = 5;
			}
		}
	}
}

switch(state)
{
	case "create":

	MapCreate();
	obj_pers.tempVar7 = 0;
	obj_pers.tempVar6 = 0;
		
	if(gamestate == "preparation")
	{
		CreateUnits();
		//SnapCamera(obj_spawnAlly.gridX, obj_spawnAlly.gridY);
		musPreparation = audio_play_sound(mus_preparation, 0, 1);
		audio_sound_gain(musPreparation, global.optionState[2] / 100, 0);
			
		state = "preparation";
		with obj_pers
		{
			state = "preparation";
			laststate = "preparation";
			global.glSelect = 0;
			global.glSelect2 = 0;
			global.glSelect3 = 0;
			global.glSelect4 = 0;
			opSize4 = 1;
			//gameFade = 1;
		}
	}
	else
	{
		state = "idle";
	}

	break;
	case "game":
		if(global.transitionCombat > 0)
		{
			global.transitionCombat += 0.75;
			/*
			global.wid -= global.wid / 60;
			global.hei -= global.hei / 60;
			
			if(global.wid < global.mwid / 1.5)global.wid = global.mwid / 1.5;
			if(global.hei < global.mhei / 1.5)global.hei = global.mhei / 1.5;
			camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
			*/
			if(global.zoom < 4)global.zoom += 1 / 30;
			camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
			
			opSize3 = 1;
			
			if(global.transitionCombat >= 60)
			{
				global.zoom = 3;
				camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
				state = "combat";
				inCombat = 1;
				cbAlpha = 1;
				
				cbSizeY = 1.5;
				cbSizeX = 1;
				if(global.phase == 1 && global.optionState[7] == 1) global.nextAction = 0;
				else global.nextAction = 60;
				
				var di = 0;
				if(global.combatDistance > 1)di = 22;
				
				with global.char1
				{
					cx = obj_camera.x - 56 - di;
					cy = obj_camera.y - 14;
					target = global.char2;
					combatvy = global.CLASS[global.CHAR[characterID, 3], 6];
				}
				with global.char2
				{
					cx = obj_camera.x + 24 + di;
					cy = obj_camera.y - 14;
					target = global.char1;
					combatvy = global.CLASS[global.CHAR[characterID, 3], 6];
				}
				
				with global.char1 startdis = abs(global.char1.cx - global.char2.cx);
				with global.char2 startdis = abs(global.char1.cx - global.char2.cx);
			}
		}
		break;
	case "combat":
		if(global.transitionCombat > 0)
		{
			global.transitionCombat -= 2;
		}
		
		if(cbSizeY > 1)cbSizeY -= 1 / 24;
		if(cbSizeY < 1)cbSizeY = 1;
		
		if(xview < 100)xview += (120 - xview) / 40;
		
		if(global.nextAction > 0)
		{
			global.nextAction --;
		}
		//if(global.phase == 1 && global.optionState[7] == 1)global.nextAction = 0;
		if(global.nextAction == 0)
		{
			global.nextAction = -1;
			if(global.combatType == 0)
			{
				if(global.currentTurn.nturns > 0)
				{
					with global.currentTurn
					{
						state = "begin attack";
						calc = false;
					}
				}
				else
				{
					with global.currentTurn
					{
						with target
						{
							state = "begin attack";
							calc = false;
						}
					}
				}
			} else global.currentTurn.state = "begin heal";
		}
		
		break;
	case "endingcombat":
		reusable1 = 0;
		if(cbTimer > 0)cbTimer --;
		if(cbTimer <= 0)
		{
			ov = false;
			state = "endcombat";
			if(global.char1.HP <= 0 && global.char1.characterID < 50)
			{
				state = "chardeath";
				//with obj_musPlayer event_user(2);
			}
		}
		break;
	case "chardeath":
		
		var dial = false;
		with obj_pers ResetDialogue();
		
		var deathQuote = -1;
		if(global.CHAR[global.char1.characterID, 72] != -1)deathQuote = global.CHAR[global.char1.characterID, 72];
		if(deathQuote == -1 && global.char1.faction == 0)deathQuote = 100;
		
		obj_pers.tempVar11 = global.char1.characterID;
		
		switch(deathQuote)
		{
			case 0:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				SetExpression(global.char1.characterID, 2);
				Dialogue(global.char1.characterID, "Sadness...Evinya...I was honoured to work beside you.");
				dial = true;
			}
			break;
			
			case 1:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "Oops :( Evinya, I'm leaving Sandyland on your hands...");
				dial = true;
			}
			break;
			
			case 2:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "C'mon...just...make sure that..an archer was good for something...");
				dial = true;
			}
			break;
			
			case 3:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "Zech write this line when you can:)");
				dial = true;
			}
			break;
			
			case 4:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "Zech write this line when you can:)");
				dial = true;
			}
			break;
			
			case 5:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "Zech write this line when you can:)");
				dial = true;
			}
			break;
			
			case 6:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "..Damn, I need to retreat! Lady Sandy, please bring Arsenis back!");
				dial = true;
			}
			break;
			
			case 7:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "..Damn, I need to retreat!");
				dial = true;
			}
			break;
			
			case 8:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "..Damn, I need to retreat!");
				dial = true;
			}
			break;
			
			case 9:
			with obj_pers
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "..Damn, I need to retreat!");
				dial = true;
			}
			break;
			
			case 100:
			{
				SetLeftCharacter(global.char1.characterID);
				Dialogue(global.char1.characterID, "I'm sorry everyone I have to leave you behind..!");
				dial = true;
			}
			break;
		}
		
		if(dial == true)
		{
			//asdfdsa
			if(global.char1.characterID == 1)
			{
				musDeath = audio_play_sound(mus_gracefully, 0, 0);
				guiTimer = 0;
				state = "chardeathwait0";
				obj_pers.tempVar6 = 1000;
				with obj_musPlayer event_user(2);
			}
			else
			{
				musDeath = audio_play_sound(mus_death, 0, 0);
				guiTimer = 0;
				state = "chardeathwait0";
				ov = true;
				obj_pers.tempVar6 = 0;
				with obj_musPlayer event_user(2);
			}
		}
		else
		{
			state = "endcombat";
		}
		
		break;
	case "chardeathwait0":
	
		guiTimer += 1 / 30;
		if(guiTimer >= 1)
		{
			with obj_pers DialogueStart(0, -1, 0);
			state = "chardeathwait";
			guiTimer = 0;
			reusable1 = 1;
		}
		
		break;
	case "endcombat":
		
		var ch1l = global.CHAR[global.char1.characterID, 4];
		var ch2l = global.CHAR[global.char2.characterID, 4];
		if(global.CLASS[global.CHAR[global.char1.characterID, 3], 36] == 2)ch1l += 20;
		if(global.CLASS[global.CHAR[global.char2.characterID, 3], 36] == 2)ch2l += 20;
		var LD = ch2l - ch1l;
		var xpg = 0;
		if(global.char2.HP > 0)
		{
			if(LD >= 0)xpg = floor((31 + LD) / 3);
			if(LD == -1)xpg = 10;
			if(LD <= -2)xpg = floor(max((33 + LD) / 3, 1));
		}
		else
		{
			if(LD >= 0)xpg = 20 + LD * 3;
			if(LD == -1)xpg = 20;
			if(LD <= -2)xpg = floor(max(26 + LD * 3, 7));
			xpg = floor(xpg * global.char2.xpmult);
		}
		xpg = floor(xpg * 2);
		for(var i = 0; i < ds_list_size(global.CHAR[global.char1.characterID, 34]); i ++)
		{
			var skillID = ds_list_find_value(global.CHAR[global.char1.characterID, 34], i);
			if(global.SKILL[skillID, 4] == 10)
			{
				for(var iii = 0; iii < 4; iii ++)
				{
					var subtype = global.SKILL[skillID, 5 + iii];
					var might = global.SKILL[skillID, 12 + iii];
					
					if(subtype != -1)
					{
						switch(subtype)
						{		
							case 0:
				
							xpg *= might;
				
							break;
						}
					}
				}
			}
		}
		
		if(xpg > 100)xpg = 100;
		
		totalxp = 90 + xpg;
		
		if(global.char1.damagedealt <= 0 && global.char1.damagehealed <= 0)
		{
			xpg = 1;
			totalxp = 71;
		}
		if(global.char1.HP <= 0 )xpg = 0;
		if(global.char1.damagehealed > 0)xpg = median(20, global.char1.damagehealed * 3, 60);
		
		sfxTimer = 0;
		cbSize2 = 1;
		
		with global.char1
		{
			nturns = 1;
			nattacks = maxattacks;
			target = noone;
		}
		with global.char2
		{
			nturns = 1;
			nattacks = maxattacks;
			target = noone;
			
			if(HP <= 0 && global.char1.faction == 0)
			{
				for(var i = 0; i < ds_list_size(global.CHAR[characterID, 49]); i ++)
				{
					var item = ds_list_find_value(global.CHAR[characterID, 49], i);
					if(item != undefined)
					{
						if(global.CHAR[characterID, 56] != i)
						{
							ds_list_add(global.itemDrops, item);
							//AddItem(global.char1.characterID, item);
						}
					}
				}
			}
		}
		
		///SKIPSKIP
		if(xpg > 0 && global.char1.faction == 0)
		{
			global.showXP = 0;
			state = "showxp";
			if(global.char1 != noone)global.char1.levelup = 0;
			global.charlevelup = global.char1;
		
			global.char1.target = noone;
			global.char1.xpgained = xpg;
			
			if(global.phase == 1 && global.optionState[7] == 1)global.showXP = 1000;
		} else
		{
			state = "endcombatwait";
			if(global.phase == 1 && global.optionState[7] == 1)endcombattimer = 0;
			else endcombattimer = 60;
		}
		
		break;
	case "showxp":
		if(global.showXP < totalxp)global.showXP ++;
		
		if(global.showXP > 30)
		{
			if(global.charlevelup.xpgained > 0)
			{
				global.charlevelup.xpgained --;
				var up = 0;
				if(global.CHAR[global.charlevelup.characterID, 5] < 100)
				{
					global.CHAR[global.charlevelup.characterID, 5] ++;
					up = 1;
				}
				
				if(global.CHAR[global.charlevelup.characterID, 5] >= 100 && global.CHAR[global.charlevelup.characterID, 4] < 20)
				{
					global.CHAR[global.charlevelup.characterID, 4] ++;
					global.charlevelup.levelup = 1;
					global.CHAR[global.charlevelup.characterID, 5] = 0;
					if(global.CHAR[global.charlevelup.characterID, 4] mod 10 == 0)
					{
						global.CHAR[global.charlevelup.characterID, 32] ++;
						global.charlevelup.MP ++;
						global.charlevelup.MAXMP ++;
					}
					
					//GAINSKILL
					if(global.CHAR[global.charlevelup.characterID, 4] mod 5 == 0)
					{
						var availableSkills = ds_list_create();
						var charID = global.charlevelup.characterID;
					
						for(var i = 0; i < 25; i ++)
						{
							var hasSkill = 0;
							for(var ii = 0; ii < ds_list_size(global.CHAR[charID, 33]); ii ++)
							{
								if(ds_list_find_value(global.CHAR[charID, 33], ii) == i)
								{
									hasSkill = 1;
								}
							}
							if(hasSkill == 0 && i != 10 && i != 17 && i != 22 && global.CHAR[charID, 70] >= global.SKILL[i, 3])ds_list_add(availableSkills, i);
						}
						
						for(var i = 33; i < 37; i ++)
						{
							var hasSkill = 0;
							for(var ii = 0; ii < ds_list_size(global.CHAR[charID, 33]); ii ++)
							{
								if(ds_list_find_value(global.CHAR[charID, 33], ii) == i)
								{
									hasSkill = 1;
								}
							}
							if(hasSkill == 0 && i != 35 && global.CHAR[charID, 70] >= global.SKILL[i, 3])ds_list_add(availableSkills, i);
						}
					
						ds_list_shuffle(availableSkills);
						var newSkill = ds_list_find_value(availableSkills, 0);
					
						if(newSkill != undefined)
						{
							AddSkill(charID, newSkill);
							charbox = charID;
							skillGained = newSkill;
						}
						
						ds_list_destroy(availableSkills);
					}
				}
				
				if(sfxTimer > 0)sfxTimer --;
				if(sfxTimer == 0 && up && (!(global.phase == 1 && global.optionState[7] == 1)))
				{
					audio_play_sound(sfx_xp, 0, 0);
					sfxTimer = 5;
				}
			}
		}
		
		if(global.showXP < totalxp)
		{
			if(global.showXP > 20)
			{
				if(cbSize2 > 0)cbSize2 -= 1 / 4;
				if(cbSize2 < 0)cbSize2 = 0;
			}
		}
		else
		{
			if(cbSize2 < 1)cbSize2 += 1 / 4;
		}
		
		if(cbSize2 >= 1 && global.showXP >= totalxp)
		{
			if(global.char1.levelup == 1)
			{
				ov = true;
				state = "levelupstart";
				with obj_musPlayer event_user(2);
				ds_list_clear(nup);
				ds_list_clear(nupVal);
				
				LevelUp(global.char1);
			}
			else
			{
				if(gamestate != "dancexpwait")state = "endcombatfadein"; else
				{
					state = "game";
					gamestate = "select";
				}
				global.showXP = 0;
			}
		}
		
		
		break;
	case "endcombatwait":
		if(endcombattimer > 0)endcombattimer --; else state = "endcombatfadein";
		
		break;
	case "endcombatfadein":
		if(global.transitionCombat < 60 && !(global.phase == 1 && global.optionState[7] == 1))
		{
			global.transitionCombat += 2;
			/*
			global.wid += global.wid / 60;
			global.hei += global.hei / 60;
			if(global.wid > global.mwid)global.wid = global.mwid;
			if(global.hei > global.mhei)global.hei = global.mhei;
			camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
			*/
			global.zoom -= 1 / 30;
			camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
			
			if(cbSizeX > 0.25)cbSizeX -= 1 / 15;
			if(cbSizeY > 0.4)cbSizeY -= 1 / 20;
			if(cbAlpha > 0)cbAlpha -= 1 / 20;
			
		} else
		{
			global.zoom = global.oldZoom;
			camera_set_view_size(global.camera, global.wid / global.zoom, global.hei / global.zoom);
			with obj_camera camera_set_view_pos(global.camera, x - (global.wid / global.zoom) / 2, y - (global.hei / global.zoom) / 2);
			state = "endcombatfadeout";
			inCombat = 0;
		}

		break;
	case "endcombatfadeout":
		if(global.transitionCombat > 0 && !(global.phase == 1 && global.optionState[7] == 1))
		{
			global.transitionCombat -= 2;
		} else
		{	
			global.transitionCombat = 0;
			guiTimer = 0;
			guiTimer2 = 0;
			
			if(gamestate == "attack")gamestate = "select";
			
			with(obj_unit)
			{
				combatSkill = -1;
				if(state == "dead")
				{
					if(captured)
					{
						if(global.nprisoners < 12)
						{
							var fillID = -1;
							for(var i = 150; i < 162; i ++)
							{
								if(global.CHAR[i, 0] == "error")
								{
									fillID = i;
									break;
								}
							}
							
							for(var i = 0; i < 73; i ++)
							{
								if(i != 33 && i != 34 && i != 49 && i != 50)
								{
									global.CHAR[fillID, i] = global.CHAR[characterID, i];
								} else global.CHAR[fillID, i] = ds_list_create();
							}
							for(var ii = 0; ii < ds_list_size(global.CHAR[characterID, 33]); ii ++)
							{
								var skill = ds_list_find_value(global.CHAR[characterID, 33], ii);
								ds_list_add(global.CHAR[fillID, 33], skill);
							}
							for(var ii = 0; ii < ds_list_size(global.CHAR[characterID, 34]); ii ++)
							{
								var skill = ds_list_find_value(global.CHAR[characterID, 34], ii);
								ds_list_add(global.CHAR[fillID, 34], skill);
							}
							for(var ii = 0; ii < ds_list_size(global.CHAR[characterID, 49]); ii ++)
							{
								var skill = ds_list_find_value(global.CHAR[characterID, 49], ii);
								ds_list_add(global.CHAR[fillID, 49], skill);
							}
							for(var ii = 0; ii < ds_list_size(global.CHAR[characterID, 50]); ii ++)
							{
								var skill = ds_list_find_value(global.CHAR[characterID, 50], ii);
								ds_list_add(global.CHAR[fillID, 50], skill);
							}
							
							global.CHAR[fillID, 40] = median(5, 100 - (30 + (isBoss * 20) + min(global.CHAR[characterID, 4] * 2.5, 70)), 100);
							//if(global.CHAR[fillID, 40] == 1)global.CHAR[fillID, 40] = 2;
							global.CHAR[fillID, 41] = floor(random(101));
							global.nprisoners ++;
							
							obj_game.enemycapture = fillID;
						}	
					}
					//asdfasdf
					with(obj_node)
					{
						marked3 = 0;
					}
					
					with(obj_unit)
					{
						if(id != other.id && markRange == true)UpdateNodesmarked_single(standingNode, id);
					}
					
					standingNode.occupant = noone;
					ds_list_delete(global.faction[faction], ds_list_find_index(global.faction[faction], id));
					//if(ds_list_find_index(targetList, id) != -1)ds_list_delete(targetList, ds_list_find_index(targetList, id));
					
					instance_destroy();
				}
			}
			
		
			with (obj_node)
			{
				marked2 = 0;
			}
			for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
			{
				var char = ds_list_find_value(global.faction[1], i);
				UpdateNodesmarked(char.standingNode, char);
			}
			if(instance_exists(global.char1) && global.char1.faction == 0)state = "endcombatevents"; else state = "endcombatskills";
		}
		break;
	case "specialevents":
	{
		state = "temp";
		if(ds_list_size(global.itemDrops) > 0)
		{
			var inventory = global.CHAR[global.char1.characterID, 49];
			var uses = global.CHAR[global.char1.characterID, 50];
			var item = ds_list_find_value(global.itemDrops, 0);
			
			if(ds_list_size(inventory) >= 5)
			{
				tempVar2 = 1;
				guiTimer3 = 0;
				guiTimer4 = 0;
				state = "itemdrop";
				with obj_musPlayer event_user(2);
				ov = true;
				ds_list_add(inventory, item);
				ds_list_add(uses, global.ITEM[item, 2]);
				//add to convoy because full
				/*
				ds_list_add(global.CHAR[100, 49], item);
				ds_list_add(global.CHAR[100, 50], global.ITEM[item, 2]);
				*/
			}
			else
			{
				tempVar2 = 0;
				guiTimer3 = 0;
				guiTimer4 = 0;
				state = "itemdrop";
				with obj_musPlayer event_user(2);
				ov = true;
				ds_list_add(inventory, item);
				ds_list_add(uses, global.ITEM[item, 2]);
			}
			exit;
		}
		if(state == "temp")
		{
			state = "game";
			gamestate = "select";

			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			CleanNodes();
			
			if(global.phase == 0)
			{
				if(ov == true)
				{
					if(global.phase > 0)with obj_musPlayer event_user(4); else with obj_musPlayer event_user(3);
					ov = false;
				}
				else
				{
					with obj_musPlayer event_user(1);
				}
			}
		}
	}
	break;
	case "endcombatevents":
	{
		state = "temp";
		if(instance_exists(global.char1) && global.char1.equipAfter != -1)
		{
			Equip(global.char1, global.char1.equipAfter);
			MoveEquipTop(global.char1.characterID);
			global.char1.equipAfter = -1;
			//show_message("wpo");
		}
		if(instance_exists(global.char2) && global.char2.equipAfter != -1)
		{
			Equip(global.char2, global.char2.equipAfter);
			global.char2.equipAfter = -1;
			//show_message("wpo");
		}
		if(skillGained != -1)
		{
			state = "skillgain";
			guiTimer3 = 0;
			guiTimer4 = 0;
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
		}
		if(weaponadvancerank != -1)
		{
			state = "weaponrank";
			guiTimer3 = 0;
			guiTimer4 = 0;
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
		}
		if(global.itemBreak != -1)
		{
			state = "weaponbreak";
			guiTimer3 = 0;
			guiTimer4 = 0;
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
		}
		if(ds_list_size(global.itemDrops) > 0)
		{
			var inventory = global.CHAR[global.char1.characterID, 49];
			var uses = global.CHAR[global.char1.characterID, 50];
			var item = ds_list_find_value(global.itemDrops, 0);
			
			if(ds_list_size(inventory) >= 5)
			{
				tempVar2 = 1;
				guiTimer3 = 0;
				guiTimer4 = 0;
				state = "itemdrop";
				with obj_musPlayer event_user(2);
				ov = true;
				ds_list_add(inventory, item);
				ds_list_add(uses, global.ITEM[item, 2]);
				//add to convoy because full
				/*
				ds_list_add(global.CHAR[100, 49], item);
				ds_list_add(global.CHAR[100, 50], global.ITEM[item, 2]);
				*/
			}
			else
			{
				tempVar2 = 0;
				guiTimer3 = 0;
				guiTimer4 = 0;
				state = "itemdrop";
				with obj_musPlayer event_user(2);
				ov = true;
				ds_list_add(inventory, item);
				ds_list_add(uses, global.ITEM[item, 2]);
			}
			exit;
		}
		if(enemycapture != -1)
		{
			state = "enemycapture";
			guiTimer3 = 0;
			guiTimer4 = 0;
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
		}
		if(state == "temp")state = "endcombatskills";
	}
	break;
	case "endcombatskills":
		state = "temp";
		if(instance_exists(global.char1))
		{
			var charID = global.char1.characterID;
			for(var i = 0; i < ds_list_size(global.CHAR[charID, 34]); i ++)
			{
				var skill = ds_list_find_value(global.CHAR[charID, 34], i);
				if(global.SKILL[skill, 4] == 12)
				{
					if(!instance_exists(global.char2) && global.char1.HP <= floor(global.char1.MAXHP * (global.SKILL[skill, 15] / 100)))
					{
						global.char1.wheal = global.SKILL[skill, 12];
						with global.char1 AddBuff(1, global.SKILL[skill, 13], 5, skill, 1, global.SKILL[skill, 14]);
					}
				}
				//buzzer beater
				if(skill == 23)
				{
					if(whoDied == 1 && global.char1.HP <= floor(global.char1.MAXHP * (global.SKILL[skill, 12] / 100)))
					{
						global.char1.endturnType = 1;
					}
				}
			}
		}
		
	
		if(state == "temp")state = "pickevents";
	break;
	case "pickevents":
	
		state = "pickendheal";
		with(obj_unit)
		{
			if(allure > 0)
			{
				allureturns = allure;
				allure = 0;
				if(ofaction == -1)ofaction = faction;
				
				var mu = ds_list_find_index(global.faction[faction], id);
				ds_list_delete(global.faction[faction], mu);
				
				if(faction == 1)
				{
					if(ds_list_size(global.faction[faction] == 1))
					{
						faction = 0;
					} else faction = 2;
				}
				if(faction == 0 || faction == 2)faction = 1;
				var spfx = instance_create_depth(x + 16, y + 16, -7000, obj_combatFX);
				spfx.sprite_index = spr_allure;
				spfx.image_speed = 1.5;
				
				ds_list_add(global.faction[faction], id);
			}
		}
	break;
	case "pickendheal":
	{
		state = "checkgamesupport";
		with(obj_unit)
		{
			if(wheal > 0)
			{
				healTimer = 2;
	
				if(HP < MAXHP)
				{
					other.healTimer = 120;
					other.healUnit = id;
					global.camTarget = id;
					other.state = "endheal";
				}
				else
				{
					other.healUnit = noone;
				}
			}
		}
	}
	break;
	case "endheal":
	{
		if(healTimer == 90 && healUnit != noone)
		{
			with healUnit
			{
				audio_play_sound(sfx_heal, 0, 0);
				var spfx = instance_create_depth(x + 16, y + 8, -7000, obj_combatFX2);
				spfx.sprite_index = spr_heal;
				spfx.xscale = 50;
				spfx.yscale = 50;

				var damage = wheal;
				if(HP + damage > MAXHP)damage = MAXHP - HP;
				HP += damage;
				var a = instance_create_depth(x + 16, y + 8, -7000, obj_number);
				a.number = string(damage);
				a.sprite_index = spr_numberheal;
			}
		}
		if(healTimer > 0)healTimer --;
		if(healTimer <= 5)
		{
			if(opSize4 < 1)opSize4 += 1 / 5;
			if(opSize4 >= 1)opSize4 = 1;
		}
		else
		{
			if(opSize4 > 0)opSize4 -= 1 / 5;
			if(opSize4 <= 0)opSize4 = 0;
		}
		if(healTimer <= 0)
		{
			opSize4 = 1;
			healUnit.wheal = 0;
			healUnit = noone;
			
			state = "pickevents";
		}
	}
	break;
	case "checkgamesupport":
	
	tempVar10 = 0;
	if(instance_exists(global.char1))
	{
		with global.char1
		{
			if(faction == 0)
			{
				gainSupport = false;
				if(global.combatType == 0 && damagedealt > 0)
				{
					for(var i = 0; i < ds_list_size(standingNode.neighbors); i ++)
					{
						var cell = ds_list_find_value(standingNode.neighbors, i);
				
						if(cell.occupant != noone && cell.occupant.faction == 0)
						{
							SupportXP(global.char1.characterID, cell.occupant.characterID, 2);
						}
					}
				}
				else if(global.char2.faction == 0 && damagehealed > 0)
				{
					SupportXP(global.char1.characterID, global.char2.characterID, 2);
				}
			}
		}
		with(obj_unit)
		{
			if(gainSupport)
			{
				other.tempVar10 = 1;
				instance_create_depth(x + 16, y, depth - 128, obj_supportXP);
			}
			gainSupport = false;
		}
	}
	
	if(tempVar10 == 0)state = "checkgame"; else
	{
		state = "checkgamewait";
		tempVar11 = 0;
	}
	
	break;
	
	case "checkgamewait":
	
	tempVar11 ++;
	if(tempVar11 >= 30)state = "checkgame";
	
	break;
	case "checkgame":
	{
		if(ds_list_size(global.faction[1]) <= 0 || obj_pers.tempVar6 == 1001)
		{
			obj_pers.tempVar6 = 0;
			state = "endgame";
			gamestate = "win";
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
			//CleanMarked();
		}
		if(ds_list_size(global.faction[0]) <= 0 || obj_pers.tempVar6 == 1000)
		{
			obj_pers.tempVar6 = 0;
			state = "endgame";
			gamestate = "lose";
			with obj_musPlayer event_user(2);
			ov = true;
			exit;
			//CleanMarked();
		}
		state = "preparegame";
	}
	
	break;
	case "preparegame":
	{
		var phase = global.phase;
		if(instance_exists(global.selectedActor))
		{
			if(global.selectedActor.endturnType == 0)EndTurn(global.selectedActor);
			if(global.selectedActor.endturnType == 1)
			{
				global.selectedActor.MP = global.selectedActor.MAXMP;
				global.selectedActor.canAttack = 0;
				audio_play_sound(sfx_transpose, 0, 0);
		
				var spfx = instance_create_depth(global.selectedActor.x + 16, global.selectedActor.y + 8, -7000, obj_combatFX2);
				spfx.sprite_index = spr_transpose;
				spfx.xscale = 50;
				spfx.yscale = 50;
			}
		} 
		else
		CheckEndTurn(global.phase);
		if(global.phase == phase)
		{
			if(ov == true)
			{
				if(global.phase > 0)with obj_musPlayer event_user(4); else with obj_musPlayer event_user(3);
				ov = false;
			}
			else
			{
				with obj_musPlayer event_user(1);
			}
		}
		global.selectedActor = noone;
		state = "game";
		ov = false;
	}
	break;
	case "weaponbreak":
	{
		if(guiTimer3 < 20 && guiTimer4 == 0)guiTimer3 ++;
		if(guiTimer3 >= 20 && guiTimer3 < 100 && guiTimer4 < 1)guiTimer4 += 1 / 5;
		if(guiTimer4 >= 1 && guiTimer3 >= 20 && guiTimer3 < 100)
		{
			guiTimer3 = 0;
			audio_play_sound(sfx_break, 0, 0);
		}
		
		if(guiTimer3 == 0 && guiTimer4 >= 1 && global.Akey_state == 1)
		{
			guiTimer3 = 100;
		}
		if(guiTimer3 == 100)
		{
			guiTimer4 -= 1 / 5;
			if(guiTimer4 <= 0)
			{
				guiTimer4 = 0;
				guiTimer3 = 0;
				state = "endcombatevents";
				
				if(instance_exists(global.char1) && global.char1.faction == 0)EquipFirstWeapon(global.char1);
				
				if(global.itemBreak >= 200)global.ITEM[global.itemBreak, 0] = "error";
				global.itemBreak = -1;
			}
		}
	}
	break;
	case "itemdrop":
	{
		if(guiTimer3 < 20 && guiTimer4 == 0)guiTimer3 ++;
		if(guiTimer3 >= 20 && guiTimer3 < 100 && guiTimer4 < 1)guiTimer4 += 1 / 5;
		if(guiTimer4 >= 1 && guiTimer3 >= 20 && guiTimer3 < 100)
		{
			guiTimer3 = 0;
			audio_play_sound(sfx_itemGet, 0, 0);
		}
		
		if(guiTimer3 == 0 && guiTimer4 >= 1 && global.Akey_state == 1)
		{
			guiTimer3 = 100;
		}
		if(guiTimer3 == 100)
		{
			guiTimer4 -= 1 / 5;
			if(guiTimer4 <= 0)
			{
				guiTimer4 = 0;
				guiTimer3 = 0;
				if(tempVar2 == 0)
				{
					if(gamestate == "specialevents")state = "specialevents"; else state = "endcombatevents";
					ds_list_delete(global.itemDrops, 0);
				}
				else
				{
					state = "itemdropchoose";
					xScroll = 0;
					global.opSelect = 0;
					global.opSelect2 = 0;
					global.opSelect3 = 0;
					opSize4 = 1;
				}
				exit;
			}
		}
	}
	break;
	case "skillgain":
	{
		if(guiTimer3 < 20 && guiTimer4 == 0)guiTimer4 ++;
		if(guiTimer3 >= 20 && guiTimer3 < 100 && guiTimer4 < 1)guiTimer4 += 1 / 5;
		if(guiTimer4 >= 1 && guiTimer3 >= 20 && guiTimer3 < 100)
		{
			guiTimer3 = 0;
			audio_play_sound(sfx_itemGet, 0, 0);
		}
		
		if(guiTimer3 == 0 && guiTimer4 >= 1 && global.Akey_state == 1)
		{
			guiTimer3 = 100;
		}
		if(guiTimer3 == 100)
		{
			guiTimer4 -= 1 / 5;
			if(guiTimer4 <= 0)
			{
				guiTimer4 = 0;
				guiTimer3 = 0;

					state = "endcombatevents";
					skillGained = -1;

				exit;
			}
		}
	}
	break;
	case "weaponrank":
	{
		if(guiTimer3 < 20 && guiTimer4 == 0)guiTimer3 ++;
		if(guiTimer3 >= 20 && guiTimer3 < 100 && guiTimer4 < 1)guiTimer4 += 1 / 5;
		if(guiTimer4 >= 1 && guiTimer3 >= 20 && guiTimer3 < 100)
		{
			guiTimer3 = 0;
			audio_play_sound(sfx_itemGet, 0, 0);
		}
		
		if(guiTimer3 == 0 && guiTimer4 >= 1 && global.Akey_state == 1)
		{
			guiTimer3 = 100;
		}
		if(guiTimer3 == 100)
		{
			guiTimer4 -= 1 / 5;
			if(guiTimer4 <= 0)
			{
				guiTimer4 = 0;
				guiTimer3 = 0;

				state = "endcombatevents";
				weaponadvancetype = -1;
				weaponadvancerank = -1;
				exit;
			}
		}
	}
	break;
	case "enemycapture":
	{
		if(guiTimer3 < 20 && guiTimer4 == 0)guiTimer3 ++;
		if(guiTimer3 >= 20 && guiTimer3 < 100 && guiTimer4 < 1)guiTimer4 += 1 / 5;
		if(guiTimer4 >= 1 && guiTimer3 >= 20 && guiTimer3 < 100)
		{
			guiTimer3 = 0;
			audio_play_sound(sfx_showOptions, 0, 0);
		}
		
		if(guiTimer3 == 0 && guiTimer4 >= 1 && global.Akey_state == 1)
		{
			guiTimer3 = 100;
		}
		if(guiTimer3 == 100)
		{
			guiTimer4 -= 1 / 5;
			if(guiTimer4 <= 0)
			{
				guiTimer4 = 0;
				guiTimer3 = 0;

				state = "endcombatevents";
				enemycapture = -1;
				exit;
			}
		}
	}
	break;
	case "itemdropchoose":
	{
		if(opSize4 > 0)opSize4 -= 1 / 4;
		if(opSize4 < 0)opSize4 = 0;
		
		var item = ds_list_find_value(global.CHAR[global.char1.characterID, 49], global.opSelect);
		if(item != undefined)
		{
			draw_set_font(ft_large);
			draw_set_halign(fa_left);
			if(guiTimer2 >= 90)
			{
				var txt = DescriptionString(item);
					
				xScroll -= 2;
				if(xScroll < - 48 - string_width(txt))xScroll = -2;
			} else guiTimer2 ++;
		}
		
		var total = 6;
		
		if(global.opSelect2 == 0)
		{
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.opSelect > 0) global.opSelect --; else global.opSelect = total - 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.opSelect < total - 1)global.opSelect ++; else global.opSelect = 0;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
			if(global.Akey_state == 1)
			{
				audio_play_sound(sfx_showOptions, 0, 0);
				global.opSelect2 = 1;
				global.opSelect3 = 2;
				exit;
			}
		}
		if(global.opSelect2 == 1)
		{
			total = 2;
			if(global.rightKey_state == 1)
			{
				if(global.opSelect3 == 1)global.opSelect3 = 2; else global.opSelect3 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(global.opSelect3 == 2)global.opSelect3 = 1; else global.opSelect3 = 2;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.Akey_state == 1)
			{
				if(global.opSelect3 == 2)
				{
					global.opSelect2 = 0;
					audio_play_sound(sfx_back, 0, 0);
				}
				if(global.opSelect3 == 1)
				{
					global.opSelect2 = 0;
					audio_play_sound(sfx_select, 0, 0);
					
					var inventory = global.CHAR[global.char1.characterID, 49];
					var uses = global.CHAR[global.char1.characterID, 50];
					var item = ds_list_find_value(inventory, global.opSelect);
					var itemuses = ds_list_find_value(uses, global.opSelect);
					
					ds_list_add(global.CHAR[100, 49], item);
					ds_list_add(global.CHAR[100, 50], itemuses);
					
					DiscardItem(global.char1.characterID, global.opSelect);
					
					if(gamestate == "specialevents")state = "specialevents"; else state = "endcombatevents";
					ds_list_delete(global.itemDrops, 0);
				}
			}
			if(global.Bkey_state == 1)
			{
				global.opSelect2 = 0;
			}
		}
	}
	break;
	case "levelupstart":
	{
		//with obj_musPlayer 
		instance_create_depth(0, 0, -6000, obj_levelup);
		state = "levelupstart2";
		guiStep = 2;
	}
	break;
	case "levelupstart2":
	{
		guiTimer = 0;
		guiTimer2 = 0;
	}
	break;
	case "levelup":
	{
		if(guiStep > 0)
		{
			guiStep -= 0.08;
			if(guiTimer < 20)guiTimer += guiStep;
			if(guiTimer2 < 20 && guiTimer > 8)guiTimer2 += guiStep;
		}
		guiTimer4 ++;
		if(guiTimer4 > 30 && nupshow < ds_list_size(nup) && (guiTimer4 mod 15) == 0)
		{
			nupshow++;
			audio_play_sound(sfx_statup, 0, 0);
		}
		if(guiTimer4 == 1030)
		{
			if(global.CHAR[global.charlevelup.characterID, 54] != -1)audio_play_sound(global.CHAR[global.charlevelup.characterID, 54], 0, 0);
		}
		for(var i = 0; i < nupshow; i ++)
		{
			if(nupshowy[i] < 1)nupshowy[i] += 1 / 10;
		}
		if(nupshow == ds_list_size(nup) && guiTimer3 > 0 && guiTimer3 <= 30)guiTimer3 ++;
		if(guiTimer3 > 30)
		{
			var levelQuotes = -1;
			if(global.CHAR[global.charlevelup.characterID, 72] != -1)levelQuotes = global.CHAR[global.charlevelup.characterID, 72];
			if(levelQuotes == -1 && global.charlevelup.faction == 0)levelQuotes = 100;
			var levelQuote = "Looks like all my hard work is paying off!";
			
			var size = ds_list_size(nup);
			if(size <= 1)levelQuote = global.LEVELDIAL[levelQuotes, 3]; else
			if(size >= 2 && size <= 3)levelQuote = global.LEVELDIAL[levelQuotes, 2]; else
			if(size >= 4 && size <= 5)levelQuote = global.LEVELDIAL[levelQuotes, 1]; else
			if(size >= 6)levelQuote = global.LEVELDIAL[levelQuotes, 0];
			
			guiTimer3 = -1;
			guiTimer4 = 1000;
			Dialogue(global.charlevelup.characterID, levelQuote);
			SetLeftCharacter(global.charlevelup.characterID);
			DialogueStart(0, -1, 1);
		}
	}
	break;
	case "leveluphide":
	{
		if(guiTimer > 0)guiTimer -= 2;
		if(guiTimer2 > 0)guiTimer2 -= 2;
		if(guiTimer <= 0)
		{
			if(gamestate != "dancexpwait" && obj_pers.tempVar11 != 101)state = "endcombatfadein"; else
			{
				state = "game";
				gamestate = "select";
				
				with obj_musPlayer event_user(3);
			}
			obj_pers.tempVar11 = 0;
			sfxTimer = 0;
			guiTimer = 0;
			guiTimer2 = 0;
			guiTimer3 = 0;
			guiTimer4 = 0;
			guiStep = 0;
			global.showXP = 0;
			global.charlevelup = noone;

			ds_list_clear(nup);
			ds_list_clear(nupVal);
			nupshow = 0;
			for(var i = 0; i < 8; i ++)
			{
				statup[i] = 0;
				nupshowy[i] = 0;
			}
			
			with obj_levelup instance_destroy();
		}
	}
	break;
	case "endgame":
	
		state = "endgame2";
		CleanNodes();
		with obj_musPlayer event_user(2);
		with(obj_unit)
		{
			usedTurn = 0;
			canAttack = 1;
			endturnType = 0;
		}
		
	break;
	case "endgame2":
	
	
	if(global.currentMap == 4)global.gamelevel += 15; else if(global.currentMap == 6) global.gamelevel += 8; else global.gamelevel += 12;
	if(gamestate == "win")
	{
		instance_create_depth(0, 0, 0, obj_stageComplete);
		state = "endgame3";
		
		for(var i = 0; i < ds_list_size(global.REGION[global.MAP[global.currentMap, 1], 2]); i ++)
		{
			var map = ds_list_find_value(global.REGION[global.MAP[global.currentMap, 1], 2], i);
			if(global.MAP[map, 8] == false)
			{
				if(global.MAP[map, 14] == 0 && global.MAP[map, 13] == global.currentStage)
				{
					ds_list_add(global.mapUnlock, map);
				}
			}
		}
	}
	else
	{
		state = "endgamelose";
		gamestate = "endgamelose";
		obj_pers.gamestate = "endgamelose";
	}
	
	break;
	case "endgame4":
	
	if(global.Akey_state > 0)
	{
		with obj_stageComplete instance_destroy();
		with obj_pers
		{
			global.currentScene = global.STAGE[global.MAP[global.currentMap, 9], 4];
			NextScene();
		}
		state = "endgame5";
	}
	
	break;
}

switch(gamestate)
{
	case "showobj":
	{
		if(guiStep < 100)guiStep += 1 / 10;
		if(guiStep > 2 && guiStep < 100)
		{
			audio_play_sound(sfx_showObj, 0, 0);
			guiStep = 100;
		}
		if(guiTimer > 200 && guiTimer2 == 0)
		{
			guiTimer -= 20;
			if(guiTimer <= 200)guiTimer2 = 1;
		}
		if(guiTimer > 188 && guiTimer2 == 1)
		{
			guiTimer -= 0.15;
			if(guiTimer <= 188)guiTimer2 = 2;
		}
		if(guiTimer2 == 2)
		{
			guiTimer -= 20;
			if(guiTimer <= - 300)
			{
				gamestate = "showobj2";
				guiStep = 0;
				guiTimer = 0;
				guiTimer2 = 0;
			}
		}
	}
	break;
	case "showobj2":
	
		if(guiStep < 1)guiStep += 1 / 10;
		if(guiStep >= 1)
		{
			guiStep = 0;
			gamestate = "prepgame";
				
			instance_create_layer(0, 0, "back", obj_phase);
			alarm[1] = 80;
		}
	break;
	
	case "prepgame":
	{
		global.hoverUnit = noone;
		CleanNodes();
		/*
		CleanNodes();
		CleanMarked();
		global.enemyUpdated = true;
		global.rangeToggle = false;
		*/
		for(var i = 0; i < 3; i ++)
		{
			ds_list_clear(global.faction[i]);
		}
		with(obj_unit)
		{
			gameid = other.unitCreate;
			other.unitCreate++;
			UpdateStatsSwitch();
			ds_list_add(global.faction[faction], id);
			CalcRanges(id, 1);
			state = "idle";
		}
		gamestate = "pickheal";
	}
	break;
	case "aistart":
	{
		if(global.phase == 1 && global.optionState[7] == 1)
		{
			obj_pers.tempVar7 = 1;
			obj_pers.tempVar6 = 0;
		}
		with (obj_unit)
		{
			if(equipAfter != -1)
			{
				Equip(id, equipAfter);
				equipAfter = -1;
				//show_message("wpo");
			}
		}
		if(global.phase == 1 || global.phase == 2)
		{
			obj_camera.lastX = obj_camera.x;
			obj_camera.lastY = obj_camera.y;
			
			CleanNodes();
			currentEnemy = 0;
		
			ds_list_clear(myList);
			ds_priority_clear(priorityList);
			
			ds_list_clear(targetList);
			
			with(obj_unit)
			{
				if(global.phase == 1 && (faction == 0 || faction == 2))
				{
					ds_list_add(other.targetList, id);
				}
				if(global.phase == 2 && faction == 1)ds_list_add(other.targetList, id);
			}
			
			
			with(obj_unit)
			{
				cTarget = noone;
				cNode = noone;
				sacrifice = false;
				
				if(global.phase == 1 && faction == 1)
				{
					UpdateNodes(standingNode, id);
					var iniscore = 100;
					
					//if(weaponType != 2)iniscore = HP + ATK;
					//if(weaponType == 0)iniscore = (HP + ATK) * 1.25;
					if(weaponType == 2)iniscore -= 1500;
					for(var i = 0; i < ds_list_size(other.targetList); i ++)
					{
						var tar = ds_list_find_value(other.targetList, i);
						var dis = FindDistance(tar.gridX, tar.gridY, gridX, gridY);
						if(tar.standingNode.parent != noone || tar.standingNode.color == 2)iniscore += 1000;
						iniscore -= dis * 2;
					}
					
					ds_priority_add(other.priorityList, id, iniscore);
				}
				if(global.phase == 2 && faction == 2)ds_priority_add(other.priorityList, id, 0);
			}
			
			
			while(ds_priority_size(priorityList) > 0)
			{
				var ally = ds_priority_delete_max(priorityList);
				ds_list_add(myList, ally);
			}
			
			ds_priority_clear(priorityList);
		
			ChangeGameState("ainew_chooseai");
			if(global.phase == 1 && global.optionState[7] == 1) chooseTimer = 0;
			else chooseTimer = chooseTi;
			exit;
		}
	}
	break;
	case "ainew_skillwait":
	
	if(guiTimer > 0)guiTimer --;
	
	if(guiTimer <= 0)
	{
		EndTurn(global.selectedActor);
	}
	
	break;
	case "ainew_chooseai":
	{
		
		global.selectedActor = ds_list_find_value(myList, currentEnemy);
		if(global.selectedActor == undefined)
		{
			CheckEndTurn(global.phase);
		}
		if(global.phase == 1 && global.optionState[7] == 1)
		{
			obj_camera.xTo = global.selectedActor.x + 16;
			obj_camera.yTo = global.selectedActor.y + 16;
			obj_camera.x = global.selectedActor.x + 16;
			obj_camera.y = global.selectedActor.y + 16;
		}
		else
		{
			obj_camera.xTo = global.selectedActor.x + 16;
			obj_camera.yTo = global.selectedActor.y + 16;
		}
		if(chooseTimer > 0)chooseTimer--; else
		{
			if(global.selectedActor.weaponType < 2)
			{
				switch(global.selectedActor.aiType)
				{
					case 0: ChangeGameState("ainew_priority"); break;
					case 1: ChangeGameState("yournewAIsystem"); break;
				}
			}
			if(global.selectedActor.weaponType == 2)ChangeGameState("ainew_priorityHeal");
		}
	}
	break;
	
	case "yournewAIsystem":
	{
		var origin = global.selectedActor;
		
		//new AI code, with this code right now the enemy will simply end turn
		EndTurn(origin);
		///
	}
	break;
	
	case "ainew_priorityHeal":
	{		
		ds_priority_clear(targetPriority);
		ds_list_clear(targetList);
		
		var origin = global.selectedActor;
		
		with(obj_node)
		{
			marked = 0;
		}
		with(obj_unit)
		{
			if(global.phase == 1 && id != origin && faction == 1)
			{
				ds_list_add(other.targetList, id);
			}
			if(global.phase == 2 && id != origin && (faction == 0 || faction == 2))ds_list_add(other.targetList, id);
		}
		
		
		UpdateNodes(origin.standingNode, origin);
		for(var i = 0; i < ds_list_size(targetList); i ++)
		{
			var tscore = 50;
			var tar = ds_list_find_value(targetList, i);
			
			if(tar.HP < tar.MAXHP)
			{
				tscore += tar.MAXHP - tar.HP;
				
				ds_priority_add(targetPriority, tar, tscore);
			}
		}
		
		if(ds_priority_size(targetPriority) > 0)ChangeGameState("ainew_reviewheal");
		else
		{
			origin.equipAfter = global.CHAR[origin.characterID, 56];
			for(var i = 0; i < 5; i ++)
			{
				var item = ds_list_find_value(global.CHAR[origin.characterID, 49], i);
				if(global.ITEM[item, 14] < 2)
				{
					origin.lastWeapon = i;
					Equip(origin, i);
					ChangeGameState("ainew_priority");
					break;
				}
			}
		}
	}
	break;	
	case "ainew_priority":
	{		
		ds_priority_clear(targetPriority);
		ds_list_clear(targetList);
		
		with(obj_node)
		{
			marked = 0;
		}
		with(obj_unit)
		{
			if(global.phase == 1 && (faction == 0 || faction == 2))
			{
				ds_list_add(other.targetList, id);
				UpdateNodesAImarked(standingNode, id, global.selectedActor);
			}
			if(global.phase == 2 && faction == 1)ds_list_add(other.targetList, id);
		}
		
		var origin = global.selectedActor;
		UpdateNodes(origin.standingNode, origin);
		for(var i = 0; i < ds_list_size(targetList); i ++)
		{
			var tscore = 50;
			var tar = ds_list_find_value(targetList, i);
			
			if(tar.standingNode.color == 2)
			{
				tscore += tar.ATK * 2;
				
				UpdateStatsCompare(origin, tar);
				var totalDamage = origin.ATKd;
				
				if(origin.minRange < tar.minRange || origin.maxRange > tar.maxRange)tscore += 90;
				else
				{
					if(origin.HP <= tar.ATKd && origin.SPD > tar.SPD + 4) totalDamage -= origin.ATKd;
				}
				
				if(totalDamage <= 0)tscore -= 500;
				if(origin.SPD > tar.SPD + 4)totalDamage += origin.ATKd;
				tscore += totalDamage * 5;
				
				var pscore = 0;
				for(var b = 0; b < 5; b ++)
				{
					var item = ds_list_find_value(global.CHAR[tar.characterID, 49], b);
					if(global.ITEM[item, 4] >= 10 && global.ITEM[item, 4] != 18)
					{
						pscore = 1;
						break;
					}
				}
				if(pscore == 1)tscore += 130;
				if(tar.HP <= totalDamage)tscore += 120;
				
				if(tscore > 0)ds_priority_add(targetPriority, tar, tscore);
			}
		}
		
		if(ds_priority_size(targetPriority) > 0)ChangeGameState("ainew_reviewattack");
		else
		{
			ChangeGameState("ainew_searchally");
			if(origin.equipAfter != -1)
			{
				Equip(origin, origin.equipAfter);
				origin.equipAfter = -1;
				//show_message("wpo");
			}
		}
	}
	break;
	case "ainew_reviewattack":
	{
		var origin, tar, tarNode;
		origin = global.selectedActor;
		
		while(ds_priority_size(targetPriority) > 0)
		{
			tar = ds_priority_delete_max(targetPriority);
			tarNode = tar.standingNode;
			
			bestS = -9999;
			closestNode = -1;
			with (obj_node)
			{
				if(color == 1 && (occupant == noone || occupant == origin) && passable == true)
				{
					var dis = FindDistance(gridX, gridY, tarNode.gridX, tarNode.gridY);
					var scoree = global.max_move - G;
					scoree -= marked * 5;
					if(type == 3)scoree += 10;
					
					for(var n = 0; n < ds_list_size(neighbors); n ++)
					{
						var nei = ds_list_find_index(neighbors, n);
						if(nei.occupant != noone && nei.occupant.faction == origin.faction && nei.occupant != origin)
						{
							scoree += 5;
						}
					}
					if(dis >= tar.minRange && dis <= tar.maxRange)scoree -= 25;
					if(scoree > other.bestS && dis >= origin.minRange && dis <= origin.maxRange)
					{
						if(!(dis <= 1 && abs(level - tarNode.level) >= 2))
						{
							other.bestS = scoree;
							other.closestNode = id;
						}
					}
				}
			}
			if(closestNode != -1)
			{
				//numbers advantage
				var numbers = ds_list_size(myList);
				if(closestNode.marked <= floor(numbers / 2))origin.sacrifice = true;
				
				UpdateStatsCompare(origin, tar);
				var totalDamage = 0;
				var cbdis = FindDistance(tar.gridX, tar.gridY, closestNode.gridX, closestNode.gridY);
							
				if(tar.HP > origin.ATKd && cbdis >= tar.minRange && cbdis <= tar.maxRange)totalDamage += tar.ATKd;
				if(tar.SPD > origin.SPD + 4 && tar.HP > origin.ATKd && cbdis >= tar.minRange && cbdis <= tar.maxRange)totalDamage += tar.ATKd;
				
				if(origin.HP > totalDamage || origin.sacrifice == true)
				{
					origin.cTarget = tar;
					origin.cNode = closestNode;
								
					if(origin.cNode != origin.standingNode)
					{
						global.pathArray[0] = origin.standingNode;
						redrawPath(origin.cNode, origin);
						BeginPath();
						if(origin.sacrifice == false)ChangeGameState("ainew_safeattack"); else ChangeGameState("ainew_sacrifice");
						exit;
					}
					else
					{
						BeginCombat(origin.cTarget, origin);
						if(origin.sacrifice == false)ChangeGameState("ainew_safeattack"); else ChangeGameState("ainew_sacrifice");
						exit;
					}
				}
			}
		}
		
		if(origin.equipAfter != -1)
		{
			Equip(origin, origin.equipAfter);
			origin.equipAfter = -1;
			//show_message("wpo");
		}
		if(origin.aiType == 0)ChangeGameState("ainew_searchally");
		if(origin.aiType == 1)ChangeGameState("ainew_searchsafe");
	}
	break;
	case "ainew_reviewheal":
	{
		var origin, tar, tarNode;
		origin = global.selectedActor;
		
		while(ds_priority_size(targetPriority) > 0)
		{
			tar = ds_priority_delete_max(targetPriority);
			tarNode = tar.standingNode;
			
			bestS = -9999;
			closestNode = -1;
			with (obj_node)
			{
				if(color == 1 && (occupant == noone || occupant == origin) && passable == true)
				{
					var dis = FindDistance(gridX, gridY, tarNode.gridX, tarNode.gridY);
					var scoree = global.max_move - G;
					scoree -= marked * 5;
					if(type == 3)scoree += 10;
					
					for(var n = 0; n < ds_list_size(neighbors); n ++)
					{
						var nei = ds_list_find_index(neighbors, n);
						if(nei.occupant != noone && nei.occupant.faction == origin.faction && nei.occupant != origin)
						{
							scoree += 5;
						}
					}
					if(scoree > other.bestS && dis >= origin.minRange && dis <= origin.maxRange)
					{
						if(!(dis <= 1 && abs(level - tarNode.level) >= 2))
						{
							other.bestS = scoree;
							other.closestNode = id;
						}
					}
				}
			}
			if(closestNode != -1)
			{			
				var cbdis = FindDistance(tar.gridX, tar.gridY, closestNode.gridX, closestNode.gridY);

				origin.cTarget = tar;
				origin.cNode = closestNode;
								
				if(origin.cNode != origin.standingNode)
				{
					global.pathArray[0] = origin.standingNode;
					redrawPath(origin.cNode, origin);
					BeginPath();
					if(origin.sacrifice == false)ChangeGameState("ainew_safeattack"); else ChangeGameState("ainew_sacrifice");
					exit;
				}
				else
				{
					BeginCombat(origin.cTarget, origin);
					if(origin.sacrifice == false)ChangeGameState("ainew_safeattack"); else ChangeGameState("ainew_sacrifice");
					exit;
				}
			}
		}
		ChangeGameState("ainew_searchally");
	}
	break;
	case "ainew_searchsafe":
	{
		var origin = global.selectedActor;
		var enemytoattack = -1;
		var enemyscore = 0;
		
		UpdateNodesInfinite(origin.standingNode, origin);
		var tarFaction1 = -1;
		var tarFaction2 = -1;
		if(origin.faction == 1)
		{
			tarFaction1 = 0;
			tarFaction2 = 2;
		}
		else
		{
			tarFaction1 = 1;
		}
		
		with(obj_unit)
		{
			if(faction == tarFaction1 || faction == tarFaction2)
			{
				var scoree = 1000;
				var dis = standingNode.G;

				scoree = 2000;
				scoree -= dis * 10;
				if(scoree > enemyscore)
				{
					enemytoattack = id;
					enemyscore = scoree;
				}
			}
		}
		bestS = -9999;
		closestNode = -1;
		if(enemytoattack != -1)
		{
			UpdateNodesInfinite(enemytoattack.standingNode, origin);
		
			with (obj_node)
			{
				if(G > 0 && color == 1 && occupant == noone && passable == true)
				{
					var cellscore = 1000;
					cellscore -= G * 10;
					cellscore -= marked * 200;
					
					if(type == 3 && origin.HP < origin.MAXHP - origin.MAXHP * 0.2)cellscore += 5;
					//cellscore -= marked * 2;
					
					if(cellscore > other.bestS)
					{
						other.closestNode = id;
						other.bestS = cellscore;	
					}
				}
			}
			
			//if(allytohelp != -1)show_message(allytohelp.characterID);
			
			UpdateNodes(origin.standingNode, origin);
			
			if(closestNode != -1)
			{
				//show_message(allytohelp.characterID);
				if(closestNode != origin.standingNode)
				{
					global.pathArray[0] = origin.standingNode;
					redrawPath(closestNode, origin);
					ChangeGameState("ainew_movesafe");
					BeginPath();
					exit;
				}
				else
				{
					ChangeGameState("ainew_movesafe");
					EndTurn(origin);
					exit;
				}
			}
		}
		
		//strange
		EndTurn(origin);
	}
	break;
	case "ainew_searchally":
	{
		
		var origin = global.selectedActor;
		var allytohelp = -1;
		var allyscore = 0;
		
		UpdateNodesInfinite(origin.standingNode, origin);
		
		with(obj_unit)
		{
			if(faction == origin.faction)
			{
				var scoree = 1000;
				if(id != origin)
				{

					var dis = standingNode.G;
					if(standingNode.marked > 0 && dis > 0)
					{
						scoree = 2000;
						scoree -= dis * 10;
						if(scoree > allyscore)
						{
							allytohelp = id;
							allyscore = scoree;
						}
					}
				}
			}
		}
		bestS = -9999;
		closestNode = -1;
		if(allytohelp != -1)
		{
			UpdateNodesInfinite(allytohelp.standingNode, allytohelp);
		
			with (obj_node)
			{
				if(G > 0 && color == 1 && occupant == noone && passable == true)
				{
					var cellscore = 1000;
					cellscore -= G * 10;
					
					if(type == 3 && origin.HP < origin.MAXHP - origin.MAXHP * 0.2)cellscore += 5;
					//cellscore -= marked * 2;
					
					if(cellscore > other.bestS)
					{
						other.closestNode = id;
						other.bestS = cellscore;	
					}
				}
			}
			
			//if(allytohelp != -1)show_message(allytohelp.characterID);
			
			UpdateNodes(origin.standingNode, origin);
			
		
			if(closestNode != -1)
			{
				//show_message(allytohelp.characterID);
				if(closestNode != origin.standingNode)
				{
					global.pathArray[0] = origin.standingNode;
					redrawPath(closestNode, origin);
					ChangeGameState("ainew_moveprotect");
					BeginPath();
					exit;
				}
				else
				{
					ChangeGameState("ainew_moveprotect");
					CheckRallies(origin);
					
					exit;
				}
			}
		}
		ChangeGameState("ainew_searchsafe"); //nothing to do
		
	}
	break;
	case "aitoend":
	{
		if(global.transitionCombat <= 0 && state == "game")
		{
			gamestate = "aiend";
		}
	}
	break;
	case "aiend":
	{
		clearPath();
		CleanNodes();
		CleanMarked();
		
		for(var i = 0; i < ds_list_size(global.faction[1]); i ++)
		{
			var char = ds_list_find_value(global.faction[1], i);
			UpdateNodesmarked(char.standingNode, char);
			
			if(char.markRange == true)
			{
				UpdateNodesmarked_single(char.standingNode, char);
			}
		}

		global.selectedActor = noone;
		gamestate = "aiend2";
		if(global.controlsType == 0) UpdateCamera(obj_camera.lastX, obj_camera.lastY);
		else
		{
			obj_camera.xTo = cx * global.gridSize + 16;
			obj_camera.yTo = cy * global.gridSize + 16;
			if(obj_pers.tempVar7 == 1 && global.optionState[7] == 1)
			{
				obj_camera.x = obj_camera.xTo;
				obj_camera.y = obj_camera.yTo;
			}
		}
		//memee
	}
	break;
	case "aiend2":
	{	
		if(obj_pers.tempVar7 == 1)
		{
			obj_pers.tempVar7 = 2;
			obj_pers.tempVar6 = 10;
		}
		if(global.phase == 0)
		{
			gamestate = "newturn";
		}
		else if(global.phase == 1 || global.phase == 2)
		{
			CheckEndTurn(global.phase);
		}
	}
	break;
    case "select":
    {
		if(global.phase != 0)exit;
		if(global.transitionCombat <= 0 && state == "game")
		{
			HoverNode();
			
			if(global.hoverNode != noone && (global.hoverNode.occupant == noone || global.hoverNode.occupant.usedTurn == 1))
			{
				if(global.Akey_state == 1)
				{
					global.showOptions = 7;
					gamestate = "showmenu";
					
					with obj_pers
					{
						gamestate = "showmenu";
						global.glSelect = 0;
						global.glSelect2 = 0;
						opSize = 1;
						opSize2 = 1;
						opSize3 = 1;
						opSize4 = 1;
						closeoptions = false;
						audio_play_sound(sfx_showOptions, 0, 0);
					}
					
					global.menuOptions = 0;
					
					//global.menuText[global.menuOptions] = "Units";
					//global.menuDescription[global.menuOptions] = "Display a list of your units in action.";
					//global.menuOptions ++;
					
					//global.menuText[global.menuOptions] = "Controls";
					//global.menuDescription[global.menuOptions] = "Adjust game controls.";
					//global.menuOptions ++;
					
					global.menuText[global.menuOptions] = "Options";
					global.menuDescription[global.menuOptions] = "Adjust game options.";
					global.menuOptions ++;
				
					global.menuText[global.menuOptions] = "Controls";
					global.menuDescription[global.menuOptions] = "Open the control mapper.";
					global.menuOptions ++;
					
					global.menuText[global.menuOptions] = "Save";
					global.menuDescription[global.menuOptions] = "Save your progress.";
					global.menuOptions ++;
					
					global.menuText[global.menuOptions] = "Retreat";
					global.menuDescription[global.menuOptions] = "Go back to the world map.";
					global.menuOptions ++;
					
					global.menuText[global.menuOptions] = "End";
					global.menuDescription[global.menuOptions] = "End your turn. The enemy will move next.";
					global.menuOptions ++;
					
					exit;
				}
			}
        
	        if(global.hoverNode != noone && global.hoverNode.occupant != noone && global.hoverNode.occupant.faction == 0 && global.hoverNode.occupant.usedTurn == 0 && global.Akey_state == 1)
	        {
	            global.selectedActor = global.hoverNode.occupant;
				CalcRanges(global.selectedActor, 1);
	            UpdateNodes(global.hoverNode, global.selectedActor);
	            gamestate = "selected";
				//TerrainBonus(global.selectedActor, global.selectedActor.standingNode);
				tabFaction = global.selectedActor.faction;
				areaIn = 0;
				global.canRewind = true;
				audio_play_sound(sfx_scroll, 0, 0);
				
				global.selectedActor.state = "selected";
				global.selectedActor.index = 20;
				global.selectedActor.rewindX = global.selectedActor.gridX;
				global.selectedActor.rewindY = global.selectedActor.gridY;
				refundMP = 0;
            
	            global.pathArray[0] = global.hoverNode;
				AttackableCells(global.selectedActor.standingNode, global.selectedActor);
				clearPath();
	        }
			
			if(global.hoverNode != noone && global.hoverNode.occupant != noone && global.Ykey_state == 1)
			{
				global.selectedActor = global.hoverNode.occupant;
				
	            gamestate = "showstats";
				UpdateSkillList(global.selectedActor.characterID);
				
				//var skills = ds_list_size(global.CHAR[global.selectedActor.characterID, 34]);
				//var inventory = ds_list_size(global.CHAR[global.selectedActor.characterID, 49]);
				
				with obj_pers
				{
					ds_list_clear(nup);	
					for(var i = 0; i < ds_list_size(global.charList); i ++)
					{
						var char = ds_list_find_value(global.charList, i);
						if(char != global.selectedActor.characterID && global.selectedActor.faction == 0 && global.selectedActor.characterID < 50 && char < 50)
						{
							if(global.SUPPORTLIMIT[char, global.selectedActor.characterID] > 0) ds_list_add(nup, char);
						}
					}
				}
				
				if(global.glSelect5 != 0 && global.glSelect5 != 1)global.glSelect5 = 0;
				
				global.glSelect6 = 0;
				global.glSelect7 = 0;
				global.glSelect8 = 0;
				global.hoverNode = noone;
				audio_play_sound(sfx_scroll, 0, 0);
				exit;
			}
		}
    }
    break;
    case "selected":
    {
		if(global.transitionCombat <= 0 && state == "game")
		{
			HoverNode();
        
	        if(global.hoverNode == global.selectedActor.standingNode && global.pathSize > 1)
	        {
	            clearPath();
	        }
			allyenemy = 0;
			if(global.hoverNode != noone && global.hoverNode.occupant != noone && (global.hoverNode.occupant.faction == 0 || global.hoverNode.occupant.faction == 2))allyenemy = 1;
			if(global.hoverNode != noone && global.hoverNode.occupant != noone && (global.hoverNode.occupant.faction == 1))allyenemy = 2;
			

	        if(allyenemy == 0 && global.hoverNode != noone && global.hoverNode.color == 1 && global.hoverNode != global.selectedActor.standingNode && global.hoverNode.parent != noone && global.pathArray[global.pathSize - 1] != global.hoverNode)
	        {
	            var found = false;
	            for(var i = 0; i < ds_list_size(global.hoverNode.neighbors); i ++)
	            {
	                var node = ds_list_find_value(global.hoverNode.neighbors, i);
	                if(global.pathArray[global.pathSize - 1] == node && (node.level == global.hoverNode.level || abs(node.level - global.hoverNode.level) <= 1))
	                {
	                    found = true;
					
						addPath(global.hoverNode);
                    
	                    if(global.pathSize > global.selectedActor.MP + 1)
	                    {
	                        redrawPath(global.hoverNode, global.selectedActor);
	                    }
	                }
	            }
	            if(found == false)
	            {
	                redrawPath(global.hoverNode, global.selectedActor);
	            }
	        }
	        if(global.pathDraw > 1 && global.pathArray[global.pathDraw - 1] != noone && global.hoverNode != noone && global.hoverNode.color == 1 && allyenemy == 0)
	        {
	            if(global.pathArray[global.pathDraw - 1].occupant != noone) global.pathDraw --; else if(global.hoverNode.occupant == noone)global.pathDraw = global.pathSize;
	        }
		
			if(global.pathDraw > 1)
			{
				if(global.Akey_state == 1 && global.hoverNode != noone && global.hoverNode.occupant == noone && global.hoverNode.color == 1 && global.unitMoving == noone && global.showOptions == 0)
				{
					BeginPath();
					audio_play_sound(sfx_select, 0, 0);
					gamestate = "action";
					clearPath();
					exit;
				}
			}
			else
			{
				if(global.Akey_state == 1 && global.hoverNode != noone && global.hoverNode.occupant == global.selectedActor)
				{
					gamestate = "action";
					global.opSelect4 = 0;
					global.opSelect2 = 0;
					with global.selectedActor OpenOptions();
					exit;
				}
			}
	        if(global.Bkey_state == 1 && global.showOptions == 0)
			{
				global.selectedActor.index = 0;
				global.selectedActor.state = "idle";
				
				audio_play_sound(sfx_back, 0, 0);
				global.target = noone;
				global.selectedActor = noone;
	
				CleanNodes();

				gamestate = "select";
				break;
			}
			
			if(global.showOptions == 0 && global.target == noone && global.hoverNode != global.selectedActor.standingNode && global.unitMoving == noone && global.hoverNode != noone && global.hoverNode.occupant != noone && allyenemy > 0)
			{
				var targ = global.hoverNode;
				var bestScore = -1;
				var bestNode = -1;
				var minr = 0, maxr = 0;
				var canHeal = 0;
				if(targ.occupant.HP < targ.occupant.MAXHP)canHeal = 1;
				CalcRanges(global.selectedActor, canHeal);
				
				if(allyenemy == 1)
				{
					minr = global.selectedActor.minRangeAlly;
					maxr = global.selectedActor.maxRangeAlly;
				}
				else
				{
					minr = global.selectedActor.minRangeDamage;
					maxr = global.selectedActor.maxRangeDamage;
				}
			
				for(var i = global.max_move - 1; i >= 1; i --)
				{
					if(global.pathArray[i - 1] != noone)
					{
						var dis = FindDistance(global.pathArray[i - 1].gridX, global.pathArray[i - 1].gridY, targ.gridX, targ.gridY);
						var check = 0;
						if((global.pathArray[i - 1].occupant == noone || global.pathArray[i - 1].occupant == global.selectedActor) && dis > bestScore && dis >= global.selectedActor.minRange && dis <= global.selectedActor.maxRange && dis >= minr && dis <= maxr && allyenemy == 2 && global.selectedActor.canAttack)
						{
							if(!(dis <= 1 && abs(global.map[global.pathArray[i - 1].gridX, global.pathArray[i - 1].gridY].level - targ.level) >= 2))
							{
								bestScore = dis;
								bestNode = i;
							}
						}
					}
				}
				if(bestNode == -1)
				{
					for(var i = global.max_move - 1; i >= 1; i --)
					{
						if(global.pathArray[i - 1] != noone)
						{
							var dis = FindDistance(global.pathArray[i - 1].gridX, global.pathArray[i - 1].gridY, targ.gridX, targ.gridY);
						
							if((global.pathArray[i - 1].occupant == noone || global.pathArray[i - 1].occupant == global.selectedActor) && dis > bestScore && dis >= minr && dis <= maxr && global.selectedActor.canAttack)
							{
								if(!(dis <= 1 && abs(global.map[global.pathArray[i - 1].gridX, global.pathArray[i - 1].gridY].level - targ.level) >= 2))
								{
									bestScore = dis;
									bestNode = i;
								}
							}
						}
					}
				}
				
				if(bestNode != -1)
				{
					//show_message("bug");
					global.pathDraw = bestNode;
					//redrawPath(global.pathArray[bestNode], global.selectedActor);
					//redrawPath(bestNode, global.selectedActor)
					global.target = targ;
					/*
					global.selectedActor.adva = -1;
					global.target.adva = -1;
					if(global.selectedActor.weaponType < 2)UpdateStatsCompare(global.selectedActor, targ.occupant);
					*/
				}
				else
				{
					bestS = -9999;
					closestNode = -1;
					with (obj_node)
					{
						if(color == 1 && (occupant == noone || occupant == global.selectedActor) && passable == true)
						{
							var scoree = 100;
							var dis = FindDistance(gridX, gridY, global.hoverNode.gridX, global.hoverNode.gridY);
							scoree += - G + dis * 2;
							//if(dis >= global.selectedActor.minRange && dis <= global.selectedActor.maxRange)scoree += 100;
							if(scoree > other.bestS && dis >= minr && dis <= maxr)
							{
								if(!(dis <= 1 && abs(level - global.hoverNode.level) >= 2))
								{
									other.bestS = scoree;
									other.closestNode = id;
								}
							}
						}
					}
					if(closestNode != -1)
					{
						redrawPath(closestNode, global.selectedActor);
						global.target = global.hoverNode;
						/*
						global.selectedActor.adva = -1;
						global.target.adva = -1;
						if(global.selectedActor.weaponType < 2)UpdateStatsCompare(global.selectedActor, global.target.occupant);
						*/
					} 
				}
			}
			if(global.target != global.hoverNode)
			{
				global.target = noone;
			}
			else if(global.hoverNode != noone)
			{
				if(global.Akey_state == 1)
				{
					//switch wepp
					gamestate = "select target dir";
					audio_play_sound(sfx_select, 0, 0);
					global.cellAttack = global.pathArray[global.pathDraw - 1];
					TerrainBonus(global.selectedActor, global.cellAttack)
					
					global.showOptions = 3;
					targetDis = FindDistance(global.cellAttack.gridX, global.cellAttack.gridY, global.target.gridX, global.target.gridY);
					
					var check = 0;
					if(allyenemy == 2 && targetDis >= global.selectedActor.minRangeDamage && targetDis <= global.selectedActor.maxRangeDamage && targetDis >= global.selectedActor.minRange && targetDis <= global.selectedActor.maxRange)check = 1;
					if(allyenemy == 1 && targetDis >= global.selectedActor.maxRangeAlly && targetDis <= global.selectedActor.maxRangeAlly && targetDis >= global.selectedActor.minRange && targetDis <= global.selectedActor.maxRange)check = 1;
					if(!check)
					{
						SwitchWeapon(global.selectedActor, global.target.occupant, global.cellAttack, allyenemy);
						global.selectedActor.adva = -1;
						global.target.adva = -1;
						MoveEquipTop(global.selectedActor.characterID);
					}
					/*
					if(targetDis >= minr && targetDis <= maxr)
					{
						
						if(allyenemy == 1 && global.selectedActor.weaponType < 2)
						{
							SwitchWeapon(global.selectedActor, global.target.occupant, global.cellAttack, allyenemy);
						}
						if(allyenemy == 2 && global.selectedActor.weaponType >= 2)
						{
							SwitchWeapon(global.selectedActor, global.target.occupant, global.cellAttack, allyenemy);
						}
						global.selectedActor.adva = -1;
						global.target.adva = -1;
					}
					else
					{
						SwitchWeapon(global.selectedActor, global.target.occupant, global.cellAttack, allyenemy);
						global.selectedActor.adva = -1;
						global.target.adva = -1;
						//UpdateStatsCompare(global.selectedActor, global.target.occupant);
						MoveEquipTop(global.selectedActor.characterID);
					}
					*/
					
					UpdateStatsCompare(global.selectedActor, global.target.occupant);
					
					RefreshUsable(global.selectedActor, targetDis);
					
					break;
				}
			}

	    }
	}
    break;
	case "action":
	{
		if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
		{
			global.hoverNode = noone;
		}
		else
		{
			global.hoverNode = global.map[cx, cy];
		}
	}
	break;
	case "select target":
	{
		global.cellAttack = global.selectedActor.standingNode;
		
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		/*
		var check = 0;
		if(global.controlsType == 0 && !(global.mxv < 190 && global.myv > 160))check = 1;
		if(global.controlsType > 0)check = 1;
		
		
		if(check)
		{
			var list = 0;
			if(targetLis == 1)list = global.selectedActor.standingNode.cellHeal;
			if(targetLis == 2)list = global.selectedActor.standingNode.cellAttack;
			for(var i = 0; i < ds_list_size(list); i ++)
			{
				var cell = ds_list_find_value(list, i);
				var dis = FindDistance(global.selectedActor.gridX, global.selectedActor.gridY, cell.gridX, cell.gridY);
				var mir = 0, mar = 0;
				if(targetLis == 1)
				{
					mir = global.selectedActor.minRangeAlly;
					mar = global.selectedActor.maxRangeAlly;
				}
				else
				{
					mir = global.selectedActor.minRangeDamage;
					mar = global.selectedActor.maxRangeDamage;
				}
				if(dis >= mir && dis <= mar && (global.hoverNode == cell || global.target == noone) && global.target != cell)
				{
					if(global.target != cell)audio_play_sound(sfx_scrollMap, 0, 0);
					global.target = cell;
					if(global.controlsType > 0)
					{
						global.hoverNode = cell;
						pickIndex = i;
					}
					global.selectedActor.adva = -1;
					global.target.adva = -1;
					if(global.selectedActor.weaponType < 2)UpdateStatsCompare(global.selectedActor, global.target.occupant);
				}
				if(global.target == cell && global.Akey_state == 1 && global.hoverNode == global.target)
				{
					gamestate = "attack";
				
					BeginCombat(global.selectedActor, cell.occupant);
					MoveEquipTop(global.selectedActor.characterID);
				
					global.showOptions = 0;
					global.target = noone;
					global.selectedActor.state = "idle";
							
					//global.opSelect = -1;
				
					exit;
				}
			}
		}
		*/
		
		var listType = -1, minr = 0, maxr = 0;
		if(global.selectedActor.weaponType < 2)
		{
			listType = global.selectedActor.standingNode.cellAttack;
			minr = global.selectedActor.minRangeDamage;
			maxr = global.selectedActor.maxRangeDamage;
		}
		else
		{
			listType = global.selectedActor.standingNode.cellHeal;
			minr = global.selectedActor.minRangeAlly;
			maxr = global.selectedActor.maxRangeAlly;
		}
		for(var i = 0; i < ds_list_size(listType); i ++)
		{
			var cell = ds_list_find_value(listType, i);
			var dis = FindDistance(global.selectedActor.gridX, global.selectedActor.gridY, cell.gridX, cell.gridY);
			if(dis >= global.selectedActor.minRange && dis <= global.selectedActor.maxRange && (global.hoverNode == cell || global.target == noone) && global.target != cell)
			{
				if(global.target != cell)audio_play_sound(sfx_scrollMap, 0, 0);
				global.target = cell;
				if(global.controlsType > 0)
				{
					global.hoverNode = cell;
					pickIndex = i;
				}
				global.selectedActor.adva = -1;
				global.target.adva = -1;
				if(global.selectedActor.weaponType < 2)UpdateStatsCompare(global.selectedActor, global.target.occupant);
			}
			if(global.target == cell && global.Akey_state == 1 && global.hoverNode == global.target)
			{
				gamestate = "attack";
				
				BeginCombat(global.selectedActor, cell.occupant);
				MoveEquipTop(global.selectedActor.characterID);
				
				global.showOptions = 0;
				global.target = noone;
				global.selectedActor.state = "idle";
							
				//global.opSelect = -1;
				
				exit;
			}
		}
		
		if(global.controlsType > 0)
		{
			if(global.leftKey_state == 1)
			{
				if(pickIndex > 0)pickIndex --;
				else pickIndex = ds_list_size(listType) - 1;
				
				global.hoverNode = ds_list_find_value(listType, pickIndex);

				global.leftKey_state = 2;
			}
			if(global.rightKey_state == 1)
			{
				if(pickIndex < ds_list_size(listType) - 1)pickIndex ++;
				else pickIndex = 0;
				
				global.hoverNode = ds_list_find_value(listType, pickIndex);

				global.rightKey_state = 2;
			}
		}
		
		if(global.Bkey_state == 1)
		{
			//uiop
			/*
			with (obj_unit)
			{
				if(equipAfter != -1)
				{
					Equip(id, equipAfter);
					equipAfter = -1;
					//show_message("wpo");
				}
			
			*/
			//back from select
			//global.showOptions = 3;
			//global.skillSelected = -1;
			//global.target = noone;
			//gamestate = "action";
			//global.showOptions = 1;
			//UpdateWeaponSkill();
			//global.opSelect = 0;
			//UpdateWeaponSkill();
			guiTimer = 1;
			var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
			if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
					
			//gamestate = "chooseweapon";
			guiTimer2 = 0;
			xScroll = 0;
			
			//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			audio_play_sound(sfx_back, 0, 0);
			with global.selectedActor UpdateStatsSwitch();
			with (obj_node)marked4 = 0;
			MoveEquipTop(global.selectedActor.characterID);
			
			UpdateWeaponSkill();
			if(selType == 1)UpdateWeaponHeal();
			global.showOptions = 4;
			var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
			if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
					
			gamestate = "chooseweapon";
			
			exit;
		}
	}
	break;
	case "select target dir":
	{	
		
		if(global.hoverNode != global.target && global.map[cx, cy] == global.target)
		{
			audio_play_sound(sfx_scrollMap, 0, 0);
		}
		if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
		{
			global.hoverNode = noone;
		}
		else
		{
			global.hoverNode = global.map[cx, cy];
		}
		
		if(global.hoverNode == global.target && global.Akey_state == 1)
		{
			gamestate = "attack";
			if(global.pathDraw > 1)
			{
				BeginPath();
				audio_play_sound(sfx_select, 0, 0);
				global.showOptions = 0;
			}
			else
			{
				BeginCombat(global.selectedActor, global.target.occupant);
				global.showOptions = 0;
			}
				
			break;
		}
		
		if(global.Bkey_state == 1)
		{
			/*
			if(global.target != noone && global.target.occupant != noone && global.target.occupant.equipAfter != -1)
			{
				//show_message(global.target.occupant.equipAfter);
				Equip(global.target.occupant, global.target.occupant.equipAfter);
				global.target.occupant.equipAfter = -1;
				//show_message("wpo");
			}
			*/
			//show_message(global.target.occupant.equipAfter);
			global.skillSelected = -1;
			
			global.target = noone;
			gamestate = "selected";
			global.showOptions = 0;
			
			with (obj_node)marked4 = 0;
			audio_play_sound(sfx_back, 0, 0);
			
			TerrainBonus(global.selectedActor, global.selectedActor.standingNode);
			with global.selectedActor UpdateStatsSwitch();
			
			break;

		}
	}
	break;
	case "showstats":
	{
		ShowStatsControls(global.selectedActor.characterID, 0);
		with obj_pers
		{
			tcindex = 0;
			tindex += 0.1;
			if(tindex >= 4)tindex = 0;
		}
	}
	break;
	case "begintrade":
	{
		global.markedColor = 6;
		global.showOptions = 6;
		ds_list_clear(tradersList);
		for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
			if(node.occupant != noone && node.occupant.faction == global.selectedActor.faction)
			{
				ds_list_add(tradersList, node);
				node.marked4 = 1;
				global.targetOp = node;
			}
		}
		gamestate = "trading";
	}
	break;
	case "begindance":
	{
		global.markedColor = 6;
		global.showOptions = 6;
		ds_list_clear(tradersList);
		for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
			if(node.occupant != noone && node.occupant.faction == global.selectedActor.faction && node.occupant.usedTurn == 1)
			{
				ds_list_add(tradersList, node);
				node.marked4 = 1;
				global.targetOp = node;
			}
		}
		gamestate = "dancing";
	}
	break;
	case "beginshove":
	{

		global.markedColor = 6;
		global.showOptions = 6;
		ds_list_clear(tradersList);
		for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
			if(node.occupant != noone && node.occupant.faction == global.selectedActor.faction)
			{
				var xx = node.occupant.gridX, yy = node.occupant.gridY;
				if(xx < global.selectedActor.standingNode.gridX)xx --; else
				if(xx > global.selectedActor.standingNode.gridX)xx ++; else
				if(yy < global.selectedActor.standingNode.gridX)yy --; else
				if(yy < global.selectedActor.standingNode.gridX)yy ++;
				
				var charType = global.CLASS[global.CHAR[node.occupant.characterID, 3], 21];
				
				var available = 0;
				if(global.map[xx, yy].occupant == noone)available = 1;
				if(global.map[xx, yy].type == 4 && charType != 1 && charType != 4)available = 0;
				if(global.map[xx, yy].type == 5 && charType != 1 && charType != 4)available = 0;
				if(available)
				{
					ds_list_add(tradersList, node);
					node.marked4 = 1;
					global.targetOp = node;
				}
			}
		}
		gamestate = "shoving";
	}
	break;
	case "beginrescue":
	{

		global.markedColor = 6;
		global.showOptions = 6;
		ds_list_clear(tradersList);
		for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
			if(node.occupant != noone && node.occupant.faction == global.selectedActor.faction)
			{
				if(global.CLASS[global.CHAR[node.occupant.characterID, 3], 21] == 0)
				{
					ds_list_add(tradersList, node);
					node.marked4 = 1;
					global.targetOp = node;
				}
			}
		}
		gamestate = "rescuing";
	}
	break;
	case "begindrop":
	{

		global.markedColor = 6;
		global.showOptions = 6;
		ds_list_clear(tradersList);
		for(var i = 0; i < ds_list_size(global.selectedActor.standingNode.neighbors); i ++)
		{
			var node = ds_list_find_value(global.selectedActor.standingNode.neighbors, i);
			if(node.occupant == noone)
			{
				ds_list_add(tradersList, node);
				node.marked4 = 1;
				global.targetOp = node;
			}
		}
		gamestate = "dropping";
	}
	break;
	case "trading":
	{
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		
		if(global.controlsType > 0)
		{
			var index = ds_list_find_index(tradersList, global.targetOp);
			stind = index;
			if(global.rightKey_state == 1)
			{
				if(index > 0)index --; else index = ds_list_size(tradersList) - 1;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(index < ds_list_size(tradersList) - 1)index++; else index = 0;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			global.targetOp = ds_list_find_value(tradersList, index);
			global.hoverNode = global.targetOp;
		}
		//ds_list_find_index(tradersList, global.targetOp);
		if(global.controlsType == 0)
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var trader = ds_list_find_value(tradersList, i);
			
				if(global.hoverNode == trader)
				{
					if(global.targetOp != trader)audio_play_sound(sfx_scrollMap, 0, 0);
					global.targetOp = trader;
				}
			}
		}
		if(global.Akey_state == 1 && global.targetOp != noone && global.targetOp == global.hoverNode)
		{
			global.showOptions = 5;
			ds_list_clear(tradersList);
			gamestate = "tradewindow";
			global.opSelect = 0;
			global.opSelect2 = 0;
			audio_play_sound(sfx_showOptions, 0, 0);
			audio_play_sound(sfx_select, 0, 0);
			nosound = 1;
			alarm[2] = 2;
			
			exit;
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(tradersList);
			gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			global.targetOp = noone;
			global.showOptions = 1;
			//UpdateWeaponSkill();
			//global.opSelect4 = 0;
			
			//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			
			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	break;
	case "dancing":
	{
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		
		if(global.controlsType > 0)
		{
			var index = ds_list_find_index(tradersList, global.targetOp);
			stind = index;
			if(global.rightKey_state == 1)
			{
				if(index > 0)index --; else index = ds_list_size(tradersList) - 1;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(index < ds_list_size(tradersList) - 1)index++; else index = 0;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			global.targetOp = ds_list_find_value(tradersList, index);
			global.hoverNode = global.targetOp;
		}
		//ds_list_find_index(tradersList, global.targetOp);
		if(global.controlsType == 0)
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var trader = ds_list_find_value(tradersList, i);
			
				if(global.hoverNode == trader)
				{
					if(global.targetOp != trader)audio_play_sound(sfx_scrollMap, 0, 0);
					global.targetOp = trader;
				}
			}
		}
		if(global.Akey_state == 1 && global.targetOp != noone && global.targetOp == global.hoverNode)
		{
			ds_list_clear(tradersList);
			//gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			//UpdateWeaponSkill();
			global.opSelect = 0;
			
			global.targetOp.occupant.usedTurn = 0;
			gamestate = "dancexp";
			global.char1 = global.selectedActor;
			global.selectedActor.canDance = 0;
						
			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			CleanNodes();
			
			audio_play_sound(sfx_dance, 0, 0);
			var spfx = instance_create_depth(global.targetOp.occupant.x + 16, global.targetOp.occupant.y + 12, -7000, obj_combatFX2);
			spfx.sprite_index = spr_dance;
			
			global.targetOp = noone;
			
			exit;
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(tradersList);
			gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			global.targetOp = noone;
			global.showOptions = 1;
			//UpdateWeaponSkill();
			//global.opSelect4 = 0;
			
			//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			
			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	break;
	case "shoving":
	{
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		
		if(global.controlsType > 0)
		{
			var index = ds_list_find_index(tradersList, global.targetOp);
			stind = index;
			if(global.rightKey_state == 1)
			{
				if(index > 0)index --; else index = ds_list_size(tradersList) - 1;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(index < ds_list_size(tradersList) - 1)index++; else index = 0;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			global.targetOp = ds_list_find_value(tradersList, index);
			global.hoverNode = global.targetOp;
		}
		//ds_list_find_index(tradersList, global.targetOp);
		if(global.controlsType == 0)
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var trader = ds_list_find_value(tradersList, i);
			
				if(global.hoverNode == trader)
				{
					if(global.targetOp != trader)audio_play_sound(sfx_scrollMap, 0, 0);
					global.targetOp = trader;
				}
			}
		}
		if(global.Akey_state == 1 && global.targetOp != noone && global.targetOp == global.hoverNode)
		{
			ds_list_clear(tradersList);
			//gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			//UpdateWeaponSkill();
			global.opSelect = 0;
			
			gamestate = "select";
			
			if(global.selectedActor.gridX < global.targetOp.gridX)UnitMove(global.targetOp.occupant, global.targetOp.occupant.gridX + 1, global.targetOp.occupant.gridY); else
			if(global.selectedActor.gridX > global.targetOp.gridX)UnitMove(global.targetOp.occupant, global.targetOp.occupant.gridX - 1, global.targetOp.occupant.gridY); else
			if(global.selectedActor.gridY < global.targetOp.gridY)UnitMove(global.targetOp.occupant, global.targetOp.occupant.gridX, global.targetOp.occupant.gridY + 1); else
			if(global.selectedActor.gridY > global.targetOp.gridY)UnitMove(global.targetOp.occupant, global.targetOp.occupant.gridX, global.targetOp.occupant.gridY - 1);
						
			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			CleanNodes();
			
			audio_play_sound(sfx_dance, 0, 0);
			
			global.targetOp = noone;
			
			exit;
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(tradersList);
			gamestate = "action";
			with (obj_node)marked4 = 0;
			
			xScroll = 0;
			UpdateWeaponSkill();
			global.showOptions = 9;
			guiTimer2 = 0;
			guiTimer = 1;
			var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
			if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
			global.opSelect = 0;
			for(var i = 0; i < 10; i ++)
			{
				if(skillinrange[i] == true)
				{
					global.opSelect = i;
					break;
				}
			}
			global.targetOp = noone;
						
			gamestate = "chooseskills";
			//uiui
			//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);

			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	break;
	case "rescuing":
	{
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		
		if(global.controlsType > 0)
		{
			var index = ds_list_find_index(tradersList, global.targetOp);
			stind = index;
			if(global.rightKey_state == 1)
			{
				if(index > 0)index --; else index = ds_list_size(tradersList) - 1;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(index < ds_list_size(tradersList) - 1)index++; else index = 0;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			global.targetOp = ds_list_find_value(tradersList, index);
			global.hoverNode = global.targetOp;
		}
		//ds_list_find_index(tradersList, global.targetOp);
		if(global.controlsType == 0)
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var trader = ds_list_find_value(tradersList, i);
			
				if(global.hoverNode == trader)
				{
					if(global.targetOp != trader)audio_play_sound(sfx_scrollMap, 0, 0);
					global.targetOp = trader;
				}
			}
		}
		if(global.Akey_state == 1 && global.targetOp != noone && global.targetOp == global.hoverNode)
		{
			ds_list_clear(tradersList);
			//gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			//UpdateWeaponSkill();
			global.opSelect = 0;
			
			gamestate = "select";
			
			Carry(global.selectedActor, global.targetOp.occupant);
						
			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			CleanNodes();
			
			audio_play_sound(sfx_dance, 0, 0);
			
			global.targetOp = noone;
			
			exit;
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(tradersList);
			gamestate = "action";
			with (obj_node)marked4 = 0;
			
			xScroll = 0;
			UpdateWeaponSkill();
			global.showOptions = 9;
			guiTimer2 = 0;
			guiTimer = 1;
			var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
			if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
			global.opSelect = 0;
			for(var i = 0; i < 10; i ++)
			{
				if(skillinrange[i] == true)
				{
					global.opSelect = i;
					break;
				}
			}
			global.targetOp = noone;
						
			gamestate = "chooseskills";
			//uiui
			//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);

			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	break;
	case "dropping":
	{
		if(global.controlsType == 0)
		{
			if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
			{
				global.hoverNode = noone;
			}
			else
			{
				global.hoverNode = global.map[cx, cy];
			}
		}
		
		if(global.controlsType > 0)
		{
			var index = ds_list_find_index(tradersList, global.targetOp);
			stind = index;
			if(global.rightKey_state == 1)
			{
				if(index > 0)index --; else index = ds_list_size(tradersList) - 1;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(index < ds_list_size(tradersList) - 1)index++; else index = 0;
				if(stind != index)audio_play_sound(sfx_scrollMap, 0, 0);
			}
			global.targetOp = ds_list_find_value(tradersList, index);
			global.hoverNode = global.targetOp;
		}
		//ds_list_find_index(tradersList, global.targetOp);
		if(global.controlsType == 0)
		{
			for(var i = 0; i < ds_list_size(tradersList); i ++)
			{
				var trader = ds_list_find_value(tradersList, i);
			
				if(global.hoverNode == trader)
				{
					if(global.targetOp != trader)audio_play_sound(sfx_scrollMap, 0, 0);
					global.targetOp = trader;
				}
			}
		}
		if(global.Akey_state == 1 && global.targetOp != noone && global.targetOp == global.hoverNode)
		{
			ds_list_clear(tradersList);
			//gamestate = "action";
			with (obj_node)marked4 = 0;
			
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			//UpdateWeaponSkill();
			global.opSelect = 0;
			
			gamestate = "select";
			
			Drop(global.selectedActor, global.targetOp.gridX, global.targetOp.gridY);
						
			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			CleanNodes();
			
			audio_play_sound(sfx_dance, 0, 0);
			
			global.targetOp = noone;
			
			exit;
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(tradersList);
			gamestate = "action";
			with (obj_node)marked4 = 0;
			
			xScroll = 0;
			UpdateWeaponSkill();
			global.showOptions = 9;
			guiTimer2 = 0;
			guiTimer = 1;
			var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
			if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
			global.opSelect = 0;
			for(var i = 0; i < 10; i ++)
			{
				if(skillinrange[i] == true)
				{
					global.opSelect = i;
					break;
				}
			}
			
			global.targetOp = noone;
						
			gamestate = "chooseskills";
			//uiui
			//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);

			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	break;
	case "dancexp":
	
		global.showXP = 0;
		state = "showxp";
		if(global.char1 != noone)global.char1.levelup = 0;
		global.charlevelup = global.char1;
		
		global.char1.target = noone;
		global.char1.xpgained = 30;
		totalxp = 110;
		
		gamestate = "dancexpwait";
	
	break;
	case "pickheal":
	{
		if(!instance_exists(obj_phase))
		{
			gamestate = "pickheal2";
			currentHeal = 0;
		}
	}
	break;
	case "pickheal2":
	{
		var list = global.faction[global.phase];
		var unit = ds_list_find_value(list, currentHeal);
			
		if(unit != undefined && global.terrainmod[unit.terrainBonus, 5] > 0)
		{
			//gamestate = "fortheal";
			healTimer = 2;
	
			if(unit.HP < unit.MAXHP)
			{
				healTimer = 120;
				healUnit = unit;
				global.camTarget = unit;
			}
			else
			{
				healUnit = noone;
			}
		}
		currentHeal++;
		gamestate = "fortheal";
		
	}
	break;
	case "fortheal":
	{
		if(healTimer == 90 && healUnit != noone)
		{
			with healUnit
			{
				audio_play_sound(sfx_heal, 0, 0);
				var spfx = instance_create_depth(x + 16, y + 8, -7000, obj_combatFX2);
				spfx.sprite_index = spr_heal;
				spfx.xscale = 50;
				spfx.yscale = 50;

				var damage = floor((global.terrainmod[terrainBonus, 5] / 100) * MAXHP);
				if(HP + damage > MAXHP)damage = MAXHP - HP;
				HP += damage;
				var a = instance_create_depth(x + 16, y + 8, -7000, obj_number);
				a.number = string(damage);
				a.sprite_index = spr_numberheal;
			}
		}
		if(healTimer > 0)healTimer --;
		if(healTimer <= 5)
		{
			if(opSize4 < 1)opSize4 += 1 / 5;
			if(opSize4 >= 1)opSize4 = 1;
		}
		else
		{
			if(opSize4 > 0)opSize4 -= 1 / 5;
			if(opSize4 <= 0)opSize4 = 0;
		}
		if(healTimer <= 0)
		{
			opSize4 = 1;
			healUnit = noone;
			/*
			if(global.phase == 0)gamestate = "select"; else gamestate = "aiheal_fort";
			if(global.phase != -1)CheckEndTurn(global.phase);
			*/
			var list = global.faction[global.phase];
			if(currentHeal >= ds_list_size(list))
			{
				gamestate = "allowcontrol";
				tabIndex = 0;
			}
			else
			{
				gamestate = "pickheal2";
			}
		}
	}
	break;
	case "newturn":
	
		obj_pers.tempVar8 = 0;

		alarm[1] = 80;

	
		tempVar3 = 0;
		gamestate = "checkrein";
		
		global.camTarget = noone;
		
		if(global.phase == 0)
		{
			global.nTurn ++;
			
			if(triggerScene == global.nTurn)
			{
				with obj_pers NextScene();
				triggerScene = -4;
			}
			with(obj_unit)
			{
				canDance = 1;
				SP += 1 + floor(LCK / 8);
				if(SP > MAXSP)SP = MAXSP;
				TimeBuff();
				captured = 0;
			}
		}

	
	break;
	case "checkrein":
	
	var found = 0;
	
	with(obj_spawnTurn)
	{
		if(global.nTurn = spawnTurn && group == other.tempVar3)
		{	
			var bestNode = global.map[x / global.gridSize, y / global.gridSize];
			
			if(bestNode.occupant != noone)
			{
				var bestScore = 9999;
				var found = 0;
				var cell = bestNode;
				while(found == 0)
				{
					for(var i = 0; i < ds_list_size(cell.neighbors); i ++)
					{
						if(ds_list_find_value(cell.neighbors, i).occupant == noone)
						{
							bestNode = ds_list_find_value(cell.neighbors, i);
							found = 1;
							
							x = bestNode.gridX * global.gridSize;
							y = bestNode.gridY * global.gridSize;
							break;
						}
					}
				}
			}
			
			if(characterID == 0 && faction != 0)
			{
				characterID = obj_pers.cid;
				obj_pers.cid ++;
			}
			
			with instance_create_depth(x, y, -y, obj_unit)
			{
				gridX = floor(x / global.gridSize);
				gridY = floor(y / global.gridSize);
				gridY = floor(y / global.gridSize);
				x = gridX * global.gridSize - lengthdir_x(other.walkDis, other.walkDir);
				y = gridY * global.gridSize - lengthdir_y(other.walkDis, other.walkDir);
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
	
				characterID = other.characterID;
				faction = other.faction;
				state = "rein";
				
				ds_list_add(global.faction[faction], id);
				
				if(obj_game.healUnit == noone && other.lead == 1)
				{
					obj_game.healUnit = id;
				}
			}
			if(reinScene)obj_game.reinScene = 1;
			
			obj_game.gamestate = "rein";
			obj_pers.tempVar11 = 0;
			found = 1;
				
			instance_destroy();
		}
	}
	if(found == 0)
	{
		if(reinScene == 2)
		{
			with obj_pers NextScene();
			reinScene = 0;
			gamestate = "idle";
			state = "idle";
		}
		else
		{
			if(state != "idle")gamestate = "beginturn";
			else
			{
				gamestate = "idle";
				with obj_pers
				{
					StopMus();
				
					global.currentScene ++;
					state = "nextscene";
				}
			}
		}
	}
	
	break;
	
	case "reinnext":
	
	obj_pers.tempVar11 ++;
	if(obj_pers.tempVar11 > 40)
	{
		tempVar3 ++;
		gamestate = "checkrein";
		healUnit = noone;
	}
	
	break;
	case "beginturn":
	{
		with instance_create_layer(0, 0, "back", obj_phase)indexx = global.phase;
		gamestate = "pickheal";
	}
	break;
	case "allowcontrol":
	
	if(global.phase == 0)
	{
		gamestate = "select";
	}
	else
	{
		gamestate = "aistart";
	}
	
	break;
	case "itemheal":
	{
		if(healTimer == 80 && healUnit != noone)
		{
			with healUnit
			{
				audio_play_sound(sfx_heal, 0, 0);
				var spfx = instance_create_depth(x + 16, y + 8, -7000, obj_combatFX2);
				spfx.sprite_index = spr_heal;
				spfx.xscale = 50;
				spfx.yscale = 50;

				var heal = other.healAmount;
				if(HP + heal > MAXHP)heal = MAXHP - HP;
				HP += heal;
				var a = instance_create_depth(x + 16, y + 8, -7000, obj_number);
				a.number = string(heal);
				a.sprite_index = spr_numberheal;
			}
		}
		if(healTimer > 0)healTimer --;
		if(healTimer <= 5)
		{
			if(opSize4 < 1)opSize4 += 1 / 5;
			if(opSize4 >= 1)opSize4 = 1;
		}
		else
		{
			if(opSize4 > 0)opSize4 -= 1 / 5;
			if(opSize4 <= 0)opSize4 = 0;
		}
		if(healTimer <= 0)
		{
			healUnit = noone;
			gamestate = "select";
			opSize4 = 1;
						
			EndTurn(global.selectedActor);
			global.selectedActor = noone;
			global.showOptions = 0;
			global.camTarget = noone;
			CleanNodes();
		}
	}
	break;
}




//opcontrols
if(global.showOptions == 1)
{
	
	if(global.selectedActor != noone)
	{
		if(opSize > 0)opSize -= 1 / 4;
		if(opSize < 0)opSize = 0;
		var opY = 120 - (global.nOptions * 19) / 2;
		
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1)
			{
				if(global.opSelect4 > 0) global.opSelect4 --; else global.opSelect4 = global.nOptions - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1)
			{
				if(global.opSelect4 < global.nOptions - 1)global.opSelect4 ++; else global.opSelect4 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		for(var i = 0; i < global.nOptions; i ++)
		{
			var xx = 260 - (1 - opSize) * 34;
			if(global.controlsType == 0 && global.opSelect4 != i && global.mxv > xx + 24 && global.mxv < xx + opEnd && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
			{
				global.opSelect = i;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.opSelect4 == i)
			{
				if(global.Akey_state == 1)
				{
					audio_play_sound(sfx_select, 0, 0);
					global.lockKeys = 1;
					if(global.options[i] == "Wait")
					{
						gamestate = "select";
						
						EndTurn(global.selectedActor);
						global.selectedActor = noone;
						global.showOptions = 0;
						CleanNodes();
						exit;
					}
					if(global.options[i] == "Items")
					{
						guiTimer2 = 0;
						xScroll = 0;
						global.showOptions = 2;
						guiTimer = 1;
						global.opSelect = 0;
						//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);
						exit;
					}
					if(global.options[i] == "Trade")
					{
						//XDXDxd
						with(obj_node)
						{
							marked4 = 0;
						}
						global.showOptions = 0;
						//global.opSelect4 = 0;
						gamestate = "begintrade";
						UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						exit;
					}
					if(global.options[i] == "Dance")
					{
						//XDXDxd
						with(obj_node)
						{
							marked4 = 0;
						}
						global.showOptions = 0;
						//global.opSelect4 = 0;
						gamestate = "begindance";
						UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						exit;
					}
					if(global.options[i] == "Attack")
					{
						selType = 0;
						UpdateWeaponSkill();
						global.showOptions = 4;
						guiTimer = 1;
						var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
						//global.opSelect4 = 0;
						for(var i = 0; i < 10; i ++)
						{
							if(weaponinrange[i] == true)
							{
								global.opSelect = i;
								break;
							}
						}
						gamestate = "chooseweapon";
						xScroll = 0;
						//uiui
						//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);

						exit;
					}
					if(global.options[i] == "Skills")
					{
						xScroll = 0;
						
						UpdateWeaponSkill();
						global.showOptions = 9;
						guiTimer2 = 0;
						guiTimer = 1;
						var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
						global.opSelect = 0;
						for(var i = 0; i < 10; i ++)
						{
							if(skillinrange[i] == true)
							{
								global.opSelect = i;
								break;
							}
						}
						
						gamestate = "chooseskills";
						//uiui
						//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);

						exit;
					}
					if(global.options[i] == "Heal")
					{
						selType = 1;
						UpdateWeaponHeal();
						global.showOptions = 4;
						guiTimer = 1;
						var di = point_distance(obj_camera.x, obj_camera.y, global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						if(di > 48)UpdateCamera(global.selectedActor.gridX * global.gridSize, global.selectedActor.gridY * global.gridSize + 32);
						
						//global.opSelect4 = 0;
						for(var i = 0; i < 10; i ++)
						{
							if(weaponinrange[i] == true)
							{
								global.opSelect = i;
								break;
							}
						}
						gamestate = "chooseweapon";
						xScroll = 0;
						exit;
					}
					if(global.options[i] == "Visit")
					{
						global.showOptions = 0;
						
						state = "visiting";
						gamestate = "idle";
						if(global.selectedActor.standingNode.objectLink != noone && global.selectedActor.standingNode.objectLink.sceneID != -1)event_user(0);
						
						exit;
					}
					if(global.options[i] == "Open")
					{
						global.showOptions = 0;
						
						state = "visiting";
						gamestate = "idle";
						if(global.selectedActor.standingNode.objectLink != noone && global.selectedActor.standingNode.objectLink.sceneID != -1)event_user(0);
						if(global.selectedActor.standingNode.objectLink != noone)
						{
							with global.selectedActor.standingNode.objectLink
							{
								with instance_nearest(x, y, obj_chest)
								{
									image_speed = 0.5;
								}
							}
						}
						
						exit;
					}
					global.Akey_state = 2;
				}
			}
		}
		if(global.canRewind == 1 && global.Bkey_state == 1)
		{
			gamestate = "selected";
			
			global.showOptions = 0;
			global.hoverNode = noone;
			audio_play_sound(sfx_back, 0, 0);
			//global.opSelect4 = 0;
			global.opSelect = 0;
			global.opSelect2 = 0;
			
			global.selectedActor.index = 20;
			global.selectedActor.state = "selected";
			
			with global.selectedActor
			{
				MP += obj_game.refundMP;
				standingNode.occupant = noone;
				
				moved = false;
				gridX = rewindX;
				gridY = rewindY;
				standingNode = global.map[gridX, gridY];
				standingNode.occupant = id;
				
				TerrainBonus(id, standingNode);
				
				x = standingNode.gridX * global.gridSize;
				y = standingNode.gridY * global.gridSize;
				//AttackableCells(standingNode, id);
				
						
				if(global.selectedActor.partner != noone)
				{
					global.selectedActor.partner.x = x;
					global.selectedActor.partner.y = y;
					global.selectedActor.partner.xTarget = x;
					global.selectedActor.partner.yTarget = y;
				}
				
			}
			
			exit;
		}
	}
}
else if(state == "game")
{
	if(opSize < 1)opSize += 1 / 4;
}
if(global.showOptions == 2)
{
	if(global.selectedActor != noone)
	{
		var inventory = global.CHAR[global.selectedActor.characterID, 49];
		var uses = global.CHAR[global.selectedActor.characterID, 50];
		if(global.opSelect != -1)
		{
			var item = ds_list_find_value(inventory, global.opSelect);
			if(item != -1 && item != undefined)
			{
				draw_set_font(ft_large);
				if(guiTimer2 >= 90)
				{
					var txt = DescriptionString(item);
					
					xScroll -= 2;
					if(xScroll < - 48 - string_width(txt))xScroll = -2;
				} else guiTimer2 ++;
			}
		}
		
		if(global.itemOptions == 0)
		{
			if(opSize2 > 0)opSize2 -= 1 / 4;
			if(opSize2 < 0)opSize2 = 0;
			var opY = 72;
		
			if(global.controlsType > 0 && global.itemOptions == 0)
			{
				if(global.upKey_state == 1)
				{
					if(global.opSelect > 0) global.opSelect --; else global.opSelect = ds_list_size(inventory) - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					guiTimer2 = 0;
					xScroll = 0;
				}
				if(global.downKey_state == 1)
				{
					if(global.opSelect < ds_list_size(inventory) - 1)global.opSelect ++; else global.opSelect = 0;
					audio_play_sound(sfx_scroll, 0, 0);
					guiTimer2 = 0;
					xScroll = 0;
				}
				/*
				var item = ds_list_find_value(inventory, global.opSelect);
				if(CanUse(global.selectedActor.characterID, item))
				{
					//global.CHAR[global.selectedActor.characterID, 44] = item;
					//global.CHAR[global.selectedActor.characterID, 56] = global.opSelect;
					with global.selectedActor UpdateStatsSwitch();
				}
				*/
			}
		
		
			for(var i = 0; i < ds_list_size(inventory); i ++)
			{
				var item = ds_list_find_value(inventory, i);
				var xx = 38 - (1 - opSize2) * 34;
				if (global.controlsType == 0 && global.mxv > xx + 24 && global.mxv < xx + 182 && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
				{
					if(global.opSelect != i)
					{
						global.opSelect = i;
						audio_play_sound(sfx_scroll, 0, 0);
					
						if(CanUse(global.selectedActor.characterID, item))
						{
							global.CHAR[global.selectedActor.characterID, 44] = item;
							//global.CHAR[global.selectedActor.characterID, 56] = global.opSelect;
							with global.selectedActor UpdateStatsSwitch();
						}
					}
				}
				if(global.opSelect == i)
				{
					if(global.Akey_state == 1)
					{
						global.itemOptions = 1;
						//if(global.controlsType == 0)window_mouse_set(420 * global.ww, 160 * global.hh);
			
						audio_play_sound(sfx_select, 0, 0);
					
						global.nOptions2 = 0;
						global.opSelect2 = 0;
						opSize3 = 1;
						if(global.ITEM[item, 3] == 0 && global.ITEM[item, 4] == 0 && global.selectedActor.HP < global.selectedActor.MAXHP)
						{	
							global.options2[global.nOptions2] = "Use";
							global.nOptions2++;
						}
						if(global.ITEM[item, 3] == 3 && global.CHAR[global.selectedActor.characterID, 4] >= 10 && global.CLASS[global.CHAR[global.selectedActor.characterID, 3], 36] < 2)
						{	
							global.options2[global.nOptions2] = "Use";
							global.nOptions2++;
						}
						if(global.CHAR[global.selectedActor.characterID, 56] != i && global.ITEM[item, 3] == 2 && CanUse(global.selectedActor.characterID, item))
						{	
							global.options2[global.nOptions2] = "Equip";
							global.nOptions2++;
						}
						if(global.CHAR[global.selectedActor.characterID, 56] == i)
						{	
							global.options2[global.nOptions2] = "Unequip";
							global.nOptions2++;
						}
						global.options2[global.nOptions2] = "Discard";
						global.nOptions2++;

					
						global.Akey_state = 2;
						exit;
					}
				}
			}
			if(global.Bkey_state == 1)
			{
				global.showOptions = 1;
				//UpdateWeaponSkill();
				//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			
				audio_play_sound(sfx_back, 0, 0);
				//global.opSelect = 0;
				global.opSelect2 = 0;
				//global.opSelect4 = 0;
			
				if(global.CHAR[global.selectedActor.characterID, 56] != -1)
				{
					global.CHAR[global.selectedActor.characterID, 44] = ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], global.CHAR[global.selectedActor.characterID, 56]);
					with global.selectedActor UpdateStatsSwitch();
				}
			
				exit;
			}
		}
	}
	if(global.itemOptions == 1)
	{
		if(global.selectedActor != noone)
		{
			var inventory = global.CHAR[global.selectedActor.characterID, 49];
			var uses = global.CHAR[global.selectedActor.characterID, 50];
			var item = ds_list_find_value(inventory, global.opSelect);
			
			if(opSize3 > 0)opSize3 -= 1 / 4;
			if(opSize3 < 0)opSize3 = 0;
			
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1)
				{
					if(global.opSelect2 > 0) global.opSelect2 --; else global.opSelect2 = global.nOptions2 - 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.downKey_state == 1)
				{
					if(global.opSelect2 < global.nOptions2 - 1)global.opSelect2 ++; else global.opSelect2 = 0;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
		
			var opY = 72;
			for(var i = 0; i < global.nOptions2; i ++)
			{
				var xx = 197 - (1 - opSize3) * 34;
				if(global.controlsType == 0 && global.opSelect2 != i && global.mxv > xx + 24 && global.mxv < xx + opEnd && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
				{
						global.opSelect2 = i;
						audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.opSelect2 == i)
				{
					if(global.Akey_state == 1)
					{
						//global.CHAR[global.selectedActor.characterID, 44] = ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], global.CHAR[global.selectedActor.characterID, 56]);
						//with global.selectedActor UpdateStatsSwitch();
			
						audio_play_sound(sfx_select, 0, 0);
						if(global.options2[i] == "Use")
						{
							global.itemOptions = 0;

							//global.selectedActor.items[global.opSelect, 1] --;
							//EndTurn(global.selectedActor);
							//global.selectedActor = noone;
							//global.showOptions = 0;
							
							if(global.ITEM[item, 3] == 0 && global.ITEM[item, 4] == 0)
							{
								gamestate = "itemheal";
								opSize4 = 1;
								global.showOptions = 0;
								CleanNodes();
								
								healTimer = 90;
								healUnit = global.selectedActor;
								global.camTarget = healUnit;
								healAmount = global.ITEM[item, 10];
								
								DecreaseUses(global.opSelect, global.selectedActor)
							}
							if(global.ITEM[item, 3] == 3)
							{
								var subtype = global.ITEM[item, 4];
								switch(subtype)
								{
									case 0:
										gamestate = "idle";
										opSize4 = 1;
										global.showOptions = 0;
										//CleanNodes();
								
										with obj_pers Promotion(global.selectedActor.characterID, global.selectedActor.characterID, global.opSelect);
									break;
								}

							}
							global.opSelect = 0;
							//global.opSelect2 = 0;
							exit;
						}
						if(global.options2[i] == "Unequip")
						{
							//show_message(global.CHAR[global.selectedActor.characterID, 44]);
							global.CHAR[global.selectedActor.characterID, 56] = -1;
							global.CHAR[global.selectedActor.characterID, 44] = -1;
							
							CalcRanges(global.selectedActor, 1);
							
							with global.selectedActor UpdateStatsSwitch();
							global.itemOptions = 0;
							//audio_play_sound(sfx_back, 0, 0);
							UpdateNodes(global.map[global.selectedActor.rewindX, global.selectedActor.rewindY], global.selectedActor);
							AttackableCells(global.selectedActor.standingNode, global.selectedActor);
							with global.selectedActor UpdateOptions();
							global.opSelect = 0;
							//global.opSelect2 = 0;
							//show_message(global.CHAR[global.selectedActor.characterID, 56]);
							exit;
						}
						if(global.options2[i] == "Equip")
						{
							Equip(global.selectedActor, global.opSelect);
							
							CalcRanges(global.selectedActor, 1);
							
							var oldUses = ds_list_find_value(uses, global.opSelect);
							var oldItem = ds_list_find_value(inventory, global.opSelect);
							
							ds_list_delete(inventory, global.opSelect);
							ds_list_delete(uses, global.opSelect);
							
							ds_list_insert(inventory, 0, oldItem);
							ds_list_insert(uses, 0, oldUses);
							global.CHAR[global.selectedActor.characterID, 56] = 0; //weapon inventory link
							
							global.itemOptions = 0;
							//audio_play_sound(sfx_back, 0, 0);
							UpdateNodes(global.map[global.selectedActor.rewindX, global.selectedActor.rewindY], global.selectedActor);
							AttackableCells(global.selectedActor.standingNode, global.selectedActor);
							with global.selectedActor UpdateOptions();
							global.opSelect = 0;
							//global.opSelect2 = 0;
							
							exit;
						}
						if(global.options2[i] == "Discard")
						{
							DiscardItem(global.selectedActor.characterID, global.opSelect);
							CalcRanges(global.selectedActor, 1);
							
							if(global.CHAR[global.selectedActor.characterID, 56] == -1)
							{
								EquipFirstWeapon(global.selectedActor);
							}
							
							with global.selectedActor UpdateStatsSwitch();
							//CalcRanges(global.selectedActor);
							var ind = global.opSelect;
							if(ds_list_find_value(global.CHAR[global.selectedActor.characterID, 49], ind) == undefined)ind --;
							if(ind < 0)ind = 0;
							UpdateNodes(global.map[global.selectedActor.rewindX, global.selectedActor.rewindY], global.selectedActor);
							
							if(ds_list_size(inventory) == 0)
							{
								global.itemOptions = 0;
								global.showOptions = 1;
								//UpdateWeaponSkill();
								//global.opSelect = 0;
								global.opSelect4 = 0;
								with global.selectedActor OpenOptions();
								//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
							}
							else
							{
								global.itemOptions = 0;
								UpdateWeaponSkill();
								with global.selectedActor UpdateOptions();
							}
							global.opSelect = ind;
							//global.opSelect2 = 0;
							
							exit;
						}
					}
				}
			}
			if(global.Bkey_state == 1)
			{
				global.itemOptions = 0;
				audio_play_sound(sfx_back, 0, 0);
				
				//if(global.controlsType == 0)window_mouse_set(100 * global.ww, (160 + (global.opSelect * 19) * 2) * global.hh);
				
				if(global.opSelect >= ds_list_size(global.CHAR[global.selectedActor.characterID, 49])) global.opSelect = ds_list_size(global.CHAR[global.selectedActor.characterID, 49]) - 1;
				//global.opSelect2 = 0;
				exit;
			}
		}
	}
	else
	{
		if(opSize3 < 1)opSize3 += 1 / 4;
	}
}
else if(global.showOptions != 4 && global.showOptions != 9)
{
	if(opSize2 < 1)opSize2 += 1 / 4;
	if(opSize3 < 1)opSize3 += 1 / 4;
}

if(global.showOptions == 9)
{
	if(global.selectedActor != noone && global.itemOptions == 0)
	{
		if(opSize2 > 0)opSize2 -= 1 / 4;
		if(opSize2 < 0)opSize2 = 0;
		var opY = 72;
	
		var inventory = obj_pers.skillList;
		
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1)
			{
				if(global.opSelect > 0) global.opSelect --; else global.opSelect = ds_list_size(inventory) - 1;
				audio_play_sound(sfx_scroll, 0, 0);
				guiTimer2 = 0;
				xScroll = 0;
			}
			if(global.downKey_state == 1)
			{
				if(global.opSelect < ds_list_size(inventory) - 1)global.opSelect ++; else global.opSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
				guiTimer2 = 0;
				xScroll = 0;
			}
		}
		if(global.opSelect != -1)
		{
			var item = ds_list_find_value(inventory, global.opSelect);
			if(item != -1 && item != undefined)
			{
				draw_set_font(ft_large);
				if(guiTimer2 >= 90)
				{
					xScroll -= 2;
					if(xScroll < - 48 - string_width(global.SKILL[item, 1]))xScroll = -2;
				} else guiTimer2 ++;
			}
		}
			
		for(var i = 0; i < ds_list_size(inventory); i ++)
		{
			var item = ds_list_find_value(inventory, i);
			var xx = 38 - (1 - opSize2) * 34;
			if(global.controlsType == 0 && global.opSelect != i && global.mxv > xx + 24 && global.mxv < xx + 182 && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
			{
				global.opSelect = i;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.opSelect == i)
			{
				if(global.Akey_state == 1)
				{
					if(skillinrange[global.opSelect])
					{
						if(global.SKILL[item, 4] == 0 || global.SKILL[item, 4] == 2)
						{
							global.skillSelected = item;
							global.showOptions = 4;
							lastOp = global.opSelect;
							global.opSelect = -1;
							for(var i = 0; i < 5; i ++)
							{
								if(weaponinrange[i] == true && global.opSelect == -1)
								{
									global.opSelect = i;
									break;
								}
							}
							gamestate = "chooseweapon";
							opSize3 = 1;
							audio_play_sound(sfx_select, 0, 0);
							//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);
						}
						if(global.SKILL[item, 4] == 1)
						{
							//rally
							gamestate = "select";
							audio_play_sound(global.SKILL[item, 16], 0, 0);
							
							with(obj_unit)
							{
								var dis = FindDistance(gridX, gridY, global.selectedActor.gridX, global.selectedActor.gridY);
								if((faction == 0 || faction == 2) && dis >= global.SKILL[item, 9] && dis <= global.SKILL[item, 10] && id != global.selectedActor)
								{
									for(var i = 0; i < 4; i ++)
									{
										var subtype = global.SKILL[item, 5 + i];
										var might = global.SKILL[item, 12 + i];
										
										switch(subtype)
										{
											case 0:			

											AddBuff(8, might, 1, item, 0, 0);
											
											var spfx = instance_create_depth(x + 16, y + 26, -7000, obj_combatFX);
											spfx.sprite_index = spr_wind;
											spfx.image_speed = 1.5;
											spfx.xscale = 50;
											spfx.yscale = 50;
											spfx.image_alpha = 0.5;
											
											break;
											
											case 1:
											
											AddBuff(1, might, 1, item, 0, 0);
											
											var spfx = instance_create_depth(x + 16, y + 26, -7000, obj_combatFX);
											spfx.sprite_index = spr_fire;
											spfx.image_speed = 1;
											spfx.xscale = 100;
											spfx.yscale = 100;
											spfx.image_alpha = 0.5;

											break;
											
											case 2:
											
											AddBuff(5, might, 2, item, 0, 0);
											
											var spfx = instance_create_depth(x + 16, y + 16, -7000, obj_combatFX3);
											spfx.sprite_index = spr_sandiness;
											spfx.image_speed = 1;
											spfx.xscale = 100;
											spfx.yscale = 100;
											spfx.lightpower=200;
											spfx.lightalpha=50;
											spfx.lightcolor=make_color_rgb(255, 190, 215);

											break;
											
										}
									}
								}
							}
							global.selectedActor.SP -= max(0, global.SKILL[item, 3] - global.selectedActor.spbuff - global.selectedActor.spbuff_area);
							
							EndTurn(global.selectedActor);
							global.selectedActor = noone;
							global.showOptions = 0;
							CleanNodes();
							
							audio_play_sound(sfx_select, 0, 0);
						}
						if(global.SKILL[item, 4] == 60)
						{
							global.skillSelected = item;
							global.showOptions = 0;
							with(obj_node)
							{
								marked4 = 0;
							}
							
							gamestate = "beginshove";
							//opSize3 = 1;
							audio_play_sound(sfx_select, 0, 0);
						}
						if(global.SKILL[item, 4] == 61)
						{
							global.skillSelected = item;
							global.showOptions = 0;
							with(obj_node)
							{
								marked4 = 0;
							}
							
							gamestate = "beginrescue";
							//opSize3 = 1;
							audio_play_sound(sfx_select, 0, 0);
						}
						if(global.SKILL[item, 4] == 62)
						{
							global.skillSelected = item;
							global.showOptions = 0;
							with(obj_node)
							{
								marked4 = 0;
							}
							
							gamestate = "begindrop";
							//opSize3 = 1;
							audio_play_sound(sfx_select, 0, 0);
						}
						if(global.SKILL[item, 4] == 63)
						{
							//dash
							audio_play_sound(global.SKILL[item, 16], 0, 0);
							
							var might = global.SKILL[item, 12];
							with global.selectedActor
							{
								//MAXMP = MP;
								AddBuff(8, might, 1, item, 0, 0);
											
								var spfx = instance_create_depth(x + 16, y + 26, -7000, obj_combatFX);
								spfx.sprite_index = spr_wind;
								spfx.image_speed = 1.5;
								spfx.xscale = 50;
								spfx.yscale = 50;
								spfx.image_alpha = 0.5;
								
								canAttack = false;
							}
							CalcRanges(global.selectedActor, 1);
					        UpdateNodes(global.selectedActor.standingNode, global.selectedActor);
					        gamestate = "selected";
							//TerrainBonus(global.selectedActor, global.selectedActor.standingNode);
			
							global.selectedActor.state = "selected";
							global.selectedActor.index = 20;
							global.selectedActor.rewindX = global.selectedActor.gridX;
							global.selectedActor.rewindY = global.selectedActor.gridY;
							refundMP = 0;
            
					        global.pathArray[0] = global.selectedActor.standingNode;
							AttackableCells(global.selectedActor.standingNode, global.selectedActor);
							clearPath();
							
							UpdateWeaponSkill();
							global.selectedActor.SP -= max(0, global.SKILL[item, 3] - global.selectedActor.spbuff - global.selectedActor.spbuff_area);
							
							global.showOptions = 0;
							
							audio_play_sound(sfx_select, 0, 0);
						}
						exit;
					}
					else audio_play_sound(sfx_error, 0, 0);
				}
			}
		}
		if(global.Bkey_state == 1)
		{
			global.skillSelected = -1;
			
			audio_play_sound(sfx_back, 0, 0);
			//global.opSelect = 0;
			global.opSelect2 = 0;
			//global.opSelect4 = 0;
			opSize4 = 1;
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			
			global.showOptions = 1;
			//UpdateWeaponSkill();
			//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			
			global.target = noone;
			gamestate = "action";
			
			exit;
		}
	}
}
if(global.showOptions == 4)
{
	if(global.selectedActor != noone)
	{
		var inventory = global.CHAR[global.selectedActor.characterID, 49];
		var uses = global.CHAR[global.selectedActor.characterID, 50];
		if(global.opSelect != -1)
		{
			var item = ds_list_find_value(inventory, global.opSelect);
			if(item != -1 && item != undefined)
			{
				draw_set_font(ft_large);
				if(guiTimer2 >= 90)
				{
					var txt = DescriptionString(item);
					
					xScroll -= 2;
					if(xScroll < - 48 - string_width(txt))xScroll = -2;
				} else guiTimer2 ++;
			}
		}
		if(global.itemOptions == 0)
		{
			if(opSize2 > 0)opSize2 -= 1 / 4;
			if(opSize2 < 0)opSize2 = 0;
			var opY = 72;
	
			var cell = global.target;
			
			//if(weaponPreview == -1 && global.CHAR[global.selectedActor, 44] != -1)weaponPreview = global.CHAR[global.selectedActor, 44];
		
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1)
				{
					if(global.opSelect > 0) global.opSelect --; else global.opSelect = ds_list_size(inventory) - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					guiTimer2 = 0;
					xScroll = 0;
				}
				if(global.downKey_state == 1)
				{
					if(global.opSelect < ds_list_size(inventory) - 1)global.opSelect ++; else global.opSelect = 0;
					//UpdateStats(global.selectedActor);
					audio_play_sound(sfx_scroll, 0, 0);
					guiTimer2 = 0;
					xScroll = 0;
				}
				var weapon = ds_list_find_value(inventory, global.opSelect);
				if(weapon != undefined && weaponinrange[global.opSelect])UpdateStats(global.selectedActor, weapon);
			}
			
			for(var i = 0; i < ds_list_size(inventory); i ++)
			{
				var item = ds_list_find_value(inventory, i);
				var xx = 38 - (1 - opSize2) * 34;
				if(global.controlsType == 0 && global.opSelect != i && global.mxv > xx + 24 && global.mxv < xx + 182 && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
				{
					global.opSelect = i;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.opSelect == i)
				{
						if(global.Akey_state == 1)
						{
							if(weaponinrange[global.opSelect])
							{
								Equip(global.selectedActor, global.opSelect);
							
								global.opSelect = 0;
								global.opSelect2 = 0;
						
								gamestate = "select target";
								if(global.ITEM[global.CHAR[global.selectedActor.characterID, 44], 14] < 2)
								{
									targetLis = 2;
									allyenemy = 2;
								}
								else
								{
									targetLis = 1;
									allyenemy = 1;
								}
						
								audio_play_sound(sfx_select, 0, 0);
		
								AttackableCells(global.selectedActor.standingNode, global.selectedActor);
								MarkRed(global.selectedActor);
						
								opSize2 = 1;
			
								global.showOptions = 3;
								exit;
							}
							else audio_play_sound(sfx_error, 0, 0);
						}
				}
			}
			if(global.Bkey_state == 1)
			{
				if(global.skillSelected == -1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.opSelect = 0;
					global.opSelect2 = 0;
					opSize4 = 1;
					opSize = 1;
					opSize2 = 1;
					opSize3 = 1;
			
					global.showOptions = 1;
					//UpdateWeaponSkill();
					//if(global.controlsType == 0)window_mouse_set(520 * global.ww, (240 - ((global.nOptions - 1) * 19)) * global.hh);
			
					global.target = noone;
					gamestate = "action";
				}
				else
				{
					audio_play_sound(sfx_back, 0, 0);
					//backskill
					global.showOptions = 9;
					
					guiTimer2 = 0;
					global.opSelect = lastOp;
					gamestate = "chooseskills";
					//if(global.controlsType == 0)window_mouse_set(100 * global.ww, 160 * global.hh);
					global.skillSelected = -1;
					guiTimer2 = 0;
					xScroll = 0;
				}
			
				exit;
			}
		}
	}
}
if(global.showOptions == 5 && global.targetOp != noone)
{
	if(global.selectedActor != noone && global.itemOptions == 0)
	{
		if(opSize4 > 0)opSize4 -= 1 / 4;
		if(opSize4 < 0)opSize4 = 0;
		var opX = trade1xpos - 36;
		var opY = trade1ypos;
	
		var inventory1 = global.CHAR[global.selectedActor.characterID, 49];
		var uses1 = global.CHAR[global.selectedActor.characterID, 50];
		var inventory2 = global.CHAR[global.targetOp.occupant.characterID, 49];
		var uses2 = global.CHAR[global.targetOp.occupant.characterID, 50];
		
		//var cell = global.target;
		
		var plus = 0;
		if(whotowho == 1)plus = 1;
		var total = ds_list_size(inventory1) + plus;
		if(total > 5)total = 5;
		
		var pplus = 0, ttotal = 0;
		if(whotowho == 0)pplus = 1;
		ttotal = ds_list_size(inventory2) + pplus;
		if(ttotal > 5)ttotal = 5;
		if(global.controlsType > 0)
		{
			if(global.rightKey_state == 1 && global.opSelect2 == 0)
			{
				global.opSelect2 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.opSelect > ttotal - 1)global.opSelect = ttotal - 1;
			}
			if(global.leftKey_state == 1 && global.opSelect2 == 1)
			{
				global.opSelect2 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.opSelect > total - 1)global.opSelect = total - 1;
			}
		}
		if(global.controlsType > 0 && global.opSelect2 == 0 && total > 1)
		{
			if(global.upKey_state == 1)
			{
				if(global.opSelect > 0) global.opSelect --; else global.opSelect = total - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1)
			{
				if(global.opSelect < total - 1)global.opSelect ++; else global.opSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		if(global.opSelect < 0)global.opSelect = 0;
		
		for(var i = 0; i < total; i ++)
		{
			var item = ds_list_find_value(inventory1, i);
			if(global.controlsType == 0 && global.mxv > opX + 24 && global.mxv < opX + 182 && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
			{
				if((global.opSelect != i || global.opSelect2 == 1) && nosound == 0)audio_play_sound(sfx_scroll, 0, 0);
				global.opSelect = i;
				//if(nosound == 0) audio_play_sound(sfx_scroll, 0, 0);
				global.opSelect2 = 0;
			}
			if(global.opSelect == i && global.opSelect2 == 0)
			{
					if(global.Akey_state == 1)
					{
						if(index1trade == -1)
						{
							whotowho = 0;
							index1trade = global.opSelect;
							global.opSelect2 = 1;
							
							alarm[2] = 2;
							nosound = 1;
							
							var freeSlot = 5;
							for(var i = 0; i < 5; i ++)
							{
								var item = ds_list_find_value(inventory2, i);
								if(item == undefined)
								{
									freeSlot = i;
									break;
								}
							}
							//if(global.controlsType == 0)window_mouse_set(((trade2xpos + 4) * 2) * global.ww, ((8 + trade2ypos + 19 * freeSlot) * 2) * global.hh);
							global.opSelect = freeSlot;
							if(global.opSelect > 4)global.opSelect = 4;
							audio_play_sound(sfx_select, 0, 0);
							exit;
						}
						else
						{
							if(whotowho == 0)
							{
								audio_play_sound(sfx_select, 0, 0);
								index2trade = global.opSelect;
								SwitchItems(index1trade, index2trade, global.selectedActor);//index1, index2, sender, receiver
								
								index1trade = -1;
								index2trade = -1;
								whotowho = -1;
								exit;
							}
							else
							{
								audio_play_sound(sfx_select, 0, 0);
								index2trade = global.opSelect;
								TradeItems(index1trade, index2trade, global.targetOp.occupant, global.selectedActor);//index1, index2, sender, receiver
								global.canRewind = false;
								
								var bye = 0;
								if(index1trade > 0 && ds_list_find_value(inventory2, index1trade) == undefined)
								{
									bye = -1;
								} //else audio_play_sound(sfx_scroll, 0, 0);
								//show_message(bye);
								//if(global.controlsType == 0)window_mouse_set(((trade2xpos + 4) * 2) * global.ww, ((8 - bye * 19 + trade2ypos + 19 * index1trade) * 2) * global.hh);
								
								whotowho = -1;
								
								alarm[2] = 2;
								nosound = 1;
								
								CalcRanges(global.selectedActor, 1);
								with global.selectedActor UpdateOptions();

								UpdateWeaponSkill();
								
								global.opSelect = index1trade + bye;
								global.opSelect2 = 1;
								index1trade = -1;
								index2trade = -1;
								exit;
							}
						}
					}
			}
		}
		
		var opX = trade2xpos - 36;
		var opY = trade2ypos;
		plus = 0;
		if(whotowho == 0)plus = 1;
		total = ds_list_size(inventory2) + plus;
		if(total > 5)total = 5;
		
				
		if(global.controlsType > 0 && global.opSelect2 == 1 && total > 1)
		{
			if(global.upKey_state == 1)
			{
				if(global.opSelect > 0) global.opSelect --; else global.opSelect = total - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1)
			{
				if(global.opSelect < total - 1)global.opSelect ++; else global.opSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		if(global.opSelect < 0)global.opSelect = 0;
		for(var i = 0; i < total; i ++)
		{
			if(global.controlsType == 0 && global.mxv > opX + 24 && global.mxv < opX + 182 && global.myv > opY + i * 19 && global.myv < opY + i * 19 + 19)
			{
				if((global.opSelect != i || global.opSelect2 == 0) && nosound == 0)audio_play_sound(sfx_scroll, 0, 0);
				global.opSelect2 = 1;
				global.opSelect = i;
			}
			var item = ds_list_find_value(inventory2, i);
			if(global.opSelect == i && global.opSelect2 == 1)
			{		
				if(global.Akey_state == 1)
				{
					if(index1trade == -1)
					{
						global.opSelect2 = 0;
						whotowho = 1;
						index1trade = global.opSelect;
						
						alarm[2] = 2;
						nosound = 1;
							
						var freeSlot = 5;
						for(var i = 0; i < 5; i ++)
						{
							var item = ds_list_find_value(inventory1, i);
							if(item == undefined)
							{
								freeSlot = i;
								break;
							}
						}
						//if(global.controlsType == 0)window_mouse_set(((trade1xpos + 4) * 2) * global.ww, ((8 + trade1ypos + 19 * freeSlot) * 2) * global.hh);
						global.opSelect = freeSlot;
						if(global.opSelect > 4)global.opSelect = 4;
						audio_play_sound(sfx_select, 0, 0);
						exit;
					}
					else
					{
						if(whotowho == 1)
						{
							audio_play_sound(sfx_select, 0, 0);
							index2trade = global.opSelect;
							SwitchItems(index1trade, index2trade, global.targetOp.occupant);//index1, index2, sender, receiver
							
							index1trade = -1;
							index2trade = -1;
							whotowho = -1;
							exit;
						}
						else
						{
							
						
								
								
								
							//asdffdsa
							audio_play_sound(sfx_select, 0, 0);
							index2trade = global.opSelect;
							TradeItems(index1trade, index2trade, global.selectedActor, global.targetOp.occupant);//index1, index2, sender, receiver
							global.canRewind = false;
							
							var bye = 0;
							if(index1trade > 0 && ds_list_find_value(inventory1, index1trade) == undefined)
							{
								bye = -1;
							}// else audio_play_sound(sfx_scroll, 0, 0);
							
							//if(global.controlsType == 0)window_mouse_set(((trade1xpos + 4) * 2) * global.ww, ((8 - bye * 19 + trade1ypos + 19 * index1trade) * 2) * global.hh);
							whotowho = -1;
							
							alarm[2] = 2;
							nosound = 1;
							CalcRanges(global.selectedActor, 1);
							with global.selectedActor UpdateOptions();
							UpdateWeaponSkill();
							
							global.opSelect = index1trade + bye;
							global.opSelect2 = 0;
							
														
							index1trade = -1;
							index2trade = -1;
							exit;
						}
					}
				}
			}
		}
		if(global.Bkey_state == 1)
		{
			if(index1trade == -1)
			{
				MoveEquipTop(global.selectedActor.characterID);
				MoveEquipTop(global.targetOp.occupant.characterID);
				
				audio_play_sound(sfx_back, 0, 0);
				global.opSelect = 0;
				global.opSelect2 = 0;
				global.opSelect4 = 0;
				global.targetOp = noone;
				opSize4 = 1;
				opSize = 1;
				opSize2 = 1;
				opSize3 = 1;
				index1trade = -1;
				index2trade = -1;
				whotowho = -1;
				global.showOptions = 1;
				//UpdateWeaponSkill();
				//if(global.controlsType == 0)window_mouse_set(520 * global.ww, 240 - (((global.nOptions - 1) * 19)) * global.hh);
				global.target = noone;
				gamestate = "action";
				with (obj_node)marked4 = 0;
			}
			else
			{
				audio_play_sound(sfx_back, 0, 0);
				global.opSelect = index1trade;
				index1trade = -1;
				index2trade = -1;
				whotowho = -1;
				global.opSelect2 = !global.opSelect2;
			}
			
			exit;
		}
	}
}
