// 0001___ = 1
// 00111__ = 7
// 011011_ = 27
// 1100011 = 99
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
	    {
	        if(py > 2)
	            global.tileBinary[py-3] = nlShift(global.tileBinary[py-3],1,px);
	        global.tileBinary[py-2] = nlShift(global.tileBinary[py-2],7,px-1);
	    }
	    global.tileBinary[py-1] = nlShift(global.tileBinary[py-1],27,px-2);
	}
	global.tileBinary[py] = nlShift(global.tileBinary[py],99,px-3);
	if(py<global.mapHeight-1)
	{
	    global.tileBinary[py+1] = nlShift(global.tileBinary[py+1],27,px-2);
	    if(py<global.mapHeight-2)
	    {
	        global.tileBinary[py+2] = nlShift(global.tileBinary[py+2],7,px-1);
	        if(py<global.mapHeight-3)
	            global.tileBinary[py+3] = nlShift(global.tileBinary[py+3],1,px);
	    }
	}
}
else
{
	if(py > 0)
	{
	    if(py > 1)
	    {
	        if(py > 2)
	            global.tileBinary2[py-3] = nlShift(global.tileBinary2[py-3],1,px);
	        global.tileBinary2[py-2] = nlShift(global.tileBinary2[py-2],7,px-1);
	    }
	    global.tileBinary2[py-1] = nlShift(global.tileBinary2[py-1],27,px-2);
	}
	global.tileBinary2[py] = nlShift(global.tileBinary2[py],99,px-3);
	if(py<global.mapHeight-1)
	{
	    global.tileBinary2[py+1] = nlShift(global.tileBinary2[py+1],27,px-2);
	    if(py<global.mapHeight-2)
	    {
	        global.tileBinary2[py+2] = nlShift(global.tileBinary2[py+2],7,px-1);
	        if(py<global.mapHeight-3)
	            global.tileBinary2[py+3] = nlShift(global.tileBinary2[py+3],1,px);
	    }
	}
}