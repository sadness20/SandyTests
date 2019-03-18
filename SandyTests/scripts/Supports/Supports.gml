var char1 = argument[0];
var char2 = argument[1];
var dial = -1;

if((char1 == 0 && char2 == 1) || (char1 == 1 || char2 == 0))dial = 0;
if((char1 == 2 && char2 == 3) || (char1 == 3 || char2 == 2))dial = 1;

if(dial != -1)
{
	gamestate = "dialchangestate";
	//showMap = false;
	ResetDialogue();
	
	if(instance_exists(obj_game))
	{
		with obj_game audio_sound_gain(musPreparation, 0, 500);
		with(obj_globalLight)
		{
			if(ambientsfx != -1)audio_sound_gain(ambientsfx, 0, 500);
		}		
	}
	StopMus();
}

switch(dial)
{
	case 0:
	
	switch(global.SUPPORTS[char1, char2])
	{
		case 0: //rank c
		
		SetLeftCharacter(0);
		SetRightCharacter(1);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);

		Dialogue(0, "Oi.");
		Dialogue(1, "How are you still awake?");
		
		Dialogue(0, ">:)");
		
		Dialogue(1, "...");
		Dialogue(1, "Go to beeeeeed!");
		
		Dialogue(0, "Sleeping is wasting time, I'd rather do work.");
		
		Dialogue(1, "Hmm! so what kind of work are you doing?");
		
		SetExpression(0, 2);
		Dialogue(0, "I'm.. not doing work.");
		
		Dialogue(1, "So you don't sleep because it's a waste of time, but you're still wasting time?");
		
		Dialogue(0, "I'm not motivated.");
		
		Dialogue(1, "You're not motivated because you're tired, so you should sleep!");
		
		Dialogue(0, "...");
		
		Dialogue(1, "I'm going to bed myself, I expect you to do the same very soon!!");
		
		RightCharacterLeave();
		
		Dialogue(0, "...");
		
		SetExpression(0, 0);
		Dialogue(0, ">:)");
		
		StopMusic(1);
		
		
		DialogueStart(0, -1, 0);
		
		break;
		
		case 1:
		
		SetLeftCharacter(0);
		SetRightCharacter(1);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);
		
		Dialogue(0, "Sandy?");
		Dialogue(1, "oui?");
		
		StopMusic(1);
		
		DialogueStart(0, -1, 0);
		
		break;
		
		case 2:
		
		SetLeftCharacter(0);
		SetRightCharacter(1);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);
		
		Dialogue(0, "Hola.");
		Dialogue(1, "Hola!!!");
		
		StopMusic(1);
		
		DialogueStart(0, -1, 0);
		
		break;
	}
	
	break;
	
	case 1:
	
	switch(global.SUPPORTS[char1, char2])
	{
		case 0: //rank c
		
		SetLeftCharacter(2);
		SetRightCharacter(3);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);

		Dialogue(2, "Hello.");
		Dialogue(3, "Bye.");
		
		RightCharacterLeave();
		
		Dialogue(2, "Byebye.");
		
		StopMusic(1);
		
		
		DialogueStart(0, -1, 0);
		
		break;
		
		case 1:
		
		SetLeftCharacter(2);
		SetRightCharacter(3);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);
		
		Dialogue(0, "a");
		Dialogue(1, "b");
		Dialogue(0, "c");
		Dialogue(1, "d");
		
		StopMusic(1);
		
		DialogueStart(0, -1, 0);
		
		break;
		
		case 2:
		
		SetLeftCharacter(2);
		SetRightCharacter(3);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);
		
		Dialogue(0, "e");
		Dialogue(1, "f");
		Dialogue(0, "g");
		Dialogue(1, "h");
		
		StopMusic(1);
		
		DialogueStart(0, -1, 0);
		
		break;
		
		case 3:
		
		SetLeftCharacter(2);
		SetRightCharacter(3);
		SetBackgroundFade(bk_support, 250, 250, 125, c_black);
		PlayMusic(mus_silly, 1);
		
		Dialogue(0, "i");
		Dialogue(1, "j");
		Dialogue(0, "k");
		Dialogue(1, "l");
		
		StopMusic(1);
		
		DialogueStart(0, -1, 0);
		
		break;
	}
	
	break;
}