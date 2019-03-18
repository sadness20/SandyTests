/// @description Insert description here
// You can write your code in this editor

global.OWchar = 1;
global.showOptions = 0;
global.nOptions = 0;
global.nOptions2 = 0;
global.nprisoners = 0;
global.nrecruited = 0;
global.armyJoin = -1;
charlistHeight[0] = 0;
charlistHeight[1] = 0;
charlistHeight[2] = 0;
showStats = 0;
itemCharSel = -1;
itemSel = -1;
opTrade = 0;
select1trade = -1;
index1trade = -1;
index2trade = -1;
whotowho = -1;
opSize = 1;
opSize2 = 1;
opSize3 = 1;
opSize4 = 1;
gameFade = 1;
surfTrade1 = surface_create(200, 200);
surfTrade2 = surface_create(260, 200);
surfTradep1 = surface_create(200, 90);
surfTradep2 = surface_create(200, 90);
surfOptions = surface_create(240, 240);
surfPort = surface_create(128, 128);
surfPort2 = surface_create(128, 128);
lastOp = 0;
showMap = false;
arrowSelect1 = 0;
arrowSelect2 = 0;
closeoptions = false;
xScroll = 0;

skillList = ds_list_create();

global.itemBreak = -1;
global.nCustom = 0;

nupshow = 0;
for(var i = 0; i < 8; i ++)
{
	statup[i] = 0;
	nupshowy[i] = 0;
}
guiTimer = 0;
guiTimer2 = 0;
guiTimer3 = 0;
guiTimer4 = 0;
guiTimer5 = 0;
guiStep = 0;

InitializeParticles();


global.debug = false;
show_debug_overlay(1);
global.window_w = 400;
global.window_h = 240;
display_set_gui_size(global.window_w, global.window_h);
randomize();
depth = -6000;
room_speed = 60;
global.particles = true;

unitSurface = surface_create(38, 38);
hairSurface = surface_create(38, 38);

hnd_colorIn = shader_get_uniform(shColorReplaceBlend, "colorIn");
hnd_colorOut = shader_get_uniform(shColorReplaceBlend, "colorOut");
hnd_colorTolerance = shader_get_uniform(shColorReplaceBlend, "colorTolerance");
hnd_blend = shader_get_uniform(shColorReplaceBlend, "blend");

colorIn = c_black;
colorOut = c_black;

csH = color_get_hue(colorOut);
csS = color_get_saturation(colorOut);
csV = color_get_value(colorOut);
vis = 1;

sinSize = 0;
selectSize = 0;
tempVar = 0;
tempVar2 = 0;
tempVar3 = 0;
tempVar4 = 0;
tempVar5 = 0;
tempVar6 = 0;
tempVar7 = 0;
tempVar8 = 0;
tempVar9 = 0;
tempVar10 = 0;
tempVar11 = 0;
tempVar12 = 0;
tempVar13 = 3;
tempVar14 = 0;
tindex = 0;
tcindex = 0;
global.globalOptions = 0;
global.gameType = 0; //0 = classic, 1 = casual

InitializeItems();

///WEAPONS
global.WEAPON[0, 0] = "Sword"; //name
global.WEAPON[0, 1] = 0; //icon


///TEMPORAL
global.CHAR[1000, 0] = "Risen"; //name
global.CHAR[1000, 1] = spr_risen_p; //portrait sprite
global.CHAR[1000, 2] = 0; //gender


///SKILL LIST
global.skillSelected = -1;

InitializeSkills();


///CLASSES
/*
for(var i = 0; i < 30; i ++)
{
	for(var ii = 0; ii < 40; ii ++)
	{
		if(ii != 38 && ii != 39)global.CLASS[i, ii] = -1;
		else global.CLASS[i, ii] = "";
	}
}
*/

InitializeClasses();


val = 0;

//HAIR STYLES
global.HAIR[val, 0] = "Style 1"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female1; //sprite
global.HAIR[val, 3] = spr_hair_female1_front; //front marker

val = 1;
global.HAIR[val, 0] = "Style 2"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female2; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 2;
global.HAIR[val, 0] = "Style 3"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female3; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 3;
global.HAIR[val, 0] = "Style 4"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female4; //sprite
global.HAIR[val, 3] = spr_hair_female4_front; //front marker

val = 4;
global.HAIR[val, 0] = "Style 5"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female5; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 5;
global.HAIR[val, 0] = "Style 6"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female6; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 6;
global.HAIR[val, 0] = "Style 1"; //name
global.HAIR[val, 1] = 0; //hair gender
global.HAIR[val, 2] = spr_hair_male1; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 7;
global.HAIR[val, 0] = "Style 2"; //name
global.HAIR[val, 1] = 0; //hair gender
global.HAIR[val, 2] = spr_hair_male2; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 8;
global.HAIR[val, 0] = "Style 3"; //name
global.HAIR[val, 1] = 0; //hair gender
global.HAIR[val, 2] = spr_hair_male3; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 9;
global.HAIR[val, 0] = "Style 7"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female7; //sprite
global.HAIR[val, 3] = spr_hair_female7_front; //front marker

val = 10;
global.HAIR[val, 0] = "Style 8"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female8; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 11;
global.HAIR[val, 0] = "Style 9"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female9; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 12;
global.HAIR[val, 0] = "Style 10"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female10; //sprite
global.HAIR[val, 3] = spr_hair_female10_front; //front marker

val = 13;
global.HAIR[val, 0] = "Style 11"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female11; //sprite
global.HAIR[val, 3] = spr_hair_female11_front; //front marker

val = 14;
global.HAIR[val, 0] = "Style 12"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female12; //sprite
global.HAIR[val, 3] = spr_hair_female12_front; //front marker

