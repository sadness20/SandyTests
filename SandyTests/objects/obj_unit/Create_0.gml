/// @description Insert description here
// You can write your code in this editor

depth = -y + 24;
characterID = 0;

lightpower=100;
lightalpha=25;
lightcolor=c_white;
lightjitter=0;

lightxpos=0;
lightypos=-30;

lighttype=spr_light;

/////
gridX = 0;
gridY = 0;
rewindX = 0;
rewindY = 0;
xscale = 1;
yscale = 1;
delay = 0;
damagedealt = 0;
damagehealed = 0;
returnMult = 1;
minRangeDamage = 9999;
maxRangeDamage = 0;
minRangeAlly = 9999;
maxRangeAlly = 0;
global.markedColor = 1;
effectiveDamage = 0;
adva = 0;
allure = 0;
gainSupport = false;
allureturns = 0;
ofaction = -1;
captured = 0;
canDance = 1;
isCarrying = noone;
oldFaction = -1;
isGhost = 0;
canGaleforce = 1;

for(var i = 0; i < 10; i ++)
{
	hasSkill[i] = 0;
}

movementPath = path_add();
path_set_kind(movementPath, 0);
path_set_closed(movementPath, false);
moved = false;

moveSpeed = 3;
state = "create";
lead = -1;
standingNode = -1;
standingSpawn = -1;

SPRITE = -1;
index = 0;
cindex = 0;
cdir = -1;

footstepTimer = 0;
myfootstep = sfx_footstep;

MAXHP = 125;
HP = MAXHP;
HPD = MAXHP;

MAXMP = 4;
MP = MAXMP;

MAXSTR = 0; //str
STR = MAXSTR;
MAXMAG = 0; //mag
MAG = MAXMAG;
MAXSKILL = 0; //skill
SKILL = MAXSKILL
MAXSPD = 0; //spd
SPD = MAXSPD;
MAXLCK = 0; //lck
LCK = MAXLCK;
MAXDEF = 0; //def
DEF = MAXDEF;
MAXRES = 0; //res
RES = MAXRES;

MAXSP = 0;
SP = MAXSP;

HIT = 0;
CRIT = 0;
AVO = 0;
ATK = 0;

HITd = 0;
CRITd = 0;
ATKd = 0;

atkbuff = 0;
defbuff = 0;
hitbuff = 0;
critbuff = 0;
avobuff = 0;
spbuff = 0;

atkbuff_area = 0;
defbuff_area = 0;
hitbuff_area = 0;
critbuff_area = 0;
avobuff_area = 0;
spbuff_area = 0;

skillbuff_area = 0;
luckbuff_area = 0;
speedbuff_area = 0;

terrainBonus = 0;
wheal = 0;
walkDis = 0;
walkDir = 96;

tempVar = 0;

//range
minRange = 0;
maxRange = 0;

//items


xx = 0;
yy = 0;
xTarget = -1;
yTarget = -1;
xpr = 0;
ypr = 0;
vy = 0;
combatvy = 0;
dieTimer = 0;
vis = 1;
alpha = 1;
levelup = 0;
markRange = false
showdamage = 1;
isBoss = false;
debuffed = false;
endturnType = 0;
canAttack = 1;
			
snapHP = 0;
tickTimer = 0;
tickAmount = 0;
tickTimerCeil = 0;

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

//combat
xpmult = 1;
cx = 0;
cy = 0;
startdis = 0;
maxhitLag = 5;
hitLag = maxhitLag;
dis = 0;
nturns = 1;
maxattacks = 1;
nattacks = maxattacks;
target = noone;
xpgained = 0;
hitStun = 0;
weapon = -1;
mySpell = -1;
hitbonus = 0;
atkbonus = 0;
weaponType = 0;
terrainATK = 0;
terrainHIT = 0;
critd = false;
dodged = false;
combatSkill = -1;
mind = -1;
transformID = -1;
//hitFrame = 11;

//game
usedTurn = 0;
partner = noone;
pairLead = 0;
lastWeapon = -1;
equipAfter = -1;


//combatfx
vspd = 0;
htlg = 0;
dodgeType = 0;
calc = false;
initCombatfx = -1;
skid = false;

//AI
aiType = 0;
aggressive = true;
sacrifice = false;
cNode = noone;
cTarget = noone;
wdie = false;
canSurrender = false;

//misc

for(var i = 0; i < 20; i ++)
{
	buff[i, 0] = -1;
	buff[i, 1] = 0;
	buff[i, 2] = -1;
	buff[i, 3] = -1;
	buff[i, 4] = -1;
	buff[i, 5] = -1;
}
/*
for(var i = 0; i < 50; i ++)
{
	areabuff[i, 0] = -1; //type
	areabuff[i, 1] = -1; //might
	areabuff[i, 2] = -1; //buffid
}
*/