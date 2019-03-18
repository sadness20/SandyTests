/// @description Insert description here
// You can write your code in this editor
if(create == 0)
{
	if(lightxsize < 1)lightxsize += 1 / 5;
	if(lightxsize >= 1)create = 1;
}
if(image_number > 2)
{
	if(create == 1 && image_index >= image_number - image_speed * 5)
	{
		if(lightxsize > 0)lightxsize -= 1 / 5;
		if(lightxsize <= 0)create = 2;
	}
}
else
{
	if(create == 1 && destroy <= 5)
	{
		//show_message(destroy);
		if(lightxsize > 0)lightxsize -= 1 / 5;
		if(lightxsize <= 0)create = 2;
	}
}

lightysize = lightxsize * lightYscale;
lightalpha = lightxsize * 50;