val = 15;
global.HAIR[val, 0] = "Style 13"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female13; //sprite
global.HAIR[val, 3] = spr_hair_female13_front; //front marker

val = 16;
global.HAIR[val, 0] = "Style 14"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female14; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 17;
global.HAIR[val, 0] = "Style 15"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female15; //sprite
global.HAIR[val, 3] = -1; //front marker

val = 18;
global.HAIR[val, 0] = "Style 16"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female16; //sprite
global.HAIR[val, 3] = spr_hair_female16_front; //front marker

val = 19;
global.HAIR[val, 0] = "Style 17"; //name
global.HAIR[val, 1] = 1; //hair gender
global.HAIR[val, 2] = spr_hair_female17; //sprite
global.HAIR[val, 3] = spr_hair_female17_front; //front marker

val = 20;
global.HAIR[val, 0] = "Style 4"; //name
global.HAIR[val, 1] = 0; //hair gender
global.HAIR[val, 2] = spr_hair_male5; //sprite
global.HAIR[val, 3] = -1; //front marker


val = 0;
global.FACE[val, 0] = spr_face1;

val = 1;
global.FACE[val, 0] = spr_face2;

val = 2;
global.FACE[val, 0] = spr_face3;

val = 0;
global.EYES[val, 0] = spr_eyes1;



//REGIONS
global.REGION[0, 0] = "test region";
global.REGION[0, 1] = spr_testMap; //map
global.REGION[0, 2] = ds_list_create(); //stages


////MAPS
global.currentMap = -1;
global.currentRegion = 0;
global.mapUnlock = ds_list_create();

//ds_list_add(global.mapUnlock, 0);
//ds_list_add(global.mapUnlock, 2);

InitializeMaps();



//STAGES
global.currentStage = -1;

val = 0;
global.STAGE[val, 0] = "Prologue"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 0; //scene ID
global.STAGE[val, 4] = 7; //end scene ID

val = 1;
global.STAGE[val, 0] = "Escape"; //name
global.STAGE[val, 1] = 1; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 1; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 2;
global.STAGE[val, 0] = "Sandy Plains"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 8; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 3;
global.STAGE[val, 0] = "Snowsandy"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 6; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 4;
global.STAGE[val, 0] = "Arena"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 14; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 5;
global.STAGE[val, 0] = "Graveyard"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 17; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 6;
global.STAGE[val, 0] = "Grove of Solitude"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 12; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 7;
global.STAGE[val, 0] = "Plains"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 16; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 8;
global.STAGE[val, 0] = "Wasteland"; //name
global.STAGE[val, 1] = 0; //objective
global.STAGE[val, 2] = false; //completed
global.STAGE[val, 3] = 15; //scene ID
global.STAGE[val, 4] = 8; //end scene ID

val = 0;
global.MUSICPACK[val, 0] = "Vanity Judge";
global.MUSICPACK[val, 1] = mus_vanityjudge;
global.MUSICPACK[val, 2] = mus_vanityjudge_fire;
global.MUSICPACK[val, 3] = mus_adarkfall;
global.MUSICPACK[val, 4] = mus_adarkfall_fire;

val = 1;
global.MUSICPACK[val, 0] = "Spooky";
global.MUSICPACK[val, 1] = mus_spooky;
global.MUSICPACK[val, 2] = mus_spooky_fire;
global.MUSICPACK[val, 3] = mus_spookyassault;
global.MUSICPACK[val, 4] = mus_spookyassault_fire;

val = 2;
global.MUSICPACK[val, 0] = "No Justice";
global.MUSICPACK[val, 1] = mus_nojustice;
global.MUSICPACK[val, 2] = mus_nojustice_ablaze;
global.MUSICPACK[val, 3] = mus_adarkfall;
global.MUSICPACK[val, 4] = mus_adarkfall_fire;

val = 3;
global.MUSICPACK[val, 0] = "Solitude";
global.MUSICPACK[val, 1] = mus_solitude;
global.MUSICPACK[val, 2] = mus_solitude_fire;
global.MUSICPACK[val, 3] = mus_spookyassault;
global.MUSICPACK[val, 4] = mus_spookyassault_fire;

val = 4;
global.MUSICPACK[val, 0] = "Dusk Falls";
global.MUSICPACK[val, 1] = mus_duskfalls;
global.MUSICPACK[val, 2] = mus_duskfalls_fire;
global.MUSICPACK[val, 3] = mus_adarkfall;
global.MUSICPACK[val, 4] = mus_adarkfall_fire;


//OBJECTIVE INFO
val = 0;
global.OBJ[val] = "Rout the enemy";

val = 1;
global.OBJ[val] = "Escape";


//TEMPLATES

