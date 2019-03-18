var text = argument[0];
var len = string_width(text);
var wid = floor(len / 26) + 1;
var xx = 200 - (wid * 26) / 2 - 26;
var yy = 120 - 33;



draw_sprite(spr_resizableBox, 0, xx, yy);
for(var i = 0; i < wid; i ++)
{
    draw_sprite(spr_resizableBox, 1, xx + 26 + i * 26, yy);
}
draw_sprite(spr_resizableBox, 2, xx + wid * 26 + 26, yy);
