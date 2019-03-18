if(global.CHAR[characterID, 44] != -1)
{
	minRange = global.ITEM[global.CHAR[characterID, 44], 7];
	maxRange = global.ITEM[global.CHAR[characterID, 44], 8];
	weaponType = global.ITEM[global.CHAR[characterID, 44], 14];
}
else
{
	minRange = 0;
	maxRange = 0;
	weaponType = 0;
}
UpdateStatsGlobal(characterID);
UpdateStats(id, -1);