/*
val = 0; //MERCENARY
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 6; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 9; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy1; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 16; //90% weapon
global.TEMPLATE[val, 8] = 16; //10% 
global.TEMPLATE[val, 9] = 1; //xp mult


val = 1;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 7; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 32; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy2; //sprite
global.TEMPLATE[val, 6] = 0; //skill template
global.TEMPLATE[val, 7] = 17; //90% weapon
global.TEMPLATE[val, 8] = 17; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 2;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 9; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 6; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy3; //sprite
global.TEMPLATE[val, 6] = 3; //skill template
global.TEMPLATE[val, 7] = 19; //90% weapon
global.TEMPLATE[val, 8] = 19; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 3;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 8; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 5; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy4; //sprite
global.TEMPLATE[val, 6] = 5; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 4;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 21; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 17; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy5; //sprite
global.TEMPLATE[val, 6] = 1; //skill template
global.TEMPLATE[val, 7] = 3; //90% weapon
global.TEMPLATE[val, 8] = 17; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 5;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 24; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 10; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy6; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 6;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 22; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 7; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy7; //sprite
global.TEMPLATE[val, 6] = 6; //skill template
global.TEMPLATE[val, 7] = 17; //90% weapon
global.TEMPLATE[val, 8] = 17; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 7;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 5; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = spr_enemy_gold; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 5; //xp mult

val = 8;
global.TEMPLATE[val, 0] = "Bandit";
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 22; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 4; //90% weapon
global.TEMPLATE[val, 8] = 4; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 9;
global.TEMPLATE[val, 0] = "Bandit"; //KNIGHT
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 7; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 17; //90% weapon
global.TEMPLATE[val, 8] = 17; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 10;
global.TEMPLATE[val, 0] = "Bandit"; //WYVERN
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 10; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 11;
global.TEMPLATE[val, 0] = "Bandit"; //MAGE
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 28; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 32; //90% weapon
global.TEMPLATE[val, 8] = 32; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 12;
global.TEMPLATE[val, 0] = "Bandit"; //MERC
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 9; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 16; //90% weapon
global.TEMPLATE[val, 8] = 16; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 13;
global.TEMPLATE[val, 0] = "Bandit"; //BRIGAND
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 31; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 14;
global.TEMPLATE[val, 0] = "Bandit"; //ARCHER
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 6; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 19; //90% weapon
global.TEMPLATE[val, 8] = 19; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 15;
global.TEMPLATE[val, 0] = "Bandit"; //FIGHTER
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 34; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 18; //90% weapon
global.TEMPLATE[val, 8] = 18; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 16;
global.TEMPLATE[val, 0] = "Bandit"; //SPEAR FIGHTER
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 35; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 17; //90% weapon
global.TEMPLATE[val, 8] = 17; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult

val = 17;
global.TEMPLATE[val, 0] = "Bandit"; //SWORD CAVALIER
global.TEMPLATE[val, 1] = 23; //portait
global.TEMPLATE[val, 2] = 0; //gender
global.TEMPLATE[val, 3] = 0; //class
global.TEMPLATE[val, 4] = 0; //mp
global.TEMPLATE[val, 5] = 0; //sprite
global.TEMPLATE[val, 6] = 2; //skill template
global.TEMPLATE[val, 7] = 16; //90% weapon
global.TEMPLATE[val, 8] = 16; //10% weapon
global.TEMPLATE[val, 9] = 1; //xp mult
*/



val = 0;
global.SKILLTEMPLATE[val, 0] = "Cavalry";
global.SKILLTEMPLATE[val, 1] = 85; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 55; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 60; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 60; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 55; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 45; //defgrowth
global.SKILLTEMPLATE[val, 8] = 25; //resgrowth

val = 1;
global.SKILLTEMPLATE[val, 0] = "Pegasus";
global.SKILLTEMPLATE[val, 1] = 80; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 50; //strgrowth
global.SKILLTEMPLATE[val, 3] = 25; //maggrowth
global.SKILLTEMPLATE[val, 4] = 70; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 70; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 60; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 30; //defgrowth
global.SKILLTEMPLATE[val, 8] = 40; //resgrowth

val = 2;
global.SKILLTEMPLATE[val, 0] = "Myrmidon";
global.SKILLTEMPLATE[val, 1] = 80; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 55; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 75; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 75; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 55; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 30; //defgrowth
global.SKILLTEMPLATE[val, 8] = 20; //resgrowth

val = 3;
global.SKILLTEMPLATE[val, 0] = "Healer";
global.SKILLTEMPLATE[val, 1] = 70; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 30; //strgrowth
global.SKILLTEMPLATE[val, 3] = 60; //maggrowth
global.SKILLTEMPLATE[val, 4] = 45; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 50; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 50; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 25; //defgrowth
global.SKILLTEMPLATE[val, 8] = 45; //resgrowth

val = 4;
global.SKILLTEMPLATE[val, 0] = "Spellsword";
global.SKILLTEMPLATE[val, 1] = 75; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 50; //strgrowth
global.SKILLTEMPLATE[val, 3] = 50; //maggrowth
global.SKILLTEMPLATE[val, 4] = 65; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 65; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 55; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 30; //defgrowth
global.SKILLTEMPLATE[val, 8] = 30; //resgrowth

val = 5;
global.SKILLTEMPLATE[val, 0] = "Berserker";
global.SKILLTEMPLATE[val, 1] = 100; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 60; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 55; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 60; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 45; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 30; //defgrowth
global.SKILLTEMPLATE[val, 8] = 20; //resgrowth

val = 6;
global.SKILLTEMPLATE[val, 0] = "Ranger";
global.SKILLTEMPLATE[val, 1] = 80; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 55; //strgrowth
global.SKILLTEMPLATE[val, 3] = 30; //maggrowth
global.SKILLTEMPLATE[val, 4] = 70; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 60; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 40; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 35; //defgrowth
global.SKILLTEMPLATE[val, 8] = 30; //resgrowth

val = 7;
global.SKILLTEMPLATE[val, 0] = "Knight";
global.SKILLTEMPLATE[val, 1] = 100; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 65; //strgrowth
global.SKILLTEMPLATE[val, 3] = 15; //maggrowth
global.SKILLTEMPLATE[val, 4] = 55; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 45; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 35; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 70; //defgrowth
global.SKILLTEMPLATE[val, 8] = 30; //resgrowth

val = 8;
global.SKILLTEMPLATE[val, 0] = "Villager";
global.SKILLTEMPLATE[val, 1] = 85; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 55; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 60; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 50; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 80; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 45; //defgrowth
global.SKILLTEMPLATE[val, 8] = 20; //resgrowth

