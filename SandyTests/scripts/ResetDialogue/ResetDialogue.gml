global.textPosition = -1; //0 = normal, 1 = top
global.textAlign = -1; //-1 = left, 0 = center, 1 = right
global.textType = 0; //0 = normal, 1 = small
global.charDial[0] = -1;
global.charDial[1] = -1;
global.charDial[2] = -1;
oldAlpha[0] = 0;
oldAlpha[1] = 0;
oldAlpha[2] = 0;
charCome[0] = -1;
charCome[1] = -1;
charCome[2] = -1;
wait = true;

global.currentStep = 0;
//global.textY = 1;
change = -1;
//global.textboxAlpha = 0;



//engine
global.write = 0;
global.charAlpha[0] = 0;
global.charAlpha[1] = 0;
global.charAlpha[2] = 0;
global.charLeave[0] = 0;
global.charLeave[1] = 0;
global.charLeave[2] = 0;
global.currentStep = 0;
global.charBlush[0] = 0;
global.charBlush[1] = 0;
global.charBlush[2] = 0;
global.charTarBlush[0] = 0;
global.charTarBlush[1] = 0;
global.charTarBlush[2] = 0;



global.fadeTimer = 0;

global.backgroundcharAlpha = 1;
global.currentBackground = -1;
global.backgroundtoSet = -1;
global.fadeinTimer = 0;
global.fadeoutTimer = 0;
global.fadeholdTimer = 0;
global.fadeColor = c_black;
global.fadeState = -1;
global.fadeTurn = 0;
global.gradientAlpha = 0;

for(var i = 0; i < 100; i ++)
{
	global.step[i, 0] = "";
	global.step[i, 1] = noone;
	global.step[i, 2] = -1;
	global.step[i, 3] = -1;
	global.step[i, 4] = -1;
	global.step[i, 5] = -1;
	global.step[i, 6] = -1;
	global.step[i, 7] = -1;
	global.step[i, 8] = -1;
	global.step[i, 9] = -1;
	global.step[i, 10] = -1;
	global.step[i, 11] = -1;
	global.step[i, 12] = -1;
	global.step[i, 13] = -1;
	global.step[i, 14] = -1;
	global.step[i, 15] = -1;
	global.step[i, 16] = -1;
	global.step[i, 17] = -1;
	global.step[i, 18] = -1;
	global.step[i, 19] = -1;
	global.step[i, 20] = -1;
	global.step[i, 21] = -1;
	global.step[i, 22] = -1;

}