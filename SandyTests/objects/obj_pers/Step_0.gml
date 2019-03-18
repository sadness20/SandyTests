/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


selectSize += 0.125;
if(selectSize > 360)selectSize = 0;
sinSize = sin(selectSize);

/*
if(keyboard_check_pressed(vk_space))
{
	SupportXP(0, 1, 25);
}
*/

if(global.ctrlKey_state > 0)room_speed = 180; else room_speed = 60;

if(global.upKey_state == -1)global.upKey_state = 0;
if(global.downKey_state == -1)global.downKey_state = 0;
if(global.rightKey_state == -1)global.rightKey_state = 0;
if(global.leftKey_state == -1)global.leftKey_state = 0;

if(global.Akey_state == -1)global.Akey_state = 0;
if(global.Bkey_state == -1)global.Bkey_state = 0;
if(global.Xkey_state == -1)global.Xkey_state = 0;
if(global.Ykey_state == -1)global.Ykey_state = 0;

if(global.Lshoulder_state == -1)global.Lshoulder_state = 0;
if(global.Rshoulder_state == -1)global.Rshoulder_state = 0;
if(global.ctrlKey_state == -1)global.ctrlKey_state = 0;
if(global.controlsType == 1)
{
	if(keyboard_check(global.startKey))global.startKey_state ++; else global.startKey_state = -1;
	if(keyboard_check(global.upKey) && global.lockKeys == 0)global.upKey_state ++; else global.upKey_state = -1;
	if(keyboard_check(global.downKey) && global.lockKeys == 0)global.downKey_state ++; else global.downKey_state = -1;
	if(keyboard_check(global.leftKey) && global.lockKeys == 0)global.leftKey_state ++; else global.leftKey_state = -1;
	if(keyboard_check(global.rightKey) && global.lockKeys == 0)global.rightKey_state ++; else global.rightKey_state = -1;
	
	if(keyboard_check_pressed(global.upKey) && global.lockKeys == 1)global.lockKeys = 0;
	if(keyboard_check_pressed(global.downKey) && global.lockKeys == 1)global.lockKeys = 0;
	if(keyboard_check_pressed(global.leftKey) && global.lockKeys == 1)global.lockKeys = 0;
	if(keyboard_check_pressed(global.rightKey) && global.lockKeys == 1)global.lockKeys = 0;
	
	if(keyboard_check(global.Akey))global.Akey_state ++; else global.Akey_state = -1;
	if(keyboard_check(global.Bkey))global.Bkey_state ++; else global.Bkey_state = -1;
	if(keyboard_check(global.Xkey))global.Xkey_state ++; else global.Xkey_state = -1;
	if(keyboard_check(global.Ykey))global.Ykey_state ++; else global.Ykey_state = -1;
	
	if(keyboard_check(global.Lshoulder))global.Lshoulder_state ++; else global.Lshoulder_state = -1;
	if(keyboard_check(global.Rshoulder))global.Rshoulder_state ++; else global.Rshoulder_state = -1;
	if(keyboard_check(global.ctrlKey))global.ctrlKey_state ++; else global.ctrlKey_state = -1;
	
	if(keyboard_check(global.upKey) && keyboard_check(global.downKey))
	{
		global.upKey_state = 0;
		global.downKey_state = 0;
	}
	if(keyboard_check(global.rightKey) && keyboard_check(global.leftKey))
	{
		global.leftKey_state = 0;
		global.rightKey_state = 0;
	}
}
if(global.controlsType == 2)
{
	if(gamepad_is_connected(0))
	{
		var hAxis = gamepad_axis_value(0, gp_axislh);
		var vAxis = gamepad_axis_value(0, gp_axislv);
		var deadZone = 0.35;
		
		if(global.lastUsed == 1 && (abs(hAxis) > deadZone || abs(vAxis) > deadZone))global.lastUsed = 0; else if(global.lastUsed == 0)
		if(gamepad_button_check(0, gp_padu) || gamepad_button_check(0, gp_padd) || gamepad_button_check(0, gp_padr) || gamepad_button_check(0, gp_padl))
		{
			global.lastUsed = 1;
		}
		
		if(global.lastUsed == 0)
		{
			if(vAxis < - deadZone  && global.lockKeys == 0)global.upKey_state ++; else global.upKey_state = -1;
			if(vAxis > deadZone  && global.lockKeys == 0)global.downKey_state ++; else global.downKey_state = -1;
			if(hAxis < - deadZone  && global.lockKeys == 0)global.leftKey_state ++; else global.leftKey_state = -1;
			if(hAxis > deadZone  && global.lockKeys == 0)global.rightKey_state ++; else global.rightKey_state = -1;
	
			if(((abs(vAxis) < deadZone && global.lockAxis == 1) || (abs(hAxis) < deadZone && global.lockAxis == 0)) && global.lockKeys == 1)global.lockKeys = 0;
			//if((global.lockAxis == 2 && abs(vAxis) < deadZone && abs(hAxis) < deadZone && global.lockKeys == 1))global.lockKeys = 0;
		}
		else
		{
			if(gamepad_button_check(0, gp_padu) && global.lockKeys == 0)global.upKey_state ++; else global.upKey_state = -1;
			if(gamepad_button_check(0, gp_padd) && global.lockKeys == 0)global.downKey_state ++; else global.downKey_state = -1;
			if(gamepad_button_check(0, gp_padl) && global.lockKeys == 0)global.leftKey_state ++; else global.leftKey_state = -1;
			if(gamepad_button_check(0, gp_padr) && global.lockKeys == 0)global.rightKey_state ++; else global.rightKey_state = -1;
	
			if(gamepad_button_check_pressed(0, gp_padu) && global.lockKeys == 1)global.lockKeys = 0;
			if(gamepad_button_check_pressed(0, gp_padd) && global.lockKeys == 1)global.lockKeys = 0;
			if(gamepad_button_check_pressed(0, gp_padl) && global.lockKeys == 1)global.lockKeys = 0;
			if(gamepad_button_check_pressed(0, gp_padr) && global.lockKeys == 1)global.lockKeys = 0;
			
			if(global.upKey_state > 0 && global.downKey_state > 0)
			{
				global.upKey_state = 0;
				global.downKey_state = 0;
			}
			if(global.leftKey_state > 0 && global.rightKey_state > 0)
			{
				global.leftKey_state = 0;
				global.rightKey_state = 0;
			}
		}
		
		if(gamepad_button_check(0, gp_face1))global.Akey_state ++; else global.Akey_state = -1;
		if(gamepad_button_check(0, gp_face2))global.Bkey_state ++; else global.Bkey_state = -1;
		if(gamepad_button_check(0, gp_face3))global.Xkey_state ++; else global.Xkey_state = -1;
		if(gamepad_button_check(0, gp_face4))global.Ykey_state ++; else global.Ykey_state = -1;
		
		if(gamepad_button_check(0, gp_shoulderl))global.Lshoulder_state ++; else global.Lshoulder_state = -1;
		if(gamepad_button_check(0, gp_shoulderr))global.Rshoulder_state ++; else global.Rshoulder_state = -1;
		
		if(gamepad_button_check(0, gp_shoulderrb))global.ctrlKey_state ++; else global.ctrlKey_state = -1;
		if(gamepad_button_check(0, gp_shoulderlb))global.ctrlKey_state ++; else global.ctrlKey_state = -1;
	}
}
if(global.controlsType == 0)
{
	if(mouse_check_button(mb_left))global.Akey_state ++; else global.Akey_state = -1;
	if(mouse_check_button(mb_right))global.Bkey_state ++; else global.Bkey_state = -1;
}

if(keyboard_check_pressed(vk_f12))
{
	if(global.debug == false)
	{
		//show_debug_overlay(1);
		global.debug = true;
		text = "" // current text
		caret = 0 // caret position
		keyboard_string = "";
	}
	else
	{
		//show_debug_overlay(0);
		global.debug = false;
	}
}

if(global.debug)
{
	global.debugWrite = TextInput(40);
	
	if(global.upKey_state == 1)
	{
		if(global.debugIndex > 5)global.debugIndex -- ;
	}
	if(global.downKey_state == 1)
	{
		if(global.debugIndex < ds_list_size(global.debugList) - 1)global.debugIndex ++;
	}
	if(keyboard_check_pressed(vk_enter) && global.debugWrite != "")
	{
		ds_list_add(global.debugList, global.debugWrite);
		global.debugIndex ++;
		
		var str = global.debugWrite;
		var arg1 = "", arg2 = "", arg3 = "", arg4 = "";
		var st = 0;
		for(var i = 1; i <= string_length(str); i ++)
		{
			var tchar = string_char_at(str, i);
			if(tchar == " ")
			{
				st ++;
			}
			else
			{
				if(tchar != "[" && tchar != "]")
				{
					if(st == 0)arg1 += tchar;
					if(st == 1)arg2 += tchar;
					if(st == 2)arg3 += tchar;
					if(st == 3)arg4 += tchar;
				}
			}
		}
		
		arg1 = string_lower(arg1);
		
		var error = -4;
		if(arg1 == "help")
		{
			ds_list_add(global.debugList, "Commands:");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "additem [characterID] [itemID]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "additemtoshop [characterID] [itemID] [amount]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "addskill [characterID] [skillID]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "setgold [value]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "setattribute [characterID] [attribute] [value]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "clearstage");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "levelup [characterID]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "refreshstats [characterID]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "sethp [characterID] [value]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "setsp [characterID] [value]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "settotalchars [value]");
			global.debugIndex ++;
			
			ds_list_add(global.debugList, "reset");
			global.debugIndex ++;
			error = -1;
		}
		if(arg1 == "reset")
		{
			ds_list_clear(global.debugList);
			global.debugIndex = 0;
			
			error = -1;
		}
		if(arg1 == "clearstage")
		{
			if(instance_exists(obj_game))
			{
				if(obj_game.gamestate == "selected" || obj_game.gamestate == "select")
				{
					tempVar6 = 1001;
					obj_game.state = "checkgame";
					obj_game.gamestate = "idle";
					error = -1;
				} else error = 5;
			} else error = 2;
		}
		if(arg1 == "additem")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			var item = arg3;
			
			if(tchar != -1 && item != -1)
			{
				if(item > 0 && item < array_height_2d(global.ITEM))
				{
					AddItem(tchar, item);
					error = -1;
				} else error = 3;
			} else error = 0;
		}
		if(arg1 == "additemtoshop")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			var item = arg3;
			var amount = arg4;
			
			if(tchar != -1 && item != -1)
			{
				if(item > 0 && item < array_height_2d(global.ITEM))
				{
					var price = global.ITEM[item, 5];
					if(amount != -1)
					{
						ds_list_add(global.CHAR[tchar, 48], price); //price
						ds_list_add(global.CHAR[tchar, 49], item); //item
						ds_list_add(global.CHAR[tchar, 50], amount);
						error = -1;
					} else error = 4;
				} else error = 3;
			} else error = 0;
		}
		if(arg1 == "addskill")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			var item = arg3;
			
			if(tchar != -1 && item != -1)
			{
				if(item >= 0 && item < array_height_2d(global.SKILL))
				{
					AddSkill(tchar, item);
					error = -1;
				} else error = 3;
			} else error = 0;
		}
		if(arg1 == "setgold")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var value = arg2;
			if(value != -1)
			{
				global.gold = value;
				error = -1;
			} else error = 0;
		}
		if(arg1 == "settotalchars")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var value = arg2;
			if(value != -1)
			{
				global.totalChars = value;
				CharListOrder();
				error = -1;
			} else error = 0;
		}
		if(arg1 == "sethp")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			var value = arg3;
			
			if(tchar != -1)
			{
				if(((tchar >= 0 && tchar <= global.totalChars) || (tchar >= 50 && tchar <= 60)))
				{
					if(instance_exists(obj_game))
					{
						with (obj_unit)
						{
							if(characterID == tchar)
							{
								HP = value;
								if(HP > MAXHP)HP = MAXHP;
								if(HP < 1)HP = 1;
							}
						}
						error = -1;
					} else error = 2;
				} else error = 1;
			} else error = 0;
		}
		if(arg1 == "setsp")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			var value = arg3;
			
			if(tchar != -1)
			{
				if(((tchar >= 0 && tchar <= global.totalChars) || (tchar >= 50 && tchar <= 60)))
				{
					if(instance_exists(obj_game))
					{
						with (obj_unit)
						{
							if(characterID == tchar)
							{
								SP = value;
								if(SP > MAXSP)SP = MAXSP;
								if(SP < 0)SP = 0;
							}
						}
						error = -1;
					} else error = 2;
				} else error = 1;
			} else error = 0;
		}
		
		if(arg1 == "refreshstats")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			
			if(tchar != -1)
			{
				if(((tchar >= 0 && tchar <= global.totalChars) || (tchar >= 50 && tchar <= 60)))
				{
					if(instance_exists(obj_game))
					{
						with (obj_unit)
						{
							if(characterID == tchar)
							{
								RefreshChar(id);
							}
						}
						error = -1;
					} else error = 2;
				} else error = 1;
			} else error = 0;
		}
		
		if(arg1 == "setattribute")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg3 != 0)
			{
				if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			}
			var tchar = arg2;
			var attribute = arg3;
			var value = arg4;
			
			if(tchar != -1 && attribute != "" && value != -1)
			{
				if(((tchar >= 0 && tchar <= global.totalChars) || (tchar >= 50 && tchar <= 60)) && (attribute >= 0 && attribute <= 71))
				{
					if(attribute == 0)value = string(value);
					var oldvar = 0;
					if(attribute == 3)oldvar = global.CHAR[tchar, 3];
					global.CHAR[tchar, attribute] = value;
					if(attribute == 3)
					{
						global.CHAR[tchar, 32] -= global.CLASS[oldvar, 37];
						global.CHAR[tchar, 32] += global.CLASS[global.CHAR[tchar, 3], 37];
					}
					if(instance_exists(obj_game))
					{
						with(obj_unit)
						{
							if(characterID = tchar)
							{
								RefreshChar(id);
							}
						}
					}
					
					error = -1;
				} else error = 1;
			} else error = 0;
		}
		if(arg1 == "levelup")
		{
			if(arg2 != "")arg2 = real(arg2); else arg2 = -1;
			if(arg3 != "")arg3 = real(arg3); else arg3 = -1;
			if(arg4 != "")arg4 = real(arg4); else arg4 = -1;
			var tchar = arg2;
			
			if(tchar != -1)
			{
				if(tchar >= 0)
				{
					if(instance_exists(obj_game))
					{
						with (obj_unit)
						{
							if(characterID == tchar)
							{
								with obj_game
								{
									obj_pers.tempVar11 = 101;
									state = "levelupstart";
									with obj_musPlayer event_user(2);
									ds_list_clear(nup);
									ds_list_clear(nupVal);
									
									global.charlevelup = other.id;
									
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
											if(hasSkill == 0 && i != 10 && i != 17)ds_list_add(availableSkills, i);
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
									
									
									LevelUp(global.charlevelup);
								}
							}
						}
						error = -1;
					} else error = 2;
				} else error = 1;
			} else error = 0;
		}

		if(error == -4)
		{
			ds_list_add(global.debugList, "ERROR: Unknown command.");
			global.debugIndex ++;
		}
		
		if(error == 0)
		{
			ds_list_add(global.debugList, "ERROR: Incorrect number of parameters.");
			global.debugIndex ++;
		}
		if(error == 1)
		{
			ds_list_add(global.debugList, "ERROR: Array value out of bounds.");
			global.debugIndex ++;
		}
		if(error == 2)
		{
			ds_list_add(global.debugList, "ERROR: Not ingame.");
			global.debugIndex ++;
		}
		if(error == 3)
		{
			ds_list_add(global.debugList, "ERROR: Invalid value.");
			global.debugIndex ++;
		}
		if(error == 4)
		{
			ds_list_add(global.debugList, "ERROR: No amount parameter.");
			global.debugIndex ++;
		}
		if(error == 5)
		{
			ds_list_add(global.debugList, "ERROR: Can't clear stage at the moment.");
			global.debugIndex ++;
		}
		global.debugWrite = "";
		keyboard_string = "";
		text = "" // current text
		caret = 0 // caret position
	}
	
	exit;
}



