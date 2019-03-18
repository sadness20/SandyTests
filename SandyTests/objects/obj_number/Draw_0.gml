
if(crit == false)
{
	for(ii=0;ii<string_length(number);ii++)
	{
		if string_char_at(number,ii+1)="," then
		{
			draw_sprite_ext(sprite_index,10,xx+(-0.5*((string_length(number)-1)*(10*(scale/100))))+x+ii*(10*(scale/100)),y+yy,scale/120,scale/120,0,c_white,alpha/100);
		}
		else
		{
			var n=real(string_char_at(number,ii+1));
			draw_sprite_ext(sprite_index,n,xx+(-0.5*((string_length(number)-1)*(10*(scale/100))))+x+ii*(10*(scale/100)),y+yy,scale/120,scale/120,0,c_white,alpha/100);
		}
	}
}
else
{
	for(ii=0;ii<string_length(number);ii++)
	{
		if string_char_at(number,ii+1)="," then
		{
			draw_sprite_ext(sprite_index,10,xx+(-0.5*((string_length(number)-1)*(10*(scale/75))))+x+ii*(10*(scale/75)),y+yy,scale/90,scale/90,0,c_white,alpha/100);
		}
		else
		{
			var n=real(string_char_at(number,ii+1));
			draw_sprite_ext(sprite_index,n,xx+(-0.5*((string_length(number)-1)*(10*(scale/75))))+x+ii*(10*(scale/75)),y+yy,scale/90,scale/90,0,c_white,alpha/100);
		}
	}
}