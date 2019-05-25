isGhost = 1;
characterID = 60;

global.CHAR[characterID, 0] = "Malefic Vision"; //name
global.CHAR[characterID, 1] = 45; //portrait ID
global.CHAR[characterID, 2] = 1; //portrait ID
global.CHAR[characterID, 4] = 30; //portrait ID
global.CHAR[characterID, 35] = 0; //face type
global.CHAR[characterID, 36] = 0; //eyes type
global.CHAR[characterID, 37] = 11; //hair ID
global.CHAR[characterID, 38] = make_color_rgb(255, 235, 215); //hair color
global.CHAR[characterID, 39] = make_color_rgb(94, 120, 161); //eye color
global.CHAR[characterID, 43] = 5; //Accessory ID

global.CHAR[characterID, 6] = 100; //hp
global.CHAR[characterID, 7] = 30; //str
global.CHAR[characterID, 8] = 30; //mag
global.CHAR[characterID, 9] = 35; //skill
global.CHAR[characterID, 10] = 35; //spd
global.CHAR[characterID, 11] = 35; //lck
global.CHAR[characterID, 12] = 20; //def
global.CHAR[characterID, 13] = 20; //res

RefreshChar(id);