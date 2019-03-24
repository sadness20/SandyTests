/// @description Insert description here
// You can write your code in this editor

with(obj_pers)
{
	switch(global.selectedActor.standingNode.objectLink.sceneID)
	{
		case 1000:
			ResetDialogue();
	
			SetLeftCharacter(101);
			Dialogue(101, "Have all this stuff!!");
						
			DialogueStart(1, -1, 0);
			
			break;
		
		case 1001:
			ResetDialogue();
	
			SetLeftCharacter(102);
			Dialogue(102, "Hey, I think you dropped this axe.");
						
			DialogueStart(1, -1, 0);
			
			break;
		case 1002:
			ResetDialogue();
	
			SetLeftCharacter(1);
			Dialogue(1, "Wow a compass!");
						
			DialogueStart(1, -1, 0);
			
			break;
	}
}