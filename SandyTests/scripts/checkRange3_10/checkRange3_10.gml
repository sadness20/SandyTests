/*
00000000001             1
000000000111            7
0000000011111           31

00000001111111          127
000000111111111         511
0000011111111111        2047

00001111111111111       8191
000111111111111111      32767
0011111111011111111     130815

01111111100011111111    522495
111111110000011111111   2089215

stored in global.r310[] in initDsStuff

*/
var px,py,m,lx;

px = argument0;
py = argument1;

for(m=10;m>=0;m-=1)
{
    if(py>(m-1))
        global.tileBinary[py-m] = nlShift(global.tileBinary[py-m],global.r310[10-m],px-10+m);
}

for(m=9;m>=0;m-=1)
{
    if(py<global.mapHeight-10+m)
        global.tileBinary[py+10-m] = nlShift(global.tileBinary[py+10-m],global.r310[m],px-m);
}