switch(gamestate)
{
	case "endgamelose":
	
	//PlayMus(mus_gameover);
	guiTimer = 0;
	guiTimer2 = 0;
	
	gamestate = "endgamelose2";
	
	break;
	
	case "endgamelose2":
	
	if(guiTimer < 60)guiTimer ++;
	if(guiTimer >= 60)
	{
		gamestate = "endgamelose3";
		guiTimer = 0;
		guiTimer2 = 0;
		audio_play_sound(mus_gameover, 0, 0);
		audio_sound_gain(mus_gameover, 1, 100);
	}
	
	break;
	
	case "endgamelose3":
	
	if(guiTimer < 60)guiTimer ++;
	if(guiTimer >= 60)
	{
		gamestate = "endgamelose4";
		tempVar = 1;
		global.glSelect5 = 1;
	}
	
	break;
	
	case "endgamelose4":
	

	if(tempVar > 0)tempVar -= 1 / 5;
	if(tempVar <= 0)tempVar = 0;
	if(global.controlsType > 0)
	{
		if(global.rightKey_state == 1)
		{
			if(global.glSelect5 == 1)global.glSelect5 = 2; else global.glSelect5 = 1;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.leftKey_state == 1)
		{
			if(global.glSelect5 == 2)global.glSelect5 = 1; else global.glSelect5 = 2;
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}

	if(global.Akey_state == 1)
	{
		if(global.glSelect5 == 1)
		{
			audio_sound_gain(mus_gameover, 0, 300);
			gamestate = "endgamelose5";
			guiTimer = 0;
		}
		else
		{
			game_restart();
		}
	}

	
	break;
	
	case "endgamelose5":
	
		if(guiTimer < 30)guiTimer += 1;
		if(tempVar < 1)tempVar += 1 / 5;
		if(guiTimer == 30)
		{
			guiTimer = 31;
			CleanGame();
			if(global.currentFileType == 0)
			{
				with(obj_unit)instance_destroy();
				CleanGame();
				LoadGame(global.currentFile);
				
				CharListOrder();
				ResetDialogue();
				
				sys_SetBackgroundFade(-2, 1000, 1000, 500, c_black);
				state = "dialogue";
			}
			else
			{
				with(obj_unit)instance_destroy();
				CleanGame();
				LoadBattle(global.currentFile);
				global.glSelect3 = 3;
						
				ResetDialogue();
				
				audio_play_sound(sfx_start, 0, 0);
				CharListOrder();
						
				obj_pers.state = "loading";
				obj_pers.gamestate = "loading";
			}
		}
	
	break;

	case "sandynotes":
	
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
		
		if(global.Akey_state == 1 || global.Bkey_state == 1 || global.startKey_state == 1)
		{
			gamestate = "sandynotes2";
			//audio_play_sound(sfx_select, 0, 0);
			break;
		}
	
	break;
	
	case "sandynotes2":
	
		if(opSize4 < 1)opSize4 += 1 / 5;
		if(opSize4 >= 1)
		{
			opSize4 = 1;
			gamestate = "startmenu";
			break;
		}
		
	break;
	case "create":
	{
		switch(global.currentScene)
		{
			case 14:
			
			obj_pers.cid = 50;
			var boss = 50 + floor(random(instance_number(obj_unit)));
			//var gold = 50 + floor(random(instance_number(obj_unit)));
			
			var b1 = 50 + floor(random(instance_number(obj_unit)));
			var b2 = 50 + floor(random(instance_number(obj_unit)));
			var b3 = 50 + floor(random(instance_number(obj_unit)));
			
			/*
			while(gold == boss)
			{
				gold = 50 + floor(random(instance_number(obj_unit)));
			}
			*/
			
			with(obj_unit)
			{	
				gridX = floor(x / global.gridSize);
				gridY = floor(y / global.gridSize);
				x = gridX * global.gridSize;
				y = gridY * global.gridSize;
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
	
				characterID = obj_pers.cid;
				faction = 1;
				xpmult = 1;
				
				if(boss == obj_pers.cid)
				{
					isBoss = true;
					xpmult *= 3;
					var nlevel = floor((global.gamelevel) / 10) + max(4, floor((global.gamelevel) / 10) * 0.35);
					GenerateEnemies(obj_pers.cid, floor(nlevel));
					//global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
					AddItemEnemy(obj_pers.cid, 21);
				}
				/*
				if(gold == obj_pers.cid)
				{
					xpmult *= 3;
					var nlevel = 0.5 * max(3, global.CHAR[characterID, 4] * 0.35);
					GenerateEnemies(obj_pers.cid, global.CHAR[characterID, 4] + floor(nlevel));
					global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
				}
				*/
				if(b1 == obj_pers.cid)
				{
					AddItemEnemy(obj_pers.cid, 98);
				}
				if(b2 == obj_pers.cid)
				{
					AddItemEnemy(obj_pers.cid, 99);
				}
				if(b3 == obj_pers.cid)
				{
					AddItemEnemy(obj_pers.cid, 100);
				}
				obj_pers.cid ++;
			}
			with(obj_spawnTurn)
			{
				if(faction == 1)
				{
					characterID = obj_pers.cid;
					obj_pers.cid ++;
				}
			}
	
			gamestate = "idle";
			
			break;
			
			case 15:
			
			obj_pers.cid = 50;
			var boss = 50 + floor(random(instance_number(obj_unit)));
			//var gold = 50 + floor(random(instance_number(obj_unit)));
			
			var b1 = 50 + floor(random(instance_number(obj_unit)));
			
			/*
			while(gold == boss)
			{
				gold = 50 + floor(random(instance_number(obj_unit)));
			}
			*/
			
			with(obj_unit)
			{	
				gridX = floor(x / global.gridSize);
				gridY = floor(y / global.gridSize);
				x = gridX * global.gridSize;
				y = gridY * global.gridSize;
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
	
				characterID = obj_pers.cid;
				faction = 1;
				xpmult = 1;
				
				if(boss == obj_pers.cid)
				{
					isBoss = true;
					xpmult *= 3;
					var nlevel = floor((global.gamelevel * 1.25 + 30) / 10) + max(4, floor((global.gamelevel * 1.25 + 30) / 10) * 0.35);
					GenerateEnemies(obj_pers.cid, floor(nlevel));
					//global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
					//AddItemEnemy(obj_pers.cid, 21);
				}
				/*
				if(gold == obj_pers.cid)
				{
					xpmult *= 3;
					var nlevel = 0.5 * max(3, global.CHAR[characterID, 4] * 0.35);
					GenerateEnemies(obj_pers.cid, global.CHAR[characterID, 4] + floor(nlevel));
					global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
				}
				*/
				if(b1 == obj_pers.cid)
				{
					AddItemEnemy(obj_pers.cid, choose(98, 99, 100));
				}
				obj_pers.cid ++;
			}
			gamestate = "idle";
			
			break;
			
			case 16:
			
			obj_pers.cid = 50;
			var boss = 50 + floor(random(instance_number(obj_unit)));
			
			with(obj_unit)
			{	
				gridX = floor(x / global.gridSize);
				gridY = floor(y / global.gridSize);
				x = gridX * global.gridSize;
				y = gridY * global.gridSize;
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
	
				characterID = obj_pers.cid;
				faction = 1;
				xpmult = 1;
				
				if(boss == obj_pers.cid)
				{
					isBoss = true;
					xpmult *= 3;
					var nlevel = floor((global.gamelevel) / 10) + max(4, floor((global.gamelevel) / 10) * 0.35);
					GenerateEnemies(obj_pers.cid, floor(nlevel));

					//global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
					if(global.gamelevel <= 10) AddItemEnemy(obj_pers.cid, 21); else
					{
						AddItemEnemy(obj_pers.cid, 20);
						AddItemEnemy(obj_pers.cid, 20);
					}
					
				}
				obj_pers.cid ++;
			}
			gamestate = "idle";
			
			break;
			
			case 17:
			
			obj_pers.cid = 50;
			var boss = 50 + floor(random(instance_number(obj_unit)));
			//var gold = 50 + floor(random(instance_number(obj_unit)));
			
			var b1 = 50 + floor(random(instance_number(obj_unit)));
			
			/*
			while(gold == boss)
			{
				gold = 50 + floor(random(instance_number(obj_unit)));
			}
			*/
			
			with(obj_unit)
			{	
				gridX = floor(x / global.gridSize);
				gridY = floor(y / global.gridSize);
				x = gridX * global.gridSize;
				y = gridY * global.gridSize;
				global.map[gridX, gridY].occupant = id;
				standingNode = global.map[gridX, gridY];
	
				characterID = obj_pers.cid;
				faction = 1;
				xpmult = 1;
				
				if(boss == obj_pers.cid)
				{
					isBoss = true;
					xpmult *= 3;
					var nlevel = floor((global.gamelevel * 1.25 + 30) / 10) + max(4, floor((global.gamelevel * 1.25 + 30) / 10) * 0.35);
					GenerateEnemies(obj_pers.cid, floor(nlevel));
					//global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
					//AddItemEnemy(obj_pers.cid, 21);
				}
				/*
				if(gold == obj_pers.cid)
				{
					xpmult *= 3;
					var nlevel = 0.5 * max(3, global.CHAR[characterID, 4] * 0.35);
					GenerateEnemies(obj_pers.cid, global.CHAR[characterID, 4] + floor(nlevel));
					global.CHAR[obj_pers.cid, 4] += floor(nlevel);
					RefreshChar(id);
				}
				*/
				if(b1 == obj_pers.cid)
				{
					AddItemEnemy(obj_pers.cid, choose(98, 99, 100));
				}
				obj_pers.cid ++;
			}
			gamestate = "idle";
			
			break;
		}
		if(global.MAP[global.currentMap, 11] == 1)obj_camera.gridColor = c_black; else obj_camera.gridColor = c_white;
	}
	break;
	case "showmenu":
	{
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
		
		if(global.controlsType > 0 && global.menuOptions > 1)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect > 0)global.glSelect --; else global.glSelect = global.menuOptions - 1;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect <= 0)global.lockKeys = 1;
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect < global.menuOptions - 1)global.glSelect ++; else global.glSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect >= global.menuOptions - 1)global.lockKeys = 1;
			}
		}
		
		for(var i = 0; i < global.menuOptions; i ++)
		{
			if(global.controlsType == 0)
			{
				if(global.glSelect != i && global.mxv > 132 && global.mxv < 132 + 132 && global.myv > i * 32 + 104 - (global.menuOptions * 32) / 2 && global.myv < i * 32 + 136 - (global.menuOptions * 32) / 2)
				{
					global.glSelect = i;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
		}
		if(global.Akey_state == 1)
		{
			if(global.menuText[global.glSelect] == "Options")
			{
				gamestate = "menuoptions";
				global.showOptions = 8;
				global.glSelect2 = 0;
				opSize4 = 1;
				tempVar2 = 0;
				audio_play_sound(sfx_showOptions, 0, 0);
				
				if(gamepad_is_connected(0))
				{
					global.nOptionsMenu[1] = 3;
				}
				else
				{
					global.nOptionsMenu[1] = 2;
				}
				
				exit;
			}
			if(global.menuText[global.glSelect] == "Controls")
			{
				gamestate = "controlmapper";
				global.glSelect3 = 0;
				global.glSelect2 = 0;
				global.showOptions = 0;
				keyboard_lastkey = 0;
				opSize4 = 1;
				tempVar2 = 0;
				audio_play_sound(sfx_showOptions, 0, 0);
				
				for(var i = 0; i < global.menuOptions3; i ++)
				{
					switch(i)
					{
						case 0:
							keyvar[i] = global.startKey;
							break;
						case 1:
							keyvar[i] = global.selectKey;
							break;
						case 2:
							keyvar[i] = global.upKey;
							break;
						case 3:
							keyvar[i] = global.downKey;
							break;
						case 4:
							keyvar[i] = global.rightKey;
							break;
						case 5:
							keyvar[i] = global.leftKey;
							break;
						case 6:
							keyvar[i] = global.Akey;
							break;
						case 7:
							keyvar[i] = global.Bkey;
							break;
						case 8:
							keyvar[i] = global.Xkey;
							break;
						case 9:
							keyvar[i] = global.Ykey;
							break;
						case 10:
							keyvar[i] = global.Lshoulder;
							break;
						case 11:
							keyvar[i] = global.Rshoulder;
							break;
						case 12:
							keyvar[i] = global.ctrlKey;
							break;
					}
				}
				
				/*
				if(gamepad_is_connected(0))
				{
					global.nOptionsMenu[1] = 3;
				}
				else
				{
					global.nOptionsMenu[1] = 2;
				}
				*/
				
				exit;
			}
			if(global.menuText[global.glSelect] == "Save")
			{
				SaveBattle(global.currentFile);
				SaveBattle_step1(global.currentFile);
				global.currentFileType = 1;
				tempVar = 1;
				tempVar2 = 0;
				tempVar11 = 100;
				tempVar10 = gamestate;
			
				gamestate = "saving";
			}
			if(global.menuText[global.glSelect] == "Retreat")
			{
				ResetDialogue();
				with obj_musPlayer event_user(2);
				sys_SetBackgroundFade(-2, 750, 750, 325, c_black);
				state = "dialogue";
				gamestate = "idle";
				guiTimer = 0;
				guiTimer2 = 0;
				guiTimer3 = 0;
				guiTimer4 = 0;
				guiTimer5 = 0;
				
				obj_game.state = "idle";
				obj_game.gamestate = "idle";
				global.showOptions = 0;
			}
			if(global.menuText[global.glSelect] == "End")
			{
				gamestate = "closemenu";
				closeoptions = true;
			}
			audio_play_sound(sfx_select, 0, 0);
			exit;
		}
		if(global.Bkey_state == 1)
		{
			gamestate = "closemenu";
			closeoptions = false;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
	}
	break;
	case "controlmapper":
	{
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
		
		if(global.controlsType > 0 && global.glSelect3 == 0)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect2 > 0)
				{
					global.glSelect2 --;
					if(tempVar2 > 1)tempVar2 --;
					if(global.glSelect2 <= 0)global.lockKeys = 1;
				}
				else
				{
					global.glSelect2 = global.menuOptions3 - 1;
					tempVar2 = 4;
				}
				if(global.glSelect2 <= 0)global.lockKeys = 1;
				audio_play_sound(sfx_scroll, 0, 0);
				keyboard_lastkey = 0;
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect2 < global.menuOptions3 - 1)
				{
					global.glSelect2 ++;
					if(tempVar2 < 4)tempVar2 ++;
				}
				else
				{
					global.glSelect2 = 0;
					tempVar2 = 0;
				}
				if(global.glSelect2 >= global.menuOptions3 - 1)global.lockKeys = 1;
				audio_play_sound(sfx_scroll, 0, 0);
				keyboard_lastkey = 0;
			}
		}
		if(global.glSelect3 == 0 && global.Akey_state == 1)
		{
			audio_play_sound(sfx_select, 0, 0);
			global.glSelect3 = 1;
			keyboard_lastkey = 0;
			exit;
		}
		
		if(keyboard_lastkey != 0 && global.glSelect3 == 1)
		{
			global.glSelect3 = 0;
			keyvar[global.glSelect2] = keyboard_lastkey;
			keyboard_lastkey = 0;
			exit;
		}
		
		
		if(global.Bkey_state == 1 && global.glSelect3 == 0)
		{
			global.showOptions = 7;
			gamestate = "showmenu";
			global.glSelect = 0;
			global.glSelect2 = 0;
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			closeoptions = false;
			audio_play_sound(sfx_back, 0, 0);
			
			for(var i = 0; i < global.menuOptions3; i ++)
			{
				switch(i)
				{
					case 0:
					
						global.startKey = keyvar[i];
						break;
					case 1:
						global.selectKey = keyvar[i];
						break;
					case 2:
						global.upKey = keyvar[i];
						break;
					case 3:
						global.downKey = keyvar[i];
						break;
					case 4:
						global.rightKey = keyvar[i];
						break;
					case 5:
						global.leftKey = keyvar[i];
						break;
					case 6:
						global.Akey = keyvar[i];
						break;
					case 7:
						global.Bkey = keyvar[i];
						break;
					case 8:
						global.Xkey = keyvar[i];
						break;
					case 9:
						global.Ykey = keyvar[i];
						break;
					case 10:
						global.Lshoulder = keyvar[i];
						break;
					case 11:
						global.Rshoulder = keyvar[i];
						break;
					case 12:
						global.ctrlKey = keyvar[i];
						break;
				}
			}
			
			SaveControls();
		}
	}
	break;
	case "menuoptions":
	{
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
		
		if(global.controlsType > 0)
		{
			arrowSelect1 = 0;
			arrowSelect2 = 0;
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect2 > 0)
				{
					global.glSelect2 --;
					if(tempVar2 > 1)tempVar2 --;
					if(global.glSelect2 <= 0)global.lockKeys = 1;
				}
				else
				{
					global.glSelect2 = global.menuOptions2 - 1;
					tempVar2 = 4;
				}
				if(global.glSelect2 <= 0)global.lockKeys = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect2 < global.menuOptions2 - 1)
				{
					global.glSelect2 ++;
					if(tempVar2 < 4)tempVar2 ++;
				}
				else
				{
					global.glSelect2 = 0;
					tempVar2 = 0;
				}
				if(global.glSelect2 >= global.menuOptions2 - 1)global.lockKeys = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			
			if(global.leftKey_state == 1)
			{
				arrowSelect1 = 2;
				if(global.optionsType[global.glSelect2] == 0)
				{
					if(global.optionState[global.glSelect2] > 0)global.optionState[global.glSelect2] --; else global.optionState[global.glSelect2] = global.nOptionsMenu[global.glSelect2] - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect2 == 6)
					{
						if(global.optionState[6] == 0)
						{
							with (obj_raindrop) instance_destroy();
							with (obj_snow) instance_destroy();
						}
						else
						{
							if(instance_exists(obj_particles))
							{
								obj_particles.par[0] = 1;
								obj_particles.par[1] = 1;
							}
						}
					}
				} else if(global.optionState[global.glSelect2] > 0)
				{
					global.leftKey_state = 0;
					global.optionState[global.glSelect2] -= 2;
					if(global.optionState[global.glSelect2] < 0)global.optionState[global.glSelect2] = 0;
					if(global.glSelect2 == 2 && musMap != -1)audio_sound_gain(musMap, global.optionState[2] / 100, 750);
					//if(global.glSelect2 == 2 && vnAudio != -1)audio_sound_gain(vnAudio, global.optionState[2] / 100, 750);
					if(global.glSelect2 == 3)audio_master_gain(global.optionState[3] / 100);
					if(instance_exists(obj_musPlayer))
					{
						if(global.glSelect2 == 2)with obj_musPlayer event_user(5);
					}
				}
				exit;
			}
			if(global.rightKey_state == 1)
			{
				arrowSelect2 = 2;
				if(global.optionsType[global.glSelect2] == 0)
				{
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.optionState[global.glSelect2] < global.nOptionsMenu[global.glSelect2] - 1)global.optionState[global.glSelect2] ++; else global.optionState[global.glSelect2] = 0;
					if(global.glSelect2 == 6)
					{
						if(global.optionState[6] == 0)
						{
							with (obj_raindrop) instance_destroy();
							with (obj_snow) instance_destroy();
						}
						else
						{
							if(instance_exists(obj_particles))
							{
								obj_particles.par[0] = 1;
								obj_particles.par[1] = 1;
							}
						}
					}
				} else if(global.optionState[global.glSelect2] < 100)
				{
					global.rightKey_state = 0;
					global.optionState[global.glSelect2] += 2;
					if(global.optionState[global.glSelect2] > 100)global.optionState[global.glSelect2] = 100;
					if(global.glSelect2 == 2 && musMap != -1)audio_sound_gain(musMap, global.optionState[2] / 100, 750);
					if(global.glSelect2 == 3)audio_master_gain(global.optionState[3] / 100);
					if(instance_exists(obj_musPlayer))
					{
						if(global.glSelect2 == 2)with obj_musPlayer event_user(5);
					}
				}
				exit;
			}
		}
		if(global.controlsType == 0)
		{
			var xv = 9;
			var yv = 110 - (global.menuOptions2 * 32) / 2;
			arrowSelect1 = 0;
			arrowSelect2 = 0;
			
			if(global.mxv >= 194 + xv && global.mxv <= 194 + 10 + xv && global.myv >= 16 + global.glSelect2 * 32 + yv && global.myv <= 32 + global.glSelect2 * 32 + yv)
			{
				arrowSelect1 = 1;
				if(global.Akey_state == 1)
				{
					arrowSelect1 = 2;
					
					if(global.optionsType[global.glSelect2] == 0)
					{
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.optionState[global.glSelect2] < global.nOptionsMenu[global.glSelect2] - 1)global.optionState[global.glSelect2] ++; else global.optionState[global.glSelect2] = 0;
					}
				}
				if(global.Akey_state > 0)
				{
					if(global.optionsType[global.glSelect2] == 1 && global.optionState[global.glSelect2] > 0)
					{
						global.optionState[global.glSelect2] -= 2;
						if(global.optionState[global.glSelect2] < 0)global.optionState[global.glSelect2] = 0;
						if(global.glSelect2 == 2)with obj_musPlayer event_user(5);
					}
				}
			}
			if(global.mxv >= 322 + xv && global.mxv <= 322 + 10 + xv && global.myv >= 16 + global.glSelect2 * 32 + yv && global.myv <= 32 + global.glSelect2 * 32 + yv)
			{
				arrowSelect2 = 1;
				if(global.Akey_state == 1)
				{
					arrowSelect2 = 2;
					
					if(global.optionsType[global.glSelect2] == 0)
					{
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.optionState[global.glSelect2] < global.nOptionsMenu[global.glSelect2] - 1)global.optionState[global.glSelect2] ++; else global.optionState[global.glSelect2] = 0;
					}
				}
				if(global.Akey_state > 0)
				{
					if(global.optionsType[global.glSelect2] == 1 && global.optionState[global.glSelect2] < 100)
					{
						global.optionState[global.glSelect2] += 2;
						if(global.optionState[global.glSelect2] > 100)global.optionState[global.glSelect2] = 100;
						if(global.glSelect2 == 2)with obj_musPlayer event_user(5);
					}
				}
				
			}
			//draw_sprite_ext(spr_switchArrow, 0, 194 - 10 - obj_pers.sinSize * 0.75, 16 + global.glSelect2 * 32, 1, 1, 0, c_white, 1);
			//draw_sprite_ext(spr_switchArrow, 0, 322 - 10 + obj_pers.sinSize * 0.75, 16 + global.glSelect2 * 32, -1, 1, 0, c_white, 1);
		}
		
		for(var i = 0; i < global.menuOptions2; i ++)
		{
			if(global.controlsType == 0)
			{
				var yu = - 48;
				if(global.glSelect2 != i && global.mxv >= 48 && global.mxv <= 352 && global.myv >= yu + i * 32 + (120 - (global.menuOptions * 32) / 2) && global.myv <= yu + 31 + i * 32 + (120 - (global.menuOptions * 32) / 2))
				{
					global.glSelect2 = i;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
		}
		
		if(global.Bkey_state == 1)
		{
			global.showOptions = 7;
			gamestate = "showmenu";
			global.glSelect = 0;
			global.glSelect2 = 0;
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			closeoptions = false;
			audio_play_sound(sfx_back, 0, 0);
			
			global.controlsType = global.optionState[1];
			window_set_fullscreen(global.optionState[0]);
			
			//alarm[5] = 60;
					
			//global.menuOptions = 0;
		}
	}
	break;
	case "closemenu":
	{
		if(opSize4 < 1)opSize4 += 1 / 5;
		if(opSize4 >= 1)
		{	
			if(instance_exists(obj_campUnit))
			{
				obj_campUnit.state = "idle";
			}
			global.showOptions = 0;
			
			gamestate = tempVar5;
			if(instance_exists(obj_game))
			{
				obj_game.gamestate = "select";
				gamestate = "idle";
			}
			opSize = 1;
			opSize2 = 1;
			opSize3 = 1;
			opSize4 = 1;
			
			if(closeoptions == true && global.menuText[global.glSelect] == "End")
			{
				with (obj_unit)
				{
					if(faction == 0 && usedTurn == 0 && global.phase == 0)
					{
						EndTurn(id);
					}
				}
			}
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			
			exit;
		}
	}
	break;
	case "startmenu":
	
		PlayMus(mus_menu);
	
		gamestate = "menu";
		tempVar = 1;
		global.glSelect = 0;
		global.glSelect2 = 0;
		RefreshSaves();
	
	break;
	case "menu":
	
		if(tempVar > 0)tempVar -= 1 / 8;
		if(tempVar < 0)tempVar = 0;
		
		if(global.glSelect2 == 0 && state != "dialogue")
		{
			var total = global.mmenuOptions;
			if(global.nFiles == 0 && global.nBattleFiles == 0)
			{
				if(global.glSelect == 0)global.glSelect = 1;
			}
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.glSelect > 0) global.glSelect --; else global.glSelect = total - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect <= 0)global.lockKeys = 1;
					if(global.nFiles == 0 && global.nBattleFiles == 0)
					{
						if(global.glSelect == 0 || global.glSelect == 3 || global.glSelect == 4)global.glSelect = 2;
					}
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.glSelect < total - 1)global.glSelect ++; else global.glSelect = 0;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect >= total - 1)global.lockKeys = 1;
					if(global.nFiles == 0 && global.nBattleFiles == 0)
					{
						if(global.glSelect == 0 || global.glSelect == 3 || global.glSelect == 4)global.glSelect = 1;
					}
				}
			}
			if(global.Akey_state == 1)
			{
				if(global.glSelect == 0 && (global.nFiles > 0 || global.nBattleFiles > 0))
				{
					global.glSelect7 = 0;
					global.glSelect2 = 1;
					tempVar2 = 0;
					tempVar = 1;
					global.glSelect3 = 0;
					
					if(global.nFiles == 0) global.glSelect4 = 1; else global.glSelect4 = 0;
					audio_play_sound(sfx_select, 0, 0);
					RefreshSaves();
				}
				if(global.glSelect == 1)
				{
					global.glSelect2 = 2;
					tempVar = 1;
					global.glSelect3 = 0;
					fileName = "";
					ClearText();
					global.glSelect4 = 0;
					audio_play_sound(sfx_select, 0, 0);
				}
				if(global.glSelect == 2)
				{
					global.glSelect2 = 3;
					audio_play_sound(sfx_select, 0, 0);
					
					tempVar = 1;
					global.glSelect3 = 0;
					fileName = "";
					ClearText();
					global.glSelect4 = 0;
				}
				if(global.glSelect == 3 && (global.nFiles > 0 || global.nBattleFiles > 0))
				{
					global.glSelect2 = 4
					tempVar2 = 0;
					tempVar = 1;
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					audio_play_sound(sfx_select, 0, 0);
					global.glSelect7 = 0;
					if(global.nFiles == 0 && global.glSelect4 == 0)global.glSelect4 = 1;
					RefreshSaves();
				}
				if(global.glSelect == 4 && (global.nFiles > 0 || global.nBattleFiles > 0))
				{
					global.glSelect2 = 5;
					tempVar2 = 0;
					tempVar = 1;
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					global.glSelect7 = 0;
					if(global.nFiles == 0 && global.glSelect4 == 0)global.glSelect4 = 1;
					audio_play_sound(sfx_select, 0, 0);
					RefreshSaves();
				}
				exit;
			}
		}
		//menu controls
		if(global.glSelect2 == 1 && state != "dialogue")
		{
			var total = 0, limit = 0;
			if(global.glSelect7 == 1)
			{
				total = global.nFiles;
				limit = 0;
				if(global.Akey_state == 1)
				{
					global.currentFileType = 0;
					global.currentFile = global.saveFiles[global.glSelect4];
					CleanGame();
					if(LoadGame(global.saveFiles[global.glSelect4]))
					{
						global.glSelect3 = 3;
						ResetDialogue();
				
						sys_SetBackgroundFade(-2, 750, 750, 325, c_black);
						audio_play_sound(sfx_start, 0, 0);
						state = "dialogue";

						CharListOrder();
					}
					else
					{
						RefreshSaves();
						//file doesn't exist
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 0;
						tempVar = 1;
					}
				}
			} else
			if(global.glSelect7 == 2)
			{
				total = global.nBattleFiles;
				limit = 0;

				if(global.Akey_state == 1)
				{
					global.currentFileType = 1;
					global.currentFile = global.battleFiles[global.glSelect4];
					CleanGame();
					if(LoadBattle(global.battleFiles[global.glSelect4]))
					{
						global.glSelect3 = 3;
						
						ResetDialogue();
				
						audio_play_sound(sfx_start, 0, 0);
						CharListOrder();
						
						obj_pers.state = "loading";
						obj_pers.gamestate = "loading";
					}
					else
					{
						RefreshSaves();
						//file doesn't exist
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 0;
						tempVar = 1;
					}
				}
			}
			else
			{
				var total = 3;
				var limit = 0;
				if(global.controlsType > 0)
				{
					if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
					{
						if(global.glSelect4 > limit)
						{
							global.glSelect4 --;
							if(tempVar4 > 1)tempVar4 --;
						}
						else
						{
							global.glSelect4 = total - 1;
							tempVar4 = 4;
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect4 <= limit)global.lockKeys = 1;
						if(global.glSelect4 == 0 && global.nFiles == 0) global.glSelect4 = 2;
						if(global.glSelect4 == 1 && global.nBattleFiles == 0) global.glSelect4 = 0;
					}
					if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
					{
						if(global.glSelect4 < total - 1)
						{
							global.glSelect4 ++;
							if(tempVar4 < 3)tempVar4 ++;
						}
						else
						{
							global.glSelect4 = limit;
							tempVar4 = 0;
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect4 >= total - 1)global.lockKeys = 1;
						if(global.glSelect4 == 0 && global.nFiles == 0) global.glSelect4 = 1;
						if(global.glSelect4 == 1 && global.nBattleFiles == 0) global.glSelect4 = 2;
					}
				}
				if(global.Akey_state == 1)
				{
					switch(global.glSelect4)
					{
						case 0:
					
							global.glSelect7 = 1;
							global.glSelect4 = 0;
							tempVar = 1;
							audio_play_sound(sfx_select, 0, 0);
					
						break;
					
						case 1:
						
							global.glSelect7 = 2;
							global.glSelect4 = 0;
							tempVar = 1;
							audio_play_sound(sfx_select, 0, 0);
					
						break;
					
						case 2:
					
							audio_play_sound(sfx_back, 0, 0);
							global.glSelect2 = 0;
							RefreshSaves();
							tempVar = 1
					
						break;
					}
					exit;
				}
			}
			if(global.glSelect7 > 0)
			{
				if(global.controlsType > 0)
				{
					if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
					{
						if(global.glSelect4 > limit)
						{
							global.glSelect4 --;
							if(tempVar2 > 1)tempVar2 --;
						}
						else
						{
							global.glSelect4 = total - 1;
							tempVar2 = 4;
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect4 <= limit)global.lockKeys = 1;
						
					}
					if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
					{
						if(global.glSelect4 < total - 1)
						{
							global.glSelect4 ++;
							if(tempVar2 < 4)tempVar2 ++;
						}
						else
						{
							global.glSelect4 = limit;
							tempVar2 = 0;
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect4 >= total - 1)global.lockKeys = 1;
					}
				}
			}
			if(global.Bkey_state == 1)
			{
				if(global.glSelect7 == 0)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 0;
					RefreshSaves();
					tempVar = 1;
				}
				else
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect7 = 0;
					RefreshSaves();
					tempVar = 1;
					global.glSelect4 = 0;
				}
			}
		}
		if(global.glSelect2 == 2 && global.glSelect3 == 0 && state != "dialogue")
		{
			var total = 3;
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.glSelect4 > 0) global.glSelect4 --; else global.glSelect4 = total - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 <= 0)global.lockKeys = 1;
					if(global.glSelect4 == 1 && string_length(fileName) == 0)global.glSelect4 = 0;
					keyboard_string = "";
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.glSelect4 < total - 1)global.glSelect4 ++; else global.glSelect4 = 0;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 >= total)global.lockKeys = 1;
					if(global.glSelect4 == 1 && string_length(fileName) == 0)global.glSelect4 = 2;
					keyboard_string = "";
				}
			}
			
			if(global.glSelect4 == 0 && global.glSelect3 == 0)
			{
				fileName = TextInput(13);
			}
			if(global.glSelect4 == 1)
			{
				if(global.Akey_state == 1)
				{
					if(string_length(fileName) > 0)
					{
						RefreshSaves();
						var save = true;
						for(var i = 0; i < global.nFiles; i ++)
						{
							if(global.saveFiles[i] == fileName)
							{
								save = false;
								global.glSelect3 = 2;
								global.glSelect5 = 2;
								tempVar3 = 1;
								audio_play_sound(sfx_showOptions, 0, 0);
								exit;
							}
						}
						if(save)
						{
							CleanGame();
							global.currentFileType = 0;
							SaveGame(fileName);
							CharListOrder();
							global.currentFile = fileName;
							global.glSelect3 = 1;
							tempVar2 = 0;
							tempVar3 = 1;
							audio_play_sound(sfx_select, 0, 0);
							exit;
						}
					} else audio_play_sound(sfx_error, 0, 0);
				}
			}
			if(global.glSelect4 == 2)
			{
				if(global.Akey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 0;
					RefreshSaves();
					tempVar = 1;
				}
			}
			if(global.glSelect4 > 0 && global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 0;
				RefreshSaves();
				tempVar = 1;
			}
		}
		MultiplayerControls();
		
		//delete duplicate controls
		if(global.glSelect7 > 0 && (global.glSelect2 == 4 || global.glSelect2 == 5) && global.glSelect3 == 0 && state != "dialogue")
		{
			var total = global.nFiles;
			if(global.glSelect7 == 2)total = global.nBattleFiles;
			var limit = 0;
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.glSelect4 > limit)
					{
						global.glSelect4 --;
						if(tempVar4 > 1)tempVar4 --;
					}
					else
					{
						global.glSelect4 = total - 1;
						tempVar4 = 4;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 <= limit)global.lockKeys = 1;
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.glSelect4 < total - 1)
					{
						global.glSelect4 ++;
						if(tempVar4 < 3)tempVar4 ++;
					}
					else
					{
						global.glSelect4 = limit;
						tempVar4 = 0;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 >= total - 1)global.lockKeys = 1;
				}
			}
			if(global.Akey_state == 1 && global.glSelect2 == 4 && global.glSelect7 == 1)
			{
				global.currentFile = global.saveFiles[global.glSelect4];
				CleanGame();
				if(LoadGame(global.saveFiles[global.glSelect4]))
				{
					CharListOrder();
					global.glSelect3 = 2;
					global.glSelect5 = 2;
					audio_play_sound(sfx_showOptions, 0, 0);
					CharListOrder();
				}
				else
				{
					RefreshSaves();
					//file doesn't exist
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 0;
					tempVar = 1;
				}
				exit;
			}
			//duplicate a battle file
			if(global.Akey_state == 1 && global.glSelect2 == 4 && global.glSelect7 == 2)
			{
				global.currentFile = global.battleFiles[global.glSelect4];
				CleanGame();
				var file = working_directory + "\saves\\" + string(global.battleFiles[global.glSelect4]) + ".battle1";
				if(file_exists(file))
				{
					global.glSelect3 = 2;
					global.glSelect5 = 2;
					audio_play_sound(sfx_showOptions, 0, 0);
				}
				else
				{
					RefreshSaves();
					//file doesn't exist
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 0;
					tempVar = 1;
				}
				exit;
			}
			if(global.Akey_state == 1 && global.glSelect2 == 5)
			{
				global.glSelect2 = 5;
				global.glSelect3 = 2;
				global.glSelect5 = 2;
				audio_play_sound(sfx_showOptions, 0, 0);
				exit;
			}
			if(global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				
				global.glSelect4 = global.glSelect7 - 1;
				
				global.glSelect7 = 0;
				RefreshSaves();
				tempVar = 1;
				
				if(global.glSelect4 == 0 && global.nFiles == 0) global.glSelect4 = 1;
				
				exit;
			}
		}
		if(global.glSelect7 == 0 && (global.glSelect2 == 4 || global.glSelect2 == 5) && global.glSelect3 == 0 && state != "dialogue")
		{
			var total = 3;
			var limit = 0;
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.glSelect4 > limit)
					{
						global.glSelect4 --;
						if(tempVar4 > 1)tempVar4 --;
					}
					else
					{
						global.glSelect4 = total - 1;
						tempVar4 = 4;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 <= limit)global.lockKeys = 1;
					if(global.glSelect4 == 0 && global.nFiles == 0) global.glSelect4 = 2;
					if(global.glSelect4 == 1 && global.nBattleFiles == 0) global.glSelect4 = 0;
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.glSelect4 < total - 1)
					{
						global.glSelect4 ++;
						if(tempVar4 < 3)tempVar4 ++;
					}
					else
					{
						global.glSelect4 = limit;
						tempVar4 = 0;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 >= total - 1)global.lockKeys = 1;
					if(global.glSelect4 == 0 && global.nFiles == 0) global.glSelect4 = 1;
					if(global.glSelect4 == 1 && global.nBattleFiles == 0) global.glSelect4 = 2;
				}
			}
			if(global.Akey_state == 1)
			{
				switch(global.glSelect4)
				{
					case 0:
					
						global.glSelect7 = 1;
						global.glSelect4 = 0;
						
						tempVar = 1;
						audio_play_sound(sfx_select, 0, 0);
					
					break;
					
					case 1:
						
						global.glSelect7 = 2;
						global.glSelect4 = 0;
						tempVar = 1;
						audio_play_sound(sfx_select, 0, 0);
					
					break;
					
					case 2:
					
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 0;
						RefreshSaves();
						tempVar = 1
					
					break;
				}
				exit;
			}
			if(global.Bkey_state == 1)
			{
				if(global.glSelect7 == 0)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 0;
					RefreshSaves();
					tempVar = 1;
					exit;
				}
			}
		}
		
		if(global.glSelect3 == 2 && state != "dialogue")
		{
			if(tempVar3 > 0)tempVar3 -= 1 / 5;
			if(tempVar3 <= 0)tempVar3 = 0;
			if(global.controlsType > 0)
			{
				if(global.rightKey_state == 1)
				{
					if(global.glSelect5 == 1)global.glSelect5 = 2; else global.glSelect5 = 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.leftKey_state == 1)
				{
					if(global.glSelect5 == 2)global.glSelect5 = 1; else global.glSelect5 = 2;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
			
			if(global.glSelect2 == 2)
			{
				if(global.Akey_state == 1)
				{
					if(global.glSelect5 == 1)
					{
						CleanGame();
						audio_play_sound(sfx_select, 0, 0);
						SaveGame(fileName);
						CharListOrder();
						global.currentFile = fileName;
						global.glSelect3 = 1;
						tempVar2 = 0;
						tempVar3 = 1;
					}
					else
					{
						audio_play_sound(sfx_back, 0, 0);
						keyboard_string = "";
						global.glSelect3 = 0;
						global.glSelect4 = 0;
					}
				}
				if(global.Bkey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					keyboard_string = "";
					exit;
				}
			}
			if(global.glSelect2 == 4)
			{
				if(global.Akey_state == 1)
				{
					if(global.glSelect5 == 1)
					{
						audio_play_sound(sfx_select, 0, 0);
						var str = global.currentFile;
						var laststr = string_digits(string_char_at(str, string_length(str)));
						if(laststr == "")str += "0"; else
						{
							str = string_copy(str, 1, string_length(str) - 1);
							var num = real(laststr) + 1;
							str += string(num);
						}
						var canexit = true;
						if(global.glSelect7 == 1)
						{
							do
							{
								for(var i = 0; i < global.nFiles; i ++)
								{
									if(global.saveFiles[i] == str)
									{
										str += "0";
										canexit = true;
										for(var ii = 0; ii < global.nFiles; ii ++)
										{
											if(global.saveFiles[ii] == str)
											{
												canexit = false;
											}
										}
									}
								}
							} until (canexit == true)
							str = string_copy(str, 0, 20);
							var file = working_directory + "\saves\\" + string(global.currentFile) + ".sandy";
							if(file_exists(file))file_copy(file, working_directory + "\saves\\" + str + ".sandy");
						}
						else
						{
							do
							{
								for(var i = 0; i < global.nBattleFiles; i ++)
								{
									if(global.battleFiles[i] == str)
									{
										str += "0";
										canexit = true;
										for(var ii = 0; ii < global.nBattleFiles; ii ++)
										{
											if(global.battleFiles[ii] == str)
											{
												canexit = false;
											}
										}
									}
								}
							} until (canexit == true)
							str = string_copy(str, 0, 20);
							var file = working_directory + "\saves\\" + string(global.currentFile) + ".battle1";
							var file2 = working_directory + "\saves\\" + string(global.currentFile) + ".battle2";
							if(file_exists(file))file_copy(file, working_directory + "\saves\\" + str + ".battle1");
							if(file_exists(file2))file_copy(file2, working_directory + "\saves\\" + str + ".battle2");
						}
						CharListOrder();
						global.currentFile = str;
						global.glSelect3 = 1;
						tempVar2 = 0;
						tempVar3 = 1;
					}
					else
					{
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect3 = 0;
						global.glSelect4 = 0;
					}
				}
				if(global.Bkey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect3 = 0;
				}
			}
			if(global.glSelect2 == 5)
			{
				if(global.Akey_state == 1)
				{
					if(global.glSelect5 == 1)
					{
						if(global.glSelect7 == 1)
						{
							audio_play_sound(sfx_delete, 0, 0);
							DeleteGame(global.saveFiles[global.glSelect4]);
							CleanGame();
							global.glSelect3 = 0;
							RefreshSaves();
							if(global.glSelect4 >= global.nFiles)global.glSelect4 --;
							if(global.nFiles == 0)
							{
								global.glSelect2 = 0;
								global.glSelect = 0;
								global.glSelect4 = 0;
								tempVar = 1;
							}
						}
						else
						{
							audio_play_sound(sfx_delete, 0, 0);
							DeleteBattle(global.battleFiles[global.glSelect4]);
							CleanGame();
							global.glSelect3 = 0;
							RefreshSaves();
							if(global.glSelect4 >= global.battleFiles)global.glSelect4 --;
							if(global.nBattleFiles == 0)
							{
								global.glSelect2 = 0;
								global.glSelect = 0;
								global.glSelect4 = 0;
								tempVar = 1;
							}
						}
						exit;
					}
					else
					{
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect3 = 0;
						//global.glSelect4 = 0;
					}
				}
				if(global.Bkey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect3 = 0;
				}
			}
		}
		//saving
		if(global.glSelect3 == 1)
		{	
			if(tempVar2 < 5)
			{
				if(tempVar3 > 0)tempVar3 -= 1 / 5;
				if(tempVar3 <= 0)tempVar3 = 0;
			}
			if(tempVar2 > 20)
			{
				if(tempVar3 < 1)tempVar3 += 1 / 5;
				if(tempVar3 >= 1)tempVar3 = 1;
			}
			tempVar2 += 0.5;
			if(tempVar2 > 24 && tempVar3 >= 1)
			{
					global.glSelect3 = 3;
					
					if(global.glSelect2 == 2)
					{
						ResetDialogue();
						audio_play_sound(sfx_start, 0, 0);
				
						sys_SetBackgroundFade(-2, 750, 750, 325, c_black);
						state = "dialogue";
					}
					if(global.glSelect2 == 4)
					{
						audio_play_sound(sfx_saved, 0, 0);
						global.glSelect3 = 0;
						RefreshSaves();
					}
					if(global.glSelect2 == 13)
					{
						//go lobby
						audio_play_sound(sfx_saved, 0, 0);
						global.glSelect3 = 0;
						global.glSelect2 = 15;
						RefreshSavesMultiplayer();
					}
			}
		}
	
	break;
	case "saving":
	
		if(tempVar2 < 5)
		{
			if(tempVar > 0)tempVar -= 1 / 5;
			if(tempVar <= 0)tempVar = 0;

		}
		if(tempVar2 > 20)
		{
			if(tempVar < 1)tempVar += 1 / 5;
			if(tempVar >= 1)tempVar = 1;
		}
		tempVar2 += 0.5;
		if(tempVar2 > 24 && tempVar >= 1)
		{
			if(instance_exists(obj_game))
			{
				if(tempVar11 != 100)
				{
					obj_game.gamestate = "preparation";
					gamestate = "preparation";
				
					CheckSupports();
				}
				else
				{
					tempVar11 = 0;
					gamestate = tempVar10;
					tempVar10 = 0;
					closeoptions = false;
				}
			}
			else
			{
				gamestate = laststate;
			}
			audio_play_sound(sfx_saved, 0, 0);
		}	
	
	break;
	case "startmap":
	
		PlayMus(mus_map);
	
		CharListOrder();
		
		var tchar = ds_list_find_index(global.charList, global.OWchar);
		if(tchar < 0)global.OWchar = ds_list_find_value(global.charList, 0);
		
		tempVar11 = 1;
		gamestate = "map";
		showMap = true;
		tempVar3 = 0;
		tempVar4 = 0;
		tempVar5 = 0;
		obj_mapCamera.xTo = global.MAP[0, 6];
		obj_mapCamera.yTo = global.MAP[0, 7];
		obj_mapCamera.x = global.MAP[0, 6];
		obj_mapCamera.y = global.MAP[0, 7];
	
	break;
	case "startcamp":
	
		room_goto(global.MAP[goTo, 9]);
	
		global.currentMap = goTo;
		global.currentRegion = global.MAP[global.currentMap, 1];
	
		goTo = -1;
	
		if(global.MAP[global.currentMap, 12] != -1)
		{
			PlayMus(global.MUSICPACK[global.MAP[global.currentMap, 12], 1]);
		} else StopMus();
		if(global.CLIMATE[global.MAP[global.currentMap, 4], 2] != -1)
		{
			PlayAmb(global.CLIMATE[global.MAP[global.currentMap, 4], 2]);
		}
	
		gamestate = "camp";
		tempVar4 = 45;
	
	break;
	case "camp":
	
	if(tempVar4 > 0)
	{
		tempVar4 --;
	}
	
	break;
	case "events":
	/*
	if(global.itemBreak != -1)
	{
		state = "weaponbreak";
		exit;
	}
	*/
	gamestate = "temp";
	if(ds_list_size(global.itemDrops) > 0)
	{
		var inventory = global.CHAR[global.OWchar, 49];
		var uses = global.CHAR[global.OWchar, 50];
		var item = ds_list_find_value(global.itemDrops, 0);
		if(ds_list_size(inventory) >= 5)
		{
			tempVar2 = 1;
			gamestate = "itemdrop";
			//ov = true;
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
			gamestate = "itemdrop";
			ds_list_add(inventory, item);
			ds_list_add(uses, global.ITEM[item, 2]);
		}
		if(global.CHAR[global.OWchar, 56] == -1 && CanUse(global.OWchar, item))
		{
			EquipGlobal(global.OWchar, ds_list_size(inventory) - 1);
			MoveEquipTop(global.OWchar);
		}
		exit;
	}
	if(global.armyJoin != -1)
	{
		guiTimer = 0;
		guiTimer2 = 0;
		gamestate = "armyjoin";
		exit;
	}
	if(ds_list_size(global.recDrops) > 0)
	{
		var item = ds_list_find_value(global.recDrops, 0);
		var stack = ds_list_find_value(global.recDropsAm, 0);
		
		if(item != undefined)
		{
			gamestate = "recdrop";
		
			AddResource(item, stack);
		}
		exit;
	}
	if(gamestate == "temp")
	{
		global.glSelect = 0;
		if(global.CHAR[global.OWchar, 56] == -1)EquipFirstWeaponGlobal(global.OWchar);
		if(tempVar8 == -100)
		{
			gamestate = tempVar7;
			opSize4 = 1;
			global.glSelect2 = 0;
		}
		else
		{
			tempVar10 = 0;
			tempVar = 1;
			tempVar3 = 1;
			tempVar11 = -1;
			
			if(instance_exists(obj_mysticorb))
			{
				gamestate = "orb_interact";
			}
			else gamestate = "idle";
		}
	}
		
	break;
	case "itemdropchoose":
	{
		if(opSize4 > 0)opSize4 -= 1 / 4;
		if(opSize4 < 0)opSize4 = 0;
		
		var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect);
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
		
		if(global.glSelect2 == 0)
		{
			if(global.controlsType > 0)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					if(global.glSelect > 0) global.glSelect --; else global.glSelect = total - 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					if(global.glSelect < total - 1)global.glSelect ++; else global.glSelect = 0;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
			if(global.Akey_state == 1)
			{
				audio_play_sound(sfx_showOptions, 0, 0);
				global.glSelect2 = 1;
				global.glSelect3 = 2;
				exit;
			}
		}
		if(global.glSelect2 == 1)
		{
			total = 2;
			if(global.rightKey_state == 1)
			{
				if(global.glSelect3 == 1)global.glSelect3 = 2; else global.glSelect3 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(global.glSelect3 == 2)global.glSelect3 = 1; else global.glSelect3 = 2;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.Akey_state == 1)
			{
				if(global.glSelect3 == 2)
				{
					global.glSelect2 = 0;
					audio_play_sound(sfx_back, 0, 0);
				}
				if(global.glSelect3 == 1)
				{
					global.glSelect2 = 0;
					audio_play_sound(sfx_select, 0, 0);
					
					var inventory = global.CHAR[global.OWchar, 49];
					var uses = global.CHAR[global.OWchar, 50];
					var item = ds_list_find_value(inventory, global.glSelect);
					var itemuses = ds_list_find_value(uses, global.glSelect);
					
					ds_list_add(global.CHAR[100, 49], item);
					ds_list_add(global.CHAR[100, 50], itemuses);
					
					DiscardItem(global.OWchar, global.glSelect);
					
					gamestate = "events";
					tempVar = 1;
					global.glSelect4 = 0;
					global.glSelect3 = 0;
					ds_list_delete(global.itemDrops, 0);
				}
			}
			if(global.Bkey_state == 1)
			{
				global.glSelect2 = 0;
			}
		}
	}
	break;
	case "itemdrop":
	{
		if(guiTimer < 20 && guiTimer2 == 0)guiTimer ++;
		if(guiTimer >= 20 && guiTimer < 100 && guiTimer2 < 1)guiTimer2 += 1 / 5;
		if(guiTimer2 >= 1 && guiTimer >= 20 && guiTimer < 100)
		{
			guiTimer = 0;
			audio_play_sound(sfx_itemGet, 0, 0);
		}
		
		if(guiTimer == 0 && guiTimer2 >= 1 && global.Akey_state == 1)
		{
			guiTimer = 100;
		}
		if(guiTimer == 100)
		{
			guiTimer2 -= 1 / 5;
			if(guiTimer2 <= 0)
			{
				guiTimer2 = 0;
				guiTimer = 0;
				if(tempVar2 == 0)
				{
					gamestate = "events";
					
					ds_list_delete(global.itemDrops, 0);
				}
				else
				{
					gamestate = "itemdropchoose";
					guiTimer2 = 0;
					xScroll = 0;
					global.glSelect = 0;
					global.glSelect2 = 0;
					global.glSelect3 = 0;
					opSize4 = 1;
				}
				exit;
			}
		}
	}
	break;
	case "recdrop":
	{
		if(guiTimer < 20 && guiTimer2 == 0)guiTimer ++;
		if(guiTimer >= 20 && guiTimer < 100 && guiTimer2 < 1)guiTimer2 += 1 / 5;
		if(guiTimer2 >= 1 && guiTimer >= 20 && guiTimer < 100)
		{
			guiTimer = 0;
			audio_play_sound(sfx_itemGet, 0, 0);
		}
		
		if(guiTimer == 0 && guiTimer2 >= 1 && global.Akey_state == 1)
		{
			guiTimer = 100;
		}
		if(guiTimer == 100)
		{
			guiTimer2 -= 1 / 5;
			if(guiTimer2 <= 0)
			{
				guiTimer2 = 0;
				guiTimer = 0;
				gamestate = "events";
					
				ds_list_delete(global.recDrops, 0);
				ds_list_delete(global.recDropsAm, 0);
				exit;
			}
		}
	}
	break;
	case "armyjoin":
	{
		if(guiTimer < 20 && guiTimer2 == 0)guiTimer ++;
		if(guiTimer >= 20 && guiTimer < 100 && guiTimer2 < 1)guiTimer2 += 1 / 5;
		if(guiTimer2 >= 1 && guiTimer >= 20 && guiTimer < 100)
		{
			guiTimer = 0;
			audio_play_sound(sfx_levelup, 0, 0);
		}
		
		if(guiTimer == 0 && guiTimer2 >= 1 && global.Akey_state == 1)
		{
			guiTimer = 100;
		}
		if(guiTimer == 100)
		{
			guiTimer2 -= 1 / 5;
			if(guiTimer2 <= 0)
			{
				guiTimer2 = 0;
				guiTimer = 0;
				gamestate = "events";
					
				if(instance_exists(obj_campUnit))obj_campUnit.state = "idle";
				global.armyJoin = -1;
				exit;
			}
		}
	}
	break;
	case "itemconvoy":
	{
		if(guiTimer < 20 && guiTimer2 == 0)guiTimer ++;
		if(guiTimer >= 20 && guiTimer < 100 && guiTimer2 < 1)guiTimer2 += 1 / 5;
		if(guiTimer2 >= 1 && guiTimer >= 20 && guiTimer < 100)
		{
			guiTimer = 0;
			audio_play_sound(sfx_showOptions, 0, 0);
		}
		
		if(guiTimer == 0 && guiTimer2 >= 1 && global.Akey_state == 1)
		{
			guiTimer = 100;
		}
		if(guiTimer == 100)
		{
			guiTimer2 -= 1 / 5;
			if(guiTimer2 <= 0)
			{
				guiTimer2 = 0;
				guiTimer = 0;
				gamestate = "shop";
				exit;
			}
		}
	}
	break;
	case "orb_options":
	
	if(tempVar > 0)tempVar -= 1 / 5;
	
	if(tempVar11 == -1)
	{
		var inventory = global.CHAR[global.OWchar, 49];
		var useslist = global.CHAR[global.OWchar, 50];
	
		if(ds_list_size(inventory) > 1)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect7 > 0)
				{
					global.glSelect7 --;
				}
				else
				{
					global.glSelect7 = ds_list_size(inventory) - 1;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect7 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect7 < ds_list_size(inventory) - 1)
				{
					global.glSelect7 ++;
				}
				else
				{
					global.glSelect7 = 0;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect7 >= ds_list_size(inventory) - 1 && global.downKey_state > 20)global.lockKeys = 1;
			}
		}
	
		if(global.Akey_state == 1)
		{
			var item = ds_list_find_value(inventory, global.glSelect7);
			var uses = ds_list_find_value(useslist, global.glSelect7);
		
			var usable = false;
			
			
			if(global.ITEM[item, 4] >= 10)usable = true;
			if(global.glSelect6 == 0)
			{
				if(uses >= global.ITEM[item, 2])
				{
					usable = false;
				}
			}
			if(global.glSelect6 == 2)
			{
				var times = global.ITEM[item, 30];
				if(times > 1)
				{
					usable = false;
				}
			}
			if(global.glSelect6 == 3)
			{
				if(global.ITEM[item, 4] == 18)usable = false;
			}
			if(usable == true)
			{
				audio_play_sound(sfx_select, 0, 0);
				tempVar11 = item;
				if(global.glSelect6 == 0)tempVar10 = ceil(((global.ITEM[item, 2] - uses) / global.ITEM[item, 2]) * (global.ITEM[item, 5] / 2));
				if(global.glSelect6 == 2)tempVar10 = floor(global.ITEM[item, 5] / 2) + ceil(((global.ITEM[item, 2] - uses) / global.ITEM[item, 2]) * (global.ITEM[item, 5] / 2));
				
				if(global.glSelect6 == 3)
				{
					tempVar10 = -2;
					tempVar9 = -1;
				}
				global.glSelect8 = 0;
				//tempVar10 = global.glSelect7;
			}
			else audio_play_sound(sfx_error, 0, 0);

		}
		if(global.Bkey_state == 1)
		{
			tempVar10 = 0;
			tempVar = 1;
			tempVar3 = 1;
			tempVar11 = -1;
			gamestate = "orb_interact";
				
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
	}
	else
	{
		if(global.Akey_state == 1)
		{
			if(global.glSelect6 == 0)
			{
				if(global.gold >= tempVar10)
				{
				//repair
				tempVar = 1;
				tempVar3 = 1;
				gamestate = "orb_interact";
				obj_mysticorb.react = 10;
				
				ds_list_delete(global.CHAR[global.OWchar, 50], global.glSelect7);
				ds_list_insert(global.CHAR[global.OWchar, 50], global.glSelect7, global.ITEM[tempVar11, 2]);
				
				global.gold -= tempVar10;
				tempVar11 = -1;
				tempVar10 = 0;
				
				//audio_play_sound(sfx_buy, 0, 0);
				audio_play_sound(sfx_dismantle1, 0, 0);
				audio_play_sound(sfx_dismantle2, 0, 0);
				audio_play_sound(sfx_dismantle3, 0, 0);
				} else audio_play_sound(sfx_error, 0, 0);
				exit;
			}
			if(global.glSelect6 == 1)
			{
				//dismantle
				tempVar = 1;
				tempVar3 = 1;
				gamestate = "events";
				guiTimer = 0;
				guiTimer2 = 0;
				obj_mysticorb.react = 10;
				
				var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
				if(global.ITEM[item, 23] != -1 && global.ITEM[item, 23] != -2)
				{
					var amount = ceil(global.ITEM[item, 28] / 2);
					if(amount == 0 && global.ITEM[item, 28] > 0 && floor(random(101)) <= 50)amount = 1;
					
					if(amount > 0)
					{
						ds_list_add(global.recDrops, global.ITEM[item, 23]);
						ds_list_add(global.recDropsAm, amount);
						var chance = 0;
						for(var i = 0; i < 6; i ++)
						{
							if(global.ITEM[item, 23] == 38 + i)
							{
								chance = 10 * i * amount;
								if(i == 0)chance = 5 * amount;
							}
						}
						if(floor(random(101)) <= chance)
						{
							ds_list_add(global.recDrops, choose(50, 51, 52, 53));
							ds_list_add(global.recDropsAm, 1);
						}
					}
				}
				if(global.ITEM[item, 24] != -1 && global.ITEM[item, 23] != -2)
				{
					var amount = ceil(global.ITEM[item, 29] / 2);
					if(amount == 0 && global.ITEM[item, 29] > 0 && floor(random(101)) <= 50)amount = 1;
					
					if(amount > 0)
					{
						ds_list_add(global.recDrops, global.ITEM[item, 24]);
						ds_list_add(global.recDropsAm, amount);
					
						var chance = 0;
						for(var i = 0; i < 6; i ++)
						{
							if(global.ITEM[item, 23] == 38 + i)
							{
								chance = 10 * i * amount;
								if(i == 0)chance = 5 * amount;
							}
						}
						if(floor(random(101)) <= chance)
						{
							ds_list_add(global.recDrops, choose(50, 51, 52, 53));
							ds_list_add(global.recDropsAm, 1);
						}
					}
				}
				if(global.ITEM[item, 25] != -1)
				{
					ds_list_add(global.recDrops, global.ITEM[item, 25]);
					ds_list_add(global.recDropsAm, 1);
				}
				if(global.ITEM[item, 26] != -1)
				{
					ds_list_add(global.recDrops, global.ITEM[item, 26]);
					ds_list_add(global.recDropsAm, 1);
				}
				if(global.ITEM[item, 27] != -1)
				{
					ds_list_add(global.recDrops, global.ITEM[item, 27]);
					ds_list_add(global.recDropsAm, 1);
				}
				
				if(item >= 200)global.ITEM[item, 0] = "error";
				
				ds_list_delete(global.CHAR[global.OWchar, 49], global.glSelect7);
				ds_list_delete(global.CHAR[global.OWchar, 50], global.glSelect7);
				
				if(global.CHAR[global.OWchar, 56] == global.glSelect7)
				{
					global.CHAR[global.OWchar, 56] = -1;
					global.CHAR[global.OWchar, 44] = -1;
				}
				
				tempVar11 = -1;
				tempVar10 = 0;
				
				audio_play_sound(sfx_dismantle1, 0, 0);
				audio_play_sound(sfx_dismantle2, 0, 0);
				audio_play_sound(sfx_dismantle3, 0, 0);
				exit;
			}
			if(global.glSelect6 == 2)
			{
				if(global.gold >= tempVar10)
				{
				//refinee
				tempVar = 1;
				tempVar3 = 1;
				gamestate = "orb_interact";
				obj_mysticorb.react = 10;
				
				var item = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
				var copy = 200 + global.nCustom;
				replacement = 0;
				for(var i = 200; i < 200 + global.nCustom; i ++)
				{
					if(global.ITEM[i, 0] = "error")
					{
						copy = i;
						replacement = 1;
						break;
					}
				}
				
				if(item >= 200)
				{
					copy = item;
					replacement = 1;
				}else CopyItem(item, copy);
				
				
				
				global.ITEM[copy, 2] = ceil(global.ITEM[copy, 2] + global.ITEM[copy, 2] * .1);
				
				/*
				ds_list_delete(global.CHAR[global.OWchar, 49], global.glSelect7);
				ds_list_insert(global.CHAR[global.OWchar, 49], global.glSelect7, copy);
				ds_list_delete(global.CHAR[global.OWchar, 50], global.glSelect7);
				ds_list_insert(global.CHAR[global.OWchar, 50], global.glSelect7, global.ITEM[copy, 2]);
				*/
				
				DiscardItem(global.OWchar, global.glSelect7);
				
				global.ITEM[copy, 10] += ceil(global.ITEM[copy, 10] * .1);
				global.ITEM[copy, 11] += 3;
				
				if(global.ITEM[copy, 11] > 100)global.ITEM[copy, 11] = 100;
				global.ITEM[copy, 5] += tempVar10;
				
				global.ITEM[copy, 0] += "+";
				/*
				if(global.ITEM[copy, 31] == 0)
				{
					if(global.ITEM[copy, 30] == 0)
					{
						global.ITEM[copy, 0] += "(+)";
					}
					else
					{
						global.ITEM[copy, 0] = string_delete(global.ITEM[copy, 0], string_length(global.ITEM[copy, 0]), 1);
						global.ITEM[copy, 0] += "+)";
					}
				}
				else //(e)
				{
					global.ITEM[copy, 0] = string_delete(global.ITEM[copy, 0], string_length(global.ITEM[copy, 0]), 1);
					global.ITEM[copy, 0] += "+)";
				}
				*/
				global.ITEM[copy, 30] ++;
				//global.ITEM[copy, 0] += "+";
				
				
				if(replacement == 0)global.nCustom ++;
				
				global.gold -= tempVar10;
				
				
				//dismantle
				tempVar = 1;
				tempVar3 = 1;
				gamestate = "events";
				guiTimer = 0;
				guiTimer2 = 0;
				obj_mysticorb.react = 10;
				
				ds_list_add(global.itemDrops, copy);
				
				tempVar11 = -1;
				tempVar10 = 0;
				
				audio_play_sound(sfx_dismantle1, 0, 0);
				audio_play_sound(sfx_dismantle2, 0, 0);
				audio_play_sound(sfx_dismantle3, 0, 0);
				exit;
				}
				else audio_play_sound(sfx_error, 0, 0);
			}
		}
		if(global.glSelect6 >= 3)
		{
			//enchant

			var storage = global.resourceBox;
			var storagestacks = global.resourceBoxAm;
			if(ds_list_size(storage) > 1)
			{
				if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
				{
					xScroll = 0;
					guiTimer2 = 0;
					if(global.glSelect8 > 0)
					{
						global.glSelect8 --;
						if(tempVar2 > 1)tempVar2 --;
					}
					else
					{
						global.glSelect8 = ds_list_size(storage) - 1;
						tempVar2 = 4;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect8 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
				{
					xScroll = 0;
					guiTimer2 = 0;
					if(global.glSelect8 < ds_list_size(storage) - 1)
					{
						global.glSelect8 ++;
						if(tempVar2 < 4)tempVar2 ++;
					}
					else
					{
						global.glSelect8 = 0;
						tempVar2 = 0;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect8 >= ds_list_size(storage) - 1 && global.downKey_state > 20)global.lockKeys = 1;
				}
			}
			draw_set_font(ft_large);
			draw_set_halign(fa_left);
			var item = ds_list_find_value(storage, global.glSelect8);
			if(guiTimer2 >= 90)
			{
				var txt = DescriptionString(item);
					
				xScroll -= 2;
				if(xScroll < - 48 - string_width(txt))xScroll = -2;
			} else guiTimer2 ++;
			draw_set_font(ft_med);
			if(global.Akey_state == 1 && global.glSelect6 == 3)
			{
				var item = ds_list_find_value(storage, global.glSelect8);
				var stack = ds_list_find_value(storagestacks, global.glSelect8);
				
				if(tempVar9 == -1)
				{
					var usable = false;
					if(global.ITEM[item, 3] == 4)usable = true;

					var subtype = global.ITEM[item, 4];
					if(subtype != 6)
					{
						usable = false;
					}
					if(usable == true)
					{
						audio_play_sound(sfx_select, 0, 0);
						tempVar9 = item;
						//add item to recipee
					}
					else
					{
						audio_play_sound(sfx_error, 0, 0);

					}
				}
				else
				{
					//enchant
					if(stack > 1)
					{
						//ds_list_delete(storage, global.glSelect8);
						ds_list_delete(storagestacks, global.glSelect8);
						ds_list_insert(storagestacks, global.glSelect8, stack - 1);
					}
					else
					{
						ds_list_delete(storage, global.glSelect8);
						ds_list_delete(storagestacks, global.glSelect8);
					}
					
					tempVar = 1;
					tempVar3 = 1;
					gamestate = "orb_interact";
					obj_mysticorb.react = 10;
				
					var weapon = ds_list_find_value(global.CHAR[global.OWchar, 49], global.glSelect7);
					var copy = 200 + global.nCustom;
					replacement = 0;
					for(var i = 200; i < 200 + global.nCustom; i ++)
					{
						if(global.ITEM[i, 0] = "error")
						{
							copy = i;
							replacement = 1;
							break;
						}
					}
				
					if(weapon >= 200)
					{
						copy = weapon;
						replacement = 1;
					}else CopyItem(weapon, copy);
				
					ds_list_delete(global.CHAR[global.OWchar, 49], global.glSelect7);
					ds_list_insert(global.CHAR[global.OWchar, 49], global.glSelect7, copy);
					
					DiscardItem(global.OWchar, global.glSelect7);
				
					global.ITEM[copy, 5] += global.ITEM[item, 5];
					
					global.ITEM[copy, 22] = global.ITEM[item, 22];
					
					/*
					if(global.ITEM[copy, 31] == 0)
					{
						if(global.ITEM[copy, 30] == 0)global.ITEM[copy, 0] += "(e)";
						else
						{
							global.ITEM[copy, 0] = string_delete(global.ITEM[copy, 0], string_length(global.ITEM[copy, 0]) - global.ITEM[copy, 30], global.ITEM[copy, 30] + 1);
							global.ITEM[copy, 0] += "e";
							for(var i = 0; i < global.ITEM[copy, 30]; i ++)
							{
								global.ITEM[copy, 0] += "+";
							}
							global.ITEM[copy, 0] += ")";
						}
					}
					*/
					
					global.ITEM[copy, 31] ++;

				
					if(replacement == 0)global.nCustom ++;
				
				
					//dismantle
					tempVar = 1;
					tempVar3 = 1;
					gamestate = "events";
					guiTimer = 0;
					guiTimer2 = 0;
					obj_mysticorb.react = 10;
				
					ds_list_add(global.itemDrops, copy);
				
					tempVar11 = -1;
					tempVar10 = 0;
				
					audio_play_sound(sfx_dismantle1, 0, 0);
					audio_play_sound(sfx_dismantle2, 0, 0);
					audio_play_sound(sfx_dismantle3, 0, 0);
					exit;
				}
			}
			if(global.Akey_state == 1 && global.glSelect6 == 4)
			{
				if(ds_list_size(reList) < 9)
				{
					var item = ds_list_find_value(storage, global.glSelect8);
					var stack = ds_list_find_value(storagestacks, global.glSelect8);
				
					var usable = false;
					if(global.ITEM[item, 3] == 4)usable = true;
				
					var subtype = global.ITEM[item, 4];
					if(subtype == 6)usable = false;
				
					if(usable)
					{
						ds_list_add(reList, item);
					
						if(stack > 1)
						{
							//ds_list_delete(storage, global.glSelect8);
							ds_list_delete(storagestacks, global.glSelect8);
							ds_list_insert(storagestacks, global.glSelect8, stack - 1);
						}
						else
						{
							ds_list_delete(storage, global.glSelect8);
							ds_list_delete(storagestacks, global.glSelect8);
						
							if(global.glSelect8 >= ds_list_size(storage) && global.glSelect8 > 0)global.glSelect8 --;
						}
					
						audio_play_sound(sfx_select, 0, 0);
					} else audio_play_sound(sfx_error, 0, 0);
				}  else audio_play_sound(sfx_error, 0, 0);
			}
			if(global.startKey_state == 1 && global.glSelect6 == 4)
			{
				//makeitem
				var iList = ds_list_create();
				var newItem = 0;
				
				var design = -1;
				for(var i = 0; i < ds_list_size(reList); i ++)
				{
					var item = ds_list_find_value(reList, i);
					if(global.ITEM[item, 3] == 4 && global.ITEM[item, 4] >= 10)
					{
						design = global.ITEM[item, 4];

						var storagestacks = global.resourceBoxAm;
						var index = ds_list_find_index(global.resourceBox, item);
						var amount = ds_list_find_value(global.resourceBoxAm, index);
						if(index != undefined && amount != undefined)
						{
							ds_list_delete(storagestacks, index);
							ds_list_insert(storagestacks, index, amount + 1);
						}
						else
						{
							ds_list_add(global.resourceBox, item);
							ds_list_add(global.resourceBoxAm, 1);
						}
						//ds_list_delete(reList, i);
				
						audio_play_sound(sfx_back, 0, 0);
					}
				}
				for(var i = 0; i < ds_list_size(reList); i ++)
				{
					var item = ds_list_find_value(reList, i);
					if(global.ITEM[item, 3] == 4 && global.ITEM[item, 4] >= 10)
					{
						ds_list_delete(reList, i);
					}
				}
				for(var i = 0; i < global.nItems + 1; i ++)
				{
					var canCraft = 1;
					var usedResources = 0;
					for(var ii = 0; ii < 2; ii ++)
					{
						if(global.ITEM[i, 23 + ii] != -1)
						{
							var amount = global.ITEM[i, 28 + ii];
							var has = 0;
							for(var j = 0; j < ds_list_size(reList); j ++)
							{
								if(global.ITEM[i, 23 + ii] == ds_list_find_value(reList, j))has ++;
							}
							if(has != amount)canCraft = 0; else usedResources = 1;
						}
					}
					for(var ii = 3; ii < 5; ii ++)
					{
						if(global.ITEM[i, 23 + ii] != -1)
						{
							var amount = 1;
							var has = 0;
							for(var j = 0; j < ds_list_size(reList); j ++)
							{
								if(global.ITEM[i, 23 + ii] == ds_list_find_value(reList, j))has ++;
							}
							if(has != amount)canCraft = 0; else usedResources = 1;
						}
					}
					for(var ii = 0; ii < ds_list_size(reList); ii ++)
					{
						var resource = ds_list_find_value(reList, ii);
						for(var j = 0; j < 5; j ++)
						{
							if(global.ITEM[ii, 23 + j] != resource && global.ITEM[ii, 23 + j] != -1)
							{
								canCraft = 0;
							}
						}
					}

					if(global.ITEM[i, 4] >= 10 && global.ITEM[i, 4] <= 14 && global.ITEM[i, 4] != design)canCraft = 0;
					if(canCraft && usedResources)ds_list_add(iList, i);
				}
				
				if(ds_list_size(iList) > 0)
				{
					ds_list_shuffle(iList);
					var itemCraft = ds_list_find_value(iList, 0);

					newItem = itemCraft;
				}
				else
				{
					var copy = 0;
					var weaponstring = "";
					var replacement = 0;
					if(design != -1)
					{
						//PHYSICAL WEAPONS
						//randomize item
						
						var sprite = 0; //0 = bronze, 1 = iron, 2 = steel, 3 = silver
						var maxcount = 0; 
						var itempower = 0;
						var amb = 100;
						var itemaccuracy = 100;
						var itemuses = 50;
						var cost = 0;
						for(var i = 0; i < 6; i ++)
						{
							var count = 0;
							for(var ii = 0; ii < ds_list_size(reList); ii ++)
							{
								var resource = ds_list_find_value(reList, ii);
								if(resource == 38 + i)
								{
									if(count > 0 && count < 5)amb *= 1 - count * .2;
									itempower += round(((i + 1.5) * 1.5) * (amb / 100));
									if(count < 2)itemuses -= i * 3.35;
									count ++;
									
									itemaccuracy -= i * 2.5;
								}
							}
							if(count >= maxcount && count > 0)
							{
								sprite = i;
								maxcount = count;
							}
						}
						
						var ingotType = sprite;
						var ingotAmount = 0;
						
						for(var ii = 0; ii < ds_list_size(reList); ii ++)
						{
							var resource = ds_list_find_value(reList, ii);
							if(resource == ingotType + 38)ingotAmount ++;
						}

						if(itempower > 0)
						{
							var topamount = 0;
							var critpower = 0;
							////////////crit
							var amount = 0;
							var mo = 100;
							for(var ii = 0; ii < ds_list_size(reList); ii ++)
							{
								if(ds_list_find_value(reList, ii) == 44)
								{
									critpower += 15 * (mo / 100);
									if(amount < 3)mo *= 1 - amount * 0.3;
									amount ++;
								}
							}
							
							cost += critpower * 25;
								
							if(amount >= topamount && amount > 0)
							{
								if(floor(random(101)) < 50)sprite = 10;
								topamount = amount;
							}
							
							var magicpower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 48)
								{
									magicpower += 25 - count * 5;
									if(magicpower > 100)magicpower = 100;
									if(floor(random(101)) < 50)sprite = 11;
									if(count < 4)count ++;
								}
							}
							
							cost += magicpower * 10;
							
							var healpower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 49)
								{
									healpower += 8 - count * 2;
									if(healpower > 30)healpower = 30;
									if(floor(random(101)) < 50)sprite = 12;
									if(count < 3)count ++;
								}
							}
							
							cost += healpower * 30;
							////////////////
						
							itemaccuracy = round(itemaccuracy);
							
							copy = 200 + global.nCustom;
							replacement = 0;
							for(var i = 200; i < 200 + global.nCustom; i ++)
							{
								if(global.ITEM[i, 0] = "error")
								{
									copy = i;
									replacement = 1;
									break;
								}
							}
						
							switch(design)
							{
								case 10:
								
								CopyItem(16, copy);
								if(sprite == 0)global.ITEM[copy, 1] = 16;
								if(sprite == 1)global.ITEM[copy, 1] = 24;
								if(sprite == 2)global.ITEM[copy, 1] = 1;
								if(sprite == 3)global.ITEM[copy, 1] = 40;
								if(sprite == 4)global.ITEM[copy, 1] = 98;
								if(sprite == 5)global.ITEM[copy, 1] = 102;
								if(sprite == 10)global.ITEM[copy, 1] = 5;
								if(sprite == 11)global.ITEM[copy, 1] = 90;
								if(sprite == 12)global.ITEM[copy, 1] = 86;
								global.ITEM[copy, 10] = round(itempower * 1);
								global.ITEM[copy, 11] = round(itemaccuracy * 1);
								global.ITEM[copy, 2] = round(itemuses * 1);
								weaponstring = "Sword";
						
								break;
								case 11:
						
								CopyItem(17, copy);
								if(sprite == 0)global.ITEM[copy, 1] = 17;
								if(sprite == 1)global.ITEM[copy, 1] = 25;
								if(sprite == 2)global.ITEM[copy, 1] = 12;
								if(sprite == 3)global.ITEM[copy, 1] = 41;
								if(sprite == 4)global.ITEM[copy, 1] = 99;
								if(sprite == 5)global.ITEM[copy, 1] = 103;
								if(sprite == 10)global.ITEM[copy, 1] = 29;
								if(sprite == 11)global.ITEM[copy, 1] = 91;
								if(sprite == 12)global.ITEM[copy, 1] = 87;
								global.ITEM[copy, 10] = round(itempower * 1.1);
								global.ITEM[copy, 11] = round(itemaccuracy * .91);
								global.ITEM[copy, 2] = round(itemuses * 1);
								weaponstring = "Lance";
						
								break;
								case 12:
						
								CopyItem(18, copy);
								if(sprite == 0)global.ITEM[copy, 1] = 18;
								if(sprite == 1)global.ITEM[copy, 1] = 23;
								if(sprite == 2)global.ITEM[copy, 1] = 11;
								if(sprite == 3)global.ITEM[copy, 1] = 42;
								if(sprite == 4)global.ITEM[copy, 1] = 100;
								if(sprite == 5)global.ITEM[copy, 1] = 104;
								if(sprite == 10)global.ITEM[copy, 1] = 30;
								if(sprite == 11)global.ITEM[copy, 1] = 92;
								if(sprite == 12)global.ITEM[copy, 1] = 88;
								global.ITEM[copy, 10] = round(itempower * 1.2);
								global.ITEM[copy, 11] = round(itemaccuracy * 0.84);
								global.ITEM[copy, 2] = round(itemuses * 1);
								weaponstring = "Axe";
						
								break;
								case 13:
						
								CopyItem(13, copy);
								if(sprite == 4)global.ITEM[copy, 1] = 142; else
								if(sprite == 5)global.ITEM[copy, 1] = 143; else
								if(sprite == 0)global.ITEM[copy, 1] = 38; else global.ITEM[copy, 1] = 13;
								global.ITEM[copy, 10] = round(itempower * .65);
								global.ITEM[copy, 11] = round(itemaccuracy * 1);
								global.ITEM[copy, 2] = round(itemuses * 1);
								weaponstring = "Dagger";
						
								break;
								case 14:
						
								CopyItem(19, copy);
								if(sprite == 0)global.ITEM[copy, 1] = 19;
								if(sprite == 1)global.ITEM[copy, 1] = 14;
								if(sprite == 2)global.ITEM[copy, 1] = 69;
								if(sprite == 3)global.ITEM[copy, 1] = 43;
								if(sprite == 4)global.ITEM[copy, 1] = 101;
								if(sprite == 5)global.ITEM[copy, 1] = 105;
								if(sprite == 10)global.ITEM[copy, 1] = 2;
								if(sprite == 11)global.ITEM[copy, 1] = 93;
								if(sprite == 12)global.ITEM[copy, 1] = 89;
								global.ITEM[copy, 10] = round(itempower * 1);
								global.ITEM[copy, 11] = round(itemaccuracy * .89);
								global.ITEM[copy, 2] = round(itemuses * 1);
								weaponstring = "Bow";
						
								break;
							}
							global.ITEM[copy, 12] = round(critpower);
							
							global.ITEM[copy, 23] = -1;
							global.ITEM[copy, 24] = -1;
							global.ITEM[copy, 23] = 38 + ingotType;
							global.ITEM[copy, 28] = floor(ingotAmount / 2);
							global.ITEM[copy, 29] = floor(ingotAmount / 2);
							if(critpower > 15)global.ITEM[copy, 23] = 44;
							if(magicpower > 15)global.ITEM[copy, 24] = 48;
							if(healpower > 15 && global.ITEM[copy, 23] == -1)global.ITEM[copy, 23] = 49;
							else if(healpower > 15 && global.ITEM[copy, 24] == -1)global.ITEM[copy, 24] = 49;
							
							if(magicpower > 0)
							{
								global.ITEM[copy, 22] = 26;
								global.ITEM[copy, 33] = magicpower;
							}
							if(healpower > 0)
							{
								global.ITEM[copy, 22] = 27;
								global.ITEM[copy, 33] = healpower;
							}
							
							//dusts
							var randomness = 0, sorb = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 45)
								{
									global.ITEM[copy, 32] = 2;
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 0.55);
									cost += 300;
									if(floor(random(101)) < 50)
									{
										if(design == 10)global.ITEM[copy, 1] = 90;
										if(design == 11)global.ITEM[copy, 1] = 91;
										if(design == 12)global.ITEM[copy, 1] = 92;
										if(design == 14)global.ITEM[copy, 1] = 93;
									}
								}
								if(item == 46)
								{
									if(global.ITEM[copy, 18] == -1)
									{
										global.ITEM[copy, 18] = 3;
										cost += 200;
										if(floor(random(101)) < 50)
										{
											if(design == 10)global.ITEM[copy, 1] = 74;
											if(design == 11)global.ITEM[copy, 1] = 75;
											if(design == 12)global.ITEM[copy, 1] = 76;
											if(design == 14)global.ITEM[copy, 1] = 77;
										}
									}
									else if(global.ITEM[copy, 19] == -1)
									{
										global.ITEM[copy, 19] = 3;
										cost += 200;
										if(floor(random(101)) < 50)
										{
											if(design == 10)global.ITEM[copy, 1] = 74;
											if(design == 11)global.ITEM[copy, 1] = 75;
											if(design == 12)global.ITEM[copy, 1] = 76;
											if(design == 14)global.ITEM[copy, 1] = 77;
										}
									}
								}
								if(item == 47)
								{
									if(global.ITEM[copy, 18] == -1)
									{
										global.ITEM[copy, 18] = 4;
										cost += 200;
										if(floor(random(101)) < 50)
										{
											if(design == 10)global.ITEM[copy, 1] = 82;
											if(design == 11)global.ITEM[copy, 1] = 83;
											if(design == 12)global.ITEM[copy, 1] = 84;
											if(design == 14)global.ITEM[copy, 1] = 85;
										}
									}
									else if(global.ITEM[copy, 19] == -1)
									{
										global.ITEM[copy, 19] = 4;
										cost += 200;
										if(floor(random(101)) < 50)
										{
											if(design == 10)global.ITEM[copy, 1] = 82;
											if(design == 11)global.ITEM[copy, 1] = 83;
											if(design == 12)global.ITEM[copy, 1] = 84;
											if(design == 14)global.ITEM[copy, 1] = 85;
										}
									}
								}
								if(item == 60)
								{
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.2);
									if(floor(random(101)) < 50)
									{
										if(design == 10)global.ITEM[copy, 1] = 94;
										if(design == 11)global.ITEM[copy, 1] = 95;
										if(design == 12)global.ITEM[copy, 1] = 96;
										if(design == 14)global.ITEM[copy, 1] = 97;
									}
								}
								if(item == 75)
								{
									randomness ++;
								}
								if(item == 50)
								{
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.13);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
								}
								if(item == 51)
								{
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * 1.08);
								}
								if(item == 52)
								{
									global.ITEM[copy, 12] += 15;
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
									cost += 250;
								}
								if(item == 53)
								{
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
									global.ITEM[copy, 2] = round(global.ITEM[copy, 2] * 1.13);
								}
								if(item == 59 && sorb == 0 && design == 14)
								{
									if(global.ITEM[copy, 8] > 1)global.ITEM[copy, 8] ++;
									
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .7);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .9);
									
									sorb = 1;
								}
							}
							
							//randomize
							var mv = (global.ITEM[copy, 10] * (0.15 + randomness * 0.15))
							global.ITEM[copy, 10] = round(global.ITEM[copy, 10] + irandom_range(-mv, mv));
							
							mv = 5 + randomness * 5;
							global.ITEM[copy, 11] = round(global.ITEM[copy, 11] + irandom_range(-mv, mv));
							if(global.ITEM[copy, 11] > 100)global.ITEM[copy, 11] = 100;
							
							mv = (global.ITEM[copy, 12] * (0.15 + randomness * 0.15));
							global.ITEM[copy, 12] = round(global.ITEM[copy, 12] + irandom_range(-mv, mv));
							
							mv = (global.ITEM[copy, 2] * (0.15 + randomness * 0.15));
							global.ITEM[copy, 2] = round(global.ITEM[copy, 2] + irandom_range(-mv, mv));
							
							if(global.ITEM[copy, 2] < 1)global.ITEM[copy, 2] = 1;
							
							cost += global.ITEM[copy, 10] * 100;
							global.ITEM[copy, 5] = cost * 0.6;
							global.ITEM[copy, 5] = round(global.ITEM[copy, 5] * (global.ITEM[copy, 11] / 100));
							global.ITEM[copy, 20] = floor(cost / 400);
							if(global.ITEM[copy, 20] > 5)global.ITEM[copy, 20] = 5;
						}
						else
						{
							//oops
							copy = 74;
						}
					}
					else
					{
						weaponstring = "Tome";
						var sprite = 0; //0 = bronze, 1 = iron, 2 = steel, 3 = silver
						var maxcount = 0; 
						var itempower = 0;
						var amb = 100;
						var itemaccuracy = 100;
						var itemuses = 50;
						var cost = 0;
						
						var maxcount = 0;
						var counttype = 0;
						for(var i = 0; i < ds_list_size(reList); i ++)
						{
							var count = 0;
							var resource = ds_list_find_value(reList, i);
							if((resource >= 54 && resource <= 58) || resource == 67)
							{
								if(count > 4 && count < 8)amb *= 1 - count * .2;
								itempower += round(2 * (amb / 100));
								if(itemuses > 20)itemuses -= count * 5;
								count ++;
							}
							if(count >= maxcount)
							{
								maxcount = count;
								counttype = resource;
								if(resource == 54)sprite = 3;
								if(resource == 55)sprite = 118;
								if(resource == 56)sprite = 113;
								if(resource == 57)sprite = 113;
								if(resource == 58)sprite = 108;
								if(resource == 67)sprite = 123;
							}
						}

						if(itempower > 0)
						{
							var topamount = 0;
							var critpower = 0;
							////////////crit
							var amount = 0;
							var mo = 100;
							for(var ii = 0; ii < ds_list_size(reList); ii ++)
							{
								if(ds_list_find_value(reList, ii) == 44)
								{
									critpower += 15 * (mo / 100);
									if(amount < 3)mo *= 1 - amount * 0.3;
									amount ++;
								}
							}
							
							cost += critpower * 25;
								
							if(amount >= topamount && amount > 0)
							{
								//if(floor(random(101)) < 50)sprite = 10;
								topamount = amount;
							}
							
							var magicpower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 48)
								{
									magicpower += 25 - count * 5;
									if(magicpower > 100)magicpower = 100;
									//if(floor(random(101)) < 50)sprite = 11;
									if(count < 4)count ++;
								}
							}
							
							cost += magicpower * 10;
							
							var healpower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 49)
								{
									healpower += 8 - count * 2;
									if(healpower > 30)healpower = 30;
									//if(floor(random(101)) < 50)sprite = 12;
									if(count < 3)count ++;
								}
							}
							
							cost += healpower * 30;
							////////////////
						
							copy = 200 + global.nCustom;
							replacement = 0;
							for(var i = 200; i < 200 + global.nCustom; i ++)
							{
								if(global.ITEM[i, 0] = "error")
								{
									copy = i;
									replacement = 1;
									break;
								}
							}
							CopyItem(34, copy);
							itemaccuracy = round(itemaccuracy);
							switch(sprite)
							{
								case 3:
						
									global.ITEM[copy, 1] = sprite;
								
									CopyItem(3, copy);
									global.ITEM[copy, 10] = round(itempower * 1);
									global.ITEM[copy, 11] = round(itemaccuracy * 0.95);
									global.ITEM[copy, 2] = round(itemuses * 1.2);
						
								break;
								case 118:
						
									var ind = sprite + floor(random(4));
								
									CopyItem(88 + ind - sprite, copy);
								
									global.ITEM[copy, 1] = ind;
								
									global.ITEM[copy, 10] = round(itempower * 1.2);
									global.ITEM[copy, 11] = round(itemaccuracy * 0.95);
									global.ITEM[copy, 2] = round(itemuses * 0.8);
									critpower += itempower;
						
								break;
								case 113:
								
									var ind = sprite + floor(random(4));
						
									CopyItem(83 + ind - sprite, copy);
								
									global.ITEM[copy, 1] = ind;
								
									global.ITEM[copy, 10] = round(itempower * 0.9);
									global.ITEM[copy, 11] = round(itemaccuracy * 1.05);
									global.ITEM[copy, 2] = round(itemuses * 1);
									
									global.ITEM[copy, 18] = 1;
						
								break;

								case 108:
								
									var ind = sprite + floor(random(4));
									
									if(ind == 108)CopyItem(34, copy);
									if(ind == 109)CopyItem(76, copy);
									if(ind == 110)CopyItem(35, copy);
									if(ind == 111)CopyItem(77, copy);
									if(ind == 112)CopyItem(78, copy);
								
									global.ITEM[copy, 10] = round(itempower * 1.2);
									global.ITEM[copy, 11] = round(itemaccuracy * 0.95);
									global.ITEM[copy, 2] = round(itemuses);
						
								break;
								case 123:
								
									var ind = sprite + floor(random(4));
								
									if(ind == 123)CopyItem(32, copy);
									if(ind == 124)CopyItem(79, copy);
									if(ind == 125)CopyItem(80, copy);
									if(ind == 126)CopyItem(81, copy);
									if(ind == 127)CopyItem(82, copy);
									
									
	
								
									global.ITEM[copy, 10] = round(itempower * 1.2);
									global.ITEM[copy, 11] = round(itemaccuracy * 0.95);
									global.ITEM[copy, 2] = round(itemuses);
								
								break;
							}
							global.ITEM[copy, 12] = round(critpower);
							
							global.ITEM[copy, 24] = -1;
							global.ITEM[copy, 23] = resource;
							global.ITEM[copy, 28] = floor(itempower / 6);
							if(critpower > 15)global.ITEM[copy, 23] = 44;
							if(magicpower > 15)global.ITEM[copy, 24] = 48;
							if(healpower > 15 && global.ITEM[copy, 23] == -1)global.ITEM[copy, 23] = 49;
							else if(healpower > 15 && global.ITEM[copy, 24] == -1)global.ITEM[copy, 24] = 49;
							
							if(magicpower > 0)
							{
								global.ITEM[copy, 22] = 26;
								global.ITEM[copy, 33] = magicpower;
							}
							if(healpower > 0)
							{
								global.ITEM[copy, 22] = 27;
								global.ITEM[copy, 33] = healpower;
							}
							
							//dusts
							var randomness = 0, sorb = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var item = ds_list_find_value(reList, i);
								if(item == 45)
								{
									global.ITEM[copy, 32] = 2;
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 0.55);
									cost += 300;
								}
								if(item == 46)
								{
									if(global.ITEM[copy, 18] == -1)
									{
										global.ITEM[copy, 18] = 3;
										cost += 200;
									}
									else if(global.ITEM[copy, 19] == -1)
									{
										global.ITEM[copy, 19] = 3;
										cost += 200;

									}
								}
								if(item == 47)
								{
									if(global.ITEM[copy, 18] == -1)
									{
										global.ITEM[copy, 18] = 4;
										cost += 200;
									}
									else if(global.ITEM[copy, 19] == -1)
									{
										global.ITEM[copy, 19] = 4;
										cost += 200;
									}
								}
								if(item == 60)
								{
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.2);

								}
								if(item == 75)
								{
									randomness ++;
								}
								if(item == 50)
								{
									global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.13);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
								}
								if(item == 51)
								{
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * 1.08);
								}
								if(item == 52)
								{
									global.ITEM[copy, 12] += 15;
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
									cost += 250;
								}
								if(item == 53)
								{
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
									global.ITEM[copy, 2] = round(global.ITEM[copy, 2] * 1.13);
								}
								if(item == 59 && sorb == 0)
								{
									if(global.ITEM[copy, 8] > 1)global.ITEM[copy, 8] ++;
									
									global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .7);
									global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .9);
									
									sorb = 1;
								}
								
							}
							
							//randomize
							var mv = (global.ITEM[copy, 10] * (0.15 + randomness * 0.15))
							global.ITEM[copy, 10] = round(global.ITEM[copy, 10] + irandom_range(-mv, mv));
							
							mv = 5 + randomness * 5;
							global.ITEM[copy, 11] = round(global.ITEM[copy, 11] + irandom_range(-mv, mv));
							if(global.ITEM[copy, 11] > 100)global.ITEM[copy, 11] = 100;
							
							mv = (global.ITEM[copy, 12] * (0.15 + randomness * 0.15));
							global.ITEM[copy, 12] = round(global.ITEM[copy, 12] + irandom_range(-mv, mv));
							
							mv = (global.ITEM[copy, 2] * (0.15 + randomness * 0.15));
							global.ITEM[copy, 2] = round(global.ITEM[copy, 2] + irandom_range(-mv, mv));
							
							if(global.ITEM[copy, 2] < 1)global.ITEM[copy, 2] = 1;
							
							cost += global.ITEM[copy, 10] * 100;
							global.ITEM[copy, 5] = cost * 0.6;
							global.ITEM[copy, 5] = round(global.ITEM[copy, 5] * (global.ITEM[copy, 11] / 100));
							global.ITEM[copy, 20] = floor(cost / 430);
							if(global.ITEM[copy, 20] > 5)global.ITEM[copy, 20] = 5;
						
						
						//tome
					}
					else
					{
						
						weaponstring = "Staff";
						
						var sprite = 0; //0 = bronze, 1 = iron, 2 = steel, 3 = silver
						var maxcount = 0; 
						var itempower = 0;
						var amb = 100;
						var itemuses = 30;
						var cost = 0;
						for(var i = 0; i < 6; i ++)
						{
							var count = 0;
							for(var ii = 0; ii < ds_list_size(reList); ii ++)
							{
								var resource = ds_list_find_value(reList, ii);
								if(resource == 38 + i)
								{
									if(count > 0 && count < 5)amb *= 1 - count * .2;
									itempower += round(((i + 2) * 2) * (amb / 100));
									if(count < 2)itemuses -= i * 2;
									count ++;
								}
							}
							if(count >= maxcount && count > 0)
							{
								sprite = 128 + i;
								maxcount = count;
								ingotType = i;
							}
						}
						
						var checklast = 0;
						if(itempower > 0)
						{
						
							var healpower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var resource = ds_list_find_value(reList, i);
								if(resource == 66)
								{
									var sum = 5 - count * 0.8;
									if(sum < 1)sum = 1;
									healpower += sum;
									count ++;
								}
							}
							copy = 200 + global.nCustom;
							replacement = 0;
							for(var i = 200; i < 200 + global.nCustom; i ++)
							{
								if(global.ITEM[i, 0] = "error")
								{
									copy = i;
									replacement = 1;
									break;
								}
							}
							if(healpower > 0)
							{
								var totalpower = (itempower + healpower) * 0.75;
								
								CopyItem(4, copy);
								
								global.ITEM[copy, 1] = sprite;
								
								global.ITEM[copy, 10] = round(totalpower);
								global.ITEM[copy, 2] = round(itemuses);
								
								global.ITEM[copy, 24] = 66;
								global.ITEM[copy, 23] = 38 + ingotType;
								global.ITEM[copy, 28] = 2;
								global.ITEM[copy, 29] = floor(totalpower / 7);
								
								var randomness = 0, mend = 0, sight = 0;
								for(var ii = 0; ii < ds_list_size(reList); ii ++)
								{
									var resource = ds_list_find_value(reList, ii);
									if(resource == 75)
									{
										randomness ++;
									}
									if(sight == 0 && resource == 59)
									{
										sight = 1;
										global.ITEM[copy, 8] ++;
										global.ITEM[copy, 10] = round(global.ITEM[copy, 10] * 0.68);
									}
									if(mend == 0 && resource == 97)
									{
										mend = 1;
										global.ITEM[copy, 8] --;
										global.ITEM[copy, 10] = round(global.ITEM[copy, 10] * 1.7);
									}
								}
								
								var mv = (global.ITEM[copy, 10] * (0.15 + randomness * 0.15))
								global.ITEM[copy, 10] = round(global.ITEM[copy, 10] + irandom_range(-mv, mv));
							
								mv = (global.ITEM[copy, 2] * (0.15 + randomness * 0.15));
								global.ITEM[copy, 2] = round(global.ITEM[copy, 2] + irandom_range(-mv, mv));
							
								if(global.ITEM[copy, 2] < 1)global.ITEM[copy, 2] = 1;
							
								var cost = totalpower * 50;
								global.ITEM[copy, 20] = floor(cost / 430);
								if(global.ITEM[copy, 20] > 5)global.ITEM[copy, 20] = 5;
								
								checklast = 2;
							} else checklast = 1;
						} else checklast = 1;
						
						//craftstone
						if(checklast == 1)
						{
							var itempower = 0, count = 0;
							for(var i = 0; i < ds_list_size(reList); i ++)
							{
								var resource = ds_list_find_value(reList, i);
								if(resource == 101)itempower += 1 * ((5 - count) / 5);
								if(count < 5)count ++;
							}
							
							if(itempower > 0)
							{
								var topamount = 0;
								var critpower = 0;
								////////////crit
								var amount = 0;
								var mo = 100;
								for(var ii = 0; ii < ds_list_size(reList); ii ++)
								{
									if(ds_list_find_value(reList, ii) == 44)
									{
										critpower += 15 * (mo / 100);
										if(amount < 3)mo *= 1 - amount * 0.3;
										amount ++;
									}
								}
							
								cost += critpower * 25;
								
								if(amount >= topamount && amount > 0)
								{
									//if(floor(random(101)) < 50)sprite = 10;
									topamount = amount;
								}
							
								var magicpower = 0, count = 0;
								for(var i = 0; i < ds_list_size(reList); i ++)
								{
									var item = ds_list_find_value(reList, i);
									if(item == 48)
									{
										magicpower += 25 - count * 5;
										if(magicpower > 100)magicpower = 100;
										//if(floor(random(101)) < 50)sprite = 11;
										if(count < 4)count ++;
									}
								}
							
								cost += magicpower * 10;
							
								var healpower = 0, count = 0;
								for(var i = 0; i < ds_list_size(reList); i ++)
								{
									var item = ds_list_find_value(reList, i);
									if(item == 49)
									{
										healpower += 8 - count * 2;
										if(healpower > 30)healpower = 30;
										//if(floor(random(101)) < 50)sprite = 12;
										if(count < 3)count ++;
									}
								}
								
								
								var type = choose(26, 27, 28);
								copy = 200 + global.nCustom;
								replacement = 0;
								for(var i = 200; i < 200 + global.nCustom; i ++)
								{
									if(global.ITEM[i, 0] = "error")
									{
										copy = i;
										replacement = 1;
										break;
									}
								}
								CopyItem(type, copy);
								weaponstring = "Stone";
								
								global.ITEM[copy, 10] = round((4 * itempower) * 1.15);
								global.ITEM[copy, 11] = round(100  - global.ITEM[copy, 10]);
								global.ITEM[copy, 2] = 50;
								
								global.ITEM[copy, 12] = round(critpower);
							
								if(magicpower > 0)
								{
									global.ITEM[copy, 22] = 26;
									global.ITEM[copy, 33] = magicpower;
								}
								if(healpower > 0)
								{
									global.ITEM[copy, 22] = 27;
									global.ITEM[copy, 33] = healpower;
								}
								
								global.ITEM[copy, 24] = -1;
								global.ITEM[copy, 23] = 101;
								global.ITEM[copy, 28] = 2;
								global.ITEM[copy, 29] = 2;
								if(critpower > 15)global.ITEM[copy, 23] = 44;
								if(magicpower > 15)global.ITEM[copy, 24] = 48;
								if(healpower > 15 && global.ITEM[copy, 23] == -1)global.ITEM[copy, 23] = 49;
								else if(healpower > 15 && global.ITEM[copy, 24] == -1)global.ITEM[copy, 24] = 49;
							
								//dusts
								var randomness = 0, sorb = 0;
								for(var i = 0; i < ds_list_size(reList); i ++)
								{
									var item = ds_list_find_value(reList, i);
									if(item == 45)
									{
										global.ITEM[copy, 32] = 2;
										global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 0.55);
										cost += 300;
									}
									if(item == 46)
									{
										if(global.ITEM[copy, 18] == -1)
										{
											global.ITEM[copy, 18] = 3;
											cost += 200;
										}
										else if(global.ITEM[copy, 19] == -1)
										{
											global.ITEM[copy, 19] = 3;
											cost += 200;

										}
									}
									if(item == 47)
									{
										if(global.ITEM[copy, 18] == -1)
										{
											global.ITEM[copy, 18] = 4;
											cost += 200;
										}
										else if(global.ITEM[copy, 19] == -1)
										{
											global.ITEM[copy, 19] = 4;
											cost += 200;
										}
									}
									if(item == 60)
									{
										global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.2);

									}
									if(item == 75)
									{
										randomness ++;
									}
									if(item == 50)
									{
										global.ITEM[copy, 10] = ceil(global.ITEM[copy, 10] * 1.13);
										global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
									}
									if(item == 51)
									{
										global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
										global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * 1.08);
									}
									if(item == 52)
									{
										global.ITEM[copy, 12] += 15;
										global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .925);
										cost += 250;
									}
									if(item == 53)
									{
										global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .93);
										global.ITEM[copy, 2] = round(global.ITEM[copy, 2] * 1.13);
									}
									if(item == 59 && sorb == 0)
									{
										if(global.ITEM[copy, 8] > 1)global.ITEM[copy, 8] ++;
									
										global.ITEM[copy, 10] = floor(global.ITEM[copy, 10] * .7);
										global.ITEM[copy, 11] = round(global.ITEM[copy, 11] * .9);
									
										sorb = 1;
									}
								
								}
							
								//randomize
								var mv = (global.ITEM[copy, 10] * (0.15 + randomness * 0.15))
								global.ITEM[copy, 10] = round(global.ITEM[copy, 10] + irandom_range(-mv, mv));
							
								mv = 5 + randomness * 5;
								global.ITEM[copy, 11] = round(global.ITEM[copy, 11] + irandom_range(-mv, mv));
								if(global.ITEM[copy, 11] > 100)global.ITEM[copy, 11] = 100;
							
								mv = (global.ITEM[copy, 12] * (0.15 + randomness * 0.15));
								global.ITEM[copy, 12] = round(global.ITEM[copy, 12] + irandom_range(-mv, mv));
							
								mv = (global.ITEM[copy, 2] * (0.15 + randomness * 0.15));
								global.ITEM[copy, 2] = round(global.ITEM[copy, 2] + irandom_range(-mv, mv));
							
								if(global.ITEM[copy, 2] < 1)global.ITEM[copy, 2] = 1;
							
								cost += global.ITEM[copy, 10] * 100;
								global.ITEM[copy, 5] = cost * 0.6;
								global.ITEM[copy, 5] = round(global.ITEM[copy, 5] * (global.ITEM[copy, 11] / 100));
								global.ITEM[copy, 20] = floor(cost / 430);
								if(global.ITEM[copy, 20] > 5)global.ITEM[copy, 20] = 5;
								global.ITEM[copy, 5] = round(global.ITEM[copy, 5] * 1.5);
								
							} else copy = 74;
						} else if(checklast != 2)copy = 74;
						
						//heal
					}
					}
					if(copy <= 0)copy = 74;
					if(copy != 74)
					{
							//PICK NAME
						var read = choose("fnames", "mnames");
						var file = file_text_open_read(working_directory + "\\" + read + ".txt");
						var str = "";
				
						var rpos = floor(random(1001));
						while (rpos > 0)
						{
							str = file_text_read_string(file);
							file_text_readln(file);
							rpos --;
						}
					
						global.ITEM[copy, 0] = str + "'s " + weaponstring;
						global.ITEM[copy, 17] = "A crafted weapon."
					
						if(replacement == 0)global.nCustom ++;
					}
					newItem = copy;
				}
				
				
				ds_list_destroy(iList);
				ds_list_destroy(reList);
				
				//dismantle
				tempVar = 1;
				tempVar3 = 1;
				gamestate = "events";
				guiTimer = 0;
				guiTimer2 = 0;
				obj_mysticorb.react = 10;
				
				ds_list_add(global.itemDrops, newItem);
				
				tempVar11 = -1;
				tempVar10 = 0;
				
				audio_play_sound(sfx_dismantle1, 0, 0);
				audio_play_sound(sfx_dismantle2, 0, 0);
				audio_play_sound(sfx_dismantle3, 0, 0);
				exit;
			}
		}

		if(global.Bkey_state == 1)
		{
			if(global.glSelect6 < 3)
			{
				global.glSelect8 = 0;
				tempVar10 = 0;
				tempVar11 = -1;
				tempVar9 = -1;
				audio_play_sound(sfx_back, 0, 0);
			}
			if(global.glSelect6 == 3)
			{
				if(tempVar9 != -1)
				{
					tempVar9 = -1;
					audio_play_sound(sfx_back, 0, 0);
				}
				else
				{
				global.glSelect8 = 0;
				tempVar10 = 0;
				tempVar11 = -1;
				tempVar9 = -1;
				audio_play_sound(sfx_back, 0, 0);
				}
			}
			if(global.glSelect6 == 4)
			{
				var item = ds_list_find_value(reList, ds_list_size(reList) - 1);
				if(item != undefined)
				{
					var storagestacks = global.resourceBoxAm;
					var index = ds_list_find_index(global.resourceBox, item);
					var amount = ds_list_find_value(global.resourceBoxAm, index);
					if(amount > 0)
					{
						//ds_list_delete(storage, global.glSelect8);
						ds_list_delete(storagestacks, index);
						ds_list_insert(storagestacks, index, amount + 1);
					}
					else
					{
						ds_list_add(global.resourceBox, item);
						ds_list_add(global.resourceBoxAm, 1);
					}
					ds_list_delete(reList, ds_list_size(reList) - 1);
				
					audio_play_sound(sfx_back, 0, 0);
				}
				else
				{
					tempVar10 = 0;
					tempVar = 1;
					tempVar3 = 1;
					tempVar11 = -1;
					gamestate = "orb_interact";
					ds_list_destroy(reList);
				
					audio_play_sound(sfx_back, 0, 0);
				}
			}
		}
	}
	
	break;
	case "chest_interact":
	
	if(tempVar > 0)tempVar -= 1 / 5;
	
	var storage = global.resourceBox;
	var storagestacks = global.resourceBoxAm;
	if(ds_list_size(storage) > 1)
	{
		if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
		{
			if(global.glSelect4 > 0)
			{
				global.glSelect4 --;
				if(tempVar2 > 1)tempVar2 --;
			}
			else
			{
				global.glSelect4 = ds_list_size(storage) - 1;
				tempVar2 = 4;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect4 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
		{
			if(global.glSelect4 < ds_list_size(storage) - 1)
			{
				global.glSelect4 ++;
				if(tempVar2 < 4)tempVar2 ++;
			}
			else
			{
				global.glSelect4 = 0;
				tempVar2 = 0;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect4 >= ds_list_size(storage) - 1 && global.downKey_state > 20)global.lockKeys = 1;
		}
	}
			
	if(global.Bkey_state == 1)
	{
		obj_campUnit.state = "idle";
		gamestate = "idle";
		tempVar = 1;
		audio_play_sound(sfx_back, 0, 0);
		global.glSelect4 = 0;
		exit;
	}
	
	break;
	case "orb_interact":
	
	if(tempVar > 0)tempVar -= 1 / 5;
	
	if(global.glSelect3 == 0)
	{
		//host main
		var total = 5;
		var limit = 0;
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect4 > limit)
				{
					global.glSelect4 --;
					if(tempVar4 > 1)tempVar4 --;
				}
				else
				{
					global.glSelect4 = total - 1;
					tempVar4 = 4;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect4 <= limit)global.lockKeys = 1;
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect4 < total - 1)
				{
					global.glSelect4 ++;
					if(tempVar4 < 3)tempVar4 ++;
				}
				else
				{
					global.glSelect4 = limit;
					tempVar4 = 0;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect4 >= total - 1)global.lockKeys = 1;
			}
		}
		if(global.Akey_state == 1)
		{
			tempVar8 = 0;
			gamestate = "orb_options";
			tempVar = 1;
			guiTimer2 = 0;
			xScroll = 0;
			tempVar3 = 1;
			tempVar11 = -1;
			tempVar10 = 0;
			tempVar9 = -1;
			tempVar2 = 0;
			global.glSelect6 = global.glSelect4;
			if(global.glSelect6 == 4)
			{
				tempVar10 = -2;
				tempVar11 = -2;
				reList = ds_list_create();
			}
			global.glSelect7 = 0;
			global.glSelect8 = 0;
			audio_play_sound(sfx_select, 0, 0);

			exit;
		}
	}
	if(global.glSelect3 == 2)
	{
		if(tempVar3 > 0)tempVar3 -= 1 / 5;
		if(tempVar3 <= 0)tempVar3 = 0;
		if(global.controlsType > 0)
		{
			if(global.rightKey_state == 1)
			{
				if(global.glSelect5 == 1)global.glSelect5 = 2; else global.glSelect5 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(global.glSelect5 == 2)global.glSelect5 = 1; else global.glSelect5 = 2;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}

		if(global.Akey_state == 1)
		{
			if(global.glSelect5 == 1)
			{
				//press yes
				
				gamestate = "idle";
				tempVar = 1;
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect4 = 0;
			}
			else
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect3 = 0;
				global.glSelect4 = 0;
			}
		}
		if(global.Bkey_state == 1)
		{
			audio_play_sound(sfx_back, 0, 0);
			global.glSelect3 = 0;
			global.glSelect4 = 0;
			global.glSelect = 0;
			exit;
		}
	}
	else
	if(global.Bkey_state == 1)
	{
		obj_campUnit.state = "idle";
		gamestate = "idle";
		tempVar = 1;
		audio_play_sound(sfx_back, 0, 0);
		global.glSelect4 = 0;
		global.glSelect = 0;
		exit;
	}
	
	break;
	case "sandyjail_interact":
	
	if(tempVar > 0)tempVar -= 1 / 5;
	
	if(global.glSelect3 == 0)
	{
		//host main
		var total = 2;
		var limit = 0;
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect4 > limit)
				{
					global.glSelect4 --;
					if(tempVar4 > 1)tempVar4 --;
				}
				else
				{
					global.glSelect4 = total - 1;
					tempVar4 = 4;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect4 <= limit)global.lockKeys = 1;
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect4 < total - 1)
				{
					global.glSelect4 ++;
					if(tempVar4 < 3)tempVar4 ++;
				}
				else
				{
					global.glSelect4 = limit;
					tempVar4 = 0;
				}
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect4 >= total - 1)global.lockKeys = 1;
			}
		}
		if(global.Akey_state == 1)
		{
			switch(global.glSelect4)
			{
				case 0:
					
					//recruit
					gamestate = "idle";
					tempVar = 1;
					audio_play_sound(sfx_select, 0, 0);
					global.glSelect4 = 0;
					Recruit(obj_campUnit.target.characterID);
					//obj_campUnit.target = noone;
					
				break;
					
				case 1:
						
					//let free
					//gamestate = "idle";
					tempVar = 1;
					tempVar3 = 1;
					audio_play_sound(sfx_select, 0, 0);
					global.glSelect3 = 2;
					global.glSelect5 = 2;
					
				break;
			}

			exit;
		}
	}
	if(global.glSelect3 == 2)
	{
		if(tempVar3 > 0)tempVar3 -= 1 / 5;
		if(tempVar3 <= 0)tempVar3 = 0;
		if(global.controlsType > 0)
		{
			if(global.rightKey_state == 1)
			{
				if(global.glSelect5 == 1)global.glSelect5 = 2; else global.glSelect5 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.leftKey_state == 1)
			{
				if(global.glSelect5 == 2)global.glSelect5 = 1; else global.glSelect5 = 2;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}

		if(global.Akey_state == 1)
		{
			if(global.glSelect5 == 1)
			{
				with(obj_prisonerTalk)
				{
					if(char == obj_campUnit.target)instance_destroy();
				}
				global.CHAR[obj_campUnit.target.characterID, 0] = "error";
				
				obj_campUnit.target.free = 1;
				obj_campUnit.target = noone;
				obj_campUnit.state = "idle";
				
				gamestate = "idle";
				tempVar = 1;
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect4 = 0;
			}
			else
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect3 = 0;
				global.glSelect4 = 0;
			}
		}
		if(global.Bkey_state == 1)
		{
			audio_play_sound(sfx_back, 0, 0);
			global.glSelect3 = 0;
			global.glSelect4 = 0;
			exit;
		}
	}
	else
	if(global.Bkey_state == 1)
	{
		obj_campUnit.state = "idle";
		gamestate = "idle";
		tempVar = 1;
		audio_play_sound(sfx_back, 0, 0);
		global.glSelect4 = 0;
		obj_campUnit.target = noone;
		exit;
	}
	
	break;
	case "mapunlock":
	
	tempVar11 = ds_list_find_value(global.mapUnlock, 0);
	
	if(tempVar11 != undefined)
	{
		tempVar10 = 60;
		guiTimer5 = 0;
		gamestate = "mapwait";
	}
	else
	{
		gamestate = "map";
	}
	
	break;
	case "mapwait":
	

	if(tempVar5 > 0)tempVar5 --;
	
	tempVar10 --;
	if(tempVar10 > 20)guiTimer5 += 6 * ((60 - tempVar10) / 40);
	if(tempVar10 <= 20)guiTimer5 -= 4 * ((20 - tempVar10) / 20);
	//show_message(tempVar9);
	if(tempVar10 == 20)audio_play_sound(sfx_newMap, 0, 0);
	if(tempVar10 <= 0)
	{
		global.MAP[tempVar11, 8] = true;
		ds_list_delete(global.mapUnlock, 0);
		gamestate = "mapunlock";
	}
	
	break;
	case "map":
	
	if(tempVar5 > 0)tempVar5 --;
	
	if(ds_list_size(global.mapUnlock) > 0)
	{
		gamestate = "mapunlock";
	}
	
	SwitchOW();
	
	if(tempVar4 > 1)
	{
		tempVar4 --;
		if(tempVar4 == 1)
		{
			tempVar7 = 0;
			tempVar8 = 0;
			//tempVar13 = global.glSelect6;
			var map = ds_list_find_value(global.REGION[global.currentRegion, 2], tempVar13);
			if(global.MAP[map, 10] == 0)
			{
				StopMus();
				
				global.currentScene = global.MAP[map, 9];
				state = "nextscene";
			}
			
			if(global.MAP[map, 10] == 1)
			{
				StopMus();
				
				global.lastStage = global.MAP[map, 9];
				global.currentScene = global.STAGE[global.MAP[map, 9], 3];
				state = "nextscene";
			}
			if(global.MAP[map, 10] == 2)
			{
				global.currentMap = map;
				
				PlayMus(mus_anna);
				
				ResetDialogue();
				
				SetLeftCharacter(global.MAP[global.currentMap, 9]);

				Dialogue(global.MAP[global.currentMap, 9], "Welcome! Thanks for stopping by!");
		
				DialogueStart(0, -1, 0);
				
				alarm[2] = 30;
				
				gamestate = "shop";
				
				tempVar4 = 45;
				global.glSelect = 0;
				global.gradientAlpha = 1;
				tempVar = 1;
				showMap = false;
			}
			if(global.MAP[map, 10] == 3)
			{
				gamestate = "startcamp";
				goTo = map;
				showMap = false;
			}
			
			if(global.MAP[map, 10] == 4)
			{
				PlayMus(mus_wii);
				
				ResetDialogue();
				
				SetLeftCharacter(global.MAP[map, 9]);

				//Dialogue(global.MAP[tempVar3, 9], "Hellooooooo!!! buy and sell units here! ♥");
				Dialogue(global.MAP[map, 9], "Buy and sell units here!");
				DialogueStart(0, -1, 0);
				
				alarm[2] = 30;
				
				//tempVar3 = global.glSelect6;
				gamestate = "unitshop";
				tempVar4 = 45;
				tempVar8 = 0;
				global.glSelect = 0;
				global.gradientAlpha = 1;
				tempVar = 1;
				showMap = false;
				
				unitList = ds_list_create();
				ds_list_add(unitList, 0);
				ds_list_add(unitList, 6);
				ds_list_add(unitList, 7);
				ds_list_add(unitList, 8);
				ds_list_add(unitList, 9);
				ds_list_add(unitList, 10);
				ds_list_add(unitList, 12);
				ds_list_add(unitList, 13);
				ds_list_add(unitList, 14);
				ds_list_add(unitList, 17);
				ds_list_add(unitList, 22);
				ds_list_add(unitList, 26);
				ds_list_add(unitList, 28);
				ds_list_add(unitList, 30);
				ds_list_add(unitList, 32);
				ds_list_add(unitList, 33);
				ds_list_add(unitList, 34);
				ds_list_add(unitList, 35);
			}
			
			if(global.MAP[map, 10] == 5)
			{
				global.MAP[map, 11] = choose(0, 0, 1, 1, 2, 2, 3, 3, 4);
				global.MAP[map, 12] = choose(0, 2, 4);
				//global.MAP[tempVar3, 11] = 4;
				switch(global.MAP[map, 11])
				{
					case 0:
						global.MAP[map, 3] = choose(4, 5);
						global.MAP[map, 4] = choose(0, 3);
						global.MAP[map, 11] = 0;
					break;
					case 1:
						global.MAP[map, 3] = choose(8, 9);
						global.MAP[map, 4] = choose(2, 2, 3, 4);
						global.MAP[map, 11] = 1;
					break;
					case 2:
						global.MAP[map, 3] = choose(6, 7);
						global.MAP[map, 4] = choose(5, 6);
						global.MAP[map, 11] = 0;
					break;
					case 3:
						global.MAP[map, 3] = choose(10, 15);
						global.MAP[map, 4] = 3;
						global.MAP[map, 12] = choose(1, 3);
						global.MAP[map, 11] = 0;
					break;
					case 4:
						global.MAP[map, 3] = 17;
						global.MAP[map, 4] = 1;
						global.MAP[map, 12] = 3;
						global.MAP[map, 11] = 2;
					break;
				}
				global.MAP[map, 5] = 20 + floor(random(80));
				
				StopMus();
				
				global.lastStage = global.MAP[map, 9];
				global.currentScene = global.STAGE[global.MAP[map, 9], 3];
				state = "nextscene";
			}
			if(global.MAP[map, 10] == 6)
			{
				global.MAP[map, 5] = 20 + floor(random(80));
				
				StopMus();
				
				global.lastStage = global.MAP[map, 9];
				global.currentScene = global.STAGE[global.MAP[map, 9], 3];
				state = "nextscene";
			}
			exit;
		}
	}
	
	if(tempVar4 == 0)
	{
		if(global.controlsType > 0)
		{
			var xdis = 0;
			var ydis = 0;
			if(global.rightKey_state == 1)xdis = 24;
			if(global.leftKey_state == 1)xdis = -24;
			if(global.upKey_state == 1)ydis = -24;
			if(global.downKey_state == 1)ydis = 24;
		
			if(xdis != 0 || ydis != 0)
			{
				var closest = ds_priority_create();
				for(var i = 0; i < ds_list_size(global.REGION[global.currentRegion, 2]); i ++)
				{
					var val = 0;
				
					var map = ds_list_find_value(global.REGION[global.currentRegion, 2], i);
					var smap = ds_list_find_value(global.REGION[global.currentRegion, 2], tempVar13);
					val = point_distance(global.MAP[map, 6], global.MAP[map, 7], global.MAP[smap, 6] + xdis, global.MAP[smap, 7] + ydis);
				
					if(tempVar13 != i && global.MAP[map, 8] == true)ds_priority_add(closest, i, val);
				}
				var mi = -1;
			
				if(ds_priority_size(closest) > 0)
				{
					mi = ds_priority_delete_min(closest);
					audio_play_sound(sfx_scroll, 0, 0);
				
					tempVar13 = mi;
					obj_mapCamera.xTo = global.MAP[map, 6];
					obj_mapCamera.yTo = global.MAP[map, 7];
				}
				ds_priority_destroy(closest);
			}
		
			if(global.Akey_state == 1)
			{
				//var map = ds_list_find_value(global.REGION[global.currentRegion, 2], tempVar13);
			
				audio_play_sound(sfx_start, 0, 0);
				
				tempVar4 = 45;
			}
		}
	}
	
	if(global.Xkey_state == 1)
	{
		global.glSelect = 0;
		gamestate = "preparationmain";
		laststate = "preparationmain";
		CheckSupports();
		audio_play_sound(sfx_showOptions, 0, 0);
	}
	if(global.Ykey_state == 1)
	{
		global.showOptions = 7;

		tempVar5 = gamestate;
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
	
	break;
	case "unitshop":
	
		tcindex = 0;
		tindex += 0.1;
		if(tindex >= 4)tindex = 0;
	
		if(tempVar > 0)tempVar -= 1 / 8;
		if(tempVar < 0)tempVar = 0;
		
		if(tempVar4 > 0)tempVar4 --;
		
		if(global.globalOptions == 0)
		{
			var nOptions = 2;
			if(ds_list_size(global.charList) > 0)
			{
				if(global.downKey_state == 1)
				{
					if(global.glSelect < nOptions - 1)global.glSelect ++; else global.glSelect = 0;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.upKey_state == 1)
				{
					if(global.glSelect > 0)global.glSelect --; else global.glSelect = nOptions - 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			} else global.glSelect = 0;

			if(global.Akey_state == 1)
			{
				if(global.glSelect == 0)
				{
					global.globalOptions = 2;
					global.glSelect2 = 0;
					global.glSelect3 = 0;
					global.glSelect6 = 0;
					audio_play_sound(sfx_select, 0, 0);
					tempVar = 1;
					tempVar2 = 0;
					state = "hide";
					
					for(var i = 0; i < 50; i ++)
					{
						if(global.CHAR[i, 52] == true)
						{
							tempVar5 = i;
							break;
						}
					}
					ResetChar(tempVar5);
					global.CHAR[tempVar5, 0] = "";
					global.CHAR[tempVar5, 2] = 1;
					global.CHAR[tempVar5, 4] = 1;
					global.CHAR[tempVar5, 3] = 0;
					global.CHAR[tempVar5, 37] = 0;
					global.CHAR[tempVar5, 38] = make_color_rgb(48, 48, 48);
					global.CHAR[tempVar5, 39] = make_color_rgb(48, 48, 48);
					
					tempVar10 = 900;
					
					tempVar6 = 40;
					
					tempVar7 = floor(tempVar10 + ((0.06 * tempVar6 * tempVar6 * ((40 + tempVar6) / 100) * 60 + ((global.CHAR[tempVar5, 4] + 10) * (global.CHAR[tempVar5, 4] * 200) + global.CHAR[tempVar5, 4] * (global.CHAR[tempVar5, 4] * 150))) * 0.22));
					
					
					//if(global.CHAR[tempVar5, 3] == 11)tempVar7 += 2500;
					text = "" // current text
					caret = 0 // caret position
					keyboard_string = "";
				
					CharListOrder();
					exit;
				}
				if(global.glSelect == 1)
				{
					global.globalOptions = 1;
					global.glSelect2 = 0;
					global.glSelect3 = 0;
					audio_play_sound(sfx_select, 0, 0);
					tempVar = 1;
					tempVar2 = 0;
					state = "hide";
				
					CharListOrder();
				}
				
				exit;
			}
			if(global.Bkey_state == 1)
			{
				//ResetDialogue();
				PlayMus(mus_map);
				
				gamestate = "map";
				tempVar5 = 45;
				tempVar4 = 0;
				showMap = true;
				global.glSelect = 0;
				
				tempVar = 1;
				audio_play_sound(sfx_back, 0, 0);
				state = "hide";
				
				ds_list_destroy(unitList);
				exit;
			}
		}
		if(global.globalOptions == 1)
		{
			var tchar = ds_list_find_value(global.charList, global.glSelect2);
			if(global.glSelect3 == 0)
			{
				var nOptions = ds_list_size(global.charList);
				if(global.Akey_state == 1)
				{
					if(tchar > 1)
					{
						global.glSelect3 = 2;
						audio_play_sound(sfx_select, 0, 0);
					}
					else audio_play_sound(sfx_error, 0, 0);
				}
				if(global.Bkey_state == 1)
				{
					state = "show";
				
					global.globalOptions = 0;
		
					audio_play_sound(sfx_back, 0, 0);
					exit;
				}
				if(ds_list_size(global.charList) > 1)
				{
					if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
					{
						if(global.glSelect2 < nOptions - 1)
						{
							global.glSelect2 ++;
							if(tempVar2 < 5)tempVar2 ++;
						}
						else
						{
							global.glSelect2 = 0;
							tempVar2 = 0
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect2 >= nOptions - 1 && global.downKey_state > 20)global.lockKeys = 1;
					}
					if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
					{
						if(global.glSelect2 > 0)
						{
							global.glSelect2 --;
							if(tempVar2 > 1)tempVar2 --;
						}
						else
						{
							global.glSelect2 = nOptions - 1;
							tempVar2 = 5;
						}
						audio_play_sound(sfx_scroll, 0, 0);
						if(global.glSelect2 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
					}
				}
			}
			else
			{
				var nOptions = 3;
				if(global.leftKey_state == 1)
				{
					if(global.glSelect3 > 1)
					{
						global.glSelect3 --;
					}else
					{
						global.glSelect3 = nOptions - 1;
					}
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.rightKey_state == 1)
				{
					if(global.glSelect3 < nOptions - 1)
					{
						global.glSelect3 ++;
					}else
					{
						global.glSelect3 = 1;
					}
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.Akey_state == 1)
				{
					if(global.glSelect3 == 1)
					{
						//sell unit
						var lvlmult = 0.5 * (global.CHAR[tchar, 4] * 100 + (global.CHAR[tchar, 4] * global.CHAR[tchar, 4]) * 10);
					
						var sum = 0;
						for(var i = 14; i < 22; i ++)
						{
							sum += global.CHAR[tchar, i];
						}
						price = floor(250 + lvlmult + 1.7 * (sum * ((200 + sum) / 200)));
						
						global.gold += price;
						
						DeleteCharacter(tchar);
						
						if(global.glSelect2 > 0 && global.glSelect2 >= ds_list_size(global.charList))
						{
							global.glSelect2 --;
						}
						
						audio_play_sound(sfx_buy, 0, 0);
						
						if(ds_list_size(global.charList) <= 0)
						{
							state = "show";
				
							global.globalOptions = 0;
		
							audio_play_sound(sfx_back, 0, 0);
							global.glSelect3 = 0;
							exit;
						}
					} else audio_play_sound(sfx_back, 0, 0);
					
					global.glSelect3 = 0;
					
					exit;
				}
				if(global.Bkey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect3 = 0;
					exit;
				}
			}
		}
		if(global.globalOptions == 2)
		{
			//creationstep
			if(global.glSelect6 == 0)
			{
				if(global.Bkey_state == 1 && global.glSelect2 > 0)
				{
					state = "show";
				
					global.globalOptions = 0;
		
					audio_play_sound(sfx_back, 0, 0);
					exit;
				}
				if(global.Akey_state == 1 && global.glSelect2 == 2)
				{
					if(global.gold >= tempVar7 && string_length(global.CHAR[tempVar5, 0]) > 0)
					{
						//buybuy
						BuyUnit();
						CharListOrder();
						global.gold -= tempVar7;
						audio_play_sound(sfx_buy, 0, 0);
						
						state = "show";
				
						global.globalOptions = 0;
						text = "" // current text
						caret = 0 // caret position
						keyboard_string = "";
					}
					else
					{
						audio_play_sound(sfx_error, 0, 0);
					}
					exit;
				}
				if(global.leftKey_state == 1 && global.glSelect2 == 1)
				{
					global.glSelect2 = 0;
					audio_play_sound(sfx_scroll, 0, 0);
					keyboard_string = "";
					exit;
				}
				if(global.leftKey_state == 1 && global.glSelect2 == 2)
				{
					global.glSelect2 = 1;
					audio_play_sound(sfx_scroll, 0, 0);
					exit;
				}
				if(global.rightKey_state == 1 && global.glSelect2 == 0)
				{
					global.glSelect2 = 1;
					audio_play_sound(sfx_scroll, 0, 0);
					//tempVar8 = string_copy(keyboard_string, 1, 10);
					exit;
				}
				if(global.rightKey_state == 1 && global.glSelect2 == 1)
				{
					global.glSelect2 = 2;
					audio_play_sound(sfx_scroll, 0, 0);
					exit;
				}
				if(global.glSelect2 == 0)
				{
					global.CHAR[tempVar5, 0] = TextInputNoMove(10);
				}
			}
			if(global.glSelect6 == 1)
			{
				var nOptions = 0;
				var limit = 0;
				
				tempVar7 = floor(tempVar10 + ((0.06 * tempVar6 * tempVar6 * ((40 + tempVar6) / 100) * 60 + ((global.CHAR[tempVar5, 4] + 10) * (global.CHAR[tempVar5, 4] * 200) + global.CHAR[tempVar5, 4] * (global.CHAR[tempVar5, 4] * 150))) * 0.22));
				//if(global.CHAR[tempVar5, 3] == 11)tempVar7 += 2500;
				
				switch(global.glSelect3)
				{
					case 0:
					nOptions = ds_list_size(unitList);
					break;
					case 1:
					nOptions = 21;
					limit = 1;
					break;
					case 2:
					nOptions = 101;
					limit = 0;
					break;
				}
				if(global.leftKey_state == 1 || (global.leftKey_state mod 3 == 0 && global.leftKey_state > 15))
				{
					switch(global.glSelect3)
					{
						case 0:
							if(tempVar8 > limit)tempVar8 --; else tempVar8 = nOptions - 1;
						break;
						case 1:
							if(global.CHAR[tempVar5, 4] > limit)global.CHAR[tempVar5, 4] --; else global.CHAR[tempVar5, 4] = nOptions - 1;
						break;
						case 2:
							if(tempVar6 > limit)tempVar6 --; else tempVar6 = nOptions - 1;
						break;
					}
					
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.rightKey_state == 1 || (global.rightKey_state mod 3 == 0 && global.rightKey_state > 15))
				{
					switch(global.glSelect3)
					{
						case 0:
							if(tempVar8 < nOptions - 1)tempVar8 ++; else tempVar8 = limit;
						break;
						case 1:
							if(global.CHAR[tempVar5, 4] < nOptions - 1)global.CHAR[tempVar5, 4] ++; else global.CHAR[tempVar5, 4] = limit;
						break;
						case 2:
							if(tempVar6 < nOptions - 1)tempVar6 ++; else tempVar6 = limit;
						break;
					}
					audio_play_sound(sfx_scroll, 0, 0);
				}
				global.CHAR[tempVar5, 3] = ds_list_find_value(unitList, tempVar8);
			}
			if(global.glSelect2 == 1 && global.glSelect6 = 0)
			{
				var nOptions = 4;
				if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
				{
					if(global.glSelect3 < nOptions - 1)global.glSelect3 ++; else global.glSelect3 = 0;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect3 >= nOptions - 1)global.lockKeys = 1;
				}
				if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
				{
					if(global.glSelect3 > 0)global.glSelect3 --; else global.glSelect3 = nOptions - 1;
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect3 <= 0)global.lockKeys = 1;
				}
				
				if(global.Akey_state == 1)
				{
					if(global.glSelect3 < 3)
					{
						global.glSelect6 = 1;
						audio_play_sound(sfx_select, 0, 0);
					}
					else
					{
						
						tempVar10 += 10;
						tempVar7 += 10;
						global.CHAR[tempVar5, 43] = -1;
						global.CHAR[tempVar5, 2] = choose(0, 1);
						
						if(global.CHAR[tempVar5, 2] == 0)
						{
							global.CHAR[tempVar5, 1] = choose(16, 17, 18, 19, 40, 41);
							
						} else
						{
							global.CHAR[tempVar5, 1] = choose(14, 15, 0, 2, 20, 5, 35, 37, 38, 39, 42, 43, 44);
						}
						
						switch(global.CHAR[tempVar5, 1])
						{
							case 16:
								global.CHAR[tempVar5, 37] = 8;
								break;
							case 17:
								global.CHAR[tempVar5, 37] = 6;
								break;
							case 18:
								global.CHAR[tempVar5, 37] = 8;
								break;
							case 19:
								global.CHAR[tempVar5, 37] = 7;
								break;
							case 40:
								global.CHAR[tempVar5, 37] = 6;
								break;
							case 41:
								global.CHAR[tempVar5, 37] = 20;
								break;
								
								
							case 14:
								global.CHAR[tempVar5, 37] = 16;
								break;
							case 15:
								global.CHAR[tempVar5, 37] = 5;
								break;
							case 0:
								global.CHAR[tempVar5, 37] = 5;
								break;
							case 2:
								global.CHAR[tempVar5, 37] = 3;
								break;
							case 5:
								global.CHAR[tempVar5, 37] = 4;
								break;
							case 20:
								global.CHAR[tempVar5, 37] = 9;
								break;
							case 35:
								global.CHAR[tempVar5, 37] = 11;
								global.CHAR[tempVar5, 43] = 1;
								break;
							case 37:
								global.CHAR[tempVar5, 37] = 15;
								break;
							case 38:
								global.CHAR[tempVar5, 37] = 14;
								global.CHAR[tempVar5, 43] = 2;
								break;
							case 39:
								global.CHAR[tempVar5, 37] = 0;
								break;
							case 42:
								global.CHAR[tempVar5, 37] = 18;
								global.CHAR[tempVar5, 43] = 3;
								break;
							case 43:
								global.CHAR[tempVar5, 37] = 17;
								break;
							case 44:
								global.CHAR[tempVar5, 37] = 19;
								global.CHAR[tempVar5, 43] = 4;
								break;
						}
						
						//make_color_hsv(random(255), random(180), random(255));  
						global.CHAR[tempVar5, 38] = make_color_rgb(30 + random(200), 30 + random(200), 30 + random(200));
						global.CHAR[tempVar5, 39] = make_color_rgb(random(140), random(140), random(140));
						
						audio_play_sound(sfx_select, 0, 0);
					}
					
					exit;
				}
			}
			if(global.glSelect6 == 1)
			{
				if(global.Bkey_state == 1 || global.Akey_state == 1)
				{
					global.glSelect6 = 0;
					audio_play_sound(sfx_back, 0, 0);
					exit;
				}
			}
		}
		break;
	case "shop":
	
		var shopkeeper = global.MAP[global.currentMap, 9];
		tcindex = 0;
		tindex += 0.1;
		if(tindex >= 4)tindex = 0;
	
		if(tempVar > 0)tempVar -= 1 / 8;
		if(tempVar < 0)tempVar = 0;
		
		if(tempVar4 > 0)tempVar4 --;
		
		if(global.globalOptions == 0)
		{
			var nOptions = 2;
			if(global.downKey_state == 1)
			{
				if(global.glSelect < nOptions - 1)global.glSelect ++; else global.glSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.upKey_state == 1)
			{
				if(global.glSelect > 0)global.glSelect --; else global.glSelect = nOptions - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.Akey_state == 1)
			{
				selling = global.glSelect;
				global.globalOptions = 1;
				global.glSelect2 = 0;
				audio_play_sound(sfx_select, 0, 0);
				tempVar = 1;
				tempVar2 = 0;
				state = "hide";
				
				CharListOrder();
				
				exit;
			}
			if(global.Bkey_state == 1)
			{
				//ResetDialogue();
				PlayMus(mus_map);
				
				gamestate = "map";
				tempVar5 = 45;
				tempVar4 = 0;
				tempVar3 = 0;
				showMap = true;
				global.glSelect = 0;
				tempVar = 1;
				audio_play_sound(sfx_back, 0, 0);
				state = "hide";
			}
		}
		if(global.globalOptions == 1)
		{
			var nOptions = ds_list_size(global.charList) + 1;
			if(selling == 1)nOptions ++;
			if(ds_list_size(global.charList) > 0)
			{
				if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
				{
					guiTimer2 = 0;
					if(global.glSelect2 < nOptions - 1)
					{
						global.glSelect2 ++;
						if(tempVar2 < 5)tempVar2 ++;
					}
					else
					{
						global.glSelect2 = 0;
						tempVar2 = 0
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect2 >= nOptions - 1 && global.downKey_state > 20)global.lockKeys = 1;
				}
				if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
				{
					guiTimer2 = 0;
					if(global.glSelect2 > 0)
					{
						global.glSelect2 --;
						if(tempVar2 > 1)tempVar2 --;
					}
					else
					{
						global.glSelect2 = nOptions - 1;
						tempVar2 = 5;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect2 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
				}
			}
			var tchar = ds_list_find_value(global.charList, global.glSelect2), inventory;
			if(tchar != undefined)inventory = global.CHAR[tchar, 49];
			if(global.glSelect2 == ds_list_size(global.charList))
			{
				inventory = global.CHAR[100, 49];
				tchar = 100;
			}
			if(global.glSelect2 > ds_list_size(global.charList))
			{
				inventory = global.resourceBox;
				tchar = 1000;
			}
			if(global.Akey_state == 1)
			{
				if(ds_list_size(inventory) > 0 || selling == 0)
				{
					if(tchar == 100)global.glSelect2 = 100;
					if(tchar == 1000)global.glSelect2 = 1000;
					global.globalOptions = 2;
					global.glSelect = 0
					global.glSelect3 = 0;
					global.glSelect4 = 0;
					tempVar2 = 0;
					guiTimer2 = 0;
					xScroll = 0;
					if(selling && tchar != 1000)
					{
						var uses = global.CHAR[tchar, 50];
						ds_list_clear(itemList);
						ds_list_clear(nup);
						ds_list_clear(nupVal);
						
						for(var i = 0; i < ds_list_size(inventory); i ++)
						{
							var item = ds_list_find_value(inventory, i);
							var itemuses = ds_list_find_value(uses, i);
							var amount = 0;
							var canAdd = 1;
							for(var a = 0; a < ds_list_size(itemList); a ++)
							{
								if(item == ds_list_find_value(itemList, a) && itemuses == ds_list_find_value(nupVal, a))
								{
									canAdd = 0;
								}
							}
							if(canAdd)
							{
								for(var ii = 0; ii < ds_list_size(inventory); ii ++)
								{
									if(item == ds_list_find_value(inventory, ii) && itemuses == ds_list_find_value(uses, ii))
									{
										amount ++;
									}
								}
								ds_list_add(itemList, item);
								ds_list_add(nup, amount);
								ds_list_add(nupVal, itemuses);
								//show_message(itemuses);
							}
						}
					}
				
					audio_play_sound(sfx_select, 0, 0);
					exit;
				}
				else
				{
					audio_play_sound(sfx_error, 0, 0);
					exit;
				}
			}
			if(global.Bkey_state == 1)
			{
				state = "show";
				
				global.globalOptions = 0;
		
				audio_play_sound(sfx_back, 0, 0);
				exit;
			}
		}
		if(global.globalOptions == 2)
		{
			var stock, inventory, prices, uses, price = -1, use;
			var tchar = ds_list_find_value(global.charList, global.glSelect2);
			if(global.glSelect2 == 100)tchar = 100;
			if(global.glSelect2 == 1000)tchar = 1000;
			if(tchar != 1000)
			{
				uses = global.CHAR[tchar, 50];
				if(selling == 0)
				{
					var stock = global.CHAR[shopkeeper, 50];
					var inventory = global.CHAR[shopkeeper, 49];
					var prices = global.CHAR[shopkeeper, 48];
				}
				else
				{
					inventory = global.CHAR[tchar, 49];
				}
			}
			else
			{
				uses = global.resourceBoxAm;
				inventory = global.resourceBox;
			}
			
			if(global.glSelect != -1)
			{
				var item = ds_list_find_value(inventory, global.glSelect);
				if(item != -1 && item != undefined)
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
			}
			
			if(global.glSelect3 == 0)
			{
				var nOptions = ds_list_size(inventory);
				if(selling && tchar != 1000)nOptions = ds_list_size(itemList);
				if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
				{
					guiTimer2 = 0;
					xScroll = 0;
					if(global.glSelect < nOptions - 1)
					{
						global.glSelect ++;
						if(tempVar2 < 4)tempVar2 ++;
					}else
					{
						global.glSelect = 0;
						tempVar2 = 0;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect >= nOptions - 1 && global.downKey_state > 20)global.lockKeys = 1;
				}
				if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
				{
					guiTimer2 = 0;
					xScroll = 0;
					if(global.glSelect > 0)
					{
						global.glSelect --;
						if(tempVar2 > 1)tempVar2 --;
					}else
					{
						global.glSelect = nOptions - 1;
						tempVar2 = 4;
					}
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect <= 0 && global.upKey_state > 20)global.lockKeys = 1;
				}
				if(global.Akey_state == 1)
				{
					if(selling == 0)
					{
						if(global.gold >= ds_list_find_value(prices, global.glSelect))
						{
							global.glSelect3 = 2;
							audio_play_sound(sfx_select, 0, 0);
						} else audio_play_sound(sfx_error, 0, 0);
					}else
					{
						if(tchar != 1000)
						{
							use = ds_list_find_value(nupVal, global.glSelect);
							price = floor((global.ITEM[ds_list_find_value(itemList, global.glSelect), 5] / 2) * (use / global.ITEM[ds_list_find_value(itemList, global.glSelect), 2]));
							if(price > 0)
							{
								global.glSelect3 = 2;
								audio_play_sound(sfx_select, 0, 0);
							} else audio_play_sound(sfx_error, 0, 0);
						}
						else
						{
							price = floor((global.ITEM[ds_list_find_value(inventory, global.glSelect), 5] / 2));
							if(price > 0)
							{
								global.glSelect3 = 2;
								audio_play_sound(sfx_select, 0, 0);
							} else audio_play_sound(sfx_error, 0, 0);
						}
					}
					exit;
				}
				if(global.Bkey_state == 1)
				{
					tempVar2 = median(0, ds_list_size(global.charList) - 1, 5);
					ds_list_clear(itemList);
					ds_list_clear(nup);
					ds_list_clear(nupVal);
					audio_play_sound(sfx_back, 0, 0);
					global.globalOptions = 1;
					global.glSelect = 0;
					if(global.glSelect2 == 100)global.glSelect2 = ds_list_size(global.charList);
					if(global.glSelect2 == 1000)global.glSelect2 = ds_list_size(global.charList) + 1;
					exit;
				}
			}
			else
			{
				var nOptions = 3;
				if(global.leftKey_state == 1)
				{
					if(global.glSelect3 > 1)
					{
						global.glSelect3 --;
					}else
					{
						global.glSelect3 = nOptions - 1;
					}
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.rightKey_state == 1)
				{
					if(global.glSelect3 < nOptions - 1)
					{
						global.glSelect3 ++;
					}else
					{
						global.glSelect3 = 1;
					}
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.Akey_state == 1)
				{
					tempVar2 = 0;
					if(selling == 0)
					{
						//buyitemmm
						var prices = global.CHAR[shopkeeper, 48];
						if(global.glSelect3 == 1)
						{
							audio_play_sound(sfx_buy, 0, 0);
							//audio_play_sound(sfx_select, 0, 0);
						
							stock = global.CHAR[shopkeeper, 50];
							inventory = global.CHAR[shopkeeper, 49];
						
							global.gold -= ds_list_find_value(prices, global.glSelect);
						
							var iit = ds_list_find_value(inventory, global.glSelect);
							if(global.ITEM[iit, 3] == 4)
							{
								//qwer
								var index = ds_list_find_index(global.resourceBox, iit);
								var amount = ds_list_find_value(global.resourceBoxAm, index)
								if(amount != undefined && amount > 0)
								{
									ds_list_delete(global.resourceBoxAm, index);
									ds_list_insert(global.resourceBoxAm, index, amount + 1);
								}
								else
								{
									ds_list_add(global.resourceBox, iit);
									ds_list_add(global.resourceBoxAm, 1);
								}
							}
							else
							{
								if(tchar != undefined)
								{
									AddItem(tchar, iit);
									EquipFirstWeaponGlobal(tchar);
								} else
								{
									AddItem(100, iit);
								}
							}
					
							var istock = ds_list_find_value(stock, global.glSelect);
							if(istock < 1000)istock --;
							ds_list_replace(stock, global.glSelect, istock);
							if(istock <= 0)
							{
								ds_list_delete(stock, global.glSelect);
								ds_list_delete(inventory, global.glSelect);
								ds_list_delete(prices, global.glSelect);
						
								if(global.glSelect > 0)global.glSelect --;
							}
						} else audio_play_sound(sfx_back, 0, 0);
					}
					else
					{
						if(global.glSelect3 == 1)
						{
							//sell item
							audio_play_sound(sfx_buy, 0, 0);
						
							if(tchar != 1000)
							{
								use = ds_list_find_value(nupVal, global.glSelect);
								price = floor((global.ITEM[ds_list_find_value(itemList, global.glSelect), 5] / 2) * (use / global.ITEM[ds_list_find_value(itemList, global.glSelect), 2]));
							
								global.gold += price;
								
								var oldStock = ds_list_find_value(nup, global.glSelect);
								
								for(var i = 0; i < ds_list_size(inventory); i ++)
								{
									if(ds_list_find_value(inventory, i) == ds_list_find_value(itemList, global.glSelect)
									&& ds_list_find_value(global.CHAR[tchar, 50], i) == ds_list_find_value(nupVal, global.glSelect))
									{
										ds_list_delete(inventory, i);
										ds_list_delete(global.CHAR[tchar, 50], i);
										if(global.CHAR[tchar, 56] == i)
										{
											global.CHAR[tchar, 44] = -1;
											global.CHAR[tchar, 56] = -1;
											EquipFirstWeaponGlobal(tchar);
										}
										break;
									}
								}
								ds_list_delete(nup, global.glSelect);
								if(oldStock > 1)
								{
									ds_list_insert(nup, global.glSelect, oldStock - 1);
								}
								else
								{
									ds_list_delete(itemList, global.glSelect);
									ds_list_delete(nupVal, global.glSelect);
								}
								
							}
							else
							{
								price = floor((global.ITEM[ds_list_find_value(inventory, global.glSelect), 5] / 2));
								global.gold += price;
								var stock = ds_list_find_value(uses, global.glSelect);
								if(stock > 1)
								{
									ds_list_delete(uses, global.glSelect);
									ds_list_insert(uses, global.glSelect, stock - 1);
								}
								else
								{
									ds_list_delete(inventory, global.glSelect);
									ds_list_delete(uses, global.glSelect);
								}
							}
						
							if(global.glSelect > ds_list_size(inventory) - 1 && global.glSelect > 0)global.glSelect --;
						
							if(ds_list_size(inventory) <= 0)
							{
								global.globalOptions = 1;
								global.glSelect = 0;
								if(global.glSelect2 == 100)global.glSelect2 = ds_list_size(global.charList);
								if(global.glSelect2 == 1000)global.glSelect2 = ds_list_size(global.charList) - 1;
							}
						} else audio_play_sound(sfx_back, 0, 0);
					}
					
					global.glSelect3 = 0;
					global.Akey_state = 2;
					
					exit;
				}
				if(global.Bkey_state == 1)
				{
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect3 = 0;
					exit;
				}
			}
		}
		
		break;
}

