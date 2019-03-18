var charid = tempVar5;
var classID = 0;
var level = global.CHAR[charid, 4];
var classID = global.CHAR[charid, 3];  //skill template

//global.CHAR[charid, 1] = 0; //portrait sprite
//global.CHAR[charid, 2] = 0; //gender

global.CHAR[charid, 5] = 0; //exp

var i = 0;
global.CHAR[charid, 14 + i] = median(10, choose(-10, -5, 0, 5, 10) + 5 * (round((1 / 5) * (global.SKILLTEMPLATE[global.CLASS[classID, 40], i + 1] * ((tempVar6 + 80) / 130)))), 125);
global.CHAR[charid, 6 + i] = round(5 + (global.CHAR[charid, 14 + i] / 6) + (global.CHAR[charid, 14 + i] / 100) * level);
for(var i = 1; i < 8; i ++)
{
	global.CHAR[charid, 14 + i] = median(10, choose(-10, -5, 0, 5, 10) + 5 * (round((1 / 5) * (global.SKILLTEMPLATE[global.CLASS[classID, 40], i + 1] * ((tempVar6 + 80) / 130)))), 125);
	global.CHAR[charid, 6 + i] = round((global.CHAR[charid, 14 + i] / 11) + (global.CHAR[charid, 14 + i] / 100) * level);
}

for(var i = 0; i < 8; i ++)
{
	global.CHAR[charid, 6 + i] = max(global.CHAR[charid, 6 + i], 1);
}

var skill = floor(level / 4);
skill += choose(0, 1);
if(skill > 4)skill = 4;
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

for(var i = 0; i < 10; i ++)
{
	if(global.CLASS[classID, 10 + i])global.CHAR[charid, 22 + i] = skill;
}

global.CHAR[charid, 32] = global.CLASS[classID, 37]; //MP
global.CHAR[charid, 33] = ds_list_create(); //skills
global.CHAR[charid, 34] = ds_list_create(); //activeskills

global.CHAR[charid, 35] = 0; //face
global.CHAR[charid, 36] = 0; //eyes

global.CHAR[charid, 40] = 0; //support rank biarray id
global.CHAR[charid, 41] = 0; //children biarray list

global.CHAR[charid, 42] = 0; //voice id
global.CHAR[charid, 44] = -1; //weaponequip

global.CHAR[charid, 45] = 0; //atk
global.CHAR[charid, 46] = 0; //hit
global.CHAR[charid, 47] = 0; //crit
global.CHAR[charid, 48] = 0; //avo

global.CHAR[charid, 49] = ds_list_create(); //inventory
global.CHAR[charid, 50] = ds_list_create(); //uses

global.CHAR[charid, 51] = false; //xeyecenter
global.CHAR[charid, 52] = false; //yeyecenter
global.CHAR[charid, 53] = 0; //expression

global.CHAR[charid, 54] = -1; //voice1
global.CHAR[charid, 55] = -1; //last expression
global.CHAR[charid, 56] = -1; //weapon inventory link

global.CHAR[charid, 57] = true; //recruited
global.CHAR[charid, 58] = true; //active
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
	
global.CHAR[charid, 70] = global.CHAR[charid, 9] + 5 + floor(global.CHAR[charid, 11] / 2); //SP
global.CHAR[charid, 71] = -1; //SP
global.CHAR[charid, 72] = -1; //death quote
global.CHAR[charid, 73] = 0; //deploy order
global.CHAR[charid, 74] = -1; //personal skill

if(charid <= global.totalChars) global.totalChars++;


var nskills = 1 + floor(global.CHAR[charid, 4] / 5);
var availableSkills = ds_list_create();

repeat(nskills)
{
	ds_list_clear(availableSkills);
					
	for(var i = 0; i < 25; i ++)
	{
		var hasSkill = 0;
		for(var ii = 0; ii < ds_list_size(global.CHAR[charid, 33]); ii ++)
		{
			if(ds_list_find_value(global.CHAR[charid, 33], ii) == i)
			{
				hasSkill = 1;
			}
		}
		if(hasSkill == 0 && i != 10 && i != 17 && i != 22 && global.CHAR[charid, 70] >= global.SKILL[i, 3])ds_list_add(availableSkills, i);
	}
	
	for(var i = 33; i < 37; i ++)
	{
		var hasSkill = 0;
		for(var ii = 0; ii < ds_list_size(global.CHAR[charid, 33]); ii ++)
		{
			if(ds_list_find_value(global.CHAR[charid, 33], ii) == i)
			{
				hasSkill = 1;
			}
		}
		if(hasSkill == 0 && i != 35 && global.CHAR[charid, 70] >= global.SKILL[i, 3])ds_list_add(availableSkills, i);
	}
					
	ds_list_shuffle(availableSkills);
	var newSkill = ds_list_find_value(availableSkills, 0);
					
	if(newSkill != undefined)
	{
		AddSkill(charid, newSkill);
	}
}

ds_list_destroy(availableSkills);