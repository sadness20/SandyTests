/// @description Insert description here
// You can write your code in this editor
if step=0 && size<maxsize then {powerMult += 1/timer size+=maxsize/timer alpha+=1.5/timer};
if step=0 && size>=maxsize then step=1;
if step=1 && size>0 then {size-=maxsize/timer powerMult -= 1/timer alpha-=1.5/timer};
if step=1 && size<=0 then instance_destroy();
direction+=dirchange;
dirchange+=dirchangedir;