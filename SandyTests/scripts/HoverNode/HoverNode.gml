if(cx < 0 || cy < 0 || cx > global.mapWidth - 1 || cy > global.mapHeight)
{
	global.hoverNode = noone;
}
else
{
	if(global.hoverNode != global.map[cx, cy])
	{
		global.hoverNode = global.map[cx, cy];
		if(scrollTimer == 0)
		{
			audio_play_sound(sfx_scrollMap, 0, 0);
			scrollTimer = 5;
		}
	}
}