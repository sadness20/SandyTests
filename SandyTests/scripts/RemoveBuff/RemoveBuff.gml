var index = argument[0];

StatsBuff(buff[index, 0], - buff[index, 1]);

buff[index, 0] = -1;
buff[index, 1] = 0;
buff[index, 2] = -1;
buff[index, 3] = -1;

for(var i = 0; i < 20; i ++)
{
	debuffed = false;
	if(buff[i, 1] < 0)
	{
		debuffed = true;
		break;
	}
}