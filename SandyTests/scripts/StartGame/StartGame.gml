global.totalChars = 0;
global.gold = 15000;
global.gamelevel = 10;

global.CHAR[100, 0] = "Convoy"; //name
global.CHAR[100, 1] = -1; //portrait ID
global.CHAR[100, 49] = ds_list_create(); //convoy item id
global.CHAR[100, 50] = ds_list_create(); //convoy item uses
global.CHAR[100, 56] = -1; 
global.CHAR[100, 57] = true; //recruited


//VENDORS
var val = 101;
global.CHAR[val, 0] = "Anna"; //name
global.CHAR[val, 1] = 10; //portrait ID
global.CHAR[val, 37] = 3; //hair ID
global.CHAR[val, 38] = make_color_rgb(250, 235, 60); //hair color
global.CHAR[val, 39] = make_color_rgb(0, 80, 200); //eye color
global.CHAR[val, 48] = ds_list_create(); //prices
global.CHAR[val, 49] = ds_list_create(); //items
global.CHAR[val, 50] = ds_list_create(); //stock
global.CHAR[val, 51] = false; //dead
global.CHAR[val, 52] = false; //marked for deletion
global.CHAR[val, 53] = 0; //expression
global.CHAR[val, 54] = -1; //voice1
global.CHAR[val, 55] = -1; //last expression
global.CHAR[val, 56] = -1; 
global.CHAR[val, 57] = true; //recruited
global.CHAR[val, 71] = 0; //voice pack

val = 102;
global.CHAR[val, 0] = "Bones"; //name
global.CHAR[val, 1] = 33; //portrait ID
global.CHAR[val, 37] = 3; //hair ID
global.CHAR[val, 38] = make_color_rgb(250, 235, 60); //hair color
global.CHAR[val, 39] = make_color_rgb(0, 80, 200); //eye color
global.CHAR[val, 48] = ds_list_create(); //prices
global.CHAR[val, 49] = ds_list_create(); //items
global.CHAR[val, 50] = ds_list_create(); //stock
global.CHAR[val, 51] = false; //dead
global.CHAR[val, 52] = false; //marked for deletion
global.CHAR[val, 53] = 0; //expression
global.CHAR[val, 54] = -1; //voice1
global.CHAR[val, 55] = -1; //last expression
global.CHAR[val, 56] = -1; 
global.CHAR[val, 57] = true; //recruited
global.CHAR[val, 71] = -1; //voice pack

val = 103;
global.CHAR[val, 0] = "Anna"; //name
global.CHAR[val, 1] = 36; //portrait ID
global.CHAR[val, 37] = 3; //hair ID
global.CHAR[val, 38] = make_color_rgb(250, 235, 60); //hair color
global.CHAR[val, 39] = make_color_rgb(0, 80, 200); //eye color
global.CHAR[val, 48] = ds_list_create(); //prices
global.CHAR[val, 49] = ds_list_create(); //items
global.CHAR[val, 50] = ds_list_create(); //stock
global.CHAR[val, 51] = false; //dead
global.CHAR[val, 52] = false; //marked for deletion
global.CHAR[val, 53] = 0; //expression
global.CHAR[val, 54] = -1; //voice1
global.CHAR[val, 55] = -1; //last expression
global.CHAR[val, 56] = -1; 
global.CHAR[val, 57] = true; //recruited
global.CHAR[val, 71] = 0; //voice pack



global.nChars = 0;

///CHARACTERS
global.CHAR[global.nChars, 0] = "Zech"; //name
global.CHAR[global.nChars, 1] = 13; //portrait ID
global.CHAR[global.nChars, 2] = 0; //gender

global.CHAR[global.nChars, 3] = 0; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 19; //hp
global.CHAR[global.nChars, 7] = 6; //str
global.CHAR[global.nChars, 8] = 2; //mag
global.CHAR[global.nChars, 9] = 6; //skill
global.CHAR[global.nChars, 10] = 7; //spd
global.CHAR[global.nChars, 11] = 4; //lck
global.CHAR[global.nChars, 12] = 6; //def
global.CHAR[global.nChars, 13] = 2; //res

