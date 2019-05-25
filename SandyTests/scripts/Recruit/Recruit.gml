var char = argument[0];
var chance = global.CHAR[char, 40];
var cuchance = global.CHAR[char, 41];

/*
if(cuchance == 0)
{
	global.CHAR[char, 41] = floor(random(101));
	cuchance = global.CHAR[char, 41];
}
*/

ResetDialogue();

SetLeftCharacter(global.OWchar);
SetRightCharacter(char);

SetExpression(1, 0);
if(global.OWchar == 1)
{
	Dialogue(1, "Hey you! This place is super boring don't you think?");
	Dialogue(1, "So why don't you work for me? It's way more fun.");
}
else
{
	Dialogue(global.OWchar, "Don't you want to get out of here?");
	Dialogue(global.OWchar, "Work for us and we'll free you.");
}
	/*
if(cuchance < chance)
{
*/
	SetExpression(char, global.PORT[global.CHAR[char, 1], 3]);
	var dial = choose("Alright.. Just get me out of here...", "As long as I get out of this place...", "Please let me out of this place!");
	Dialogue(char, dial);
	obj_campUnit.su = 1;
	
	if(global.OWchar == 1)Dialogue(1, "Okie! What's your name?");
	else Dialogue(global.OWchar, "What's your name?");
	
	if(global.nrecruited < 18)
	{
		var fillID = -1;
		for(var i = 162; i < 180; i ++)
		{
			if(global.CHAR[i, 0] == "error")
			{
				fillID = i;
				break;
			}
		}
		
		global.armyJoin = fillID;
							
		for(var i = 0; i < 74; i ++)
		{
			if(i != 33 && i != 34 && i != 49 && i != 50 && i != 44)
			{
				global.CHAR[fillID, i] = global.CHAR[char, i];
			} else global.CHAR[fillID, i] = ds_list_create();
		}
		for(var ii = 0; ii < ds_list_size(global.CHAR[char, 33]); ii ++)
		{
			var skill = ds_list_find_value(global.CHAR[char, 33], ii);
			ds_list_add(global.CHAR[fillID, 33], skill);
		}
		for(var ii = 0; ii < ds_list_size(global.CHAR[char, 34]); ii ++)
		{
			var skill = ds_list_find_value(global.CHAR[char, 34], ii);
			ds_list_add(global.CHAR[fillID, 34], skill);
		}
		for(var ii = 0; ii < ds_list_size(global.CHAR[char, 49]); ii ++)
		{
			var skill = ds_list_find_value(global.CHAR[char, 49], ii);
			ds_list_add(global.CHAR[fillID, 49], skill);
		}
		for(var ii = 0; ii < ds_list_size(global.CHAR[char, 50]); ii ++)
		{
			var skill = ds_list_find_value(global.CHAR[char, 50], ii);
			ds_list_add(global.CHAR[fillID, 50], skill);
		}
		if(fillID >= 162 + global.nrecruited)global.nrecruited ++;
		//show_message(ds_list_size(global.charList));
		global.CHAR[fillID, 57] = true;
		global.CHAR[fillID, 58] = true;
		global.CHAR[fillID, 59] = false;
		
		EquipFirstWeaponGlobal(fillID);
				
		//PICK NAME
		var read = "fnames";
		if(global.CHAR[fillID, 2] == 0)read = "mnames";
		var file = file_text_open_read(working_directory + "\\" + read + ".txt");
		var str = "";
				
		var rpos = floor(random(1001));
		while (rpos > 0)
		{
			str = file_text_read_string(file);
			file_text_readln(file);
			rpos --;
		}
		
		global.CHAR[fillID, 0] = str;
				
		global.LEVELDIAL[fillID, 0] = "Wow... Sometimes I surprise even myself!";
		global.LEVELDIAL[fillID, 1] = "Now that's what I call progress!" ;
		global.LEVELDIAL[fillID, 2] = "I can tell I've gotten stronger.";
		global.LEVELDIAL[fillID, 3] = "Hmm, I don't feel very different...";
		global.LEVELDIAL[fillID, 4] = "Maybe I should learn some new skills...";
				
		with obj_pers CharListOrder();
		//ds_list_add(global.charList, fillID);
		//show_message(ds_list_size(global.charList));
		
		global.nprisoners --;
	}
	
	Dialogue(char, str + "." + choose("", "."));
	if(global.OWchar == 1)Dialogue(1, "Alright " + str + "! Let's get you out of here. ♥");
	else Dialogue(global.OWchar, "Okay, let's get you of here.");
	/*
}
else
{
	SetExpression(char, global.PORT[global.CHAR[char, 1], 4]);
	var dial = choose("Piss off.", "Hahah no thanks. Get out of here, trash.", "Never going to fight for you.");
	Dialogue(char, dial);
	SetExpression(1, 2);
	Dialogue(1, "...");
	obj_campUnit.su = 0;
}
*/
DialogueStart(0, -1, 0);