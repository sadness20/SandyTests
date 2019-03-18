var no,by,sft;
no = argument0;
by = argument1;
sft = argument2;

if(sft<0)
    no |= by>>(-1*sft);
else
     no |= by<<sft;
return no;