global.CHAR[global.nChars, 14] = 90; //hpgrowth
global.CHAR[global.nChars, 15] = 65; //strgrowth
global.CHAR[global.nChars, 16] = 10; //maggrowth
global.CHAR[global.nChars, 17] = 60; //skillgrowth
global.CHAR[global.nChars, 18] = 60; //spdgrowth
global.CHAR[global.nChars, 19] = 40; //lckgrowth
global.CHAR[global.nChars, 20] = 50; //defgrowth
global.CHAR[global.nChars, 21] = 20; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 0; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 7; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 6; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(160, 210, 210); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(40, 80, 130); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = -1; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote

global.CHAR[global.nChars, 73] = 0; //deploy order
global.CHAR[global.nChars, 74] = 8; //personal skill

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 1;

global.CHAR[global.nChars, 0] = "Sadness"; //name
global.CHAR[global.nChars, 1] = 39; //portrait ID
global.CHAR[global.nChars, 2] = 1; //gender

global.CHAR[global.nChars, 3] = 4; //class
global.CHAR[global.nChars, 4] = 1; //level
global.CHAR[global.nChars, 5] = 0; //exp

global.CHAR[global.nChars, 6] = 18; //hp
global.CHAR[global.nChars, 7] = 6; //str
global.CHAR[global.nChars, 8] = 5; //mag
global.CHAR[global.nChars, 9] = 6; //skill
global.CHAR[global.nChars, 10] = 9; //spd
global.CHAR[global.nChars, 11] = 7; //lck
global.CHAR[global.nChars, 12] = 4; //def
global.CHAR[global.nChars, 13] = 2; //res

global.CHAR[global.nChars, 14] = 70; //hpgrowth
global.CHAR[global.nChars, 15] = 60; //strgrowth
global.CHAR[global.nChars, 16] = 60; //maggrowth
global.CHAR[global.nChars, 17] = 50; //skillgrowth
global.CHAR[global.nChars, 18] = 65; //spdgrowth
global.CHAR[global.nChars, 19] = 55; //lckgrowth
global.CHAR[global.nChars, 20] = 40; //defgrowth
global.CHAR[global.nChars, 21] = 40; //resgrowth

global.CHAR[global.nChars, 22] = 0; //swordrank
global.CHAR[global.nChars, 23] = 0; //lancerank
global.CHAR[global.nChars, 24] = 0; //axerank
global.CHAR[global.nChars, 25] = 0; //daggerrank
global.CHAR[global.nChars, 26] = 0; //bowrank
global.CHAR[global.nChars, 27] = 0; //darktome 
global.CHAR[global.nChars, 28] = 0; //lighttome
global.CHAR[global.nChars, 29] = 0; //animaatome
global.CHAR[global.nChars, 30] = 1; //staffrank
global.CHAR[global.nChars, 31] = 0; //stonerank
global.CHAR[global.nChars, 32] = 5; //MP
global.CHAR[global.nChars, 33] = ds_list_create(); //skills
global.CHAR[global.nChars, 34] = ds_list_create(); //activeskills

global.CHAR[global.nChars, 35] = 0; //face type
global.CHAR[global.nChars, 36] = 0; //eyes type
global.CHAR[global.nChars, 37] = 0; //hair ID
global.CHAR[global.nChars, 38] = make_color_rgb(120, 220, 230); //hair color
global.CHAR[global.nChars, 39] = make_color_rgb(40, 80, 100); //eye color

global.CHAR[global.nChars, 40] = 0; //support rank biarray id
global.CHAR[global.nChars, 41] = 0; //children biarray list

global.CHAR[global.nChars, 42] = 0; //voice id
global.CHAR[global.nChars, 43] = 0; //Accessory ID
global.CHAR[global.nChars, 44] = -1; //weaponequip

global.CHAR[global.nChars, 45] = 0; //atk
global.CHAR[global.nChars, 46] = 0; //hit
global.CHAR[global.nChars, 47] = 0; //crit
global.CHAR[global.nChars, 48] = 0; //avo

