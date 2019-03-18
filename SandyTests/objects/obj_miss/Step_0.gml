vspd+=grav;

yy+=vspd;
xx+=hspd;

/*
if origin!=noone && instance_exists(origin) then
{
x=origin.x;
y=origin.y;
}
*/

if step=0 && alpha<100 then {alpha+=10*tempo scale-=5*tempo};
if step=0 && alpha>=100 then step=1;
if step=1 && alarm[0]=-1 then alarm[0]=30/tempo;
if step=2 then {alpha-=10*tempo scale-=5*tempo};
if step=2 && alpha<10 then instance_destroy();