switch(state)
{
	case "chapterbegin":
	
		image += 0.3;
		if(image > 70 && fade == 0)
		{
			fade = 1;
			image = 70;
			
			if(instance_number(obj_spawnAlly) <= 0)
			{
				with (obj_spawnTurn)
				{
					if(spawnTurn == 0 && faction == 0 && lead == 1)
					{
						with obj_game SnapCamera(other.x / global.gridSize, other.y / global.gridSize);
					}
				}
			}
			else
			{
				with (obj_spawnAlly)
				{
					with obj_game SnapCamera(other.x / global.gridSize, other.y / global.gridSize);
				}
			}
		}
		if(global.Bkey_state == 1 && image < 60)
		{
			image = 60;
		}
		if(fade >= 1)fade += 1 / 60;
		if(fade >= 2.5)
		{
			if(instance_number(obj_spawnAlly) > 0)
			{
				gamestate = "preparation";
				with(obj_game)
				{
					obj_game.gamestate = "preparation";
					obj_game.state = "create";
				}
			}
			else
			{
				gamestate = "idle";
				with(obj_game)
				{
					obj_game.gamestate = "checkrein";
					obj_game.state = "create";
				}
			}
			state = "idle";
			tempVar5 = 0;
			
			CheckSupports();
			
			with(obj_globalLight)
			{
				ambientsfx = global.CLIMATE[global.MAP[global.currentMap, 4], 2];
				if(ambientsfx != -1)audio_play_sound(ambientsfx, 0, 1);
			}
	
			fade = 0;
			image = 0;
		}
	
		break;
	case "idle":
	
		break;
	case "nextscene":
	
		NextScene();
		break;
		
	case "fade":
	{
		tempVar += 1 / 30;
		if(tempVar >= 1)
		{
			state = "fadeout";
			global.currentBackground = -1;
		}
	}
	break;
	case "fadeout":
	{
		tempVar -= 1 / 30;
		if(tempVar <= 0)
		{
			//ResetDialogue();
			state = "idle";
			//show_message("");
		}
	}
	break;
	case "dialogue":
	{
		//deadchar
		if(global.gradientAlpha < 1 && global.fadeState == -1)
		{
			global.gradientAlpha += 1 / 30;
			break;
		}
		
		var post = true;
		if(global.charDial[0] != -1 && global.CHAR[global.charDial[0], 51] == true)post = false;
		if(global.charDial[1] != -1 && global.CHAR[global.charDial[1], 51] == true)post = false;
			
		if(prepareend == true && global.fadeinTimer == 0 && global.fadeoutTimer == 0 && global.fadeholdTimer == 0)
		{
			state = "enddialogue";
			ResetDialogue();
		}
		//chardeath
		if(global.fadeState == -1 && post == false)
		{
			
			if(global.step[global.currentStep + 1, 0] != "")
			{
				sys_RunEvents();
				global.textY = 1;
				global.currentStep++;
				
				global.backgroundcharAlpha = 1;
				
				global.textboxAlpha = 0;
				
				for(var ii = 0; ii < 3; ii ++)
				{
					if(global.charDial[ii] != -1)
					{
						if(global.charLeave[ii] == 1)
						{
							global.charLeave[ii] = 0;
							//global.backgroundcharAlpha = 1;
							if(global.CHAR[global.charDial[ii], 51] == true)global.charAlpha[ii] = 0;
							global.charDial[ii] = -1;
							leave = 1;
						}
						if(charCome[ii] != -1)
						{
							global.charDial[ii] = charCome[ii];
							if(global.CHAR[global.charDial[ii], 51] == true)global.charAlpha[ii] = 1;
							charCome[ii] = -1;
						}
					}
				}
			}
			else
			{
				if(global.step[global.currentStep + 1, 0] == "")
				{
					sys_RunEvents();
					//show_message(global.fadeinTimer);
					if(global.fadeinTimer == 0 && global.fadeoutTimer == 0 && global.fadeholdTimer == 0) state = "enddialogue"; else prepareend = true;
					exit;
				}
			}
		}
		
		if(global.fadeState == -1 && post == true)
		{
			if(global.textboxAlpha < 1)global.textboxAlpha += 1 / 10;
		}

		
		//if(post == false)exit;
		
		if(prepareend == false)
		{
			
			wait = false;
			for(var i = 0; i < 3; i ++)
			{
				if(global.charLeave[i] == 1)
				{
					wait = true;
					global.charAlpha[i] -= 1 / 10;
					if(global.charAlpha[i] <= 0)
					{
						global.charLeave[i] = 0;
						global.charDial[i] = -1;
					}
				}
				
				if(charCome[i] != -1 && global.charAlpha[i] <= 0)
				{
					global.charDial[i] = charCome[i];
					charCome[i] = -1;
				}
				if(oldAlpha[i] > 0)oldAlpha[i] -= 1 / 20;
				if(global.fadeState == -1)
				{
					if(global.charDial[i] != -1 && global.charLeave[i] == 0)
					{
						if(global.charAlpha[i] < 1)
						{
							global.charAlpha[i] += 1 / 10;
							change = i;
							wait = true;
						}
					}
					if(global.charBlush[i] != global.charTarBlush[i])
					{
						if(global.charBlush[i] < global.charTarBlush[i])global.charBlush[i] += 1 / 30;
						if(global.charBlush[i] > global.charTarBlush[i])global.charBlush[i] -= 1 / 30;
					}
				}
			}

			if(global.fadeState == -1 && ((global.charDial[0] == -1 || global.charAlpha[0] >= 1) && (global.charDial[1] == -1 || global.charAlpha[1] >= 1)))
			{
				if(global.backgroundcharAlpha < 1)global.backgroundcharAlpha += 1 / 8;
				if(global.backgroundcharPos < 1)global.backgroundcharPos += 1 / 8;
				if(global.textY > 0)global.textY -= 1 / 8;
			}
		
			if(gamestate != "shop" && gamestate != "unitshop" && ((global.textboxAlpha >= 1 && global.Akey_state == 1 && prepareend == false) || global.Bkey_state > 0))
			{
				if(global.step[global.currentStep + 1, 0] != "" && global.fadeState == -1 && wait == false)
				{
					sys_AdvanceText();
					exit;
				}
				if(global.step[global.currentStep + 1, 0] == "")
				{
					sys_RunEvents();
					//show_message(global.fadeinTimer);
					if(global.fadeinTimer == 0 && global.fadeoutTimer == 0 && global.fadeholdTimer == 0) state = "enddialogue"; else prepareend = true;
					exit;
				}
			}
			
			//skipdial
			if(gamestate != "shop" && gamestate != "unitshop" && global.startKey_state > 0)
			{
				if(vnAudio != -1)
				{
					audio_sound_gain(vnAudio, 0, 500)
					alarm[1] = 300;
				}
				if(vnAmbient != -1)
				{
					audio_sound_gain(vnAmbient, 0, 500)
					alarm[0] = 300;
				}
				
				//prepareend = true;
				
				for(var i = 99; i > 0; i --)
				{
					if(global.step[i, 5] != -1 && global.step[i, 4] == -2)
					{
						global.currentStep = i;
						sys_RunEvents();
						prepareend = true;
						exit;
					}
				}
				state = "enddialogue";
				//ResetDialogue();
				//var aa = global.currentBackground;
				//ResetDialogue();
				//global.currentBackground = aa;
			}
			
			//deadchar
			
			
			/*
			if(change != -1 && global.charAlpha[change] > 0.75 && global.fadeState != -1)
			{
				if(global.textboxAlpha < 1)global.textboxAlpha += 1 / 10;
			}
			*/

		
		}
		else
		{
			if(global.backgroundcharAlpha > 0)global.backgroundcharAlpha -= 1 / 8;
			if(global.backgroundcharPos > 0)global.backgroundcharPos -= 1 / 8;
			if(global.textY < 1)global.textY += 1 / 8;
		
			for(var i = 0; i < 3; i ++)
			{
				global.charAlpha[i] -= 1 / 10;
				if(global.charAlpha[i] <= 0)
				{
					global.charLeave[i] = 0;
					global.charDial[i] = -1;
				}
			}
		}
		if(global.fadeState == 0)
		{
			global.fadeTimer += 60 / global.fadeinTimer;
			global.gradientAlpha -= 1 / 30;
			if(global.fadeTimer >= 60)
			{
				global.fadeState = 1;
				global.fadeTurn = 0;
			}
		}
		if(global.fadeState == 1)
		{			
			global.fadeTurn += 60 / global.fadeholdTimer;
			if(global.fadeTurn >= 60 || global.fadeholdTimer <= 0)
			{
				global.currentBackground = global.backgroundtoSet;
				if(global.currentBackground == -2)
				{
					//ResetDialogue();
					
					gamestate = "startmap";
					state = "fadeout";
					tempVar = 1;
					global.fadeColor = c_black;
					
					global.currentBackground = -1;
					room_goto(rm_map);
				}
				global.backgroundtoSet = -1;
				global.fadeState = 2;
			}
		}
		if(global.fadeState == 2)
		{
			global.fadeTimer -= 60 / global.fadeoutTimer;
			if(global.fadeTimer <= 0)
			{
				global.fadeState = -1;
				global.fadeinTimer = 0;
				global.fadeoutTimer = 0;
				global.fadeholdTimer = 0;
				global.fadeTimer = 0;
			}
		}
	}
	break;
	case "enddialogue":
	{
		prepareend = false;
		if(room == rm_sandyjail)
		{
			with(obj_prisonerTalk)
			{
				if(char == obj_campUnit.target)instance_destroy();
			}
			
			global.CHAR[tempVar14, 53] = 0;
			
			if(obj_campUnit.target != noone)
			{
				if(obj_campUnit.su == 1)obj_campUnit.target.free = 1;
				obj_campUnit.target = noone;
			}
			if(obj_campUnit.su == 1)alarm[7] = 60;
			
			opSize4 = 1;
			state = "hide";
			gamestate = "events";
			tempVar = 1;
			//recruit
			exit;
		}
		if(gamestate == "dialchangestate")
		{
			opSize4 = 1;
			state = "hide";
			gamestate = "showsupportadv"; //then switch to tempvar11
			//guiTimer4 = 0;
			
			exit;
		}
		if(gamestate == "changeclass2")
		{
			//endclasschange
			state = "hide";
			gamestate = "changeclass3";
			opSize4 = 1;
			if(instance_exists(obj_game))
			{
				if(obj_game.state != "game")
				{
					with obj_game audio_sound_gain(musPreparation, global.optionState[2] / 100, 500);
				}
				else
				{
					with obj_musPlayer event_user(3);
					
					with obj_game
					{
						gamestate = "select";
						EndTurn(global.selectedActor);
						global.selectedActor = noone;
						global.showOptions = 0;
					
					}
				}
				StopMus();
			}
			else if (!instance_exists(obj_campUnit)) PlayMus(mus_map); else StopMus();
			exit;
		}
		state = "hide";
		if(instance_exists(obj_game))
		{
			if(obj_game.reinScene == 2)
			{
				obj_game.state = "game";
				obj_game.gamestate = "beginturn";
				obj_game.reinScene = 0;
			} else
			if(obj_game.state == "levelup")
			{
				obj_game.state = "leveluphide";
			} else
			if(obj_game.state == "chardeathwait")
			{
				//var marked = tempVar11;
				
				if(global.gameType == 0)DeleteCharacter(tempVar11);
				
				obj_game.state = "endcombat";
				audio_sound_gain(obj_game.musDeath, 0, 1000);
			} else
			{
				state = "nextscenehide";
			}
		} else state = "nextscenehide";
	}
	break;
	case "hide":
	
		for(var i = 0; i < 3; i ++)
		{
			global.charAlpha[i] -= 1 / 10;
		}
				
		if(global.backgroundcharAlpha > 0)global.backgroundcharAlpha -= 1 / 8;
		if(global.backgroundcharPos > 0)global.backgroundcharPos -= 1 / 8;
		if(global.textY < 1)global.textY += 1 / 8;
		
		if(global.textY >= 1)
		{
			state = "idle";
		}
	
		break;
	case "nextscenehide":
	
		for(var i = 0; i < 3; i ++)
		{
			global.charAlpha[i] -= 1 / 10;
		}
				
		if(global.backgroundcharAlpha > 0)global.backgroundcharAlpha -= 1 / 8;
		if(global.backgroundcharPos > 0)global.backgroundcharPos -= 1 / 8;
		if(global.textY < 1)global.textY += 1 / 8;
		
		if(global.textY >= 1)
		{
			state = "nextscene";
		}
	
		break;
	case "show":
	
		for(var i = 0; i < 3; i ++)
		{
			global.charAlpha[i] += 1 / 10;
		}
				
		if(global.backgroundcharAlpha < 1)global.backgroundcharAlpha += 1 / 8;
		if(global.backgroundcharPos < 1)global.backgroundcharPos += 1 / 8;
		if(global.textY > 0)global.textY -= 1 / 8;
		
		if(global.textY <= 0)
		{
			state = "dialogue";
		}
		
	break;
}

