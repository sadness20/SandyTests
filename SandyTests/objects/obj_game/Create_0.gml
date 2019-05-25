/// @description Insert description here
// You can write your code in this editor


instance_create_layer(0, 0, "back", obj_camera);

instance_create_depth(0, 0, -8000, obj_globalLight);
instance_create_depth(0, 0, 0, obj_particles);

global.gridSize = 32;
global.scrollSpeed = 20;
global.transitionCombat = 0;
global.char1 = noone;
global.char2 = noone;
global.rangeToggle = false;
global.enemyUpdated = true;
global.targetOp = noone;
global.nSpawns = 0;
global.glSelect5 = 0;
global.oldZoom = 2;
global.nTurn = 0;

for(var i = 0; i < 24; i ++)
{
	global.spawn[i] = noone;
}
selType = 0;
whoDied = -1;
triggerScene = -4;
reinScene = 0;
arrowSelect1 = 0;
arrowSelect2 = 0;
targetDis = 0;
weaponsinrange = 0;
skillsinrange = 0;
enemycapture = -1;
nosound = 0;
cx = 0;
cy = 0;
moveKey = 0;
areaIn = 0;
vcheck = 0;
hcheck = 0;
pickIndex = 0;
scrollTimer = 0;
musPreparation = -1;
indVal = 0;
reusable1 = 0;
tempVar = noone;
tempVar2 = 0;
tempVar3 = 0;
unitCreate = 0;
skillGained = -1;
weaponadvancetype = -1;
weaponadvancerank = -1;
charbox = -1;
allyenemy = 0;
targetLis = 0;
//weaponPreview = -1;

//combat
global.hoverUnit = noone;
global.combatDistance = 0;
global.combatX = 0;
global.combatY = 0;
global.combatXpos = -1000;
global.combatYpos = -1000;
global.showAnimations = true;
global.showXP = 0;

global.worldXoffset = 128;
global.worldYoffset = 128;

global.nextAction = -1;
global.currentTurn = -1;
global.activeCharacters = 0;
endcombattimer = 0;
empty = noone;

xview = 0;
tcdir = -1;
tindex = 0;
tcindex = 0;
typ = 0;

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

depth = -5000;

fontColor1 = make_color_rgb(253, 236, 185);
fontColor2 = make_color_rgb(68, 8, 0);
fontColor3 = make_color_rgb(89, 89, 89);
fontColor4 = make_color_rgb(220, 150, 16);
fontColor5 = make_color_rgb(120, 120, 120);
fontColor6 = make_color_rgb(40, 190, 40);
fontColor7 = make_color_rgb(255, 220, 200);
fontColor8 = make_color_rgb(255, 215, 130);
fontColor9 = make_color_rgb(35, 140, 35);
fontColor10 = make_color_rgb(140, 35, 35);


xScroll = 0;

global.mapWidth = global.MAP[global.currentMap, 15];
global.mapHeight = global.MAP[global.currentMap, 16];
global.max_move = 24; // maxim

global.hoverNode = noone;
global.lastNode = noone;
lastHover = -1;

global.selectedActor = noone;
global.pairupTarget = noone;
global.cturn = 0;
global.unitMoving = noone;

global.phase = 0;
global.target = noone;

global.cellAttack = noone;
global.itemOptions = 0;
global.canRewind = true;

obj_pers.gameFade = 1;
gamestate = "wait";
healUnit = noone;
path = ds_list_create();
for(var i = 0; i < 10; i ++)
{
	global.options[i] = "";
	global.options2[i] = "";
	weaponinrange[i] = false;
}
inCombat = 0;
cbTimer = 0;
opSize = 1;
opSize2 = 1;
opSize3 = 1;
opSize4 = 1;
global.enemyTurn = 0;

cbAlpha = 0;
cbSizeX = 1;
cbSizeY = 1.5;
cbSize2 = 1;
sfxTimer = 0;
guiTimer = 0;
guiTimer2 = 0;
guiTimer3 = 0;
guiTimer4 = 0;
guiStep = 0;
lastOp = 0;
global.charlevelup = noone;
global.combatType = 0;
global.cellDistance = 0;

nup = ds_list_create();
nupVal = ds_list_create();
nupshow = 0;
for(var i = 0; i < 8; i ++)
{
	statup[i] = 0;
	nupshowy[i] = 0;
}

global.opSelect = 0;
global.opSelect2 = 0;
global.opSelect3 = 0;
global.opSelect4 = 0;
surfOptions = surface_create(240, 240);
surfItems = surface_create(240, 240);
surfTrade1 = surface_create(200, 200);
surfTrade2 = surface_create(260, 200);
surfTradep1 = surface_create(200, 90);
surfTradep2 = surface_create(200, 90);
surfStats = surface_create(global.window_w, global.window_h);
surfPort = surface_create(128, 128);
surfPort2 = surface_create(128, 128);
surfCombat = surface_create(global.window_w, global.window_h);
surfBroke = surface_create(222, 66);
opEnd = 0;
chooseTimer = 0;
chooseTi = 20;

