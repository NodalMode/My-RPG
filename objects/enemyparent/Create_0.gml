

enum eState
{
    idle, 
    run, 
    atk1, 
    atk2,
    dead
}

if instance_exists(playerhbox){
    distfromplayer = sqrt(sqr(x-playerhbox.x)+sqr(y-playerhbox.y));
}

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");
walls = layer_tilemap_get_id("walls");

function place_meeting_tile(_x, _y, _tilemap) {
    var tile = tilemap_get_at_pixel(_tilemap, _x, _y);
    return (tile != 0);  
                                         // if empty, it’s not a wall tile 
}

function tile_place_meeting(xx, yy, layer_id){
    var xp = x;
    var yp = y;
	var meeting = false;
    
    x = xx;
    y = yy;
    
    meeting = tilemap_get_at_pixel(layer_id, bbox_left, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top)
    
    
    x = xp;
    y = yp;
    
    return meeting;
}


function movetoplayer(speed)
{
    var dir = point_direction(x, y, player.x, player.y);
    if !global.transitioning{   
        if dir >= 0 and dir < 180{//up
           if !tile_place_meeting(x, y-speed, edges) and !tile_place_meeting(x, y-speed, walls) and !tile_place_meeting(x, y-speed, foreground){
               y += lengthdir_y(speed, dir);
           }
       }
       else{//down
           if !tile_place_meeting(x, y+speed, edges) and !tile_place_meeting(x, y+speed, walls) and !tile_place_meeting(x, y+speed, foreground){
               y += lengthdir_y(speed, dir);
           }
       }
       if dir >= 90 and dir <270{//left
           if !tile_place_meeting(x-speed, y, edges) and !tile_place_meeting(x-speed, y, walls) and !tile_place_meeting(x-speed, y, foreground)
               x += lengthdir_x(speed, dir);
       }
       else{//right
           if !tile_place_meeting(x+speed, y, edges) and !tile_place_meeting(x+speed, y, walls) and !tile_place_meeting(x+speed, y, foreground)
               x += lengthdir_x(speed, dir);
       }
    }
    
}




//x += lengthdir_x(speed, dir)
//y += lengthdir_y(speed, dir)

dmgrecieved = false;

hurt = 0;
flash_counter = 0;

startx = x;
starty = y;

killsoundplayed = false;

function deadenemydata(room, xx, yy) constructor{
    myroom = room;
    myx = xx;
    myy = yy;
}

mydata = new deadenemydata(room, startx, starty);

if variable_global_exists("deadenemies"){
   if array_contains(global.deadenemies, mydata){
       state = eState.dead;
       killsoundplayed = true;
       sprite_index = NOTHING;
   }
   else{
       state = eState.idle;
   }
}
else{
    state = eState.idle;
}