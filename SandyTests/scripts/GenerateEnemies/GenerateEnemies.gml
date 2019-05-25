var charID = argument[0];
var level = argument[1];
var classOverride = argument[2];

if(global.CHAR[charID, 33] != -1)
{
	ds_list_destroy(global.CHAR[charID, 33]);
	ds_list_destroy(global.CHAR[charID, 34]);
	ds_list_destroy(global.CHAR[charID, 49]);
	ds_list_destroy(global.CHAR[charID, 50]);
}

var classList = ds_list_create();
for(var i = 0; i < 37; i ++)
{
	if(level > 20)
	{
		if(global.CLASS[i, 36] == 2 && i != 36)ds_list_add(classList, i);
	}
	else
	if(global.CLASS[i, 36] == 1 && i != 4)ds_list_add(classList, i);
}
if(level > 20)
{
	for(var i = 6; i < 14; i ++)
	{
		global.CHAR[charID, 6 + i] += 2;
	}
}
if(level > 45)
{
	global.CHAR[charID, 4] = 45;
	level = global.CHAR[charID, 4];
}
ds_list_shuffle(classList);
var class = ds_list_find_value(classList, 0);
ds_list_destroy(classList);

global.CHAR[charID, 2] = choose(0, 1); //gender
//global.CHAR[charID, 1] = global.TEMPLATE[templateID, 1]; //portrait sprite

if(classOverride != -1)global.CHAR[charID, 3] = classOverride; else global.CHAR[charID, 3] = class; //class
global.CHAR[charID, 0] = global.CLASS[global.CHAR[charID, 3], global.CHAR[charID, 2] * 2]; //name
global.CHAR[charID, 4] = level; //level
global.CHAR[charID, 5] = 0; //exp

var skilltemplateID = global.CLASS[global.CHAR[charID, 3], 40];
global.CHAR[charID, 6] = 5 + floor((global.SKILLTEMPLATE[skilltemplateID, 1] + choose(-10, -5, 0, 5, 10)) / 6.5) + floor(((global.SKILLTEMPLATE[skilltemplateID, 1] + choose(-10, -5, 0, 5, 10)) / 100) * level); //hp
global.CHAR[charID, 7] = floor((global.SKILLTEMPLATE[skilltemplateID, 2] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 2] + choose(-10, -5, 0, 5, 10)) / 100) * level); //str
global.CHAR[charID, 8] = floor((global.SKILLTEMPLATE[skilltemplateID, 3] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 3] + choose(-10, -5, 0, 5, 10)) / 100) * level); //mag
global.CHAR[charID, 9] = floor((global.SKILLTEMPLATE[skilltemplateID, 4] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 4] + choose(-10, -5, 0, 5, 10)) / 100) * level); //skill
global.CHAR[charID, 10] = floor((global.SKILLTEMPLATE[skilltemplateID, 5] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 5] + choose(-10, -5, 0, 5, 10)) / 100) * level); //spd
global.CHAR[charID, 11] = floor((global.SKILLTEMPLATE[skilltemplateID, 6] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 6] + choose(-10, -5, 0, 5, 10)) / 100) * level); //lck
global.CHAR[charID, 12] = floor((global.SKILLTEMPLATE[skilltemplateID, 7] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 7] + choose(-10, -5, 0, 5, 10)) / 100) * level); //def
global.CHAR[charID, 13] = floor((global.SKILLTEMPLATE[skilltemplateID, 8] + choose(-10, -5, 0, 5, 10)) / 12) + floor(((global.SKILLTEMPLATE[skilltemplateID, 8] + choose(-10, -5, 0, 5, 10)) / 100) * level); //res

global.CHAR[charID, 14] = global.SKILLTEMPLATE[skilltemplateID, 1] + choose(-10, -5, 0, 5, 10); //hpgrowth
global.CHAR[charID, 15] = global.SKILLTEMPLATE[skilltemplateID, 2] + choose(-10, -5, 0, 5, 10); //strgrowth
global.CHAR[charID, 16] = global.SKILLTEMPLATE[skilltemplateID, 3] + choose(-10, -5, 0, 5, 10); //maggrowth
global.CHAR[charID, 17] = global.SKILLTEMPLATE[skilltemplateID, 4] + choose(-10, -5, 0, 5, 10); //skillgrowth
global.CHAR[charID, 18] = global.SKILLTEMPLATE[skilltemplateID, 5] + choose(-10, -5, 0, 5, 10); //spdgrowth
global.CHAR[charID, 19] = global.SKILLTEMPLATE[skilltemplateID, 6] + choose(-10, -5, 0, 5, 10); //lckgrowth
global.CHAR[charID, 20] = global.SKILLTEMPLATE[skilltemplateID, 7] + choose(-10, -5, 0, 5, 10); //defgrowth
global.CHAR[charID, 21] = global.SKILLTEMPLATE[skilltemplateID, 8] + choose(-10, -5, 0, 5, 10); //resgrowth

