var char = argument[0];
var charID = char.characterID;

with char
{
	
	vy = global.CLASS[global.CHAR[charID, 3], 5];
		
	MAXMP = global.CHAR[charID, 32];
	MP = MAXMP;
	
	MAXHP = global.CHAR[charID, 6];
	HP = MAXHP;
		
	MAXSP = global.CHAR[charID, 70];
	SP = MAXSP;
		
		
	//set stats
		
	MAXSTR = global.CHAR[charID, 7]; //str
	STR = MAXSTR;
	MAXMAG = global.CHAR[charID, 8]; //mag
	MAG = MAXMAG;
	MAXSKILL = global.CHAR[charID, 9]; //skill
	SKILL = MAXSKILL
	MAXSPD = global.CHAR[charID, 10]; //spd
	SPD = MAXSPD;
	MAXLCK = global.CHAR[charID, 11]; //lck
	LCK = MAXLCK;
	MAXDEF = global.CHAR[charID, 12] ; //def
	DEF = MAXDEF;
	MAXRES = global.CHAR[charID, 13]; //res
	RES = MAXRES;
}