val = 9;
global.SKILLTEMPLATE[val, 0] = "Wyvern";
global.SKILLTEMPLATE[val, 1] = 100; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 70; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 55; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 50; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 50; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 55; //defgrowth
global.SKILLTEMPLATE[val, 8] = 15; //resgrowth

val = 10;
global.SKILLTEMPLATE[val, 0] = "Bow Knight";
global.SKILLTEMPLATE[val, 1] = 85; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 45; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 65; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 65; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 55; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 45; //defgrowth
global.SKILLTEMPLATE[val, 8] = 25; //resgrowth

val = 11;
global.SKILLTEMPLATE[val, 0] = "Kitsune";
global.SKILLTEMPLATE[val, 1] = 100; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 50; //strgrowth
global.SKILLTEMPLATE[val, 3] = 20; //maggrowth
global.SKILLTEMPLATE[val, 4] = 60; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 75; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 50; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 30; //defgrowth
global.SKILLTEMPLATE[val, 8] = 20; //resgrowth

val = 12;
global.SKILLTEMPLATE[val, 0] = "Wizard";
global.SKILLTEMPLATE[val, 1] = 80; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 25; //strgrowth
global.SKILLTEMPLATE[val, 3] = 70; //maggrowth
global.SKILLTEMPLATE[val, 4] = 45; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 50; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 50; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 25; //defgrowth
global.SKILLTEMPLATE[val, 8] = 45; //resgrowth

val = 13;
global.SKILLTEMPLATE[val, 0] = "Magic Knight";
global.SKILLTEMPLATE[val, 1] = 85; //hpgrowth
global.SKILLTEMPLATE[val, 2] = 20; //strgrowth
global.SKILLTEMPLATE[val, 3] = 55; //maggrowth
global.SKILLTEMPLATE[val, 4] = 60; //skillgrowth
global.SKILLTEMPLATE[val, 5] = 60; //spdgrowth
global.SKILLTEMPLATE[val, 6] = 55; //lckgrowth
global.SKILLTEMPLATE[val, 7] = 45; //defgrowth
global.SKILLTEMPLATE[val, 8] = 25; //resgrowth




val = 0;
//VOICE PACKS
global.VOICE[val, 0] = "Anna";
global.VOICE[val, 1] = sfx_takeyourtime; //shopkeeper


//CLIMATES
global.CLIMATE[0, 0] = "Default";
global.CLIMATE[0, 1] = -1;
global.CLIMATE[0, 2] = -1;
global.CLIMATE[0, 3] = -1; //object particle1
global.CLIMATE[0, 4] = -1; //object particle2

global.CLIMATE[1, 0] = "Windy";
global.CLIMATE[1, 1] = global.ptWindS; //particles
global.CLIMATE[1, 2] = sfx_wind1; //sound fx
global.CLIMATE[1, 3] = -1; //object particle1
global.CLIMATE[1, 4] = -1; //object particle2

global.CLIMATE[2, 0] = "Snowy";
global.CLIMATE[2, 1] = global.ptSnow; //particles
global.CLIMATE[2, 2] = sfx_strongwinds; //sound fx
global.CLIMATE[2, 3] = 1; //object particle1
global.CLIMATE[2, 4] = -1; //object particle2

global.CLIMATE[3, 0] = "Rainy";
global.CLIMATE[3, 1] = -1;
global.CLIMATE[3, 2] = sfx_rain;
global.CLIMATE[3, 3] = 0; //object particle1
global.CLIMATE[3, 4] = -1; //object particle2

global.CLIMATE[4, 0] = "Snowy";
global.CLIMATE[4, 1] = global.ptWindS2; //particles
global.CLIMATE[4, 2] = sfx_strongwinds; //sound fx
global.CLIMATE[4, 3] = 1; //object particle1
global.CLIMATE[4, 4] = -1; //object particle2

global.CLIMATE[5, 0] = "Fairy";
global.CLIMATE[5, 1] = -1;
global.CLIMATE[5, 2] = -1;
global.CLIMATE[5, 3] = 2; //object particle1
global.CLIMATE[5, 4] = -1; //object particle2

global.CLIMATE[6, 0] = "Fairy Rainy";
global.CLIMATE[6, 1] = -1;
global.CLIMATE[6, 2] = sfx_rain;
global.CLIMATE[6, 3] = 2; //object particle1
global.CLIMATE[6, 4] = 0; //object particle2

global.CLIMATE[7, 0] = "Interiors";
global.CLIMATE[7, 1] = -1;
global.CLIMATE[7, 2] = sfx_interiors;
global.CLIMATE[7, 3] = -1; //object particle1
global.CLIMATE[7, 4] = -1; //object particle2

//SCENES
global.currentScene = 0;

//PORTRAIT INFO
val = 0;
global.PORT[val, 0] = spr_severa_p;
global.PORT[val, 1] = 116;
global.PORT[val, 2] = 98;
global.PORT[val, 3] = 7; //scared index
global.PORT[val, 4] = 4; //angry index

val = 1;
global.PORT[val, 0] = spr_sadness_p;
global.PORT[val, 1] = 148;
global.PORT[val, 2] = 97;
global.PORT[val, 3] = 2; //scared index
global.PORT[val, 4] = 2; //angry index

val = 2;
global.PORT[val, 0] = spr_morgan_p;
global.PORT[val, 1] = 114;
global.PORT[val, 2] = 93;
global.PORT[val, 3] = 3; //scared index
global.PORT[val, 4] = 5; //angry index