if(gamestate == "preparation")
{
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	if(gameFade > 0)gameFade -= 1 / 30;
	
	if(global.controlsType > 0)
	{
		if(global.leftKey_state == 1 || (global.leftKey_state mod 5 == 0 && global.leftKey_state > 20))
		{
			if(global.glSelect < 4)global.glSelect += 4; else global.glSelect -= 4;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 5 == 0 && global.rightKey_state > 20))
		{
			if(global.glSelect > 3)global.glSelect -= 4; else global.glSelect += 4;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect < 4)
			{
				if(global.glSelect > 0)global.glSelect --; else global.glSelect = 3;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect > 4)global.glSelect --; else global.glSelect = 7;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect < 4)
			{
				if(global.glSelect < 3)global.glSelect ++; else global.glSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect < 7)global.glSelect ++; else global.glSelect = 4;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
	}
	
	if(global.Akey_state == 1)
	{
		if(global.glSelect == 0)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepunits";
			opSize4 = 1;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			var size = ds_list_size(global.charList);
			var mmod = size mod 3;
			
			charlistHeight[0] = floor(size / 3);
			charlistHeight[1] = floor(size / 3);
			charlistHeight[2] = floor(size / 3);
			
			if(mmod > 0)charlistHeight[0] ++;
			if(mmod > 1)charlistHeight[1] ++;
			exit;
		}
		if(global.glSelect == 1)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepmap";
			tempVar = noone;
			with(obj_unit)
			{
				CalcRanges(id, 1);
			}
			
			global.glSelect = -1;
			global.glSelect2 = -1;
			global.Akey_state = 2;
			//global.lockKeys = 1;
			exit;
		}
		if(global.glSelect == 2)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepinventory";
			opSize4 = 1;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			var size = ds_list_size(global.charList);
			var mmod = size mod 3;
			
			charlistHeight[0] = floor(size / 3);
			charlistHeight[1] = floor(size / 3);
			charlistHeight[2] = floor(size / 3);
			
			if(mmod > 0)charlistHeight[0] ++;
			if(mmod > 1)charlistHeight[1] ++;
			exit;
		}
		if(global.glSelect == 3)
		{
			var hasChamps = false;
			for(var i = 0; i < global.totalChars; i ++)
			{
				if(global.CHAR[i, 59] == true)
				{
					hasChamps = true;
				}
			}
			if(hasChamps == true)
			{
				StartBattle();
				audio_play_sound(sfx_select, 0, 0);
				exit;
			}
			else
			{
				audio_play_sound(sfx_error, 0, 0);
				exit;
			}
		}
		if(global.glSelect == 4)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepsupports";
			opSize4 = 1;
			
			for(var i = 0; i < ds_list_size(global.charList); i ++)
			{
				var tchar = ds_list_find_value(global.charList, i);
				if(tchar < 50)
				{
					global.CHAR[tchar, 40] = 0;
					for(var ii = 0; ii < ds_list_size(global.charList); ii ++)
					{
						var tar = ds_list_find_value(global.charList, ii);
						if(tar < 50 && global.SUPPORTADV[tchar, tar])
						{
							global.CHAR[tchar, 40] = 1;
							break;
						}
					}
				}
			}
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			var size = ds_list_size(global.charList);
			var mmod = size mod 3;
			
			charlistHeight[0] = floor(size / 3);
			charlistHeight[1] = floor(size / 3);
			charlistHeight[2] = floor(size / 3);
			
			if(mmod > 0)charlistHeight[0] ++;
			if(mmod > 1)charlistHeight[1] ++;
			exit;
		}
		if(global.glSelect == 5)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepskills";
			opSize4 = 1;
			tempVar2 = 0;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			global.glSelect3 = -1;
			global.showOptions = 0;
			exit;
		}
		if(global.glSelect == 6)
		{
			global.currentFileType = 0;
			SaveGame(global.currentFile);
			tempVar = 1;
			tempVar2 = 0;
			
			gamestate = "saving";
			audio_play_sound(sfx_select, 0, 0);
		}
		if(global.glSelect == 7)
		{
			audio_play_sound(sfx_back, 0, 0);
			with obj_game
			{
				state = "exit";
				gamestate = "exit";
				audio_sound_gain(musPreparation, 0, 500);
				alarm[6] = 29;
			}
			ResetDialogue();
			sys_SetBackgroundFade(-2, 500, 500, 500, c_black);
			state = "dialogue";
			gamestate = "hideprep";
			global.glSelect = 0;
			
			exit;
		}
	}
}
if(gamestate == "preparationmain")
{
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	if(gameFade > 0)gameFade -= 1 / 30;
	
	if(global.controlsType > 0)
	{
		if(global.leftKey_state == 1 || (global.leftKey_state mod 5 == 0 && global.leftKey_state > 20))
		{
			if(global.glSelect < 2)global.glSelect += 2; else global.glSelect -= 2;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 5 == 0 && global.rightKey_state > 20))
		{
			if(global.glSelect > 1)global.glSelect -= 2; else global.glSelect += 2;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect < 2)
			{
				if(global.glSelect > 0)global.glSelect --; else global.glSelect = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect > 2)global.glSelect --; else global.glSelect = 3;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect < 2)
			{
				if(global.glSelect < 1)global.glSelect ++; else global.glSelect = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			else
			{
				if(global.glSelect < 3)global.glSelect ++; else global.glSelect = 2;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
	}
	
	if(global.Akey_state == 1)
	{
		if(global.glSelect == 0)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepinventory";
			opSize4 = 1;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			var size = ds_list_size(global.charList);
			var mmod = size mod 3;
			
			charlistHeight[0] = floor(size / 3);
			charlistHeight[1] = floor(size / 3);
			charlistHeight[2] = floor(size / 3);
			
			if(mmod > 0)charlistHeight[0] ++;
			if(mmod > 1)charlistHeight[1] ++;
			exit;
		}
		if(global.glSelect == 1)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepskills";
			opSize4 = 1;
			tempVar2 = 0;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			global.glSelect3 = -1;
			global.showOptions = 0;
			exit;
		}
		if(global.glSelect == 3)
		{
			global.currentFileType = 0;
			SaveGame(global.currentFile);
			tempVar = 1;
			tempVar2 = 0;
			
			gamestate = "saving";
			audio_play_sound(sfx_select, 0, 0);
		}
		if(global.glSelect == 2)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			gamestate = "prepsupports";
			opSize4 = 1;
			
			for(var i = 0; i < ds_list_size(global.charList); i ++)
			{
				var tchar = ds_list_find_value(global.charList, i);
				if(tchar < 50)
				{
					global.CHAR[tchar, 40] = 0;
					for(var ii = 0; ii < ds_list_size(global.charList); ii ++)
					{
						var tar = ds_list_find_value(global.charList, ii);
						if(tar < 50 && global.SUPPORTADV[tchar, tar])
						{
							global.CHAR[tchar, 40] = 1;
							break;
						}
					}
				}
			}
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			
			var size = ds_list_size(global.charList);
			var mmod = size mod 3;
			
			charlistHeight[0] = floor(size / 3);
			charlistHeight[1] = floor(size / 3);
			charlistHeight[2] = floor(size / 3);
			
			if(mmod > 0)charlistHeight[0] ++;
			if(mmod > 1)charlistHeight[1] ++;
			exit;
		}
	}
	if(global.Bkey_state == 1)
	{
		if(showMap || instance_exists(obj_campUnit))gamestate = "hidemain";
		audio_play_sound(sfx_back, 0, 0);
	}
}
if(gamestate == "hidemain")
{
	if(opSize4 < 1)opSize4 += 1 / 5;
	if(opSize4 >= 1)
	{
		opSize4 = 1;
		if(instance_exists(obj_campUnit))
		{
			gamestate = "idle";
			obj_campUnit.state = "idle";
		} else
		gamestate = "map";
	}
}
if(gamestate == "hideprep")
{
	if(opSize4 < 1)opSize4 += 1 / 5;
	if(opSize4 >= 1)
	{
		opSize4 = 1;
		gamestate = "idle";
	}
}
if(gamestate == "prepmap")
{
	if(opSize4 < 1)opSize4 += 1 / 5;
	if(opSize4 >= 1)opSize4 = 1;

	if(global.glSelect2 == -1 && tempVar == noone)with obj_game HoverNode();
	
	if(global.hoverNode != noone && global.hoverNode.occupant != noone && global.Ykey_state == 1)
	{
		
		tempVar = global.hoverNode.occupant;
		global.glSelect6 = 0;
		global.glSelect7 = 0;
		global.glSelect8 = 0;
		global.hoverNode = noone;
		
		var skills = ds_list_size(global.CHAR[tempVar.characterID, 34]);
		var inventory = ds_list_size(global.CHAR[tempVar.characterID, 49]);
				
		if(global.glSelect5 != 0 && global.glSelect5 != 1)global.glSelect5 = 0;
		
		audio_play_sound(sfx_scroll, 0, 0);
		exit;
	}
	
	
	if(tempVar == noone)
	{
		if(global.glSelect2 == -1 && global.hoverNode != noone && global.hoverNode.spawn != noone)
		{
			if(global.Akey_state == 1)
			{
				if(global.glSelect == -1)
				{
					global.glSelect = global.hoverNode;
					audio_play_sound(sfx_move, 0, 0);
					global.glSelect.spawn.image_index = 1;
				}
				else
				{
					global.glSelect2 = global.hoverNode;
					if(global.glSelect.occupant == noone && global.glSelect2.occupant == noone)
					{
						global.glSelect2 = -1;
						audio_play_sound(sfx_error, 0, 0);
					}
					else
					{
						if(global.glSelect2 != global.glSelect)
						{
							audio_play_sound(sfx_active, 0, 0);
							global.glSelect.spawn.image_index = 0;
						}
						else
						{
							global.glSelect2 = -1;
							audio_play_sound(sfx_error, 0, 0);
						}
					}
				}
				exit;
			}
		}
	
		if(global.glSelect != -1 && global.glSelect2 != -1)
		{
			var cell1 = global.glSelect;
			var cell2 = global.glSelect2;
			var unit1 = cell1.occupant;
			var unit2 = cell2.occupant;
		
			var dir = point_direction(cell1.gridX * global.gridSize, cell1.gridY * global.gridSize, cell2.gridX * global.gridSize, cell2.gridY * global.gridSize);
			var dist = 0;
		
			if(unit1 == noone)dist = point_distance(unit2.x, unit2.y, cell1.gridX * global.gridSize, cell1.gridY * global.gridSize); else
			if(unit2 == noone)dist = point_distance(unit1.x, unit1.y, cell2.gridX * global.gridSize, cell2.gridY * global.gridSize); else
			dist = point_distance(unit1.x, unit1.y, cell2.gridX * global.gridSize, cell2.gridY * global.gridSize);
		
			var spd = median(2, dist / 8, 30);
		
		
			if(unit1 != noone)
			{
				unit1.x += lengthdir_x(spd, dir);
				unit1.y += lengthdir_y(spd, dir);
			}
		
			if(unit2 != noone)
			{
				dir += 180;
				unit2.x += lengthdir_x(spd, dir);
				unit2.y += lengthdir_y(spd, dir);
			}
		
			if(dist <= 2)
			{

				if(unit1 != noone)
				{
					with unit1
					{
						cell2.occupant = id;
						standingNode = cell2;
						standingSpawn = cell2.spawn;
						cell2.spawn.occupant = id;
					
						gridX = cell2.gridX;
						gridY = cell2.gridY;
						x = gridX * global.gridSize;
						y = gridY * global.gridSize;
					}
				}
				else
				{
					cell2.occupant = noone;
					cell2.spawn.occupant = noone;
				}
				if(unit2 != noone)
				{
					with unit2
					{
						cell1.occupant = id;
						standingNode = cell1;
						standingSpawn = cell1.spawn;
						cell1.spawn.occupant = id;
					
						gridX = cell1.gridX;
						gridY = cell1.gridY;
						x = gridX * global.gridSize;
						y = gridY * global.gridSize;
					}
				}
				else
				{
					cell1.occupant = noone;
					cell1.spawn.occupant = noone;
				}
			
				global.glSelect = -1;
				global.glSelect2 = -1;
				exit;
			}
		}
	
		if(global.Bkey_state == 1 && global.glSelect2 == -1)
		{
			//CleanNodes();
			if(global.glSelect == -1)
			{			
				opSize4 = 1;
				gamestate = "preparation";
				
				CheckSupports();
				
				global.glSelect = 1;
				global.glSelect2 = 0;
				audio_play_sound(sfx_back, 0, 0);
			}
			else
			{
				global.glSelect.spawn.image_index = 0;
				global.glSelect = -1;
				audio_play_sound(sfx_back, 0, 0);
			}
		}
	}
	else
	{
		ShowStatsControls(tempVar.characterID, 0);
	}
}
if(gamestate == "prepinventory")
{
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	
	if(global.controlsType > 0 && ds_list_size(global.charList) > 1 && showStats == 0)
	{
		var ctr = global.glSelect2 * 3 + global.glSelect;
		if(global.leftKey_state == 1 || (global.leftKey_state mod 5 == 0 && global.leftKey_state > 20))
		{
			if(global.glSelect > 0)global.glSelect --; else global.glSelect = 2;
			ctr = global.glSelect2 * 3 + global.glSelect;
			while(ctr > ds_list_size(global.charList) - 1)
			{
				global.glSelect --;
				ctr = global.glSelect2 * 3 + global.glSelect;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 5 == 0 && global.rightKey_state > 20))
		{
			if(global.glSelect < 2 && ctr < ds_list_size(global.charList) - 1)global.glSelect ++; else global.glSelect = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect2 > 0)global.glSelect2 --; else global.glSelect2 = charlistHeight[global.glSelect] - 1;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect2 < charlistHeight[global.glSelect] - 1)global.glSelect2 ++; else global.glSelect2 = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
	
	OpenStats();
	
	if(global.Akey_state == 1 && showStats == 0)
	{
		global.glSelect3 = ds_list_find_value(global.charList, global.glSelect2 * 3 + global.glSelect);
		if(global.glSelect3 != undefined)
		{
			audio_play_sound(sfx_showOptions, 0, 0);
			
			xScroll = 0;
			opSize4 = 1;
			opSize = 1;
			gamestate = "prepitems";
			guiTimer5 = 0;
			xScroll = 0;
			
			itemindexList = ds_list_create();
			itemcharList = ds_list_create();
			
			guiTimer = global.glSelect;
			guiTimer2 = global.glSelect2;
			
			global.glSelect = 0;
			global.glSelect2 = 0;
			global.showOptions = 0;
			
			index1trade = -1;
			index2trade = -1;
			whotowho = -1;
			itemCharSel = 100;
			itemSel = -1;
			
			ds_list_clear(itemindexList);
			ds_list_clear(itemcharList);

			
			AddItemsList(10, global.glSelect3);
			
			exit;
		}
	}
	
	if(global.Bkey_state == 1)
	{
		if(showStats == 0)
		{
			opSize4 = 1;
			gamestate = laststate;
			if(gamestate == "preparation")global.glSelect = 2; else global.glSelect = 0;
			global.glSelect2 = 0;
			audio_play_sound(sfx_back, 0, 0);
		
			exit;
		}
	}
}
if(gamestate == "prepskills")
{
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	
	
	
	var nOptions = ds_list_size(global.charList);
	if(ds_list_size(global.charList) > 0 && global.glSelect3 == -1)
	{
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			guiTimer2 = 0;
			if(global.glSelect < nOptions - 1)
			{
				global.glSelect ++;
				if(tempVar2 < 4)tempVar2 ++;
			}
			else
			{
				global.glSelect = 0;
				tempVar2 = 0;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect >= nOptions - 1 && global.downKey_state > 20)global.lockKeys = 1;
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			guiTimer2 = 0;
			if(global.glSelect > 0)
			{
				global.glSelect --;
				if(tempVar2 > 1)tempVar2 --;
			}
			else
			{
				global.glSelect = nOptions - 1;
				tempVar2 = 4;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect <= 0 && global.upKey_state > 20)global.lockKeys = 1;
		}
	}
	if(global.glSelect3 != -1 && global.showOptions == 0)
	{
		var total2 = ds_list_size(nup);
		var total1 = ds_list_size(global.CHAR[global.glSelect3, 34]);
		if(global.controlsType > 0)
		{
			if(global.rightKey_state == 1 && global.glSelect4 == 0)
			{
				global.glSelect4 = 1;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect2 > total2 - 1)global.glSelect2 = total2 - 1;
			}
			if(global.leftKey_state == 1 && global.glSelect4 == 1)
			{
				global.glSelect4 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
				if(global.glSelect2 > total1 - 1)global.glSelect2 = total1 - 1;
			}
			
			if((global.glSelect4 == 0 && total1 > 1) || (global.glSelect4 == 1 && total2 > 1))
			{
				var total = 0;
				if(global.glSelect4 == 0)total = total1; else total = total2;
				if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
				{
					if(global.glSelect2 > 0)
					{
						global.glSelect2 --;
						if(guiTimer2 > 1 && global.glSelect4 == 1)guiTimer2 --;
					}
					else
					{
						global.glSelect2 = total - 1;
						if(global.glSelect4 == 1)guiTimer2 = 4;
					}
					if(global.glSelect2 <= 0)global.lockKeys = 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
				if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
				{
					if(global.glSelect2 < total - 1)
					{
						global.glSelect2 ++;
						if(guiTimer2 < 3 && global.glSelect4 == 1)guiTimer2 ++;
					}
					else
					{
						global.glSelect2 = 0;
						if(global.glSelect4 == 1)guiTimer2 = 0;
					}
					if(global.glSelect2 >= total - 1)global.lockKeys = 1;
					audio_play_sound(sfx_scroll, 0, 0);
				}
			}
			if(global.glSelect2 < 0)global.glSelect2 = 0;
		}
		if(global.Akey_state == 1)
		{
			if(((global.glSelect4 == 0 && ds_list_size(global.CHAR[global.glSelect3, 34]) > 0) || (global.glSelect4 == 1 && ds_list_size(nup) > 0)))
			{
				if(!(global.glSelect4 == 1 && ds_list_size(global.CHAR[global.glSelect3, 34]) >= 5))
				{
					global.showOptions = 10;
					global.glSelect5 = 0;
					audio_play_sound(sfx_showOptions, 0, 0);
					if(global.glSelect4 == 0)
					{
						global.nOptions = 0;
		
						global.options[global.nOptions] = "Remove";
						global.nOptions++;
						if(global.glSelect2 > 0)
						{
							global.options[global.nOptions] = "Arrange";
							global.nOptions++;
						}
					}
					else
					{
						global.nOptions = 0;
			
						global.options[global.nOptions] = "Equip";
						global.nOptions++;
					}
					exit;
				} else audio_play_sound(sfx_error, 0, 0);
			} else audio_play_sound(sfx_error, 0, 0);
		}
		if(global.Bkey_state == 1)
		{
			ds_list_clear(nup);
			global.glSelect3 = -1;
			audio_play_sound(sfx_back, 0, 0);
		
			exit;
		}
	}
	if(global.Akey_state == 1 && global.glSelect3 == -1 && global.showOptions == 0)
	{
		global.glSelect3 = ds_list_find_value(global.charList, global.glSelect);
		guiTimer2 = 0;
		global.glSelect2 = 0;
		global.glSelect4 = 0;
		audio_play_sound(sfx_select, 0, 0);
		
		ds_list_clear(nup);
		for(var i = 0; i < ds_list_size(global.CHAR[global.glSelect3, 33]); i ++)
		{
			var found = 0;
			var skill = ds_list_find_value(global.CHAR[global.glSelect3, 33], i);
			for(var ii = 0; ii < ds_list_size(global.CHAR[global.glSelect3, 34]); ii ++)
			{
				if(skill == ds_list_find_value(global.CHAR[global.glSelect3, 34], ii))found = 1;
			}
			if(found == 0)ds_list_add(nup, skill);
		}
	}
	if(global.Bkey_state == 1 && global.glSelect3 == -1)
	{
		opSize4 = 1;
		gamestate = laststate;
		if(instance_exists(obj_game))global.glSelect = 5; else global.glSelect = 1;
		global.glSelect2 = 0;
		audio_play_sound(sfx_back, 0, 0);
		
		exit;
	}
	if(global.showOptions == 10)
	{
		if(opSize > 0)opSize -= 1 / 5;
		if(opSize <= 0)opSize = 0;
		
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1)
			{
				if(global.glSelect5 > 0) global.glSelect5 --; else global.glSelect5 = global.nOptions - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1)
			{
				if(global.glSelect5 < global.nOptions - 1)global.glSelect5 ++; else global.glSelect5 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		
		if(global.Akey_state == 1)
		{
			if(global.glSelect4 == 0)
			{
				if(global.options[global.glSelect5] == "Remove")
				{
					var skill = ds_list_find_value(global.CHAR[global.glSelect3, 34], global.glSelect2);
					ds_list_delete(global.CHAR[global.glSelect3, 34], global.glSelect2);
					ds_list_add(nup, skill);
					if(ds_list_find_value(global.CHAR[global.glSelect3, 34], global.glSelect2) == undefined)global.glSelect2 --;
					if(global.glSelect2 < 0)global.glSelect2 = 0;
					
					audio_play_sound(sfx_select, 0, 0);
				}
				if(global.options[global.glSelect5] == "Arrange")
				{
					var skill = ds_list_find_value(global.CHAR[global.glSelect3, 34], global.glSelect2);
					ds_list_delete(global.CHAR[global.glSelect3, 34], global.glSelect2);
					ds_list_insert(global.CHAR[global.glSelect3, 34], 0, skill);
					
					audio_play_sound(sfx_select, 0, 0);
				}
				global.showOptions = 0;
			}
			else
			{
				if(global.options[global.glSelect5] == "Equip")
				{
					var skill = ds_list_find_value(nup, global.glSelect2);
					ds_list_delete(nup, global.glSelect2);
					ds_list_add(global.CHAR[global.glSelect3, 34], skill);
					
					if(ds_list_find_value(nup, global.glSelect2) == undefined)global.glSelect2 --;
					if(global.glSelect2 < 0)global.glSelect2 = 0;
					
					audio_play_sound(sfx_select, 0, 0);
				}
				global.showOptions = 0;
			}
		}
		
		if(global.Bkey_state == 1)
		{
			global.showOptions = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
	}
	else
	{
		if(opSize < 1)opSize += 1 / 5;
		if(opSize >= 1)opSize = 1;
	}
}
if(gamestate == "prepunits")
{
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	
	if(global.controlsType > 0 && ds_list_size(global.charList) > 1 && showStats == 0)
	{
		var ctr = global.glSelect2 * 3 + global.glSelect;
		if(global.leftKey_state == 1 || (global.leftKey_state mod 5 == 0 && global.leftKey_state > 20))
		{
			if(global.glSelect > 0)global.glSelect --; else global.glSelect = 2;
			ctr = global.glSelect2 * 3 + global.glSelect;
			while(ctr > ds_list_size(global.charList) - 1)
			{
				global.glSelect --;
				ctr = global.glSelect2 * 3 + global.glSelect;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 5 == 0 && global.rightKey_state > 20))
		{
			if(global.glSelect < 2 && ctr < ds_list_size(global.charList) - 1)global.glSelect ++; else global.glSelect = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect2 > 0)global.glSelect2 --; else global.glSelect2 = charlistHeight[global.glSelect] - 1;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect2 < charlistHeight[global.glSelect] - 1)global.glSelect2 ++; else global.glSelect2 = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
	
	OpenStats();
	
	if(global.Akey_state == 1 && showStats == 0)
	{
		global.glSelect3 = ds_list_find_value(global.charList, global.glSelect2 * 3 + global.glSelect);
		if(global.glSelect3 != undefined)
		{
			if(global.CHAR[global.glSelect3, 59] == false && global.activeCharacters < instance_number(obj_spawnAlly))
			{	
				empty = noone;
				with(obj_spawnAlly)
				{
					if(occupant = noone)
					{
						other.empty = id;
						break;
					}
				}
				if(empty != noone)
				{
					audio_play_sound(sfx_active, 0, 0);
					global.CHAR[global.glSelect3, 59] = true;
					global.CHAR[global.glSelect3, 58] = true;
				
					var unit = instance_create_layer(0, 0, "base", obj_unit);
					var spawn = empty;
					spawn.occupant = unit;
		
					unit.standingSpawn = spawn;
					unit.gridX = spawn.gridX;
					unit.gridY = spawn.gridY;
					unit.x = unit.gridX * global.gridSize;
					unit.y = unit.gridY * global.gridSize;
					global.map[unit.gridX, unit.gridY].occupant = unit;
					unit.standingNode = global.map[unit.gridX, unit.gridY];
					unit.characterID = global.glSelect3;
					unit.faction = 0;
					
					global.activeCharacters ++;
					
					global.CHAR[unit.characterID, 73] = global.activeCharacters;
				}
				else
				{
					audio_play_sound(sfx_error, 0, 0);
				}
				exit;
			} else if (global.CHAR[global.glSelect3, 59] == false)audio_play_sound(sfx_error, 0, 0);
			if(global.CHAR[global.glSelect3, 59] == true)
			{				
				with(obj_unit)
				{
					if(characterID == global.glSelect3)
					{
						audio_play_sound(sfx_unactive, 0, 0);
						global.CHAR[global.glSelect3, 59] = false;
				
						standingNode.occupant = noone;
						standingSpawn.occupant = noone;
						
						global.activeCharacters --;
						global.CHAR[global.glSelect3, 73] = 0;
						instance_destroy();
					}
				}
			}
			exit;
		}
	}
	
	if(global.Bkey_state == 1)
	{
		if(showStats == 0)
		{
			opSize4 = 1;
			gamestate = laststate;
			global.glSelect = 0;
			global.glSelect2 = 0;
			audio_play_sound(sfx_back, 0, 0);
			CharListOrder();
		
			for(var i = 0; i < 3; i ++)
			{
				ds_list_clear(global.faction[i]);
			}
			with (obj_unit)
			{
				ds_list_add(global.faction[faction], id);
			}
		}
		
		exit;
	}
}
if(gamestate == "prepsupports")
{
	tempVar9 += 1 / 6;
	if(tempVar9 > 120)tempVar9 = 0;
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	
	if(global.controlsType > 0 && ds_list_size(global.charList) > 1 && showStats == 0)
	{
		var ctr = global.glSelect2 * 3 + global.glSelect;
		if(global.leftKey_state == 1 || (global.leftKey_state mod 5 == 0 && global.leftKey_state > 20))
		{
			if(global.glSelect > 0)global.glSelect --; else global.glSelect = 2;
			ctr = global.glSelect2 * 3 + global.glSelect;
			while(ctr > ds_list_size(global.charList) - 1)
			{
				global.glSelect --;
				ctr = global.glSelect2 * 3 + global.glSelect;
			}
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.rightKey_state == 1 || (global.rightKey_state mod 5 == 0 && global.rightKey_state > 20))
		{
			if(global.glSelect < 2 && ctr < ds_list_size(global.charList) - 1)global.glSelect ++; else global.glSelect = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect2 > 0)global.glSelect2 --; else global.glSelect2 = charlistHeight[global.glSelect] - 1;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect2 < charlistHeight[global.glSelect] - 1)global.glSelect2 ++; else global.glSelect2 = 0;
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
	
	OpenStats();
	
	if(global.Akey_state == 1 && showStats == 0)
	{
		guiTimer = global.glSelect;
		guiTimer2 = global.glSelect2;
		global.glSelect3 = ds_list_find_value(global.charList, global.glSelect2 * 3 + global.glSelect);
		if(global.glSelect3 != undefined)
		{
			global.glSelect2 = 0;
			
			ds_list_clear(nup);	
			for(var i = 0; i < ds_list_size(global.charList); i ++)
			{
				var tchar = ds_list_find_value(global.charList, i);
				if(tchar != global.glSelect3 && tchar < 50 && global.glSelect3 < 50)
				{
					if(global.SUPPORTLIMIT[tchar, global.glSelect3] > 0) ds_list_add(nup, tchar);
				}
			}
			
			if(ds_list_size(nup) > 0)
			{
				audio_play_sound(sfx_showOptions, 0, 0);
			}
			else
			{
				global.glSelect2 = guiTimer2;
				audio_play_sound(sfx_error, 0, 0);
				exit;
			}
			
			opSize4 = 1;
			opSize = 1;
			gamestate = "supports";
			tempVar2 = 0;
			
			if(global.glSelect2 == -1)global.glSelect2 = 0;
			
			global.glSelect = 0;
			
			global.showOptions = 0;
			
			exit;
		}
	}
	
	if(global.Bkey_state == 1)
	{
		if(showStats == 0)
		{
			opSize4 = 1;
			gamestate = laststate;
			global.glSelect = 2;
			global.glSelect2 = 0;
			
			if(instance_exists(obj_game))global.glSelect = 4;
			
			audio_play_sound(sfx_back, 0, 0);
			CharListOrder();
		}
		exit;
	}
}
if(gamestate == "supports")
{
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	
	var nOptions = ds_list_size(nup);
	
	if(ds_list_size(nup) > 1)
	{
		if(global.downKey_state == 1 || (global.downKey_state mod 5 == 0 && global.downKey_state > 20))
		{
			if(global.glSelect2 < nOptions - 1)
			{
				global.glSelect2 ++;
				if(tempVar2 < 2)tempVar2 ++;
			}
			else
			{
				global.glSelect2 = 0;
				tempVar2 = 0;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect2 >= nOptions - 1 && global.downKey_state > 20)global.lockKeys = 1;
		}
		if(global.upKey_state == 1 || (global.upKey_state mod 5 == 0 && global.upKey_state > 20))
		{
			if(global.glSelect2 > 0)
			{
				global.glSelect2 --;
				if(tempVar2 > 1)tempVar2 --;
			}
			else
			{
				global.glSelect2 = nOptions - 1;
				tempVar2 = 2;
			}
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect2 <= 0 && global.upKey_state > 20)global.lockKeys = 1;
		}
	}
	
	if(global.Akey_state == 1 && global.showOptions == 0)
	{
		var charr = ds_list_find_value(nup, global.glSelect2);
		if(global.SUPPORTADV[global.glSelect3, charr])
		{
			audio_play_sound(sfx_select, 0, 0);
			
			tempVar11 = gamestate;
			Supports(global.glSelect3, charr);
			global.SUPPORTADV[global.glSelect3, charr] = false;
			global.SUPPORTADV[charr, global.glSelect3] = false;
			global.SUPPORTS[global.glSelect3, charr] ++;
			global.SUPPORTS[charr, global.glSelect3] ++;
			global.SUPPORTXP[global.glSelect3, charr] = 0;
			global.SUPPORTXP[charr, global.glSelect3] = 0;
			
			global.CHAR[global.glSelect3, 40] = 0;
			global.CHAR[charr, 40] = 0;
			var found = 0;
			for(var i = 0; i < ds_list_size(nup); i ++)
			{
				if(global.SUPPORTADV[global.glSelect3, ds_list_find_value(nup, i)])
				{
					found = 1;
					global.CHAR[global.glSelect3, 40] = 1;
					break;
				}
			}
			guiTimer3 = global.SUPPORTS[global.glSelect3, charr] + 1;
			guiTimer5 = charr;
			
			CheckSupports();
		}
		else audio_play_sound(sfx_error, 0, 0);
		
		//surface_copy(surfScreen, 0, 0, application_surface);
	}
	if(global.Bkey_state == 1 && global.showOptions == 0)
	{
		opSize4 = 1;
		gamestate = "prepsupports";
		audio_play_sound(sfx_back, 0, 0);
		global.glSelect = guiTimer;
		global.glSelect2 = guiTimer2;
		ds_list_clear(nup);
	}
	
	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
}
if(gamestate == "showsupportadv")
{
	if(guiTimer4 < 30)guiTimer4 ++;
	if(guiTimer4 == 30)
	{
		audio_play_sound(sfx_itemGet, 0, 0);
		guiTimer4 = 100;
	}
	if(guiTimer4 == 100)
	{
		if(global.Akey_state == 1 && global.showOptions == 0)
		{
			opSize4 = 1;
			gamestate = tempVar11;
			global.currentBackground = -1;
		
			if(instance_exists(obj_game))
			{
				with obj_game audio_sound_gain(musPreparation, global.optionState[2] / 100, 500);
				StopMus();
				with(obj_globalLight)
				{
					if(ambientsfx != -1)audio_sound_gain(ambientsfx, global.optionState[2] / 100, 500);
				}
			}
			else
			{
				if(!instance_exists(obj_campUnit)) PlayMus(mus_map);
				//endsupport
				tempVar3 = 0;
				tempVar4 = 0;
				tempVar5 = 0;
				opSize4 = 1;
			}
		}
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
	}
}
if(gamestate == "prepitems")
{
	if(global.Bkey_state == 1 && global.showOptions == 0)
	{
		opSize4 = 1;
		gamestate = "prepinventory";
		audio_play_sound(sfx_back, 0, 0);
		global.glSelect = guiTimer;
		global.glSelect2 = guiTimer2;
		ds_list_destroy(itemindexList);
		ds_list_destroy(itemcharList);
		exit;
	}

	if(opSize4 > 0)opSize4 -= 1 / 5;
	if(opSize4 <= 0)opSize4 = 0;
	var opX = trade1xpos - 36;
	var opY = trade1ypos;
	
	var inventory1 = global.CHAR[global.glSelect3, 49];
	var uses1 = global.CHAR[global.glSelect3, 50];
	
	var plus = 0;
	var total = ds_list_size(inventory1) + 1;
	if(total > 5)total = 5;
	
	if(global.controlsType > 0 && global.glSelect2 == 0 && total > 1 && (global.showOptions == 0 || global.showOptions > 10))
	{
		if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
		{
			if(global.glSelect > 0) global.glSelect --; else global.glSelect = total - 1;
			audio_play_sound(sfx_scroll, 0, 0);
			guiTimer5 = 0;
			xScroll = 0;
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
		{
			if(global.glSelect < total - 1)global.glSelect ++; else global.glSelect = 0;
			audio_play_sound(sfx_scroll, 0, 0);
			guiTimer5 = 0;
			xScroll = 0;
		}
	}
	
	if(whotowho == 0)plus = 1;
	var total2 = ds_list_size(itemindexList) + plus;
	
	if(global.controlsType > 0 && (global.showOptions == 0 || global.showOptions == 11))
	{
		var mv = false;
		var limit = 0;
		if(global.showOptions == 11)limit = 1;
		if(global.rightKey_state == 1 || (global.rightKey_state mod 4 == 0 && global.rightKey_state > 15))
		{
			if(global.glSelect2 < 11)global.glSelect2 ++; else global.glSelect2 = limit;
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect2 >= 11 && global.rightKey_state > 20)global.lockKeys = 1;
			mv = true;
			guiTimer5 = 0;
			xScroll = 0;
		}
		if(global.leftKey_state == 1 || (global.leftKey_state mod 4 == 0 && global.leftKey_state > 15))
		{
			if(global.glSelect2 > limit)global.glSelect2 --; else global.glSelect2 = 11;
			audio_play_sound(sfx_scroll, 0, 0);
			if(global.glSelect2 <= limit && global.leftKey_state > 20)global.lockKeys = 1;
			mv = true;
			guiTimer5 = 0;
			xScroll = 0;
		}
		if(mv == true && global.glSelect2 > 0)
		{
			if(global.glSelect2 < 11)
			{
				AddItemsList(global.glSelect2 + 9, global.glSelect3);
			} else
			if(global.glSelect2 == 11)
			{
				AddItemsList(-1, global.glSelect3);
			}
			
			if(whotowho == 0)plus = 1;
			total2 = ds_list_size(itemindexList) + plus;
			if(global.glSelect >= total2 - 1)global.glSelect = total2 - 1;
			if(total2 > 0 && global.glSelect < 0)global.glSelect = 0;
		}
		else if(mv == true)
		{
			AddItemsList(10, global.glSelect3);
			itemCharSel = ds_list_find_value(itemcharList, global.glSelect);
			if(global.glSelect >= total - 1)global.glSelect = total - 1;
			if(global.glSelect <= 0 && total > 0)global.glSelect = 0;
		}
		if(mv == false && global.glSelect2 > 0)
		{
			itemCharSel = 100;
			itemSel = -1;
		}
	}
	//if(total > 5)total = 5;
	if(global.controlsType > 0 && global.glSelect2 > 0 && total2 > 1 && (global.showOptions == 0 || global.showOptions > 10))
	{
		if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
		{
			if(global.glSelect > 0) global.glSelect --; else global.glSelect = total2 - 1;
			audio_play_sound(sfx_scroll, 0, 0);
			guiTimer5 = 0;
			xScroll = 0;
		}
		if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
		{
			if(global.glSelect < total2 - 1)global.glSelect ++; else global.glSelect = 0;
			audio_play_sound(sfx_scroll, 0, 0);
			guiTimer5 = 0;
			xScroll = 0;
		}
	}
	
	
	var itemIndex = -1, itemChar = -1, item = -1, uses = -1;
	if(global.glSelect2 > 0)
	{
		itemIndex = ds_list_find_value(itemindexList, global.glSelect);
		itemChar = ds_list_find_value(itemcharList, global.glSelect);
	}
	else
	{
		itemIndex = global.glSelect;
		itemChar = global.glSelect3;
	}
	
	if(itemIndex != -1 && itemIndex != undefined)
	{
		item = ds_list_find_value(global.CHAR[itemChar, 49], itemIndex);
		uses = ds_list_find_value(global.CHAR[itemChar, 50], itemIndex);
	
		if(global.glSelect2 > 0)itemCharSel = itemChar;
		if(itemCharSel == undefined)itemCharSel = 100;
		itemSel = item;
		
		if(guiTimer5 >= 90)
		{
			draw_set_font(ft_large);
			draw_set_halign(fa_left);
			var txt = DescriptionString(item);
					
			xScroll -= 2;
			if(xScroll < - 48 - string_width(txt))xScroll = -2;
		} else guiTimer5 ++;
	} else xScroll = 0;
	
	if(global.Akey_state == 1 && item != -1 && global.showOptions == 0)
	{

		global.showOptions = 10;
		global.glSelect4 = 0;
		audio_play_sound(sfx_showOptions, 0, 0);
		if(global.glSelect2 == 0)
		{
			if(global.glSelect < ds_list_size(global.CHAR[global.glSelect3, 49]))
			{
				global.nOptions = 0;
		
				global.options[global.nOptions] = "Store";
				global.nOptions++;
				global.options[global.nOptions] = "Trade";
				global.nOptions++;
				
				if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0 && global.CHAR[global.glSelect3, 4] >= 10 && global.CLASS[global.CHAR[global.glSelect3, 3], 36] < 2)
				{
					global.options[global.nOptions] = "Use";
					global.nOptions++;
				}
				if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] > 0)
				{
					global.options[global.nOptions] = "Use";
					global.nOptions++;
				}
				if(CanUse(global.glSelect3, item) && global.CHAR[global.glSelect3, 56] != itemIndex)
				{
					global.options[global.nOptions] = "Equip";
					global.nOptions++;
				}
				global.options[global.nOptions] = "Discard";
				global.nOptions++;
			}
			else
			{
				opSize = 1;
				audio_play_sound(sfx_select, 0, 0);
				
				opTrade = global.glSelect2;
				if(global.glSelect2 == 0)
				{
					global.showOptions = 11;
					global.glSelect2 = 1;
					AddItemsList(global.glSelect2 + 9, global.glSelect3);
					
					index1trade = global.glSelect;
					char1trade = global.glSelect3;
					select1trade = global.glSelect;
				}
				else
				{
					global.showOptions = 12;
					global.glSelect2 = 0;
					
					index1trade = itemIndex;
					char1trade = itemCharSel;
					select1trade = global.glSelect;
				}
				global.glSelect = 0;
			}
		}
		else
		{
			global.nOptions = 0;
			
			global.options[global.nOptions] = "Take";
			global.nOptions++;
			global.options[global.nOptions] = "Trade";
			global.nOptions++;
			if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] == 0 && global.CHAR[global.glSelect3, 4] >= 10 && global.CLASS[global.CHAR[global.glSelect3, 3], 36] < 2)
			{
				global.options[global.nOptions] = "Use";
				global.nOptions++;
			}
			if(global.ITEM[item, 3] == 3 && global.ITEM[item, 4] > 0)
			{
				global.options[global.nOptions] = "Use";
				global.nOptions++;
			}
			/*
			if(global.ITEM[item, 3] == 0 && global.ITEM[item, 4] != 0)
			{
				global.options[global.nOptions] = "Use";
				global.nOptions++;
			}
			*/
			global.options[global.nOptions] = "Discard";
			global.nOptions++;
		}
		exit;
	}
	
	if(global.showOptions == 10)
	{
		if(opSize > 0)opSize -= 1 / 5;
		if(opSize <= 0)opSize = 0;
		
		if(global.controlsType > 0)
		{
			if(global.upKey_state == 1)
			{
				if(global.glSelect4 > 0) global.glSelect4 --; else global.glSelect4 = global.nOptions - 1;
				audio_play_sound(sfx_scroll, 0, 0);
			}
			if(global.downKey_state == 1)
			{
				if(global.glSelect4 < global.nOptions - 1)global.glSelect4 ++; else global.glSelect4 = 0;
				audio_play_sound(sfx_scroll, 0, 0);
			}
		}
		if(global.Akey_state == 1 && item != -1)
		{
			if(global.options[global.glSelect4] == "Store")
			{
				//show_message(ds_list_size(global.CHAR[100, 49]));
				
				//show_message(ds_list_size(global.CHAR[100, 49]));
				
				DiscardItem(global.glSelect3, global.glSelect);
				UpdateStatsGlobal(global.glSelect3);
				EquipFirstWeaponGlobal(global.glSelect3);
				
				MoveEquipTop(global.glSelect3);
				
				ds_list_add(global.CHAR[100, 49], item);
				ds_list_add(global.CHAR[100, 50], uses);
				
				if(global.glSelect > 0 && global.glSelect >= ds_list_size(global.CHAR[global.glSelect3, 49]))global.glSelect --;
				
				opSize = 1;
				global.showOptions = 0;
				audio_play_sound(sfx_select, 0, 0);
				
				AddItemsList(10, global.glSelect3);
			}
			if(global.options[global.glSelect4] == "Trade")
			{
				opSize = 1;
				audio_play_sound(sfx_select, 0, 0);
				
				opTrade = global.glSelect2;
				if(global.glSelect2 == 0)
				{
					global.showOptions = 11;
					global.glSelect2 = 1;
					AddItemsList(global.glSelect2 + 9, global.glSelect3);
					
					index1trade = global.glSelect;
					char1trade = global.glSelect3;
					select1trade = global.glSelect;
				}
				else
				{
					global.showOptions = 12;
					global.glSelect2 = 0;
					
					index1trade = itemIndex;
					char1trade = itemCharSel;
					select1trade = global.glSelect;
				}
				global.glSelect = 0;
			}
			if(global.options[global.glSelect4] == "Take")
			{
				if(ds_list_size(global.CHAR[global.glSelect3, 49]) < 5)
				{
					DiscardItem(itemChar, itemIndex);
					
					EquipFirstWeaponGlobal(global.glSelect3);
					
					MoveEquipTop(global.glSelect3);
					
					if(global.glSelect >= ds_list_size(itemindexList) - 1)global.glSelect --;
				
					opSize = 1;
					global.showOptions = 0;
					audio_play_sound(sfx_select, 0, 0);
					
					ds_list_add(global.CHAR[global.glSelect3, 49], item);
					ds_list_add(global.CHAR[global.glSelect3, 50], uses);
					
					if(global.glSelect2 < 11)
					{
						AddItemsList(global.glSelect2 + 9, global.glSelect3);
					} else
					if(global.glSelect2 == 11)
					{
						AddItemsList(-1, global.glSelect3);
					}
				} else audio_play_sound(sfx_error, 0, 0);
			}
			if(global.options[global.glSelect4] == "Equip")
			{
				EquipGlobal(global.glSelect3, global.glSelect);
				MoveEquipTop(global.glSelect3);
				
				opSize = 1;
				global.showOptions = 0;
				audio_play_sound(sfx_select, 0, 0);
			}
			if(global.options[global.glSelect4] == "Discard")
			{
				DiscardItem(itemChar, itemIndex);
				opSize = 1;
				global.showOptions = 0;
				audio_play_sound(sfx_select, 0, 0);
				if(global.glSelect2 < 11)
				{
					AddItemsList(global.glSelect2 + 9, global.glSelect3);
				} else
				if(global.glSelect2 == 11)
				{
					AddItemsList(-1, global.glSelect3);
				}
			}
			if(global.options[global.glSelect4] == "Use")
			{
				if(global.ITEM[item, 3] == 0)
				{
					UseItemGlobal(global.glSelect3, item);
					DecreaseUsesGlobal(global.glSelect3, itemIndex);
				
					opSize = 1;
					global.showOptions = 0;
					audio_play_sound(sfx_select, 0, 0);
				}
				if(global.ITEM[item, 3] == 3)
				{
					//eek
					var subtype = global.ITEM[item, 4];
					switch(subtype)
					{
						case 0:
							Promotion(global.glSelect3, itemChar, itemIndex);
							tempVar10 = itemChar;
							tempVar11 = itemIndex;
							audio_play_sound(sfx_select, 0, 0);
						
							break;
						case 1:
							
							//openbox
							
								tempVar = 1;
								tempVar3 = 1;
								tempVar7 = gamestate;
								gamestate = "events";
								guiTimer = 0;
								guiTimer2 = 0;
								tempVar8 = -100;
								
								ds_list_clear(global.recDrops);
								ds_list_clear(global.recDropsAm);
								
								global.showOptions = 0;
								global.glSelect4 = 0;
								
								DiscardItem(itemChar, itemIndex);
								AddItemsList(10, global.glSelect3);
								if(ds_list_size(itemindexList) == 0)global.glSelect = -1;
								
								

								//IRON
								var amount = 0, item = 39, chance = round(-50 + (((global.gamelevel + 120) * 2) - (0.0075 * ((global.gamelevel + 120) * (global.gamelevel + 120)))));
								if(chance < 10)chance = 10;
								if(chance > 90)chance = 90;
								repeat(5)
								{
									if(floor(random(101)) < chance)amount ++;
								}
								if(amount > 0)
								{
									ds_list_add(global.recDrops, item);
									ds_list_add(global.recDropsAm, amount);
								}
								
								//STEEL
								amount = 0
								item = 40
								chance = round(-50 + (((global.gamelevel + 120) * 2) - (0.0075 * ((global.gamelevel + 120) * (global.gamelevel + 120)))));
								if(chance < 10)chance = 10;
								if(chance > 90)chance = 90;
								repeat(5)
								{
									if(floor(random(101)) < chance)amount ++;
								}
								if(amount > 0)
								{
									ds_list_add(global.recDrops, item);
									ds_list_add(global.recDropsAm, amount);
								}
								
								//SILVER
								amount = 0
								item = 41
								chance = round(-90 + (((global.gamelevel + 60) * 2.2) - (0.007 * ((global.gamelevel + 60) * (global.gamelevel + 60)))));
								if(chance < 15)chance = 15;
								if(chance > 90)chance = 90;
								repeat(5)
								{
									if(floor(random(101)) < chance)amount ++;
								}
								if(amount > 0)
								{
									ds_list_add(global.recDrops, item);
									ds_list_add(global.recDropsAm, amount);
								}
								
								//GOLD
								amount = 0
								item = 42
								chance = round(-30 + (((global.gamelevel + 30) * 0.9) - (0.02 * (power(global.gamelevel + 30, 1.6)))));
								if(chance < 5)chance = 5;
								if(chance > 90)chance = 90;
								repeat(5)
								{
									if(floor(random(101)) < chance)amount ++;
								}
								if(amount > 0)
								{
									ds_list_add(global.recDrops, item);
									ds_list_add(global.recDropsAm, amount);
								}
								
								//SANDY
								amount = 0
								item = 43
								chance = round(-15 + (((global.gamelevel) * 0.38) - (0.02 * (power(global.gamelevel, 1.4)))));
								if(chance < 0)chance = 0;
								if(chance > 90)chance = 90;
								repeat(5)
								{
									if(floor(random(101)) < chance)amount ++;
								}
								if(amount > 0)
								{
									ds_list_add(global.recDrops, item);
									ds_list_add(global.recDropsAm, amount);
								}
								if(floor(random(101)) < 50)
								{
									ds_list_add(global.recDrops, 101);
									ds_list_add(global.recDropsAm, 1);
								}
								
								tempVar11 = -1;
								tempVar10 = 0;
				
								audio_play_sound(sfx_openbox, 0, 0);
						
							break;
							
							
								case 2:
								
								tempVar = 1;
								tempVar3 = 1;
								tempVar7 = gamestate;
								gamestate = "events";
								guiTimer = 0;
								guiTimer2 = 0;
								tempVar8 = -100;
								
								ds_list_clear(global.recDrops);
								ds_list_clear(global.recDropsAm);
								
								global.showOptions = 0;
								global.glSelect4 = 0;
								
								DiscardItem(itemChar, itemIndex);
								AddItemsList(10, global.glSelect3);
								if(ds_list_size(itemindexList) == 0)global.glSelect = -1;
								
								
								var level = (global.gamelevel - 10) / 15;
								if (level mod 3 == 0)
								{
									ds_list_add(global.recDrops, 45);
									ds_list_add(global.recDropsAm, 1);
									ds_list_add(global.recDrops, 97);
									ds_list_add(global.recDropsAm, 1);
								}
								if (level + 2 mod 12 == 0)
								{
									ds_list_add(global.recDrops, 60);
									ds_list_add(global.recDropsAm, 1);
								}
								if (level mod 6 == 0)
								{
									ds_list_add(global.recDrops, 59);
									ds_list_add(global.recDropsAm, 1);
								}
								if ((level + 1) mod 3 == 0)
								{
									ds_list_add(global.recDrops, 48);
									ds_list_add(global.recDropsAm, 1);
								}
								if ((level - 1) mod 3 == 0)
								{
									ds_list_add(global.recDrops, 49);
									ds_list_add(global.recDropsAm, 1);
								}
								
								var nCrystals = choose(2, 3);
								repeat(nCrystals)
								{
									ds_list_add(global.recDrops, choose(50, 51, 52, 53));
									ds_list_add(global.recDropsAm, 1);
								}
								
								ds_list_add(global.recDrops, 44);
								ds_list_add(global.recDropsAm, choose(1, 2));
								
								if ((level - 1) mod 2 == 0)
								{
									ds_list_add(global.recDrops, choose(68, 93, 94, 95, 96));
									ds_list_add(global.recDropsAm, 1);
								}
								if ((level) mod 2 == 0)
								{
									ds_list_add(global.recDrops, choose(46, 47));
									ds_list_add(global.recDropsAm, 1);
									ds_list_add(global.recDrops, 75);
									ds_list_add(global.recDropsAm, 1);
								}
								
								tempVar11 = -1;
								tempVar10 = 0;
				
								audio_play_sound(sfx_openbox, 0, 0);
								
								break;
								
							case 3:
							
								tempVar = 1;
								tempVar3 = 1;
								tempVar7 = gamestate;
								gamestate = "events";
								guiTimer = 0;
								guiTimer2 = 0;
								tempVar8 = -100;
								
								ds_list_clear(global.recDrops);
								ds_list_clear(global.recDropsAm);
								
								global.showOptions = 0;
								global.glSelect4 = 0;
								
								DiscardItem(itemChar, itemIndex);
								AddItemsList(10, global.glSelect3);
								if(ds_list_size(itemindexList) == 0)global.glSelect = -1;
							
								ds_list_add(global.recDrops, choose(54, 55, 56, 57, 58, 67));
								ds_list_add(global.recDropsAm, choose(1, 2));
								ds_list_add(global.recDrops, choose(54, 55, 56, 57, 58, 67));
								ds_list_add(global.recDropsAm, choose(2, 3));
								
								ds_list_add(global.recDrops, 66);
								ds_list_add(global.recDropsAm, choose(1, 2));
								
								
								tempVar11 = -1;
								tempVar10 = 0;
				
								audio_play_sound(sfx_openbox, 0, 0);
								
								break;
					}
				}

			}
			/*
			if(global.glSelect2 < 8)
			{
				
			} else
			if(global.glSelect2 == 8)
			{
				AddItemsList(-1);
			}
			*/
			exit;
		}
		
		if(global.Bkey_state == 1)
		{
			opSize = 1;
			global.showOptions = 0;
			xScroll = 0;
			audio_play_sound(sfx_back, 0, 0);
			
			exit;
		}
	}
	else if(global.showOptions == 0)
	{
		if(opSize4 > 0)opSize4 -= 1 / 5;
		if(opSize4 <= 0)opSize4 = 0;
	}
	
	if(global.glSelect2 > 0)
	{
		lastOp = global.glSelect;
	}
	
	if(global.showOptions > 10)
	{
		if(global.Bkey_state == 1)
		{
			opSize = 1;
			global.glSelect2 = opTrade;
			global.glSelect = index1trade;
			
			global.showOptions = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
		
		if(global.Akey_state == 1 && global.glSelect >= 0)
		{
			var char2trade = noone;
			
			if(global.showOptions == 11)
			{
				index2trade = itemIndex;
				char2trade = itemCharSel;
			}
			else
			{
				index2trade = global.glSelect;
				char2trade = global.glSelect3;
			}
			
			TradeItemsGlobal(index1trade, index2trade, char1trade, char2trade);
			audio_play_sound(sfx_select, 0, 0);
			
			if(global.showOptions == 12)
			{
				if(opTrade < 11)
				{
					AddItemsList(opTrade + 9, global.glSelect3);
				} else
				if(opTrade == 11)
				{
					AddItemsList(-1, global.glSelect3);
				}
			}
			else
			{
				if(global.glSelect2 < 11)
				{
					AddItemsList(global.glSelect2 + 9, global.glSelect3);
				} else
				if(global.glSelect2 == 11)
				{
					AddItemsList(-1, global.glSelect3);
				}
			}
			
			opSize = 1;
			global.glSelect2 = opTrade;
			global.glSelect = select1trade;
			
			if(global.glSelect2 == 0)
			{
				if(global.glSelect > 0 && global.glSelect > ds_list_size(global.CHAR[global.glSelect3, 49]) - 1)global.glSelect --;
			}
			else
			{
				if(global.glSelect > ds_list_size(itemindexList) - 1)global.glSelect --;
			}
			
			EquipFirstWeaponGlobal(global.glSelect3);
			MoveEquipTop(global.glSelect3);
			
			if(itemChar != 100)
			{
				EquipFirstWeaponGlobal(itemChar);
				MoveEquipTop(itemChar);
			}
			
			global.showOptions = 0;
			exit;
		}
	}
}
				
