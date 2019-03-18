var charID = argument[0];
var charIDtoremove = argument[1];
var slottoremove = argument[2];

//usemasterseal
classList = ds_list_create();
for(var i = 0; i < 4; i ++)
{
	var class = global.CLASS[global.CHAR[charID, 3], 32 + i];
	if(class != -1)ds_list_add(classList, class);
}

global.glSelect3 = charID;
tempVar11 = slottoremove;
tempVar10 = charIDtoremove;
tempVar9 = global.CHAR[charID, 3];
tempVar8 = gamestate;
tempVar7 = global.glSelect2;
gamestate = "changeclass";
tempVar2 = 0;
global.glSelect2 = 0;
global.glSelect5 = 0;
global.glSelect4 = 0;
global.gradientAlpha = 0;
global.fadeTimer = 0;
					
					
UpdateClassChange(0);
					
opSize = 1;
global.showOptions = 0;