val = 3;
global.PORT[val, 0] = spr_thunder_p;
global.PORT[val, 1] = 130;
global.PORT[val, 2] = 100;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 4;
global.PORT[val, 0] = spr_donnel_p;
global.PORT[val, 1] = 117;
global.PORT[val, 2] = 71;
global.PORT[val, 3] = 5; //scared index
global.PORT[val, 4] = 2; //angry index

val = 5;
global.PORT[val, 0] = spr_noire_p;
global.PORT[val, 1] = 117;
global.PORT[val, 2] = 83;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 6;
global.PORT[val, 0] = spr_risen_p;
global.PORT[val, 1] = 108;
global.PORT[val, 2] = 73;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 7;
global.PORT[val, 0] = spr_risen2_p;
global.PORT[val, 1] = 112;
global.PORT[val, 2] = 79;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 8;
global.PORT[val, 0] = spr_risen3_p;
global.PORT[val, 1] = 102;
global.PORT[val, 2] = 65;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 9;
global.PORT[val, 0] = spr_risen4_p;
global.PORT[val, 1] = 78;
global.PORT[val, 2] = 75;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 10;
global.PORT[val, 0] = spr_anna_p;
global.PORT[val, 1] = 120;
global.PORT[val, 2] = 80;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 11;
global.PORT[val, 0] = spr_sandy_p;
global.PORT[val, 1] = 133;
global.PORT[val, 2] = 92;
global.PORT[val, 3] = 2; //scared index
global.PORT[val, 4] = 2; //angry index

val = 12;
global.PORT[val, 0] = spr_evinya_p;
global.PORT[val, 1] = 118;
global.PORT[val, 2] = 96;
global.PORT[val, 3] = 6; //scared index
global.PORT[val, 4] = 4; //angry index

val = 13;
global.PORT[val, 0] = spr_zech_p;
global.PORT[val, 1] = 123;
global.PORT[val, 2] = 73;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 14;
global.PORT[val, 0] = spr_kjelle_p;
global.PORT[val, 1] = 115;
global.PORT[val, 2] = 72;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 15;
global.PORT[val, 0] = spr_cynthia_p;
global.PORT[val, 1] = 112;
global.PORT[val, 2] = 99;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 16;
global.PORT[val, 0] = spr_brady_p;
global.PORT[val, 1] = 110;
global.PORT[val, 2] = 84;
global.PORT[val, 3] = 5; //scared index
global.PORT[val, 4] = 2; //angry index

val = 17;
global.PORT[val, 0] = spr_inigo_p;
global.PORT[val, 1] = 111;
global.PORT[val, 2] = 71;
global.PORT[val, 3] = 6; //scared index
global.PORT[val, 4] = 5; //angry index

val = 18;
global.PORT[val, 0] = spr_owain_p;
global.PORT[val, 1] = 123;
global.PORT[val, 2] = 77;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 19;
global.PORT[val, 0] = spr_laurent_p;
global.PORT[val, 1] = 114;
global.PORT[val, 2] = 66;
global.PORT[val, 3] = 3; //scared index
global.PORT[val, 4] = 5; //angry index

val = 20;
global.PORT[val, 0] = spr_lucina_p;
global.PORT[val, 1] = 102;
global.PORT[val, 2] = 83;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 5; //angry index

val = 21;
global.PORT[val, 0] = spr_risen5_p;
global.PORT[val, 1] = 115;
global.PORT[val, 2] = 81;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 22;
global.PORT[val, 0] = spr_risen6_p;
global.PORT[val, 1] = 65;
global.PORT[val, 2] = 79;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 23;
global.PORT[val, 0] = spr_gold_p;
global.PORT[val, 1] = 115;
global.PORT[val, 2] = 86;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 24;
global.PORT[val, 0] = spr_risen7_p;
global.PORT[val, 1] = 103;
global.PORT[val, 2] = 66;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 25;
global.PORT[val, 0] = spr_bubblegum_p;
global.PORT[val, 1] = 121;
global.PORT[val, 2] = 114;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 26;
global.PORT[val, 0] = spr_marceline_p;
global.PORT[val, 1] = 119;
global.PORT[val, 2] = 112;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 27;
global.PORT[val, 0] = spr_lukas_p;
global.PORT[val, 1] = 135;
global.PORT[val, 2] = 72;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 28;
global.PORT[val, 0] = spr_eggs_p;
global.PORT[val, 1] = 120;
global.PORT[val, 2] = 107;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 29;
global.PORT[val, 0] = spr_merpe_p;
global.PORT[val, 1] = 116;
global.PORT[val, 2] = 85;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 30;
global.PORT[val, 0] = spr_morgan_male_p;
global.PORT[val, 1] = 118;
global.PORT[val, 2] = 91;
global.PORT[val, 3] = 5; //scared index
global.PORT[val, 4] = 3; //angry index

val = 31;
global.PORT[val, 0] = spr_baxkgoru_p;
global.PORT[val, 1] = 112;
global.PORT[val, 2] = 60;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 32;
global.PORT[val, 0] = spr_lakki_p;
global.PORT[val, 1] = 125;
global.PORT[val, 2] = 89;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 33;
global.PORT[val, 0] = spr_bones_p;
global.PORT[val, 1] = 144;
global.PORT[val, 2] = 84;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 34;
global.PORT[val, 0] = spr_shang_p;
global.PORT[val, 1] = 113;
global.PORT[val, 2] = 67;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 35;
global.PORT[val, 0] = spr_tiki_p;
global.PORT[val, 1] = 115;
global.PORT[val, 2] = 107;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 4; //angry index

val = 36;
global.PORT[val, 0] = spr_anna2_p;
global.PORT[val, 1] = 120;
global.PORT[val, 2] = 80;
global.PORT[val, 3] = 0; //scared index
global.PORT[val, 4] = 0; //angry index

