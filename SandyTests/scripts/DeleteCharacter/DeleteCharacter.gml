var tchar = argument[0];

if(tchar < 50)
{
	global.CHAR[tchar, 52] = true;
	global.CHAR[tchar, 57] = false;
	global.CHAR[tchar, 58] = false;
	global.CHAR[tchar, 59] = false;
	if(tchar >= global.totalChars) global.totalChars--;
}
else
{
	global.CHAR[tchar, 0] = "error";
	global.CHAR[tchar, 52] = true;
	global.CHAR[tchar, 57] = false;
	global.CHAR[tchar, 58] = false;
	global.CHAR[tchar, 59] = false;
	//if(tchar >= global.nrecruited) global.totalChars--;
}
						
CharListOrder();