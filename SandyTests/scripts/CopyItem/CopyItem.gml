var original = argument[0];
var copy = argument[1];

for(var i = 0; i < array_length_2d(global.ITEM, original); i ++)
{
	global.ITEM[copy, i] = global.ITEM[original, i];
}