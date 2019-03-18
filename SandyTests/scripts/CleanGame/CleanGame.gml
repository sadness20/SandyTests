with (obj_pers)
{
	global.debugIndex = 0;
	
	ds_list_destroy(global.itemDrops);
	ds_list_destroy(global.recDrops);
	ds_list_destroy(global.recDropsAm);
	ds_list_destroy(nup);
	ds_list_destroy(nupVal);
	ds_list_destroy(itemList);
	ds_list_destroy(global.charList);
	ds_list_destroy(global.debugList);
		
	global.itemDrops = ds_list_create();
	global.recDrops = ds_list_create();
	global.recDropsAm = ds_list_create();
	nup = ds_list_create();
	nupVal = ds_list_create();
	itemList = ds_list_create();
	global.charList = ds_list_create();
	
	global.debugList = ds_list_create();
	ds_list_add(global.debugList, "build " + buildver + "!!");
	global.debugIndex ++;
}

ds_list_destroy(global.CHAR[100, 49]);
ds_list_destroy(global.CHAR[100, 50]);

for(var i = 0; i < 101; i ++)
{
	if(global.CHAR[i, 33] != -1)
	{
		ds_list_destroy(global.CHAR[i, 33]);
		ds_list_destroy(global.CHAR[i, 34]);
		ds_list_destroy(global.CHAR[i, 49]);
		ds_list_destroy(global.CHAR[i, 50]);
	}
}
for(var i = 101; i < 150; i ++)
{
	if(global.CHAR[i, 49] != -1)
	{
		ds_list_destroy(global.CHAR[i, 48]);
		ds_list_destroy(global.CHAR[i, 49]);
		ds_list_destroy(global.CHAR[i, 50]);
	}
}
for(var i = 150; i < 180; i ++)
{
	if(global.CHAR[i, 49] != -1)
	{
		ds_list_destroy(global.CHAR[i, 48]);
		ds_list_destroy(global.CHAR[i, 49]);
		ds_list_destroy(global.CHAR[i, 50]);
	}
}

ds_list_destroy(global.resourceBox);
ds_list_destroy(global.resourceBoxAm);

StartGenerate();
StartGame();