global.CHAR[global.nChars, 49] = ds_list_create(); //inventory
global.CHAR[global.nChars, 50] = ds_list_create(); //uses

global.CHAR[global.nChars, 51] = false; //dead
global.CHAR[global.nChars, 52] = false; //marked for deletion
global.CHAR[global.nChars, 53] = 0; //expression

global.CHAR[global.nChars, 54] = -1; //voice1
global.CHAR[global.nChars, 55] = -1; //last expression
global.CHAR[global.nChars, 56] = -1; //weapon inventory link

global.CHAR[global.nChars, 57] = true; //recruited
global.CHAR[global.nChars, 58] = true; //active
global.CHAR[global.nChars, 59] = false; //activeforfight

global.CHAR[global.nChars, 60] = 0; //swordrankxp
global.CHAR[global.nChars, 61] = 0; //lancerankxp
global.CHAR[global.nChars, 62] = 0; //axerankxp
global.CHAR[global.nChars, 63] = 0; //daggerrankxp
global.CHAR[global.nChars, 64] = 0; //bowrankxp
global.CHAR[global.nChars, 65] = 0; //darktomexp
global.CHAR[global.nChars, 66] = 0; //lighttomexp
global.CHAR[global.nChars, 67] = 0; //animaatomexp
global.CHAR[global.nChars, 68] = 0; //staffrankxp
global.CHAR[global.nChars, 69] = 0; //stonerankxp

global.CHAR[global.nChars, 70] = global.CHAR[global.nChars, 9] + 5 + floor(global.CHAR[global.nChars, 11] / 2); //SP
global.CHAR[global.nChars, 71] = -1; //voice pack
global.CHAR[global.nChars, 72] = global.nChars; //death quote
global.CHAR[global.nChars, 73] = 0; //deploy order
global.CHAR[global.nChars, 74] = 10; //personal skill

for(var i = 0; i < 8; i ++)
{
	global.CHAR[global.nChars, 14 + i] += global.CLASS[global.CHAR[global.nChars, 3], 24 + i];
}

global.nChars = 2;



//////////////////////
global.totalChars = global.nChars;

for(var i = 0; i < 50; i ++)
{
	for(var ii = 0; ii < 50; ii ++)
	{
		global.SUPPORTS[i, ii] = 0;
		global.SUPPORTXP[i, ii] = 0;
		global.SUPPORTLIMIT[i, ii] = 0;
		global.SUPPORTADV[i, ii] = false;
	}
}

/*
global.SUPPORTLIMIT[0, 1] = 3;
global.SUPPORTLIMIT[1, 0] = 3;
global.SUPPORTXP[1, 0] = 0;
global.SUPPORTXP[0, 1] = 0;
*/

//add skills
AddSkill(1, 22);
AddSkill(1, 25);

AddSkill(0, 33);
AddSkill(0, 34);
AddSkill(0, 36);
/*
AddSkill(4, 23);
AddSkill(6, 4);
AddSkill(7, 4);
AddSkill(8, 24);
AddSkill(9, 21);
*/

//AddSkill(1, 9);

//add items
AddItem(0, 16);
AddItem(1, 34);
AddItem(1, 16);
AddItem(1, 12);

/*
AddItem(4, 19);
AddItem(6, 17);

AddItem(7, 17);
AddItem(8, 32);
AddItem(9, 23);
AddItem(7, 12);
AddItem(9, 12);
*/

EquipFirstWeaponGlobal(0);
EquipFirstWeaponGlobal(1);

/*
EquipFirstWeaponGlobal(4);
EquipFirstWeaponGlobal(6);
EquipFirstWeaponGlobal(7);
EquipFirstWeaponGlobal(8);
EquipFirstWeaponGlobal(9);
*/


//shop stuff
var itemList = ds_priority_create();

/*
for(var i = 1; i < 20; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 100 + global.ITEM[item, 5] / 100);
}
for(var i = 23; i < 38; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 100 + global.ITEM[item, 5] / 100);
}
for(var i = 61; i < 66; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 100 + global.ITEM[item, 5] / 100);
}
for(var i = 76; i < 93; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 23] * 100 + 5000);
}
*/

