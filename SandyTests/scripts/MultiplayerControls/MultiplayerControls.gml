		if(global.glSelect2 == 3 && global.glSelect3 == 0 && state != "dialogue")
		{
			//multiplayer main
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
					
						global.glSelect2 = 10;
						text = "" // current text
						caret = 0; // caret position
						keyboard_string = "";
						text2 = "" // current text
						caret2 = 0;
						tempVar = 1;
						fileName = "";
						fileName2 = "";
						audio_play_sound(sfx_select, 0, 0);
					
					break;
					
					case 1:
						
						//select host game
						global.glSelect4 = 0;
						global.glSelect2 = 11;
						RefreshSavesMultiplayer();
						tempVar = 1;
						audio_play_sound(sfx_select, 0, 0);
					
					break;
					
					case 2:
					
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 0;
						RefreshSaves();
						tempVar = 1;
						exit;
					
					break;
				}
				exit;
			}
			if(global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 0;
				RefreshSaves();
				tempVar = 1;
				exit;
			}
		}
		if(global.glSelect2 == 10 && global.glSelect3 == 0 && state != "dialogue")
		{
			//join game
			var total = 4;
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
					keyboard_string = "";
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 <= limit)global.lockKeys = 1;
					if((fileName == "" || fileName2 == "") && global.glSelect4 == 2)global.glSelect4 = 1;
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
					keyboard_string = "";
					audio_play_sound(sfx_scroll, 0, 0);
					if(global.glSelect4 >= total - 1)global.lockKeys = 1;
					if((fileName == "" || fileName2 == "") && global.glSelect4 == 2)global.glSelect4 = 3;
				}
			}
			if(global.glSelect4 == 0 && global.glSelect3 == 0)
			{
				fileName = TextInput(15);
			}
			if(global.glSelect4 == 1 && global.glSelect3 == 0)
			{
				fileName2 = TextInput2(4);
			}
			if(global.Akey_state == 1)
			{
				if(global.glSelect4 == 0)
				{
					global.glSelect2 = 10;
				}
				switch(global.glSelect4)
				{
					case 2:
					
						//join game
					
					break;
					
					case 3:
					
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 3;
						global.glSelect4 = 0;
						//global.glSelect2 = 4;
						RefreshSaves();
						tempVar = 1;
						exit;
					
					break;
				}

				exit;
			}
			if(global.Bkey_state == 1 && global.glSelect4 > 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 3;
				global.glSelect4 = 0;
				RefreshSaves();
				tempVar = 1;
				exit;
			}
		}
		if(global.glSelect2 == 11 && global.glSelect3 == 0 && state != "dialogue")
		{
			//host main
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
					if(global.glSelect4 == 1 && global.nFiles == 0)global.glSelect4 = 0;
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
					if(global.glSelect4 == 1 && global.nFiles == 0)global.glSelect4 = 2;
				}
			}
			if(global.Akey_state == 1)
			{
				switch(global.glSelect4)
				{
					case 0:
					
						//new game
						global.glSelect2 = 13;
						tempVar = 1;
						audio_play_sound(sfx_select, 0, 0);
						text = "" // current text
						caret = 0 // caret position
						keyboard_string = "";
						global.glSelect4 = 0;
					
					break;
					
					case 1:
						
						//continue
						global.glSelect2 = 12;
						global.glSelect4 = 0;
						RefreshSavesMultiplayer();
						tempVar = 1;
						audio_play_sound(sfx_select, 0, 0);
						exit;
					
					break;
					
					case 2:
					
						audio_play_sound(sfx_back, 0, 0);
						global.glSelect2 = 0;
						global.glSelect4 = 0;
						RefreshSavesMultiplayer();
						tempVar = 1;
						exit;
					
					break;
				}

				exit;
			}
			if(global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 3;
				RefreshSaves();
				tempVar = 1;
				exit;
			}
		}
		if(global.glSelect2 == 12 && state != "dialogue")
		{
			//host game continue
			var total = global.nFiles;
			var limit = 0;
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
						if(tempVar2 < 3)tempVar2 ++;
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
			if(global.Akey_state == 1)
			{
				global.currentFile = global.saveFiles[global.glSelect4];
				CleanGame();
				if(LoadGame(global.saveFiles[global.glSelect4]))
				{
					CharListOrder();
					global.glSelect3 = 3;
					ResetDialogue();
				
					sys_SetBackgroundFade(-2, 750, 750, 325, c_black);
					audio_play_sound(sfx_start, 0, 0);
					state = "dialogue";
					CharListOrder();
				}
				else
				{
					RefreshSavesMultiplayer();
					//file doesn't exist
					audio_play_sound(sfx_back, 0, 0);
					global.glSelect2 = 3;
					tempVar = 1;
				}
			}
			if(global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 3;
				RefreshSavesMultiplayer();
				tempVar = 1;
			}
		}
		if(global.glSelect2 == 13 && global.glSelect3 == 0 && state != "dialogue")
		{
			//host game new game
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
						RefreshSavesMultiplayer();
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
								//show_message("");
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
					RefreshSavesMultiplayer();
					tempVar = 1;
				}
			}
			if(global.glSelect4 > 0 && global.Bkey_state == 1)
			{
				audio_play_sound(sfx_back, 0, 0);
				global.glSelect2 = 0;
				RefreshSavesMultiplayer();
				tempVar = 1;
			}
		}