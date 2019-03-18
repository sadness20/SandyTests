// 001__ = 1
// 0101_ = 5
// 10001 = 17
// Remember, tileBinary is from right to left

var px,py;
px = argument0;
py = argument1;
var type = argument2;

if(type == 0)
{
	if(py > 0)
	{
	    if(py > 1)
	        global.tileBinary[py-2] = nlShift(global.tileBinary[py-2],1,px);
	    global.tileBinary[py-1] = nlShift(global.tileBinary[py-1],5,px-1);
	}
	global.tileBinary[py] = nlShift(global.tileBinary[py],17,px-2);
	if(py<global.mapHeight-1)
	{
	    global.tileBinary[py+1] = nlShift(global.tileBinary[py+1],5,px-1);
	    if(py<global.mapHeight-2)
	        global.tileBinary[py+2] = nlShift(global.tileBinary[py+2],1,px);
	}
}
else
{
	if(py > 0)
	{
	    if(py > 1)
	        global.tileBinary2[py-2] = nlShift(global.tileBinary2[py-2],1,px);
	    global.tileBinary2[py-1] = nlShift(global.tileBinary2[py-1],5,px-1);
	}
	global.tileBinary2[py] = nlShift(global.tileBinary2[py],17,px-2);
	if(py<global.mapHeight-1)
	{
	    global.tileBinary2[py+1] = nlShift(global.tileBinary2[py+1],5,px-1);
	    if(py<global.mapHeight-2)
	        global.tileBinary2[py+2] = nlShift(global.tileBinary2[py+2],1,px);
	}
}