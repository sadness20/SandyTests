clearPath();
var curr = argument[0];
var char = argument[1];
var check = 0;
do
{
	if(curr.parent != noone)
	{
	    global.pathArray[curr.rawG] = curr;
	    global.pathSize++;
	    global.pathDraw++;
	    curr = curr.parent;
	}
	else check = 1;
}until (check == 1)

//show_message("");