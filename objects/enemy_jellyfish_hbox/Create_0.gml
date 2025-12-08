visible = false;
solid = true;

dmgrecieved = false;

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");
walls = layer_tilemap_get_id("walls");


function tile_place_meeting(xx, yy, layer_id){
    var xp = x;
    var yp = y;
	var meeting = false;
    
	if player.dir == facing.d or player.dir == facing.u{   //checking an object colliding with a tile layer
		x = xx-1;
	}
	else{
		x = xx;
	}
    y = yy;
    
    if player.dir == facing.d or player.dir == facing.u{
		meeting = tilemap_get_at_pixel(layer_id, bbox_left+2, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
	                  tilemap_get_at_pixel(layer_id, bbox_left+2, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
	                  tilemap_get_at_pixel(layer_id, bbox_left+2, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top)
	}
	else{
		meeting = tilemap_get_at_pixel(layer_id, bbox_left, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
	                  tilemap_get_at_pixel(layer_id, bbox_left, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
	                  tilemap_get_at_pixel(layer_id, bbox_left, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top)
	}
    
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