var rank = floor(level / 6);
rank += choose(-1, 0, 1);
if(rank > 4)rank = 4;
if(rank < 0)rank = 0;

global.CHAR[charID, 22] = rank; //swordrank
global.CHAR[charID, 23] = rank; //lancerank
global.CHAR[charID, 24] = rank; //axerank
global.CHAR[charID, 25] = rank; //daggerrank
global.CHAR[charID, 26] = rank; //bowrank
global.CHAR[charID, 27] = rank; //darktome 
global.CHAR[charID, 28] = rank; //lighttome
global.CHAR[charID, 29] = rank; //animaatome
global.CHAR[charID, 30] = rank; //staffrank
global.CHAR[charID, 31] = rank; //stonerank
global.CHAR[charID, 32] = global.CLASS[global.CHAR[charID, 3], 37] ; //MP
global.CHAR[charID, 33] = ds_list_create(); //skills
global.CHAR[charID, 34] = ds_list_create(); //activeskills

global.CHAR[charID, 35] = 0; //face
global.CHAR[charID, 36] = 0; //eyes
global.CHAR[charID, 37] = 0; //hair ID
global.CHAR[charID, 38] = make_color_rgb(random(255), random(255), random(255)); //hair color
global.CHAR[charID, 39] = make_color_rgb(random(120), random(120), random(120)); //eye color
						
if(global.CHAR[charID, 2] == 0)
{
	global.CHAR[charID, 1] = choose(16, 17, 18, 19, 40, 41);
							
} else
{
	global.CHAR[charID, 1] = choose(14, 15, 0, 2, 20, 5, 35, 37, 38, 39, 42, 43, 44);
}
	
global.CHAR[charID, 43] = -1; //accessory ID

switch(global.CHAR[charID, 1])
{
	case 16:
		global.CHAR[charID, 37] = 8;
		break;
	case 17:
		global.CHAR[charID, 37] = 6;
		break;
	case 18:
		global.CHAR[charID, 37] = 8;
		break;
	case 19:
		global.CHAR[charID, 37] = 7;
		break;
	case 40:
		global.CHAR[charID, 37] = 6;
		break;
	case 41:
		global.CHAR[charID, 37] = 20;
		break;
								
								
	case 14:
		global.CHAR[charID, 37] = 16;
		break;
	case 15:
		global.CHAR[charID, 37] = 5;
		break;
	case 0:
		global.CHAR[charID, 37] = 5;
		break;
	case 2:
		global.CHAR[charID, 37] = 3;
		break;
	case 5:
		global.CHAR[charID, 37] = 4;
		break;
	case 20:
		global.CHAR[charID, 37] = 9;
		break;
	case 35:
		global.CHAR[charID, 37] = 11;
		global.CHAR[charID, 43] = 1;
		break;
	case 37:
		global.CHAR[charID, 37] = 15;
		break;
	case 38:
		global.CHAR[charID, 37] = 14;
		global.CHAR[charID, 43] = 2;
		break;
	case 39:
		global.CHAR[charID, 37] = 0;
		break;
	case 42:
		global.CHAR[charID, 37] = 18;
		global.CHAR[charID, 43] = 3;
		break;
	case 43:
		global.CHAR[charID, 37] = 17;
		break;
	case 44:
		global.CHAR[charID, 37] = 19;
		global.CHAR[charID, 43] = 4;
		break;
}

global.CHAR[charID, 40] = 0; //support rank biarray id
global.CHAR[charID, 41] = 0; //children biarray list

global.CHAR[charID, 42] = 0; //voice id
global.CHAR[charID, 44] = -1; //weaponequip

global.CHAR[charID, 45] = 0; //atk
global.CHAR[charID, 46] = 0; //hit
global.CHAR[charID, 47] = 0; //crit
global.CHAR[charID, 48] = 0; //avo

global.CHAR[charID, 49] = ds_list_create(); //inventory
global.CHAR[charID, 50] = ds_list_create(); //uses

global.CHAR[charID, 51] = false; //xeyecenter
global.CHAR[charID, 52] = false; //yeyecenter
global.CHAR[charID, 53] = 0; //expression

global.CHAR[charID, 54] = -1; //voice1
global.CHAR[charID, 55] = -1; //last expression
global.CHAR[charID, 56] = -1; //weapon inventory link

global.CHAR[charID, 57] = false; //recruited
global.CHAR[charID, 58] = false; //active
global.CHAR[charID, 59] = false; //activeforfight