val = 37;
global.PORT[val, 0] = spr_camilla_p;
global.PORT[val, 1] = 128;
global.PORT[val, 2] = 73;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 0; //angry index

val = 38;
global.PORT[val, 0] = spr_rhajat_p;
global.PORT[val, 1] = 106;
global.PORT[val, 2] = 95;
global.PORT[val, 3] = 2; //scared index
global.PORT[val, 4] = 5; //angry index

val = 39;
global.PORT[val, 0] = spr_corrin_f_p;
global.PORT[val, 1] = 112;
global.PORT[val, 2] = 72;
global.PORT[val, 3] = 5; //scared index
global.PORT[val, 4] = 4; //angry index

val = 40;
global.PORT[val, 0] = spr_corrin_m_p;
global.PORT[val, 1] = 113;
global.PORT[val, 2] = 71;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 4; //angry index

val = 41;
global.PORT[val, 0] = spr_kana_m_p;
global.PORT[val, 1] = 113;
global.PORT[val, 2] = 98;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 42;
global.PORT[val, 0] = spr_ophelia_p;
global.PORT[val, 1] = 114;
global.PORT[val, 2] = 94;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 43;
global.PORT[val, 0] = spr_kana_f_p;
global.PORT[val, 1] = 115;
global.PORT[val, 2] = 100;
global.PORT[val, 3] = 4; //scared index
global.PORT[val, 4] = 2; //angry index

val = 44;
global.PORT[val, 0] = spr_soleil_p;
global.PORT[val, 1] = 110;
global.PORT[val, 2] = 84;
global.PORT[val, 3] = 5; //scared index
global.PORT[val, 4] = 3; //angry index

val = 0;
global.ACC[val, 0] = spr_crown1;

val = 1;
global.ACC[val, 0] = spr_tiara1;

val = 2;
global.ACC[val, 0] = spr_earmuffs;

val = 3;
global.ACC[val, 0] = spr_headband1;

val = 4;
global.ACC[val, 0] = spr_hairpiece;



val = 0;
global.LEVELDIAL[val, 0] = "Thank you for placing your trust in me. I'll try to lead the way!";
global.LEVELDIAL[val, 1] = "I'll be able to keep contributing to the task at hand. Let's go!" ;
global.LEVELDIAL[val, 2] = "I'll work harder for all of us, I promise.";
global.LEVELDIAL[val, 3] = "Ah well, that's how life works, I guess.";
global.LEVELDIAL[val, 4] = "Clearly you broke the game somehow.";


val = 1;
global.LEVELDIAL[val, 0] = "It all depends on me, I have to keep going!";
global.LEVELDIAL[val, 1] = "Yay!! but I can still do better!" ;
global.LEVELDIAL[val, 2] = "I wasted so much time trying to fix that stupid thing wow.";
global.LEVELDIAL[val, 3] = "Today is lazy day!";
global.LEVELDIAL[val, 4] = "You can't get sandier than this.";

val = 2;
global.LEVELDIAL[val, 0] = "Wow, I must have some really good growths, or you're just really lucky!";
global.LEVELDIAL[val, 1] = "Hey, I'm getting better!" ;
global.LEVELDIAL[val, 2] = "Meh, decent enough.";
global.LEVELDIAL[val, 3] = "I wish I had an explanation for this lack of growth.";
global.LEVELDIAL[val, 4] = "I guess that's it then. I've come really far.";

val = 3;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 4;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 5;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 6;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 7;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 8;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 9;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";

val = 100;
global.LEVELDIAL[val, 0] = "Wow... Sometimes I surprise even myself!";
global.LEVELDIAL[val, 1] = "Now that's what I call progress!" ;
global.LEVELDIAL[val, 2] = "I can tell I've gotten stronger.";
global.LEVELDIAL[val, 3] = "Hmm, I don't feel very different...";
global.LEVELDIAL[val, 4] = "Maybe I should learn some new skills...";


////DIALOGUE

fontColor1 = make_color_rgb(253, 236, 185);
fontColor2 = make_color_rgb(68, 8, 0);
fontColor3 = make_color_rgb(89, 89, 89);
fontColor4 = make_color_rgb(220, 150, 16);
fontColor5 = make_color_rgb(120, 120, 120);
fontColor6 = make_color_rgb(40, 190, 40);
fontColor7 = make_color_rgb(255, 220, 200);
fontColor8 = make_color_rgb(255, 215, 130);
fontColor9 = make_color_rgb(0, 180, 180);
fontColor10 = make_color_rgb(25, 65, 50);
fontColor11 = make_color_rgb(50, 50, 50);
fontColor12 = make_color_rgb(35, 140, 35);
musMap = -1;
ambMap = -1;
goTo = 3;
state = "idle";
gamestate = "sandynotes";
section = 0;
image = 0;
fade = 0;

global.glSelect = 0;
global.glSelect2 = 0;
global.glSelect3 = 0;
global.glSelect4 = 0;
global.glSelect5 = 0;
global.glSelect6 = 1;
global.glSelect7 = 0;
global.glSelect8 = 0;
global.glSelect9 = 0;
selling = 0;

global.textPosition = 0; //0 = normal, 1 = top
global.textAlign = -1; //-1 = left, 0 = center, 1 = right
global.textType = 0; //0 = normal, 1 = small
global.charDial[0] = -1;
global.charDial[1] = -1;
global.charDial[2] = -1;
oldAlpha[0] = 0;
oldAlpha[1] = 0;
oldAlpha[2] = 0;
charCome[0] = -1;
charCome[1] = -1;
charCome[2] = -1;
wait = true;

