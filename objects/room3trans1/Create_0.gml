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

targetroom = Room1;

targetdir = facing.u;

targetcoords = roomenter(targetdir, 264, 768);
targetx = targetcoords[0];
targety = targetcoords[1];