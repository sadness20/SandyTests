var charid =  argument[0];
if(global.CHAR[charid, 33] != -1)
{
	ds_list_destroy(global.CHAR[charid, 33]);
	ds_list_destroy(global.CHAR[charid, 34]);
	ds_list_destroy(global.CHAR[charid, 49]);
	ds_list_destroy(global.CHAR[charid, 50]);
}

global.CHAR[charid, 0] = "error"; //name
global.CHAR[charid, 1] = 0; //portrait sprite
global.CHAR[charid, 2] = 0; //gender

global.CHAR[charid, 3] = 0; //class
global.CHAR[charid, 4] = 0; //level
global.CHAR[charid, 5] = 0; //exp

global.CHAR[charid, 6] = 0; //hp
global.CHAR[charid, 7] = 0; //str
global.CHAR[charid, 8] = 0; //mag
global.CHAR[charid, 9] = 0; //skill
global.CHAR[charid, 10] = 0; //spd
global.CHAR[charid, 11] = 0; //lck
global.CHAR[charid, 12] = 0; //def
global.CHAR[charid, 13] = 0; //res

global.CHAR[charid, 14] = 0; //hpgrowth
global.CHAR[charid, 15] = 0; //strgrowth
global.CHAR[charid, 16] = 0; //maggrowth
global.CHAR[charid, 17] = 0; //skillgrowth
global.CHAR[charid, 18] = 0; //spdgrowth
global.CHAR[charid, 19] = 0; //lckgrowth
global.CHAR[charid, 20] = 0; //defgrowth
global.CHAR[charid, 21] = 0; //resgrowth

global.CHAR[charid, 22] = 0; //swordrank
global.CHAR[charid, 23] = 0; //lancerank
global.CHAR[charid, 24] = 0; //axerank
global.CHAR[charid, 25] = 0; //daggerrank
global.CHAR[charid, 26] = 0; //bowrank
global.CHAR[charid, 27] = 0; //darktome 
global.CHAR[charid, 28] = 0; //lighttome
global.CHAR[charid, 29] = 0; //animaatome
global.CHAR[charid, 30] = 0; //staffrank
global.CHAR[charid, 31] = 0; //stonerank
global.CHAR[charid, 32] = 4; //MP
global.CHAR[charid, 33] = -1; //skills
global.CHAR[charid, 34] = -1; //activeskills

global.CHAR[charid, 35] = 0; //face
global.CHAR[charid, 36] = 0; //eyes
global.CHAR[charid, 37] = 0; //hair ID
global.CHAR[charid, 38] = c_black; //hair color
global.CHAR[charid, 39] = c_black; //eye color

global.CHAR[charid, 40] = 0; //support rank biarray id
global.CHAR[charid, 41] = 0; //children biarray list

global.CHAR[charid, 42] = 0; //voice id
global.CHAR[charid, 43] = -1; //accessory ID
global.CHAR[charid, 44] = -1; //weaponequip

global.CHAR[charid, 45] = 0; //atk
global.CHAR[charid, 46] = 0; //hit
global.CHAR[charid, 47] = 0; //crit
global.CHAR[charid, 48] = 0; //avo

global.CHAR[charid, 49] = -1; //inventory
global.CHAR[charid, 50] = -1; //uses

global.CHAR[charid, 51] = false; //xeyecenter
global.CHAR[charid, 52] = true; //yeyecenter
global.CHAR[charid, 53] = 0; //expression

global.CHAR[charid, 54] = -1; //voice1
global.CHAR[charid, 55] = -1; //last expression
global.CHAR[charid, 56] = -1; //weapon inventory link

global.CHAR[charid, 57] = false; //recruited
global.CHAR[charid, 58] = false; //active
global.CHAR[charid, 59] = false; //activeforfight
	
global.CHAR[charid, 60] = 0; //swordrankxp
global.CHAR[charid, 61] = 0; //lancerankxp
global.CHAR[charid, 62] = 0; //axerankxp
global.CHAR[charid, 63] = 0; //daggerrankxp
global.CHAR[charid, 64] = 0; //bowrankxp
global.CHAR[charid, 65] = 0; //darktomexp
global.CHAR[charid, 66] = 0; //lighttomexp
global.CHAR[charid, 67] = 0; //animaatomexp
global.CHAR[charid, 68] = 0; //staffrankxp
global.CHAR[charid, 69] = 0; //stonerankxp
	
global.CHAR[charid, 70] = 0; //SP
global.CHAR[charid, 71] = -1; //SP
global.CHAR[charid, 72] = -1; //deathquote
global.CHAR[charid, 73] = 0; //deploy order
global.CHAR[charid, 74] = -1; //personal skill