var item = argument[0];
var txt = global.ITEM[item, 17];
var effect = 0;
if(global.ITEM[item, 22] != -1)
{
	if(effect == 0)txt += "   Effect: "; else txt += "  ";
	txt += global.SKILL[global.ITEM[item, 22], 1];
	effect = 1;
}
if(global.ITEM[item, 32] > 1)
{
	if(effect == 0)txt += "   Effect: "; else txt += "  ";
	txt += "Deals " + string(global.ITEM[item, 32]) + " consecutive attacks.";
	effect = 1;
}

return txt;