if(gamestate == "changeclass")
{
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	var total = ds_list_size(classList);
	if(global.glSelect4 == 0)
	{
		if(global.controlsType > 0 && total > 1)
		{
			if(global.upKey_state == 1 || (global.upKey_state mod 4 == 0 && global.upKey_state > 15))
			{
				if(global.glSelect2 > 0)
				{
					global.glSelect2 --;
					if(tempVar2 > 1)tempVar2 --;
				}
				else
				{
					global.glSelect2 = total - 1;
					tempVar2 = 4;
				}
				if(global.glSelect2 <= 0)global.lockKeys = 1;
				audio_play_sound(sfx_scroll, 0, 0);
			
			
				UpdateClassChange(ds_list_find_value(classList, global.glSelect2));
			}
			if(global.downKey_state == 1 || (global.downKey_state mod 4 == 0 && global.downKey_state > 15))
			{
				if(global.glSelect2 < total - 1)
				{
					global.glSelect2 ++;
					if(tempVar2 < 4)tempVar2 ++;
				}
				else
				{
					global.glSelect2 = 0;
					tempVar2 = 0;
				}
				audio_play_sound(sfx_scroll, 0, 0);
			
				UpdateClassChange(ds_list_find_value(classList, global.glSelect2));
			}
		}
	
		if(global.Akey_state == 1)
		{
			global.glSelect4 = 1;
			global.glSelect5 = 2;
			audio_play_sound(sfx_showOptions, 0, 0);
			exit;
		}
	
		if(global.Bkey_state == 2)
		{
			if(instance_exists(obj_game))
			{
				if(global.phase != -1)
				{
					//CCHANGE
					with obj_game
					{
						/*
						global.selectedActor.index = 0;
						global.selectedActor.state = "idle";
				
						//audio_play_sound(sfx_back, 0, 0);
						global.target = noone;
						global.selectedActor = noone;
	
						CleanNodes();
						*/
						global.itemOptions = 0;
						//audio_play_sound(sfx_back, 0, 0);
				
						//if(global.controlsType == 0)window_mouse_set(100 * global.ww, (160 + (global.opSelect * 19) * 2) * global.hh);
				
						//global.opSelect = 0;
						global.opSelect2 = 0;
						with global.selectedActor OpenOptions();
						global.opSelect4 = 0;
						gamestate = "action";
					}
				}
			}
		
			ds_list_destroy(classList);
			gamestate = tempVar8;
			global.glSelect2 = tempVar7;
			audio_play_sound(sfx_back, 0, 0);
			global.CHAR[global.glSelect3, 3] = tempVar9;
			exit;
		}
	}
	if(global.glSelect4 == 1)
	{
		if(global.Bkey_state == 1)
		{
			global.glSelect4 = 0;
			audio_play_sound(sfx_back, 0, 0);
			exit;
		}
		if(global.Akey_state == 1)
		{
			//BCHANGE
			if(global.glSelect5 == 1)
			{
				audio_play_sound(sfx_select, 0, 0);
				var charID = global.glSelect3;
				
				var oldSP = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2);

				for(var i = 0; i < 8; i ++)
				{
					global.CHAR[charID, 14 + i] -= global.CLASS[tempVar9, 24 + i];
					global.CHAR[charID, 14 + i] += global.CLASS[global.CHAR[charID, 3], 24 + i];
				}
			
				global.CHAR[charID, 32] -= global.CLASS[tempVar9, 37];
				global.CHAR[charID, 32] += global.CLASS[global.CHAR[charID, 3], 37];
			
			
				ds_list_clear(nup);

				for(var i = 0; i < 8; i ++)
				{
					global.CHAR[charID, 6 + i] += 2;
					ds_list_add(nup, i);
					ds_list_add(nupVal, 2);
				}
				
				var newSP = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2); //SP
				global.CHAR[charID, 70] = newSP;
			
			
				if(instance_exists(obj_game))
				{
					if(obj_game.state != "game")
					{
						with obj_game audio_sound_gain(musPreparation, 0, 500);
					}
					else
					{
						with obj_musPlayer event_user(2);
						with(obj_unit)
						{
							if(characterID == charID)
							{
								SP += floor(newSP - oldSP);
								MAXSP += floor(newSP - oldSP);
								for(var i = 0; i < ds_list_size(other.nup); i ++)
								{
									StatsBuff(ds_list_find_value(other.nup, i), ds_list_find_value(other.nupVal, i));
								}
								if(MAXMP == MP)
								{
									MP = global.CHAR[charID, 32];
									MAXMP = MP;
								}
								else MAXMP = global.CHAR[charID, 32];
							}
						}
						
					}
				}
				else
				{
					AddItemsList(10, global.glSelect3);
					DiscardItem(tempVar10, tempVar11);
					if(ds_list_size(itemindexList) == 0)global.glSelect = -1;
				}
				StopMus();
				
			
			global.CHAR[global.glSelect3, 4] = 1;
			global.CHAR[global.glSelect3, 5] = 0;
			


			gamestate = "classchangewait";

			instance_create_depth(0, 0, -26000, obj_classChange);
			guiStep = 2;

			guiTimer = 0;
			guiTimer2 = 0;
			if(instance_exists(obj_game) && obj_game.state != "game")
			{
				with(obj_unit)
				{
					if(characterID == charID)
					{
						RefreshChar(id);
					}
				}
			}
			}
			else
			{
				global.glSelect4 = 0;
				audio_play_sound(sfx_back, 0, 0);
			}
		}
		if(global.rightKey_state == 1)
		{
			global.glSelect5 = 2;
			audio_play_sound(sfx_scroll, 0, 0);
		}
		if(global.leftKey_state == 1)
		{
			global.glSelect5 = 1;
			audio_play_sound(sfx_scroll, 0, 0);
		}
	}
}

