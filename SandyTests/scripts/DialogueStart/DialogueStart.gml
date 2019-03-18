obj_pers.state = "dialogue";
obj_pers.prepareend = false;

global.textPosition = argument[0]; //0 = normal, 1 = top
global.textAlign = argument[1]; //-1 = left, 0 = center, 1 = right
global.textType = argument[2]; //0 = normal, 1 = small

sys_AdvanceText();