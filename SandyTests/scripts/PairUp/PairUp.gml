var cha1 = argument[0];
var cha2 = argument[1];

cha1.partner = cha2;
cha2.partner = cha1;

cha1.pairLead = 0;
cha2.pairLead = 1;