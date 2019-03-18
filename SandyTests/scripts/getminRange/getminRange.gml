var char = argument[0];
var charID = char.characterID;

var minr = 9999;

if(char.minRangeAlly < minr)minr = char.minRangeAlly;
if(char.minRangeDamage < minr)minr = char.minRangeDamage;

return minr;