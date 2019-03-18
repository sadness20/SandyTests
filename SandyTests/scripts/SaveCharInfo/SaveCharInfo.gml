var buf = argument[0];
var char = argument[1];

buffer_write(buf, buffer_u16, char.characterID);
buffer_write(buf, buffer_u8, char.faction);
	
buffer_write(buf, buffer_u16, char.gridX);
buffer_write(buf, buffer_u16, char.gridY);
buffer_write(buf, buffer_u16, char.rewindX);
buffer_write(buf, buffer_u16, char.rewindY);
	
buffer_write(buf, buffer_u16, char.minRangeDamage);
buffer_write(buf, buffer_u16, char.maxRangeDamage);
buffer_write(buf, buffer_u16, char.minRangeAlly);
buffer_write(buf, buffer_u16, char.maxRangeAlly);
	
buffer_write(buf, buffer_u8, char.allureturns);
buffer_write(buf, buffer_s8, char.ofaction);
	
buffer_write(buf, buffer_s16, char.MAXHP);
buffer_write(buf, buffer_s16, char.HP);
buffer_write(buf, buffer_s16, char.MAXMP);
buffer_write(buf, buffer_s16, char.MP);

buffer_write(buf, buffer_s16, char.MAXSTR);
buffer_write(buf, buffer_s16, char.STR);
	
buffer_write(buf, buffer_s16, char.MAXMAG);
buffer_write(buf, buffer_s16, char.MAG);
buffer_write(buf, buffer_s16, char.MAXSKILL);
buffer_write(buf, buffer_s16, char.SKILL);
	
buffer_write(buf, buffer_s16, char.MAXSPD);
buffer_write(buf, buffer_s16, char.SPD);
buffer_write(buf, buffer_s16, char.MAXLCK);
buffer_write(buf, buffer_s16, char.LCK);
	
buffer_write(buf, buffer_s16, char.MAXDEF);
buffer_write(buf, buffer_s16, char.DEF);
buffer_write(buf, buffer_s16, char.MAXRES);
buffer_write(buf, buffer_s16, char.RES);
	
buffer_write(buf, buffer_s16, char.MAXSP);
buffer_write(buf, buffer_s16, char.SP);
	
buffer_write(buf, buffer_s16, char.HIT);
buffer_write(buf, buffer_s16, char.CRIT);
buffer_write(buf, buffer_s16, char.AVO);
buffer_write(buf, buffer_s16, char.ATK);
	
buffer_write(buf, buffer_s16, char.HITd);
buffer_write(buf, buffer_s16, char.CRITd);
buffer_write(buf, buffer_s16, char.ATKd);
	
buffer_write(buf, buffer_s16, char.atkbuff);
buffer_write(buf, buffer_s16, char.defbuff);
buffer_write(buf, buffer_s16, char.hitbuff);
buffer_write(buf, buffer_s16, char.critbuff);

buffer_write(buf, buffer_s16, char.avobuff);
buffer_write(buf, buffer_s16, char.spbuff);
	
buffer_write(buf, buffer_s16, char.atkbuff_area);
buffer_write(buf, buffer_s16, char.defbuff_area);
buffer_write(buf, buffer_s16, char.hitbuff_area);
buffer_write(buf, buffer_s16, char.critbuff_area);

buffer_write(buf, buffer_s16, char.avobuff_area);
buffer_write(buf, buffer_s16, char.spbuff_area);
	
buffer_write(buf, buffer_s16, char.skillbuff_area);
buffer_write(buf, buffer_s16, char.luckbuff_area);
buffer_write(buf, buffer_s16, char.speedbuff_area);
	
buffer_write(buf, buffer_u8, char.terrainBonus);
buffer_write(buf, buffer_u16, char.minRange);
buffer_write(buf, buffer_u16, char.maxRange);
	
//buffer_write(buf, buffer_bool, char.markRange);
buffer_write(buf, buffer_bool, char.isBoss);
buffer_write(buf, buffer_bool, char.debuffed);
buffer_write(buf, buffer_bool, char.usedTurn);
	
buffer_write(buf, buffer_u8, char.canAttack);
buffer_write(buf, buffer_s16, char.lastWeapon);
buffer_write(buf, buffer_s16, char.equipAfter);
	
buffer_write(buf, buffer_u8, char.aiType);
buffer_write(buf, buffer_bool, char.aggressive);
buffer_write(buf, buffer_bool, char.sacrifice);
buffer_write(buf, buffer_bool, char.wdie);
buffer_write(buf, buffer_bool, char.canSurrender);
buffer_write(buf, buffer_bool, char.canDance);

buffer_write(buf, buffer_s16, char.isCarrying);
buffer_write(buf, buffer_s8, char.oldFaction);
//misc

for(var i = 0; i < 20; i ++)
{
	buffer_write(buf, buffer_s16, char.buff[i, 0]);
	buffer_write(buf, buffer_s16, char.buff[i, 1]);
	buffer_write(buf, buffer_s16, char.buff[i, 2]);
	buffer_write(buf, buffer_s16, char.buff[i, 3]);
	buffer_write(buf, buffer_s16, char.buff[i, 4]);
	buffer_write(buf, buffer_s16, char.buff[i, 5]);
}
for(var i = 0; i < 10; i ++)
{
	buffer_write(buf, buffer_bool, char.hasSkill[i]);
}


buffer_write(buf, buffer_s32, char.depth);

buffer_write(buf, buffer_u16, char.lightpower);
buffer_write(buf, buffer_u8, char.lightalpha);
buffer_write(buf, buffer_u32, char.lightcolor);

buffer_write(buf, buffer_s16, char.lightxpos);
buffer_write(buf, buffer_s16, char.lightypos);