var arg = argument[0];

for(var i = 0; i < 8; i ++)
{
	global.CHAR[100, 6 + i] = global.CHAR[global.glSelect3, 6 + i];	
				
	global.CHAR[100, 14 + i] = global.CHAR[global.glSelect3, 14 + i];
	global.CHAR[100, 14 + i] -= global.CLASS[tempVar9, 24 + i];
				
	global.CHAR[100, 14 + i] += global.CLASS[arg, 24 + i];
}