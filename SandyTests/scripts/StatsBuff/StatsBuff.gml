var stat = argument[0];
var might = argument[1];

switch(stat)
{
	case 0:
	
	HP += might;
	MAXHP += might;
	
	break;
	
	
	case 1:
	
	STR += might;
	
	break;
	
	
	case 2:
	
	MAG += might;
	
	break;
	
	
	case 3:
	
	SKILL += might;
	
	break;
	
	
	case 4:
	
	SPD += might;
	
	break;
	
	
	case 5:
	
	LCK += might;
	
	break;
	
	
	case 6:
	
	DEF += might;
	
	break;
	
	
	case 7:
	
	RES += might;
	
	break;
	
	
	case 8:
	
	MAXMP += might;
	MP += might;
	
	break;
}

//show_message(id.characterID);
UpdateStats(id, -1);