global.CHAR[charID, 60] = floor(random(20)); //swordrankxp
global.CHAR[charID, 61] = floor(random(20)); //lancerankxp
global.CHAR[charID, 62] = floor(random(20)); //axerankxp
global.CHAR[charID, 63] = floor(random(20)); //daggerrankxp
global.CHAR[charID, 64] = floor(random(20)); //bowrankxp
global.CHAR[charID, 65] = floor(random(20)); //darktomexp
global.CHAR[charID, 66] = floor(random(20)); //lighttomexp
global.CHAR[charID, 67] = floor(random(20)); //animaatomexp
global.CHAR[charID, 68] = floor(random(20)); //staffrankxp
global.CHAR[charID, 69] = floor(random(20)); //stonerankxp

global.CHAR[charID, 70] = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2); //SP

var itemList = ds_list_create();
var item = 0;
for(var i = 0; i <= global.nItems; i ++)
{
	var check = 1;
	if(global.CLASS[global.CHAR[charID, 3], 18] == true && global.ITEM[i, 4] != 18)check = 0;
	if(check && CanUse(charID, i) && (global.ITEM[i, 4] == 18 || global.ITEM[i, 20] >= floor(rank / 2)))ds_list_add(itemList, i);
}
ds_list_shuffle(itemList);

if(ds_list_size(itemList) > 0)
{
	item = ds_list_find_value(itemList, 0);
	AddItem(charID, item);

	ds_list_destroy(itemList);
}

if(item > 0 && global.ITEM[item, 4] == 18)
{
	var itemList = ds_list_create();
	for(var i = 0; i <= global.nItems; i ++)
	{
		if(CanUse(charID, i) && global.ITEM[i, 20] >= floor(rank / 2) && global.ITEM[i, 4] != 18)ds_list_add(itemList, i);
	}
	if(ds_list_size(itemList) > 0)
	{
		ds_list_shuffle(itemList);

		item = ds_list_find_value(itemList, 0);
		AddItem(charID, item);
	}

	ds_list_destroy(itemList);
}


if(floor(random(101)) < 15)AddItem(charID, 12);



var nskills = floor(global.CHAR[charID, 4] / 5);
var availableSkills = ds_list_create();
	
repeat(nskills)
{
	ds_list_clear(availableSkills);
					
	for(var i = 0; i < 21; i ++)
	{
		var hasSkill = 0;
		for(var ii = 0; ii < ds_list_size(global.CHAR[charID, 33]); ii ++)
		{
			if(ds_list_find_value(global.CHAR[charID, 33], ii) == i)
			{
				hasSkill = 1;
			}
		}
		if(hasSkill == 0 && i != 10 && i != 17 && global.CHAR[charID, 70] >= global.SKILL[i, 3])ds_list_add(availableSkills, i);
	}
					
	ds_list_shuffle(availableSkills);
	var newSkill = ds_list_find_value(availableSkills, 0);
					
	if(newSkill != undefined)
	{
		AddSkill(charID, newSkill);
	}
}

//AddSkill(charID, choose(3, 4));

ds_list_destroy(availableSkills);

for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]); i ++)
{
	var newitem = ds_list_find_value(global.CHAR[charID, 49], i);
	if(CanUse(charID, newitem) && global.ITEM[newitem, 14] < 2)
	{
		EquipGlobal(charID, i);
		break;
	}
}
if(global.CHAR[charID, 44] == -1)
{
	for(var i = 0; i < ds_list_size(global.CHAR[charID, 49]); i ++)
	{
		var newitem = ds_list_find_value(global.CHAR[charID, 49], i);
		if(CanUse(charID, newitem))
		{
			EquipGlobal(charID, i);
			break;
		}
	}
}


EquipFirstWeaponGlobal(charID);

if(global.CHAR[charID, 4] > 20)
{
	global.CHAR[charID, 4] -= 20;
}
if(global.CHAR[charID, 4] > 20)
{
	global.CHAR[charID, 4] = 20;
	
	global.CHAR[charID, 22] = choose(4, 5); //swordrank
	global.CHAR[charID, 23] = choose(4, 5); //lancerank
	global.CHAR[charID, 24] = choose(4, 5); //axerank
	global.CHAR[charID, 25] = choose(4, 5); //daggerrank
	global.CHAR[charID, 26] = choose(4, 5); //bowrank
	global.CHAR[charID, 27] = choose(4, 5); //darktome 
	global.CHAR[charID, 28] = choose(4, 5); //lighttome
	global.CHAR[charID, 29] = choose(4, 5); //animaatome
	global.CHAR[charID, 30] = choose(4, 5); //staffrank
	global.CHAR[charID, 31] = choose(4, 5); //stonerank
}