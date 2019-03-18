var type = argument[0];
var might = argument[1];
var duration = argument[2];
var buffid = argument[3];
var stackable = argument[4];
var overtime = argument[5];

if(faction > 0 && duration > 0)duration ++;

if(!stackable)
{
	for(var i = 0; i < 20; i ++)
	{
		if(buff[i, 3] == buffid)
		{
			if(overtime != 0)
			{
				while(((buff[i, 5] - buff[i, 2]) * abs(buff[i, 4]) < abs(buff[i, 1])))
				{
					buff[i, 2] --;
					StatsBuff(buff[i, 0], buff[i, 4]);
				}
				
				buff[i, 0] = type;
				buff[i, 1] = might;
				buff[i, 2] = duration;
				buff[i, 3] = buffid;
				buff[i, 4] = overtime;
				buff[i, 5] = duration; //total duration
				
				StatsBuff(type, might);
				exit;
			}
			else exit;
		}
	}
}

for(var i = 0; i < 20; i ++)
{
	if(buff[i, 0] == -1)
	{
		//show_message(type);
		buff[i, 0] = type;
		buff[i, 1] = might;
		buff[i, 2] = duration;
		buff[i, 3] = buffid;
		buff[i, 4] = overtime;
		buff[i, 5] = duration; //total duration
		
		if(might < 0)
		{
			debuffed = true;
		}
		
		StatsBuff(type, might);
		break;
	}
}
