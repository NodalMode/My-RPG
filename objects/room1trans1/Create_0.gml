function roomenter(dir, xx, yy){
    var newx = 0;
    var newy = 0;
    
    switch dir{
        case facing.d:{
            newx = xx;
            newy = yy + 20;
            break; 
        }
        case facing.u:{
            newx = xx;
            newy = yy - 20;
            break; 
        }
        case facing.l:{
            newx = xx - 20;
            newy = yy;
            break; 
        }        
        case facing.r:{
            newx = xx + 20;
            newy = yy;
            break; 
        }    
    }
    return [newx, newy];
}

visible = false;

targetroom = Room2;

targetdir = facing.r;

targetcoords = roomenter(targetdir, 0, 440);
targetx = targetcoords[0];
targety = targetcoords[1];