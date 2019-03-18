// 01_ = 1
// 101 = 5
// Remember, tileBinary is from right to left

var px,py;
px = argument0;
py = argument1;
var type = argument2;

if(type == 0)
{
	if(py > 0)
	    global.tileBinary[py-1] = global.tileBinary[py-1] | (1<<px);
	if(px = 0)
	    global.tileBinary[py] = global.tileBinary[py] | 2;
	else if(px = global.mapWidth-1)
	    global.tileBinary[py] = global.tileBinary[py] | (1<<(px-1));
	else
	    global.tileBinary[py] = global.tileBinary[py] | (5<<(px-1));
	if(py < global.mapHeight-1)
	    global.tileBinary[py+1] = global.tileBinary[py+1] | (1<<px);
}
else
{
	if(py > 0)
	    global.tileBinary2[py-1] = global.tileBinary2[py-1] | (1<<px);
	if(px = 0)
	    global.tileBinary2[py] = global.tileBinary2[py] | 2;
	else if(px = global.mapWidth-1)
	    global.tileBinary2[py] = global.tileBinary2[py] | (1<<(px-1));
	else
	    global.tileBinary2[py] = global.tileBinary2[py] | (5<<(px-1));
	if(py < global.mapHeight-1)
	    global.tileBinary2[py+1] = global.tileBinary2[py+1] | (1<<px);
}