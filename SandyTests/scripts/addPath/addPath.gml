/*
show_message(global.pathSize);
show_message(global.pathDraw);
*/
var pth = argument[0];
var fnd = -1;
for(var ii = 0; ii <= global.pathSize; ii ++)
{
    var node = global.pathArray[ii];
    if(node == pth)
    {
        fnd = ii;
    }
}

if(fnd == -1)
{
    global.pathArray[global.pathSize] = pth;
    global.pathSize++;
    if(pth.occupant == noone)global.pathDraw++;
} else
{
    global.pathSize = fnd + 1;
    global.pathDraw = fnd + 1;
}
/*
show_message(global.pathSize);
show_message(global.pathDraw);
*/