if(gamestate == "changeclass2")
{
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
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
		if(global.CHAR[global.glSelect3, 54] != -1)audio_play_sound(global.CHAR[global.glSelect3, 54], 0, 0);
	}
	for(var i = 0; i < nupshow; i ++)
	{
		if(nupshowy[i] < 1)nupshowy[i] += 1 / 10;
	}
	if(nupshow == ds_list_size(nup) && guiTimer3 > 0 && guiTimer3 <= 30)guiTimer3 ++;
	if(guiTimer3 > 30)
	{
		var levelQuote = "Time to start building up some experience.";
			
		guiTimer3 = -1;
		guiTimer4 = 1000;
		Dialogue(global.glSelect3, levelQuote);
		SetLeftCharacter(global.glSelect3);
		DialogueStart(0, -1, 1);
	}
}
if(gamestate == "changeclass3")
{
	tcindex = 0;
	tindex += 0.1;
	if(tindex >= 4)tindex = 0;
	if(guiTimer > 0)guiTimer -= 2;
	if(guiTimer2 > 0)guiTimer2 -= 2;
	if(guiTimer <= 0)
	{
		ds_list_destroy(classList);
		gamestate = tempVar8;
		global.glSelect2 = tempVar7;
			
		sfxTimer = 0;
		guiTimer = 0;
		guiTimer2 = 0;
		guiTimer3 = 0;
		guiTimer4 = 0;
		guiStep = 0;
		global.showXP = 0;
		global.charlevelup = noone;

		nup = ds_list_create();
		nupshow = 0;
		for(var i = 0; i < 8; i ++)
		{
			statup[i] = 0;
			nupshowy[i] = 0;
		}
			
		with obj_classChange instance_destroy();
	}
}

sinWave += 0.05;
if(sinWave > degtorad(360))sinWave = 0;
sinVal = sin(sinWave * 4);
sinWave2 += 0.125;
if(sinWave2 > degtorad(360))sinWave2 = 0;
sinVal2 = sin(sinWave2 / 2);

if(global.simpleFadeout > 0)
{
	global.simpleFadeout -= global.simpleFadeoutsp;
}