index1trade = -1;
index2trade = -1;
whotowho = -1;
dot = "";

trade1xpos = 48;
trade1ypos = 72;
trade2xpos = 400 - 28 - 154;
trade2ypos = 72;
currentHeal = 0;

state = "wait";
instance_create_depth(0, 0, 90, obj_highDepth);

for(xx = 0; xx < global.mapWidth; xx ++)
{
	for(yy = 0; yy < global.mapHeight; yy ++)
	{
		global.map[xx, yy] = instance_create_layer(xx * global.gridSize, yy * global.gridSize, "back", obj_node);
	}
}


//populate neighbor lists!
for(xx = 0; xx < global.mapWidth; xx += 1)
{
	for(yy = 0; yy < global.mapHeight; yy += 1)
	{
			
		node = global.map[xx, yy];
		node.gridX = xx;
		node.gridY = yy;

		//add left neighbor
		if(xx > 0)
		{
			ds_list_add(node.neighbors, global.map[xx - 1, yy]);
		}

		//add right neighbor
		if(xx < global.mapWidth - 1)
		{
			ds_list_add(node.neighbors, global.map[xx + 1, yy]);
		}

		//add top neighbor
		if(yy > 0)
		{
			ds_list_add(node.neighbors, global.map[xx, yy - 1]);
		}

		//add bottom neighbor
		if(yy < global.mapHeight - 1)
		{
			ds_list_add(node.neighbors, global.map[xx, yy + 1]);
		}
	}
}

with(obj_unit)
{
	depth = -y;
}

global.faction[0] = ds_list_create();
global.faction[1] = ds_list_create();
global.faction[2] = ds_list_create();
global.newTurn = 0;

global.turnbarX = 32;
global.turnbarY = 32;
colorMult = 1;
col = 0;
col2 = 0;
xd = 0;
xd2 = 0;
ov = false;

instance_create_depth(0, 0, 0, obj_nodeDrawer);
instance_create_depth(0, 0, 0, obj_nodeDrawer1);

randomize();

/*
instance_create_layer(0, 0, "back", obj_phase);
alarm[1] = 100;
*/

for(i = 0; i < global.mapHeight; i ++)
{
    global.tileBinary[i] = 0;
	global.tileBinary2[i] = 0;
}

for(i = 0; i < global.max_move; i ++)
{
    global.pathArray[i] = noone;
}
global.pathSize = 0;
global.pathDraw = 0;

//AI
targetList = ds_list_create();
myList = ds_list_create();
priorityList = ds_priority_create();
targetPriority = ds_priority_create();
currentEnemy = 0;

//misc
tradersList = ds_priority_create();
healTimer = 0;
healAmount = 0;
tabIndex = 0;
tabFaction = 0;

//Terrain Bonuses
for(var i = 0; i < 10; i ++)
{
	global.terrainmod[i, 0] = 0; //atkmod
	global.terrainmod[i, 1] = 0; //defmod
	global.terrainmod[i, 2] = 0; //hitmod
	global.terrainmod[i, 3] = 0; //critmod
	global.terrainmod[i, 4] = 0; //avomod
	global.terrainmod[i, 5] = 0; //healmod
	global.terrainmod[i, 6] = "Plains"; //name
}
global.terrainmod[2, 0] = 0; //atkmod
global.terrainmod[2, 1] = 1; //defmod
global.terrainmod[2, 2] = 0; //hitmod
global.terrainmod[2, 3] = 0; //critmod
global.terrainmod[2, 4] = 20; //avomod
global.terrainmod[2, 5] = 0; //healmod
global.terrainmod[2, 6] = "Forest"; //healmod

global.terrainmod[3, 0] = 0; //atkmod
global.terrainmod[3, 1] = 2; //defmod
global.terrainmod[3, 2] = 0; //hitmod
global.terrainmod[3, 3] = 0; //critmod
global.terrainmod[3, 4] = 20; //avomod
global.terrainmod[3, 5] = 20; //healmod
global.terrainmod[3, 6] = "Fort"; //healmod

global.terrainmod[4, 0] = 0; //atkmod
global.terrainmod[4, 1] = 0; //defmod
global.terrainmod[4, 2] = 0; //hitmod
global.terrainmod[4, 3] = 0; //critmod
global.terrainmod[4, 4] = 0; //avomod
global.terrainmod[4, 5] = 0; //healmod
global.terrainmod[4, 6] = "Water"; //healmod

global.terrainmod[5, 0] = 0; //atkmod
global.terrainmod[5, 1] = 2; //defmod
global.terrainmod[5, 2] = 0; //hitmod
global.terrainmod[5, 3] = 0; //critmod
global.terrainmod[5, 4] = 30; //avomod
global.terrainmod[5, 5] = 0; //healmod
global.terrainmod[5, 6] = "Mountain"; //healmod