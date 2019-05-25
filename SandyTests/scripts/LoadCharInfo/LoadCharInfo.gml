var buf = argument[0];
var char = argument[1];

char.characterID = buffer_read(buf, buffer_u16);
//show_message(char.characterID);
char.faction = buffer_read(buf, buffer_u8);
		
char.gridX = buffer_read(buf, buffer_u16);
char.gridY = buffer_read(buf, buffer_u16);
char.rewindX = buffer_read(buf, buffer_u16);
char.rewindY = buffer_read(buf, buffer_u16);
		
char.minRangeDamage = buffer_read(buf, buffer_u16);
char.maxRangeDamage = buffer_read(buf, buffer_u16);
char.minRangeAlly = buffer_read(buf, buffer_u16);
char.maxRangeAlly = buffer_read(buf, buffer_u16);
		
char.allureturns = buffer_read(buf, buffer_u8);
char.ofaction = buffer_read(buf, buffer_s8);
		
char.MAXHP = buffer_read(buf, buffer_s16);
char.HP = buffer_read(buf, buffer_s16);
char.MAXMP = buffer_read(buf, buffer_s16);
char.MP = buffer_read(buf, buffer_s16);

char.HPD = char.HP;	
char.MAXSTR = buffer_read(buf, buffer_s16);
char.STR = buffer_read(buf, buffer_s16);
		
char.MAXMAG = buffer_read(buf, buffer_s16);
char.MAG = buffer_read(buf, buffer_s16);
char.MAXSKILL = buffer_read(buf, buffer_s16);
char.SKILL = buffer_read(buf, buffer_s16);
		
char.MAXSPD = buffer_read(buf, buffer_s16);
char.SPD = buffer_read(buf, buffer_s16);	
char.MAXLCK = buffer_read(buf, buffer_s16);
char.LCK = buffer_read(buf, buffer_s16);
		
char.MAXDEF = buffer_read(buf, buffer_s16);
char.DEF = buffer_read(buf, buffer_s16);	
char.MAXRES = buffer_read(buf, buffer_s16);
char.RES = buffer_read(buf, buffer_s16);
		
char.MAXSP= buffer_read(buf, buffer_s16);
char.SP = buffer_read(buf, buffer_s16);
		
		
char.HIT = buffer_read(buf, buffer_s16);
char.CRIT = buffer_read(buf, buffer_s16);
char.AVO = buffer_read(buf, buffer_s16);
char.ATK = buffer_read(buf, buffer_s16);
		
char.HITd = buffer_read(buf, buffer_s16);
char.CRITd = buffer_read(buf, buffer_s16);
char.ATKd = buffer_read(buf, buffer_s16);
		
char.atkbuff = buffer_read(buf, buffer_s16);
char.defbuff = buffer_read(buf, buffer_s16);
char.hitbuff = buffer_read(buf, buffer_s16);
char.critbuff = buffer_read(buf, buffer_s16);

char.avobuff = buffer_read(buf, buffer_s16);
char.spbuff = buffer_read(buf, buffer_s16);
		
char.atkbuff_area = buffer_read(buf, buffer_s16);
char.defbuff_area = buffer_read(buf, buffer_s16);
char.hitbuff_area = buffer_read(buf, buffer_s16);
char.critbuff_area = buffer_read(buf, buffer_s16);

char.avobuff_area = buffer_read(buf, buffer_s16);
char.spbuff_area = buffer_read(buf, buffer_s16);
		
char.skillbuff_area = buffer_read(buf, buffer_s16);
char.luckbuff_area = buffer_read(buf, buffer_s16);
char.speedbuff_area = buffer_read(buf, buffer_s16);
		
char.terrainBonus = buffer_read(buf, buffer_u8);
char.minRange = buffer_read(buf, buffer_u16);
char.maxRange = buffer_read(buf, buffer_u16);
		
//char.markRange = buffer_read(buf, buffer_bool);
char.isBoss = buffer_read(buf, buffer_bool);
char.debuffed = buffer_read(buf, buffer_bool);
char.usedTurn = buffer_read(buf, buffer_bool);
		
char.canAttack = buffer_read(buf, buffer_u8);
char.lastWeapon = buffer_read(buf, buffer_s16);
char.equipAfter = buffer_read(buf, buffer_s16);
		
char.aiType = buffer_read(buf, buffer_u8);
char.aggressive = buffer_read(buf, buffer_bool);
char.sacrifice = buffer_read(buf, buffer_bool);
char.wdie = buffer_read(buf, buffer_bool);
char.canSurrender = buffer_read(buf, buffer_bool);
char.canDance = buffer_read(buf, buffer_bool);	

char.isCarrying = buffer_read(buf, buffer_s16);
char.oldFaction = buffer_read(buf, buffer_s8);	

for(var ii = 0; ii < 20; ii ++)
{
	char.buff[ii, 0] = buffer_read(buf, buffer_s16);
	char.buff[ii, 1] = buffer_read(buf, buffer_s16);
	char.buff[ii, 2] = buffer_read(buf, buffer_s16);
	char.buff[ii, 3] = buffer_read(buf, buffer_s16);
	char.buff[ii, 4] = buffer_read(buf, buffer_s16);
	char.buff[ii, 5] = buffer_read(buf, buffer_s16);
}
for(var i = 0; i < 10; i ++)
{
	char.hasSkill[i] = buffer_read(buf, buffer_bool);
}

char.depth = buffer_read(buf, buffer_s32);
char.lightpower = buffer_read(buf, buffer_u16);
char.lightalpha = buffer_read(buf, buffer_u8);
char.lightcolor = buffer_read(buf, buffer_u32);
char.lightxpos = buffer_read(buf, buffer_s16);
char.lightypos = buffer_read(buf, buffer_s16);

char.isGhost = buffer_read(buf, buffer_bool);
char.canGaleforce = buffer_read(buf, buffer_bool);