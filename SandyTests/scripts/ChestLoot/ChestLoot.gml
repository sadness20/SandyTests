sceneID = 1002;

var worth = global.gamelevel * 20;

if(worth > 3000)worth = 3000;

var itemList = ds_list_create();

for(var i = 0; i < global.nItems; i ++)
{
	if(global.ITEM[i, 3] != 4 && global.ITEM[i, 5] >= (worth / 3) && global.ITEM[i, 5] < worth)
	{
		ds_list_add(itemList, i);
	}
}

ds_list_shuffle(itemList);

for(var i = 0; i < ds_list_size(itemList); i ++)
{
	var item = ds_list_find_value(itemList, i);
	if(worth >= global.ITEM[item, 5])
	{
		itemReward[i] = item
		worth -= global.ITEM[item, 5];
	}
}
