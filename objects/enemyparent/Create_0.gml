enum eState
{
    idle, 
    run, 
    atk1, 
    atk2,
    dead
}

state = eState.idle;
distfromplayer = sqrt(sqr(x-playerhbox.x)+sqr(y-playerhbox.y));

edges = layer_tilemap_get_id("edges");

function place_meeting_tile(_x, _y, _tilemap) {
    var tile = tilemap_get_at_pixel(_tilemap, _x, _y);
    return (tile != 0);  
                                         // if empty, it’s not a wall tile 
}


function movetoplayer(speed)
{
    var dir = point_direction(x, y, player.x, player.y);
    if (!place_meeting_tile(x+speed, y, edges)){
        x += lengthdir_x(speed, dir)
    }    
    if (!place_meeting_tile(x, y+speed, edges)){
        y += lengthdir_y(speed, dir)
    }  
    
}

dmgrecieved = false;

hurt = 0;
flash_counter = 0;
