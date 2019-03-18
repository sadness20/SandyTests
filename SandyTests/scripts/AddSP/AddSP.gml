var char = argument[0];
var charID = char.characterID;
var quan = argument[1];

var gi = quan;
if(gi > char.MAXSP - char.SP) gi = char.MAXSP - char.SP;
char.SP += gi;