var charID = argument[0];
var cind = argument[1];
var ind = floor(argument[2]);
var xpos = argument[3];
var ypos = argument[4];
var xscale = argument[5];
var yscale = argument[6];
var col = argument[7];
var alpha = argument[8];
var type = global.CLASS[global.CHAR[charID, 3], 4];
var faceX = 0;
var faceY = 0;
var team = argument[9];
var filter = argument[10];
var teamColor = c_gray;
var height = argument[11];

var vx = 0, vy = -3, ny = 2;

//FACE
if(filter == 1)
{
	shader_set(shGray);
}
switch(team)
{
	case 0:
	    teamColor = make_color_rgb(0,60,225);
	break;
	case 1:
	    teamColor = make_color_rgb(235,0,0);
	break;
	case 2:
	    teamColor = make_color_rgb(20,225,20);
	break;
}
if(global.CHAR[charID, 36] != -1 && filter != 5)
{
	switch(type)
	{
	    case 0:
    
	    if(cind == 0)
	    {
	        if(ind >= 2)
	        {
	            faceY = 1;
	        } else faceY = 0;
	        faceY ++;
	    }
	    if(cind == 4 || cind == 8 || cind == 16 || cind == 20)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY ++;
	    }
	    if(cind == 12)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
	    break;
    
	    case 1:
    
	    if(cind == 0)
	    {
	        faceX = 2;
	        faceY = -2;
	    }
	    if(cind == 4)
	    {
	        faceX = 2;
	        if(ind - cind == 1)
	        {
	            faceX --;
	        }
	        if(ind - cind == 2)
	        {
	            faceX --;
				faceY --;
	        }
	        if(ind - cind == 3)
	        {
	            faceY --;
	        }
			faceY --;
	    }
	    if(cind == 8)
	    {
	        faceX = -2;
	        if(ind - cind == 1)
	        {
	            faceX ++;
	        }
	        if(ind - cind == 2)
	        {
	            faceX ++;
				faceY --;
	        }
	        if(ind - cind == 3)
	        {
	            faceY --;
	        }
			faceY --;
	    }
	    if(cind == 20)
	    {
	        faceX += 2;
	        if(ind - cind == 1)
	        {
	            faceY --;
	        }
	        if(ind - cind == 2)
	        {
	            faceY -= 2;
				faceX += 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceY -= 1;
				faceX += 1;
	        }
			faceY -= 2;
	    }
	    if(cind == 12)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 1;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 1;
	    }
    
	    break;
    
	    case 2:
    
	    if(cind == 4 || cind == 0 || cind == 20)
	    {
	        if(ind - cind == 1)
	        {
	            faceX = -1;
	        }
	        if(ind - cind == 2)
	        {
	            faceX = -1;
	            faceY = 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = 1;
	        }
	    }
	    if(cind == 8)
	    {
	        if(ind - cind == 1)
	        {
	            faceX = 1;
	        }
	        if(ind - cind == 2)
	        {
	            faceX = 1;
	            faceY = 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = 1;
	        }
	    }
	    if(cind == 12)
	    {
	        if(ind - cind == 0)
	        {
	            faceY = -1;
	        }
	        if(ind - cind == 1)
	        {
	            faceY = 0;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 1;
	        }
	        if(ind - cind == 0)
	        {
	            faceY = 0;
	        }
	    }
	    if(cind == 16)
	    {
	        if(ind - cind == 1)
	        {
	            faceY = 1;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 2;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = -1;
	        }
	    }
	    faceY -= 3;
    
	    break;
    
	    case 3:
    
	    if(cind == 4)
	    {
	        faceX = -1;
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	    }
	    if(cind == 8)
	    {
	        faceX = 1;
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	    }
	    if(cind == 12)
	    {
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = -1; 
	        faceY += 3;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = 1;
	        faceY -= 1;
	    }
    
	    break;
		
		case 4:
		
		if(cind == 0 || cind == 20)
	    {
	        if(ind - cind == 1)
	        {
	            faceX = 1;
	            faceY = 1;
	        }
	        if(ind - cind == 2)
	        {
	            faceX = 0;
	            faceY = 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceX = 0
	            faceY = 0;
	        }
	    }
	    if(cind == 4)
	    {
	        if(ind - cind == 1)
	        {
	            faceX = -1;
	        }
	        if(ind - cind == 2)
	        {
	            faceX = -1;
	            faceY = 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = 1;
	        }
	    }
	    if(cind == 8)
	    {
	        if(ind - cind == 1)
	        {
	            faceX = 1;
	        }
	        if(ind - cind == 2)
	        {
	            faceX = 1;
	            faceY = 1;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = 1;
	        }
	        //faceY++
	    }
	    if(cind == 12)
	    {
	        if(ind - cind == 0)
	        {
	            faceY = -1;
	        }
	        if(ind - cind == 1)
	        {
	            faceY = 0;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 1;
	        }
	        if(ind - cind == 0)
	        {
	            faceY = 0;
	        }
	    }
	    if(cind == 16)
	    {
	        if(ind - cind == 1)
	        {
	            faceY = 1;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 2;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = -1;
	        }
	    }
	    faceY -= 3;
	
		break;
		
		case 5:
    
	    if(cind == 0)
	    {
	        faceX = 1;
	        faceY = 0;
	    }
	    if(cind == 4 || cind == 20)
	    {
	        if(ind - cind == 1)
	        {
	            faceY = -1;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 0;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = -1;
	        }
	        if(cind == 4) faceX --;
	        faceY += 2;
	    }
	    if(cind == 8)
	    {
	        if(ind - cind == 1)
	        {
	            faceY = -1;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 0;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = -1;
	        }
	        faceX ++;
	        faceY += 2;
	    }
	    if(cind == 12)
	    {
	        if(ind - cind == 1)
	        {
	            faceY = -1;
	        }
	        if(ind - cind == 2)
	        {
	            faceY = 0;
	        }
	        if(ind - cind == 3)
	        {
	            faceY = -1;
	        }
	        faceY += 3;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind == 1 || ind - cind == 3)
	        {
	            faceY --;
	        }
	        faceY++;
	    }
	    break;
		
	    case 6:
    
	    if(cind == 0)
	    {
	        if(ind >= cind + 2)
	        {
	            faceY = 1;
	        } else faceY = 0;
	        faceY ++;
			faceX -= 1;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
			if(cind == 20)
			{
				faceX --;
				faceY ++;
			}
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY ++;
	    }
	    if(cind == 16)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 1;
	        } else faceY = 0; 
	        faceY ++;
	    }
	    if(cind == 12)
	    {
	        if(ind == cind || ind == cind + 2)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
		if(cind == 4)faceX --;
		if(cind == 8)faceX ++;
		
	    break;
		
		case 7:
    
	    if(cind == 0)
	    {
	        if(ind == cind + 2)
	        {
	            faceY = -1;
	        }
	        faceY ++;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
	        if(cind == 4)faceX ++;
			if(cind == 8)faceX --;
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 2; 
	        //faceY ++;
	    }
	    if(cind == 12)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 2; 
	    }
	    if(cind == 16)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY -= 2;
	        }
	        faceY++;
	    }
	    break;
    
	    case 8:
    
	    if(cind == 0)
	    {
			if(global.CHAR[charID, 3] == 25)
			{
				faceX += 0;
				//faceY -= 1;
				if(ind == cind)faceY += 1;
				faceY ++;
			}
			else
			if(global.CHAR[charID, 3] == 26)
			{
				faceX += 1;
				//faceY -= 1;
				if(ind == cind + 3)faceY += 1;
				faceY ++;
			}
			else
			{
		        faceX = -1;
		        if(ind == cind + 3)
		        {
		            faceY ++;
		        } 
		        faceY += 2;
			}
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
	        if(cind == 4 || cind == 20)faceX --; else faceX ++;
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY ++;
	    }
	    if(cind == 12)
	    {
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = -1; 
	        faceY += 4;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind == 0 || ind - cind == 2)
	        {
	            faceY = 0;
	        } else faceY = 1;
	        faceY -= 1;
	    }
	    break;
		
		case 9:
    
	    if(cind == 0)
	    {
	        faceX = -4;
	    }
	    if(cind == 4)
	    {
	        faceX = -4;
	    }
		if(cind == 20)
		{
			faceX -= 4;
			if(ind - cind == 1)
			{
				faceX += 1;
			}
			if(ind - cind == 3)
			{
				faceX += 1;
			}
			//faceY --;
		}
	    if(cind == 8)
	    {
	        faceX = 0;
	    }
	    if(cind == 12)
	    {
	        faceX --;
	        if(ind - cind == 0 )
	        {
	            faceY = 0;
	        } else faceY = -1; 
	        faceY += 2;
	    }
	    break;
		
		case 10:
    
	    if(cind == 0)
	    {
	        if(ind == cind + 1 || ind == cind + 2)
	        {
	            faceY = 1;
	        } else faceY = 0;
	        faceY += 2;
	        faceX ++;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
			if(cind == 20)
			{
				faceX -= 2;
				faceY --;
			}
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
	    if(cind == 12)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
	    if(cind == 16)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY ++;
	    }
	    break;
		
		case 11:
    
	    if(cind == 0)
	    {
	        //faceX ++;
	        if(ind == 1)
	        {
	            faceY = 1;
	        }
	        if(ind == 2)
	        {
	            faceY = 2;
	        }
	        if(ind == 3)
	        {
	        faceY = 1;
	        }
	        faceY += 2;
	    }
	    if(cind == 4 || cind == 8 || cind == 16)
	    {
	        if(cind == 4)faceX -= 2;
	        if(cind == 8)faceX += 2;
	        if(ind == cind || ind == cind + 2)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY ++;
	        if(cind == 16)faceY --;
	    }
	    if(cind == 12)
	    {
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
	    if(cind == 20)
	    {
	        faceX -= 2;
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY = 0;
	        } else faceY = 1; 
	        faceY += 2;
	    }
	    break;
		
		case 12:
    
		if(cind == 0)
		{
		    if(ind > cind)faceY--;
		    if(ind > cind + 2)faceY--;
		    faceY ++;
		    faceX --;
		}
		if(cind == 4 || cind == 8 || cind == 16 || cind == 20)
		{
		    if(cind == 4)faceX --;
		    if(cind == 8)faceX ++;
		    if(ind == cind + 1)faceY --;
		    if(ind == cind + 2)faceY -= 2;
		    if(ind == cind + 3)faceY --;
		    if(cind == 4 || cind == 8)faceY += 2;
			if(cind == 20)faceX --;
		}
		if(cind == 12)
		{
		    if(ind > cind)faceY --;
		}
		break;
		
	    case 13:
    
	    if(cind == 0)
	    {
	        if(ind >= cind + 2)
	        {
	            faceY ++;
	        }
			faceY += 2;
	    } else
	    {
	        switch(cind)
	        {
				case 20: faceX -= 1; break;
	            case 4: faceX -= 2; break;
	            case 8: faceX += 2; break;
	            case 12: faceY += 1; break;
				case 16: faceY -= 1; break;
	        }
	        if(ind == cind + 1 || ind == cind + 3)
	        {
	            faceY ++;
	        }
	        faceY += 2;
	    }
	    break;
		
	    case 14:
			if(cind == 0)
			{
				faceX --;
			}
			if(cind == 20)faceX -= 1;
	        if(cind == 4)faceX --;
	        if(cind == 8)faceX ++;
	        if(cind != 12 && cind >= 4 && (ind == cind + 1 || ind == cind + 3))
	        {
	            faceY ++;
	            if(cind == 12)faceY += 2;
	        }
			if(cind == 12)
			{
				if (ind == cind + 1 || ind == cind + 3)
				{
					faceY ++;
				}
				faceY ++;
			}
    
	    break;
		
	    case 15:
	        if(cind == 0)
	        {
	            faceX += 2;
	            faceY -= 2;
	        }
	        if(cind == 4 || cind == 8)
	        {
	            if(cind == 8)faceX += 2;
	            if(ind == cind + 1)faceY += 1;
	            if(ind == cind + 2)faceY += 2;
	            if(ind == cind + 3)faceY += 1;
	            faceY -= 2;
	        }
	        if(cind == 12 || cind == 16)
	        {
	            if(cind == 16)faceY -= 2;
	            if(ind == cind + 1)faceY += 1;
	            if(ind == cind + 3)faceY -= 1;
	        }
			if(cind == 20)
			{
				if(ind == cind + 2)faceY += 1;
				if(ind == cind + 3)faceY += 2;
				faceY -= 2;
				faceX += 1;
			}
			faceY --;
    
	    break;
		
	    case 16:
    
	        if(cind == 0)
	        {
	            if(ind == cind + 2)faceY ++;
	            faceX ++;
	            faceY ++;
	        }
	        else
	        {
	            switch(cind)
	            {
	                case 4: faceX -= 2; break;
	                case 8: faceX += 3; break;
					case 20: faceX -= 2; break;
	            }
	            if(ind == cind + 1 || ind == cind + 3)faceY ++;
	            faceY ++;
	        }
    
	    break;
		
	    case 17:
    
	        if(cind == 0)
	        {
	            if(ind == cind + 1)faceY++;
	            if(ind == cind + 2)faceY++;
	            if(ind == cind + 3)faceY+= 2;
	            faceY += 2;
	            faceX += 2;
	        }
	        if(cind == 4 || cind == 20)
	        {
	            faceY += 2;
	            faceX -= 2;
	        }
	        if(cind == 8)
	        {
	            faceY += 2;
	            faceX += 2;
	        }
	        if(cind == 12)
	        {
	            faceY += 2;
	        }
	        if(cind == 16)
	        {
	            faceY += 2;
	        }
    
	    break;
	    case 18:
    
	        if(cind == 0 || cind == 4 || cind == 8 || cind == 20)
	        {
	            if(cind == 4 || cind == 0)faceX ++;
	            if(cind == 8)faceX --;
	            if(ind == cind + 1)faceY ++;
	            if(ind == cind + 2)faceY += 2;
	            if(ind == cind + 3)faceY ++;
	            faceY -= 3;
	        }
	        if(cind == 12 || cind == 16)
	        {
	            if(ind == cind + 1)faceY += 2;
	            if(ind == cind + 2)faceY += 3;
	            if(ind == cind + 3)faceY += 2;
	            if(cind == 16)faceY -= 2;
	        }
    
	    break;
	    case 19:
    
	    if(cind == 0)
	    {
	        faceX += 2;
	        faceY -= 3;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
			if(cind == 20)
			{
				faceX += 3;
				faceY --;
			}
	        if(cind == 4)faceX += 2;
	        if(cind == 8)faceX -= 2;
	        if(ind == cind + 1)faceY++;
	        if(ind == cind + 2)faceY+=2;
	        if(ind == cind + 3)faceY++;
	        faceY -= 2;
	    }
	    if(cind == 12)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 1;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 1;
	    }
    
	    break;
		
	    case 20:
    
	    if(cind == 0)
	    {
	        faceX += 2;
	        faceY -= 3;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
	        if(cind == 4 || cind == 20)faceX += 2;
	        if(cind == 8)faceX -= 2;
	        if(ind == cind + 1)faceY++;
	        if(ind == cind + 2)faceY+=2;
	        if(ind == cind + 3)faceY++;
	        faceY -= 4;
	    }
	    if(cind == 12)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 3;
	    }
	    if(cind == 16)
	    {
	        if(ind - cind >= 2)
	        {
	            faceY = -1;
	        }
	        faceY -= 3;
	    }
    
	    break;
		
		case 21:
    
	    if(cind == 0)
	    {
	        faceX = -4;
	    }
	    if(cind == 4)
	    {
	        faceX = -4;
	    }
		if(cind == 20)
		{
			faceX -= 4;
			if(ind - cind == 1)
			{
				faceX += 1;
			}
			if(ind - cind == 3)
			{
				faceX += 1;
			}
			//faceY --;
		}
	    if(cind == 8)
	    {
	        faceX = 0;
	    }
	    if(cind == 12)
	    {
	        faceX --;
	        if(ind - cind == 0 )
	        {
	            faceY = 0;
	        } else faceY = -1; 
	        faceY += 2;
	    }
	    break;
		
	    case 22:
    
	        if(cind == 0)
	        {
	            break;
	        }
			if(cind == 20)faceX -= 1;
	        if(cind == 12)faceY++;
	        if(cind == 4)faceX -= 1;
	        if(cind == 8)faceX ++;
	        if(ind == cind + 1 || ind == cind + 3)faceY ++;
    
	    break;
		
		case 23:
    
		if(cind == 0)
		{
		    if(ind >= cind + 2)faceY += 1;
		    faceX --;
		    faceY ++;
		}
		if(cind == 4 || cind == 8 || cind == 12 || cind == 16 || cind == 20)
		{
		    if(cind == 4 || cind == 20)faceX --;
		    if(cind == 8)faceX ++;
		    if(cind == 12)faceY += 2;
			if(cind == 20 && global.CLASS[charID, 3] == 27)faceY ++;
		    if(ind == cind + 1 || ind == cind + 3)
		    {
		        faceY ++;
		    }
		}
    
		break;
			
		case 24:
    
		if(cind == 0)
		{
		    if(ind >= cind + 2)faceY ++;
		    faceX --;
		}else
		{
		    if(cind == 12)faceY ++;
		    if(cind == 4 || cind == 20)faceX --;
			if(cind == 20)faceY ++;
		    if(cind == 8)faceX ++;
		    if(ind == cind + 1 || ind == cind + 3)faceY --;
		}
    
		break;
		
		case 25:
    
		if(cind == 0)
		{
		    faceX += 2;
		    faceY -= 3;
			if(ind == cind + 3)faceY ++;
		}
		if(cind == 4 || cind == 8 || cind == 20)
		{
			if(cind == 20)
			{
				faceX += 3;
				faceY --;
			}
		    if(cind == 4)faceX += 2;
		    if(cind == 8)faceX -= 2;
		    if(ind == cind + 1)faceY++;
		    if(ind == cind + 2)faceY+=2;
		    if(ind == cind + 3)faceY++;
		    faceY -= 2;
		}
		if(cind == 12)
		{
		    if(ind - cind >= 2)
		    {
		        faceY = -1;
		    }
		    faceY -= 1;
		}
		if(cind == 16)
		{
		    if(ind - cind >= 2)
		    {
		        faceY = -1;
		    }
		    faceY -= 1;
		}
    
		break;
			
		case 26:
    
		if(cind == 0)
		{
		    faceX ++;
		    faceY ++;
		}
		else
		{
		    if(cind == 4 || cind == 20)
		    {
		        faceX --;
		        faceY ++;
		    }
		    if(cind == 8)
		    {
		        faceX ++;
		        faceY ++;
		    }
		    if(cind == 16)faceY ++;
		    if(ind == cind + 1 || ind == cind + 3)faceY --;
		    faceY ++;
		}
    
		break;
			
		case 27:
		
		if(global.CHAR[charID, 2] == 0)
		{
			if(cind == 0)
			{
				faceY = 0;
				if(ind == cind + 1)faceY --;
				if(ind == cind + 2)faceY -= 2;
				if(ind == cind + 3)faceY -= 1;
				faceY += 2;
			}
		}
		else
		{
			if(cind == 0)
			{
				faceY = 0;
				if(ind == cind + 2)faceY -= 1;
				faceY += 2;
			}
		}
		if(cind == 4 || cind == 8 || cind == 20)
		{
		    if(cind == 4)faceX ++;
			if(cind == 8)faceX --;
		    if(ind == cind + 1 || ind == cind + 3)
		    {
		        faceY = 0;
		    } else faceY = 2; 
		    //faceY ++;
		}
		if(cind == 12)
		{
		    if(ind == cind + 1 || ind == cind + 3)
		    {
		        faceY = 0;
		    } else faceY = 2; 
		}
		if(cind == 16)
		{
		    if(ind == cind + 1 || ind == cind + 3)
		    {
		        faceY -= 2;
		    }
		    faceY++;
		}
		
		faceY++;
			
		break;
		
		case 28:
		
	    if(cind == 0)
	    {
	        if(ind == cind + 2)faceY ++;
	        if(ind == cind + 3)faceY --;
	         faceY += 2;
	    }
	    else
	    {
	        if(cind == 8)faceX --;
	        if(ind == cind + 1 || ind == cind + 3)faceY --;
	        faceY += 2;
	    }
		
		break;
		
		case 29:
    
	    if(cind == 0)
	    {
	        if(ind > cind + 1)faceX ++;
	        faceY ++;
	    }
	    else
	    {
	        if(ind == cind + 1 || ind == cind + 3)faceY --;
	        faceY += 2;
	        if(cind == 8)faceX ++;
	        if(cind == 12)faceY ++;
	        if(cind == 16)faceY --;
	    }
		
		break;
		
	    case 30:
    
	    if(cind == 0)
	    {
	        if(ind >= cind + 2)
	        {
	            faceY = 1;
	        } else faceY = 0;
	        faceY ++;
	    }
	    if(cind == 20)
	    {
			faceX -= 3;
			faceY ++;
	    }
	    if(cind == 4 || cind == 8 || cind == 20)
	    {
	        faceY ++;
	    }
	    if(cind == 16)
	    {
	        faceY ++;
	    }
	    if(cind == 12)
	    {
	        faceY += 2;
	    }
		if(cind == 4)faceX -= 3;
		if(cind == 8)faceX += 3;
		
	    break;
	}
	
	//BACKHAIR
	if(global.CHAR[charID, 37] != -1 && global.HAIR[global.CHAR[charID, 37], 3] != -1 && global.CLASS[global.CHAR[charID, 3], 23] == false)
	{
	    if(!surface_exists(hairSurface))hairSurface = surface_create(38, 38);
	    surface_set_target(hairSurface);
	    draw_clear_alpha(c_black, 0);
    
	    draw_sprite_ext(global.HAIR[global.CHAR[charID, 37], 2], ind / 4, 0 + faceX, faceY, 1, 1, 0, global.CHAR[charID, 38], 1);
    
	    gpu_set_blendmode(bm_subtract);
    
	    draw_sprite_ext(global.HAIR[global.CHAR[charID, 37], 3], ind / 4, 0 + faceX, faceY, 1, 1, 0, c_black, 1);
    
	    gpu_set_blendmode(bm_normal);
    
	    surface_reset_target();
	}
	
	if(!surface_exists(unitSurface))unitSurface = surface_create(38, 38);
	surface_set_target(unitSurface);
	draw_clear_alpha(c_black, 0);
	
	//draw back hair
	if(global.CHAR[charID, 37] != -1  && global.HAIR[global.CHAR[charID, 37], 3] != -1 && global.CLASS[global.CHAR[charID, 3], 23] == false)
	{
	    if(surface_exists(hairSurface))draw_surface(hairSurface, 0, 0);
	}

	var body = global.CLASS[global.CHAR[charID, 3], global.CHAR[charID, 2] + 38];
	//BODY
	if(filter != 1)
	{
	    shader_set(shColorReplaceBlend);
	    colorIn = make_color_rgb(0,0,255);
	    colorOut = teamColor;
	    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
	    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
	    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
	    shader_set_uniform_f(hnd_blend, 1);
	    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
	    shader_reset();
	} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);



	//FACE
	draw_sprite_ext(global.FACE[global.CHAR[charID, 35], 0], ind / 4, 0 + faceX, faceY, 1, 1, 0, c_white, 1);

	//EYES
	if(global.CHAR[charID, 36] != -1)draw_sprite_ext(global.EYES[global.CHAR[charID, 36], 0], ind / 4, 0 + faceX, faceY, 1, 1, 0, global.CHAR[charID, 39], 1);

	//FRONTHAIR
	if(global.CLASS[global.CHAR[charID, 3], 23] == false)
	{
		if(global.CHAR[charID, 37] != -1 && global.HAIR[global.CHAR[charID, 37], 3] != -1)
		{
		    draw_sprite_ext(global.HAIR[global.CHAR[charID, 37], 3], ind / 4, 0 + faceX, faceY, 1, 1, 0, global.CHAR[charID, 38], 1);
		}
		else if (global.CHAR[charID, 37] != -1)
		{
			draw_sprite_ext(global.HAIR[global.CHAR[charID, 37], 2], ind / 4, 0 + faceX, faceY, 1, 1, 0, global.CHAR[charID, 38], 1);
		}
	}
	
	//accessory
	if(global.CHAR[charID, 43] != -1)
	{
		draw_sprite_ext(global.ACC[global.CHAR[charID, 43], 0], ind / 4, 0 + faceX, faceY, 1, 1, 0, c_white, 1);
	}
	
	//class accessory
	if(global.CLASS[global.CHAR[charID, 3], 22] != -1)
	{
		draw_sprite_ext(global.CLASS[global.CHAR[charID, 3], 22], ind / 4, 0 + faceX, faceY, 1, 1, 0, c_white, 1);
	}
	
	switch(global.CHAR[charID, 3])
	{
		case 7:
		var body = spr_knight_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		
		case 11:
		var body = spr_bowknight_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		
		case 16:
		var body = spr_falconknight_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		
		case 17:
		var body = spr_pegasusknight_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		
		case 20:
		var body = spr_general_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		case 21:
		var body = spr_darkknight_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		case 28:
		var body = spr_wizard_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		case 12:
		var body = spr_kitsune_female_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
		case 27:
		var body = spr_ninetails_female_overlay;
		//BODY
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		break;
	}
	
	if(type == 2 || type == 4)
	{
		if(filter != 1)
		{
		    shader_set(shColorReplaceBlend);
		    colorIn = make_color_rgb(0,0,255);
		    colorOut = teamColor;
		    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
		    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
		    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
		    shader_set_uniform_f(hnd_blend, 1);
		    draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
		    shader_reset();
		} else draw_sprite_ext(body, ind, 0, 3, 1, 1, 0, c_white, 1);
	}
}
else
{
	
	if(!surface_exists(unitSurface))unitSurface = surface_create(32, 32);
	surface_set_target(unitSurface);
	draw_clear_alpha(c_black, 0);
	
	var bodyspr = global.CHAR[charID, 35];
	if(filter == 5 || filter == 8)bodyspr = transformID;

	if(filter != 1)
	{
	    shader_set(shColorReplaceBlend);
	    colorIn = make_color_rgb(0,0,255);
	    colorOut = teamColor;
	    shader_set_uniform_color(hnd_colorIn, colorIn, 1.0);
	    shader_set_uniform_color(hnd_colorOut, colorOut, 1.0);
	    shader_set_uniform_f(hnd_colorTolerance, 0.1, 0.8, 0.8, 1);
	    shader_set_uniform_f(hnd_blend, 1);
	    draw_sprite_ext(bodyspr, ind, 0, 0, 1, 1, 0, c_white, 1);
	    shader_reset();
	} else draw_sprite_ext(bodyspr, ind, 0, 0, 1, 1, 0, c_white, 1);

	vy = 3;
	ny = -6;
}

if(filter == 1)
{
	shader_reset();
}

surface_reset_target();

if(xscale < 0)vx += 32 * abs(xscale);

if((filter < 3 || filter == 5))draw_surface_ext(unitSurface, xpos + vx, ypos + 50 - height + vy + ny, xscale, -yscale * 0.75, 0, c_black, alpha * 0.3);
if(filter != 6 && filter != 7)
{
	if(vis == 2)
	{
		gpu_set_blendmode(bm_add);
		draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, col, alpha);
		gpu_set_blendmode(bm_normal);
	}
	else
	{
		draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, col, alpha);
	}
}

if(filter == 1 || filter == 2)
{
	draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, c_black, alpha * 0.2);
}

if(filter == 4)
{
	draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, c_black, alpha * 0.8);
}

if(filter < 3 && markRange == true && global.transitionCombat <= 0 && obj_game.inCombat == 0 && (global.phase == 0 || obj_pers.gamestate == "prepmap"))
{
	draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, c_red, 1);
}

if(filter == 6 || filter == 8)
{
	draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, c_black, 0.6);
}
if(filter == 7)
{
	draw_surface_ext(unitSurface, xpos + vx, ypos + vy, xscale, yscale, 0, c_black, 0.8);
}