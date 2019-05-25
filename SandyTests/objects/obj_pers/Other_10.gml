/// @description Insert description here
// You can write your code in this editor
state = "idle";

switch(global.currentScene)
{
	case -1:
	
	global.currentScene = 3;
	NextScene();
	exit;
	
	break;
	case 0:
		gamestate = "idle";
		showMap = false;
		ResetDialogue();
	
		SetRightCharacter(0);
		SetBackground(bk_hallway);
		PlayMusic(mus_ragingdark, 1);
		
		Dialogue(0, "Lady Evinya, Lady Sandy!");
		
		SetLeftCharacter(1);
		Dialogue(1, "Zech, how many times have I told you to drop the formalities around me?");
		
		Dialogue(0, "Ah sorry, Lady Sandy. I just need to report that Arsenis...");
		
		Dialogue(1, "...");
		
		Dialogue(0, "Arsenis was captured.");
		
		SwitchLeftCharacter(2);
		
		Dialogue(2, "Oh no, Arsenis?");
		
		Dialogue(0, "Yes, Sir Arsenis. He was captured by a pack of bandits while going on patrol duty.");
		
		Dialogue(2, "Zech, tell General Fire and her platoon to search that area. We cannot lose more men.");
		
		SwitchRightCharacter(1);
		
		Dialogue(1, "Wait Evinya! I can lead this mission! 100%.");
		
		Dialogue(2, "With all due respect Sadness, we don't know how dangerous these bandits may be.");
		
		Dialogue(1, "Hah, bandits? If I've learned anything, bandits are easy to outsmart!");
		Dialogue(1, "(They better be, since I programmed them...)");
		
		Dialogue(2, "Hmm okay! But I'm definitely sending you some help.");
		Dialogue(2, "You are our queen, and your subjects need you!");
		Dialogue(1, "Yep yep.");
		
		LeftCharacterLeave();
		RightCharacterLeave();
		
		SetLeftCharacter(0);
		SetRightCharacter(2);
		//StopMusic(1);
		SetBackgroundFade(bk_hilltop, 1000, 1000, 500, c_black);
		
		PlayMusic(sfx_birds, 4);
		Dialogue(0, "Evinya, we're heading out.");
		Dialogue(2, "All of you, be careful!");
		
		SwitchRightCharacter(3);
		
		Dialogue(3, "Stay safe, guys. I'd go, but I think Lukas needs me more right now.");
		Dialogue(0, "How is he taking this situation?");
		Dialogue(3, "...Not well, unfortunately. However, I have faith that our buddy, Arsenis will be brought back.");
		
		SwitchRightCharacter(4);
		
		Dialogue(4, "We got it! Leave it to me! Remember, Eggs is always sunny side up! ");
		
		SwitchRightCharacter(1);
		
		Dialogue(1, "Somehow I hope my men are the serious type of soldiers...");
		
		SetBackgroundFade(-1, 1000, 1000, 0, c_black);
		StopMusic(2);

		DialogueStart(0, -1, 0);
		//show_message("");
		
		//next scene
		global.currentScene ++;
	
		break;
	case 1:
	
		GenerateEnemies(50, 13, -1);
		GenerateEnemies(51, 12, -1);
		GenerateEnemies(52, 14, -1);
		GenerateEnemies(53, 14, -1);
		
		GenerateEnemies(54, 14, -1);
		GenerateEnemies(55, 11, -1);
		GenerateEnemies(56, 13, -1);
		
		GenerateEnemies(57, 13, -1);
		GenerateEnemies(58, 11, -1);
		GenerateEnemies(59, 3, -5);

			
		global.currentMap = 1;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "idle";
		showMap = false;
		
		break;
	
	case 2:
	
		gamestate = "idle";
		showMap = false;
		ResetDialogue();
	
		SetLeftCharacter(5);
		PlayAmbient(sfx_rain, 2);
		PlayMusic(mus_dimabyss, 1);
		
		//SetRightCharacter(2);
		//SetBackground(bk_hallway);
		//PlayMusic(mus_silly, 1);
		
		Dialogue(5, "...");
		
		SetRightCharacter(0);
		
		Dialogue(0, "What do you see, Mark?");
		
		Dialogue(5, "...We're all dead. Just kidding! ...Er, well, someone probably dies at least. ");
		
		SwitchRightCharacter(4);
		
		Dialogue(4, "Ladies and gentlemen, our brilliant tactician.");
		
		SetExpression(5, 3);
		Dialogue(5, "Hey buddy, at least I'm not locked at 2 range!");
		
		Dialogue(4, "At least I'm playable!");
		
		SwitchLeftCharacter(1);
		
		Dialogue(1, "Pay attention! Our enemies have spotted us! Mark, stay back!");
		Dialogue(1, "It would be best if you sat out for this battle, we can't afford to lose our only tactician!");

		//StopMusic(2);

		DialogueStart(0, -1, 0);
		//show_message("");
		
		global.currentScene ++;
	
	break;
	case 3:
	
		CameraBoss();
		
		gamestate = "idle";
		showMap = false;
		ResetDialogue();
	
		SetLeftCharacter(obj_game.healUnit.characterID);
		PlayMusic(mus_danger, 1);
		
		Dialogue(obj_game.healUnit.characterID, "Looks like some idiots have stumbled upon our camp...");
		Dialogue(obj_game.healUnit.characterID, "Well, you know what we do with intruders!");
		StopAmbient(1);
		StopMusic(1);
		
		DelayedDialogue(80);
		
		global.currentScene ++;
	
		break;
	case 4:
	
		StartBattle();
		global.currentScene ++;
		obj_game.reinScene = 1; //this will tell the game that in a few turns reinforcements will come
		
		break;
		
	case 5:
	
		gamestate = "idle";
		showMap = false;
		ResetDialogue();
	
		SetLeftCharacter(5);
		//PlayAmbient(sfx_rain, 2);
		//SetRightCharacter(2);
		//SetBackground(bk_hallway);
		//PlayMusic(mus_silly, 1);
		
		SetExpression(5, 5);
		Dialogue(5, "Is that... Lukas? I thought Meeerrpe was with him back at the castle!");
		
		SwitchLeftCharacter(6);
		
		Dialogue(6, "You think that you guys could just rescue Arsenis without me?");
		Dialogue(6, "I'll show you how helpful I can be.");

		DialogueStart(1, -1, 0);
		//show_message("");
		
		global.currentScene ++;
		
		break;
		
	case 6:
		
		ResumeGame();
		
		break;

	case 7:
		gamestate = "idle";
		showMap = false;
		StopAmbientSound();
		ResetDialogue();
	
		SetLeftCharacter(1);
		//SetBackground(bk_hilltop2);
		SetBackgroundFade(bk_hilltop2, 1000, 1000, 0, c_black);
		PlayMusic(mus_ragingdark, 1);
		
		Dialogue(1, "Hurry, Arsenis should be around here.");
		
		SetRightCharacter(6);

		Dialogue(6, "Yes, let me look.");
		Dialogue(1, "Wait, Lukas, why are you here?");
		
		Dialogue(6, "What does it look like I'm doing? I'm rescuing Arsenis.");
		Dialogue(6, "There's no way you guys could've gone through that without me.");
		
		Dialogue(1, "You have to trust us Lukas!");
		
		SwitchLeftCharacter(5);
		
		SetExpression(5, 5);
		Dialogue(5, "Lukas, there's a reason why Meeerrpe stayed with you.");
		
		Dialogue(6, "Meeerrpe's like a brother to me, so of course he stayed.");
		
		SetExpression(5, 3);
		Dialogue(5, "No, Lukas. you aren't ready for this just yet, you could've been killed.");
		
		Dialogue(6, "Mark, I am a strong man.");
		
		SetExpression(5, 5);
		Dialogue(5, "...");
		
		SwitchLeftCharacter(0);
		
		Dialogue(0, "Lukas, just please, go back to the castle. Evinya must be worried about you.");
		
		Dialogue(6, "Are you serious? I'm so sick of you guys treating me like this.");
		
		Dialogue(6, "I was way more useful than Eggs over there, don't you think I deserve some praise?");
		
		Dialogue(0, "Lukas, you did fine but you were meant to stay in the castle.");
		Dialogue(0, "We've got plenty to worry about as it is.");
		
		Dialogue(6, "Hah, now I'm dead weight? I can't believe you people.");
		Dialogue(6, "You know what? I'm going to find Arsenis by myself, I don't need your help.");
		
		SetExpression(5, 5);
		SwitchRightCharacter(5);
		
		Dialogue(5, "Lukas, wait!");
		
		Dialogue(0, "Sigh. I'll stop him.");
		
		LeftCharacterLeave();
		SwitchRightCharacter(1);
		Dialogue(1, "Oh noo! Let's try to catch up!!");
		
		RightCharacterLeave();
		
		SetBackgroundFade(-2, 1000, 1000, 0, c_black);
		StopMusic(2);

		DialogueStart(0, -1, 0);
		//show_message("");
		
		//next scene
		global.currentScene ++;
	
		break;
		
	case 8:
	
		//end and return to map
		ResetDialogue();
		sys_SetBackgroundFade(-2, 1000, 1000, 500, c_black);
		state = "dialogue";
		
		break;
		
	case 9:
		gamestate = "idle";
		showMap = false;
		ResetDialogue();
	
		SetRightCharacter(0);
		SetLeftCharacter(1);
		SetBackground(bk_forestnight);
		PlayMusic(mus_wistful, 1);
		
		SetExpression(1, 2);
		Dialogue(0, "Sandy.. I think we should turn back.");
		Dialogue(1, "No way, and leave Lukas behind?");
		
		Dialogue(0, "You know very well you're running into enemy territory.");
		Dialogue(0, "I have to protect you, I have to protect all of us.");
		
		Dialogue(1, "Lukas is one of us, aren't you going to protect him?");
		
		Dialogue(0, "Sadness, I understand thi-");
		
		SwitchRightCharacter(5);
		SetExpression(5, 5);
		Dialogue(5, "Uhm.. Guys, I think we're being surrounded.");
		
		SetExpression(1, 0);
		Dialogue(1, "Yeah whatever, we're going to find Lukas, let's go.");
		
		SwitchRightCharacter(0);
		Dialogue(0, "Sandy, didn't you hear Mark just now? ");
		
		SetExpression(1, 2);
		Dialogue(1, "I don't see anything?");
		
		SwitchRightCharacter(5);
		SetExpression(5, 3);
		Dialogue(5, "Wait.. Is that...");
		
		SwitchRightCharacter(7);
		
		Dialogue(7, "Sadness!");
		
		SetExpression(1, 0);
		Dialogue(1, "Oh, it's you guys.");
		Dialogue(7, "We've come to get you guys out of this forest!");
		Dialogue(7, "Those bandits that captured Arsenis this morning...they were lackeys.");
		
		SwitchLeftCharacter(8);
		
		Dialogue(8, "Heheh, lackeys.");
		
		Dialogue(7, "Ahem! This means that more men are coming, and very soon.");
		Dialogue(7, "We must make our escape as swiftly as possible.");
		
		SwitchLeftCharacter(4);
		
		Dialogue(4, "Well, this day is just going spectacularly.");
		Dialogue(4, "Nothing beats a failed rescue mission than running for our lives.");
		Dialogue(7, "Eggs, we have no time for such sarcasm. It's time that we move!");
		
		
		LeftCharacterLeave();
		RightCharacterLeave();
		
		SetBackgroundFade(-1, 1000, 1000, 0, c_black);
		StopMusic(2);

		DialogueStart(0, -1, 0);
		//show_message("");
		
		//next scene
		global.currentScene ++;

		break;
	case 10:
	
		GenerateEnemies(50, 9, -1);
		GenerateEnemies(51, 12, -1);
		GenerateEnemies(52, 14, -1);
		GenerateEnemies(53, 17, -1);
		
		GenerateEnemies(54, 14, -1);
		GenerateEnemies(55, 11, -1);
		GenerateEnemies(56, 11, -1);
		GenerateEnemies(57, 17, -1);
		
		GenerateEnemies(58, 10, -1);
		GenerateEnemies(59, 15, -1);
		GenerateEnemies(60, 16, -1);

			
		global.currentMap = 2;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "idle";
		showMap = false;
		
		break;
		
	case 11:
		
		StartBattle();
		global.currentScene ++;
		
		break;
		
	case 12:
	
		GenerateEnemies(50, floor(irandom_range(8, 14)), 1 + floor(random(3)), -1);
			
		global.currentMap = 4;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "idle";
		showMap = false;
		
		break;
		
	case 13:
		
		StartBattle();
		global.currentScene ++;
		
		break;
		
	case 14:
		
		var ran = min(2, round(sqrt(global.gamelevel / 10)));
		for(var i = 50; i < 80; i ++)
		{
			GenerateEnemies(i, floor(global.gamelevel / 10) + floor(random(ran)), -1);
		}
			
		global.currentMap = 4;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "create";
		showMap = false;
		
		break;
		
	case 15:

		var ran = min(2, round(sqrt((global.gamelevel * 1.18 + 16) / 10)));
		for(var i = 50; i < 80; i ++)
		{
			GenerateEnemies(i, floor((global.gamelevel * 1.18 + 16) / 10) + floor(random(ran)), -1);
			if(i < 53)AddItemEnemy(i, 20);
		}
			
		global.currentMap = 8;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "create";
		showMap = false;
	
		break;
		case 16:
	
		var ran = min(2, round(sqrt(global.gamelevel / 10)));
		for(var i = 50; i < 80; i ++)
		{
			GenerateEnemies(i, floor(global.gamelevel / 10) + floor(random(ran)), -1);
		}
			
		global.currentMap = 6;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "create";
		showMap = false;
		
		break;
		case 17:
	
		var ran = min(2, round(sqrt((global.gamelevel * 1.25 + 30) / 10)));
		for(var i = 50; i < 80; i ++)
		{
			GenerateEnemies(i, floor((global.gamelevel * 1.25 + 30) / 10) + floor(random(ran)), -1);
			if(i < 53)AddItemEnemy(i, 20);
		}
			
		global.currentMap = 5;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "create";
		showMap = false;
		
		break;
		
		case 18:

		GenerateEnemies(50, 40, 39);
		GenerateEnemies(51, 40, 39);
		GenerateEnemies(52, 40, 39);
		GenerateEnemies(53, 40, 39);
		
		global.currentMap = 9;
		global.currentStage = global.MAP[global.currentMap, 9];
		room_goto(global.ROOM[global.MAP[global.currentMap, 3]]);
		
		global.currentRegion = global.MAP[global.currentMap, 1];
		
		state = "chapterbegin";
		gamestate = "idle";
		showMap = false;
		
		break;
}