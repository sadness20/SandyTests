/// @description Insert description here
// You can write your code in this editor
switch(step)
{
    case 0:
    
        y -= 3;
        if(alpha < 1)alpha += 1 / 5;
        if(scale > 1)scale -= 1 / 5;
        if(scale <= 1)
        {
            scale = 1;
            step = 1;
        }
    
    break;
    
    case 1:
    
        y -= 1.5;
        timer ++;
        if(timer > 8)
        {
            alpha -= 1 / 5;
            if(alpha <= 0)instance_destroy();
        }
    
    break;
}