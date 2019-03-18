var char = argument[0];
var charID = char.characterID;

var maxr = 0;

if(char.maxRangeAlly > maxr)maxr = char.maxRangeAlly;
if(char.maxRangeDamage > maxr)maxr = char.maxRangeDamage;

return maxr;