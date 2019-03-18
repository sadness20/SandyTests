number="";
scale=125;
alpha=0;
crit = false;

xx=0;
yy=0;

step=0;
//origin=noone;

vspd=0.6*choose(-2.5,-2.65,-2.8,-2.95,-3.1);
hspd=0.3*choose(-0.6,-0.4,0.4,0.6);
grav=0.06;

/*
col=instance_place(x,y,obj_number);
if col!=noone then
{
if sign(hspd)=sign(col.hspd) then {hspd*=-1};
while vspd=col.vspd vspd=1.2*choose(-2.5,-2.65,-2.8,-2.95,-3.1);
}
*/

tempo=1;

vspd/=tempo;
hspd/=tempo;