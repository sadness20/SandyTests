var char = argument[0];
var charID = char.characterID;

var growthleft = ds_list_create();
//show_message(growthleft);
var tempnup = ds_list_create();

var oldSP = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2);

for(var i = 0; i < 8; i ++)
{
	var growth = global.CHAR[charID, 14 + i];
	ds_list_add(growthleft, growth);
						
	while(ds_list_find_value(growthleft, i) > 0)
	{
		if(floor(random(101)) < ds_list_find_value(growthleft, i))
		{
			global.CHAR[charID, 6 + i] ++;
			
			with char
			{
				switch(i)
				{
					case 0:
								
						HP += 1;
						MAXHP += 1;
								
					break;
					case 1:
								
						STR += 1;
						MAXSTR += 1;
								
					break;
					case 2:
								
						MAG += 1;
						MAXMAG += 1;
								
					break;
					case 3:
								
						SKILL += 1;
						MAXSKILL += 1;
								
					break;
					case 4:
								
						SPD += 1;
						MAXSPD += 1;
								
					break;
					case 5:
								
						LCK += 1;
						MAXLCK += 1;
								
					break;
					case 6:
								
						DEF += 1;
						MAXDEF += 1;
								
					break;
					case 7:
								
						RES += 1;
						MAXRES += 1;
								
					break;
				}
			}
			
			ds_list_add(tempnup, i);
		}
		var va = ds_list_find_value(growthleft, i);
		ds_list_delete(growthleft, i);
		ds_list_insert(growthleft, i, va - 100);
	}
}

var newSP = global.CHAR[charID, 9] + 5 + floor(global.CHAR[charID, 11] / 2); //SP
char.SP += floor(newSP - oldSP);
char.MAXSP += floor(newSP - oldSP);

global.CHAR[charID, 70] = newSP;

for(var i = 0; i < 8; i ++)
{
	var sum = 0;
	for(var ii = 0; ii < ds_list_size(tempnup); ii ++)
	{
		var sid = ds_list_find_value(tempnup, ii);
		if(sid == i)sum ++;
	}
	if(sum != 0)
	{
		ds_list_add(nup, i);
		ds_list_add(nupVal, sum);
	}
}

ds_list_destroy(tempnup);
ds_list_destroy(growthleft);