ds_priority_add(itemList, 13, global.ITEM[13, 4] * 100 + global.ITEM[13, 5] / 100);
ds_priority_add(itemList, 26, global.ITEM[26, 4] * 100 + global.ITEM[26, 5] / 100);
ds_priority_add(itemList, 12, global.ITEM[12, 4] * 100 + global.ITEM[12, 5] / 100);
ds_priority_add(itemList, 32, global.ITEM[32, 4] * 100 + global.ITEM[32, 5] / 100);
ds_priority_add(itemList, 4, global.ITEM[4, 4] * 100 + global.ITEM[4, 5] / 100);
ds_priority_add(itemList, 6, global.ITEM[6, 4] * 100 + global.ITEM[6, 5] / 100);
ds_priority_add(itemList, 34, global.ITEM[34, 4] * 100 + global.ITEM[34, 5] / 100);
ds_priority_add(itemList, 83, global.ITEM[83, 4] * 100 + global.ITEM[83, 5] / 100);
ds_priority_add(itemList, 88, global.ITEM[88, 4] * 100 + global.ITEM[88, 5] / 100);
ds_priority_add(itemList, 33, global.ITEM[33, 4] * 100 + global.ITEM[33, 5] / 100);
for(var i = 16; i < 20; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 100 + global.ITEM[item, 5] / 100);
}

while(ds_priority_size(itemList) > 0)
{
	var item = ds_priority_delete_min(itemList);
	var price = global.ITEM[item, 5];
	if(floor(random(3)) == 0)price = floor(price / 1.25);
	ds_list_add(global.CHAR[101, 48], price); //price
	ds_list_add(global.CHAR[101, 49], item); //item
	if(item != 15)ds_list_add(global.CHAR[101, 50], 1000); else ds_list_add(global.CHAR[101, 50], 1); //stock
}

ds_priority_clear(itemList);

var itemList = ds_priority_create();
for(var i = 38; i < 61; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 200 + global.ITEM[item, 5] / 100);
}

for(var i = 66; i < 74; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 200 + global.ITEM[item, 5] / 100);
}
ds_priority_add(itemList, 75, global.ITEM[75, 4] * 200 + global.ITEM[75, 5] / 100);

for(var i = 93; i < 98; i ++)
{
	var item = i;
	ds_priority_add(itemList, item, global.ITEM[item, 4] * 200 + global.ITEM[item, 5] / 100);
}
ds_priority_add(itemList, 101, global.ITEM[101, 4] * 200 + global.ITEM[101, 5] / 100);

while(ds_priority_size(itemList) > 0)
{
	var item = ds_priority_delete_min(itemList);
	var price = global.ITEM[item, 5];
	if(floor(random(3)) == 0)price = floor(price / 1.25);
	ds_list_add(global.CHAR[103, 48], price); //price
	ds_list_add(global.CHAR[103, 49], item); //item
	ds_list_add(global.CHAR[103, 50], 1000);
}

ds_priority_destroy(itemList);

global.optionState[0] = 0;
global.optionState[1] = 1;
global.optionState[2] = 100;
global.optionState[3] = 100;
global.optionState[4] = 1;
global.optionState[5] = 1;
global.optionState[6] = 1;
global.optionState[7] = 0;

global.resourceBox = ds_list_create();
global.resourceBoxAm = ds_list_create();

ds_list_add(global.resourceBox, 69);
ds_list_add(global.resourceBoxAm, 1);
ds_list_add(global.resourceBox, 70);
ds_list_add(global.resourceBoxAm, 1);
ds_list_add(global.resourceBox, 71);
ds_list_add(global.resourceBoxAm, 1);
ds_list_add(global.resourceBox, 72);
ds_list_add(global.resourceBoxAm, 1);
ds_list_add(global.resourceBox, 73);
ds_list_add(global.resourceBoxAm, 1);

global.seconds = 0;
global.lastStage = 0;