//engine
global.write = 0;
global.textboxAlpha = 0;
global.charAlpha[0] = 0;
global.charAlpha[1] = 0;
global.charAlpha[2] = 0;
global.charLeave[0] = 0;
global.charLeave[1] = 0;
global.charLeave[2] = 0;
global.charBlush[0] = 0;
global.charBlush[1] = 0;
global.charBlush[2] = 0;
global.charTarBlush[0] = 0;
global.charTarBlush[1] = 0;
global.charTarBlush[2] = 0;

global.currentStep = 0;
global.textY = 1;
change = -1;
surfScreen = surface_create(global.window_w, global.window_h);
surfScreen2 = surface_create(global.window_w, global.window_h);
surfPort = surface_create(256, 256);
surfPortsmall = surface_create(70, 50);
sinWave = 0;
sinVal = 0;
sinWave2 = 0;
sinVal2 = 0;

alarm[8] = 36000;

//fade
global.fadeTimer = 0;

global.backgroundcharAlpha = 1;
global.backgroundcharPos = 1;
global.currentBackground = -1;
global.backgroundtoSet = -1;
global.fadeinTimer = 0;
global.fadeoutTimer = 0;
global.fadeholdTimer = 0;
global.fadeColor = c_black;
global.fadeState = -1;
global.fadeTurn = 0;
global.gradientAlpha = 0;

for(var i = 0; i < 100; i ++)
{
	global.step[i, 0] = "";
	global.step[i, 1] = noone;
	global.step[i, 2] = -1;
	global.step[i, 3] = -1;
	global.step[i, 4] = -1;
	global.step[i, 5] = -1;
	global.step[i, 6] = -1;
	global.step[i, 7] = -1;
	global.step[i, 8] = -1;
	global.step[i, 9] = -1;
	global.step[i, 10] = -1;
	global.step[i, 11] = -1;
	global.step[i, 12] = -1;
	global.step[i, 13] = -1;
	global.step[i, 14] = -1;
	global.step[i, 15] = -1;
	global.step[i, 16] = -1;
	global.step[i, 17] = -1;
	global.step[i, 18] = -1;
	global.step[i, 19] = -1;
	global.step[i, 20] = -1;
	global.step[i, 21] = -1;
	global.step[i, 22] = -1;
}

//STATS
global.STAT[0] = "Hp";
global.STAT[1] = "Str";
global.STAT[2] = "Mag";
global.STAT[3] = "Skill";
global.STAT[4] = "Spd";
global.STAT[5] = "Lck";
global.STAT[6] = "Def";
global.STAT[7] = "Res";


//controls
global.controlsType = 1; //0 = mouse, 1 = keyboard, 2 = joystick

global.startKey = ord("M");
global.selectKey = ord("N");

global.upKey = vk_up;
global.downKey = vk_down;
global.rightKey = vk_right;
global.leftKey = vk_left;

global.Akey = ord("A");
global.Bkey = ord("S");
global.Xkey = ord("Z");
global.Ykey = ord("X");

global.Lshoulder = ord("Q");
global.Rshoulder = ord("W");
global.ctrlKey = vk_shift;

LoadControls();

////
global.startKey_state = 0;
global.selectKey_state = 0;

global.Akey_state = 0;
global.Bkey_state = 0;
global.Xkey_state = 0;
global.Ykey_state = 0;

global.upKey_state = 0;
global.downKey_state = 0;
global.rightKey_state = 0;
global.leftKey_state = 0;

global.Lshoulder_state = 0;
global.Rshoulder_state = 0;
global.ctrlKey_state = 0;

//misc
global.minkeySpeed = 4;
global.maxkeySpeed = 15;
global.lockKeys = 0;
global.lockAxis = 0;
global.lastUsed = 0;

//prep
global.prepOptions = 0;

global.prepText[global.prepOptions] = "Select Units";
global.prepDescription[global.prepOptions] = "Select the units who will fight.";
global.prepOptions++;

global.prepText[global.prepOptions] = "View Map";
global.prepDescription[global.prepOptions] = "View the map and set unit starting positions.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Inventory";
global.prepDescription[global.prepOptions] = "Manage items.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Start!";
global.prepDescription[global.prepOptions] = "End preparations and start the battle.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Support";
global.prepDescription[global.prepOptions] = "Build unit relationships via conversations.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Equip Skills";
global.prepDescription[global.prepOptions] = "Equip and remove skills.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Save";
global.prepDescription[global.prepOptions] = "Save your progress.";
global.prepOptions++;

global.prepText[global.prepOptions] = "Exit";
global.prepDescription[global.prepOptions] = "Return to your castle.";
global.prepOptions++;

global.prepOptions = 0;

global.prepText2[global.prepOptions] = "Inventory";
global.prepDescription2[global.prepOptions] = "Manage items.";
global.prepOptions++;

global.prepText2[global.prepOptions] = "Equip Skills";
global.prepDescription2[global.prepOptions] = "Equip and remove skills.";
global.prepOptions++;

global.prepText2[global.prepOptions] = "Support";
global.prepDescription2[global.prepOptions] = "Build unit relationships via conversations.";
global.prepOptions++;

global.prepText2[global.prepOptions] = "Save";
global.prepDescription2[global.prepOptions] = "Save your progress.";
global.prepOptions++;

//mainmenu
for(var i = 0; i < 10; i ++)
{
	global.mmenuText[0] = "";
	global.mmenuDescription[0] = "";
}

global.mmenuText[0] = "Continue";
global.mmenuDescription[0] = "Continue from a save file.";

global.mmenuText[1] = "New Game";
global.mmenuDescription[1] = "Start the game from the beginning.";

global.mmenuText[2] = "Multiplayer(WIP)";
global.mmenuDescription[2] = "Play with other people.";

