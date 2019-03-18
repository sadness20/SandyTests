var class = argument[0];
var charID = argument[1];
	
//blackbar
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 192, global.window_w, global.window_h, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_font(ft_med);

if(class != -1)
{
	draw_set_color(fontColor1);
	
	draw_set_font(ft_large);
	
	draw_text_ext(24, 185, global.CLASS[class, 1 + global.CHAR[charID, 2] * 2], 18, 352);
}