global.mmenuText[3] = "Duplicate";
global.mmenuDescription[3] = "Duplicate a save file.";

global.mmenuText[4] = "Delete";
global.mmenuDescription[4] = "Delete a save file.";

global.mmenuOptions = 5;

//menu
for(var i = 0; i < 10; i ++)
{
	global.menuText[0] = "";
	global.menuDescription[0] = "";
}
global.menuOptions = 0;
global.menuOptions2 = 0;

global.menuText2[global.menuOptions2] = "Full Screen";
global.menuDescription2[global.menuOptions2] = "Enable full screen.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Controls";
global.menuDescription2[global.menuOptions2] = "Change controls mode.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Music Volume";
global.menuDescription2[global.menuOptions2] = "Adjust the volume of music.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Master Volume";
global.menuDescription2[global.menuOptions2] = "Adjust the volume of all sound.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "True Hit Calculation";
global.menuDescription2[global.menuOptions2] = "Change how true hit is calculated.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Camera Style";
global.menuDescription2[global.menuOptions2] = "Change camera movement style.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Particles";
global.menuDescription2[global.menuOptions2] = "Enable Particles.";
global.menuOptions2++;

global.menuText2[global.menuOptions2] = "Skip Enemy Turn";
global.menuDescription2[global.menuOptions2] = "Enable Particles.";
global.menuOptions2++;


global.menuOptions3 = 0;

global.menuText3[global.menuOptions3] = "Start Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "Select Key";
global.menuOptions3++;

global.menuText3[global.menuOptions3] = "Up Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "Down Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "Right Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "Left Key";
global.menuOptions3++;

global.menuText3[global.menuOptions3] = "A Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "B Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "X Key";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "Y Key";
global.menuOptions3++;

global.menuText3[global.menuOptions3] = "L Shoulder";
global.menuOptions3++;
global.menuText3[global.menuOptions3] = "R Shoulder";
global.menuOptions3++;

global.menuText3[global.menuOptions3] = "Fast Forward Key";
global.menuOptions3++;

for(var i = 0; i < global.menuOptions3; i ++)
{
	keyvar[i] = -1;
}

/////////////////////////////////////////////

global.nOptionsMenu[0] = 2;
global.nOptionsMenu[1] = 3;
global.nOptionsMenu[2] = -1;
global.nOptionsMenu[3] = -1;
global.nOptionsMenu[4] = 2;
global.nOptionsMenu[5] = 2;
global.nOptionsMenu[6] = 2;
global.nOptionsMenu[7] = 2;

global.optionsType[0] = 0;
global.optionsType[1] = 0;
global.optionsType[2] = 1;
global.optionsType[3] = 1;
global.optionsType[4] = 0;
global.optionsType[5] = 0;
global.optionsType[6] = 0;
global.optionsType[7] = 0;

global.optionsM[0, 0] = "Windowed";
global.optionsM[0, 1] = "Full Screen";

global.optionsM[1, 0] = "Mouse/Keyboard";
global.optionsM[1, 1] = "Classic";
global.optionsM[1, 2] = "Joystick";


global.optionsM[2, 0] = 1; // 0 = choose, 1 = slider

global.optionsM[3, 0] = 1; // 0 = choose, 1 = slider

global.optionsM[4, 0] = "1RN";
global.optionsM[4, 1] = "2RN (default)";

global.optionsM[5, 0] = "Classic";
global.optionsM[5, 1] = "Awakening/Fates";

global.optionsM[6, 0] = "Off";
global.optionsM[6, 1] = "On";

global.optionsM[7, 0] = "No";
global.optionsM[7, 1] = "Yes";


//fdsa


global.debugList = ds_list_create();
global.itemDrops = ds_list_create();
global.recDrops = ds_list_create();
global.recDropsAm = ds_list_create();
nup = ds_list_create();
nupVal = ds_list_create();
itemList = ds_list_create();
global.charList = ds_list_create();

StartGenerate();
StartGame();
//CharListOrder();

//DIALOGUETEST
vnAudio = -1;
lastAudio = -1;
vnAmbient = -1;
lastAmbient = -1;
prepareend = false;

slash = "|";
alarm[4] = 30;
global.debugWrite = "";
global.debugIndex = 0;

caret_flash = 0
caret_flash_rate = 15
caret_move = 0
caret_move_rate = 12
text = "" // current text
text2 = "" // current text
caret = 0 // caret position
caret2 = 0 // caret position
fillchar = "`" // used as filler character in input handling.
filltext = string_repeat(fillchar, 10)
filltext2 = string_repeat(fillchar, 10)

buildver = "v1.85";
sandynotes = "- Movement skills.";
ds_list_add(global.debugList, "build " + buildver + "!!");
global.debugIndex ++;


//SAVES
//global.refresh = 1;
cid = 0;
global.lastStage = 0;
global.nFiles = 0;
global.nBattleFiles = 0;
global.currentFile = "";
global.currentFileType = 0;
global.simpleFadeout = 0;
global.simpleFadeoutsp = 1;
for(var i = 0; i < 10; i ++)
{
	global.saveFiles[i] = "null";
	global.battleFiles[i] = "null";
	global.saveFiles_seconds[i] = "";
	global.saveFiles_stage[i] = 0;
	global.battleFiles_seconds[i] = "";
	global.battleFiles_stage[i] = 0;
}

global.seconds = 0;
alarm[10] = 60;

RefreshSaves();
fileName = "";
fileName2 = "";

IP = "127.0.0.1";
PORT = 8000;

//players
for(var i = 0; i < 16; i ++)
{
    global.PLAYER[i, 0] = -1;
    global.PLAYER[i, 1] = -1;
    global.PLAYER[i, 2] = -1;
}

