visible = true;
solid = true;

moveSpeed = 42;

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");
walls = layer_tilemap_get_id("walls")

global.tilemap = [layer_tilemap_get_id("tlayerfg"), layer_tilemap_get_id("edges"), layer_tilemap_get_id("walls"), duckhbox];

function checkcollisionlist(x, y, list){
	var length = array_length(list);
	var beenhit = false;
	for (var i = 0; i < length; i+=1)
	{
		 if place_meeting(x, y, list[i])  //this function takes a list of hitboxes as a parameter and checks if the player is making contact with any of them.
		 {
			 beenhit = true;
		 }
	}
	return beenhit;
}

function whohitme(x, y, list){
    var length = array_length(list);
    var dir = 0;
    for (var i = 0; i < length; i+=1)
    {
        if place_meeting(x, y, list[i])
        {
            dir = point_direction(x, y, list[i].x, list[i].y);
        }
    }
    return dir;
}

function place_meeting_tile(_x, _y, _tilemap) {
    var tile = tilemap_get_at_pixel(_tilemap, _x, _y);
    return (tile != 0);  
                                         // if empty, it’s not a wall tile 
}

function dircardinal(dir){
    if dir >= 225 and dir < 315{
        dir = facing.u;
    }
    else if dir >= 315 or dir < 45{
        dir = facing.r;
    }
    else if dir >= 45 and dir < 135{
        dir = facing.d;
    }
    else if dir >= 135 and dir < 255{
        dir = facing.l;
    }
    return dir;
}

function wallcollidecheck(tilemap_id){
	var hitwall = false;
	switch player.dir{
		case facing.u:{
			if (tilemap_get_at_pixel(tilemap_id, x, y-31) != 0){
				hitwall = true;
				break;
			}
		}
		case facing.d:{
			if (tilemap_get_at_pixel(tilemap_id, x, y+31) != 0){
				hitwall = true;
				break;
			}
		}
		case facing.l:{
			if (tilemap_get_at_pixel(tilemap_id, x-30, y) != 0){
				hitwall = true;
				break;
			}
		}
		case facing.r:{
			if (tilemap_get_at_pixel(tilemap_id, x+30, y) != 0){
				hitwall = true;
				break;
			}
		}
	}
	return hitwall;
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

function tile_place_meeting_dir(xx, yy, layer_id){
    var xp = x;
    var yp = y;
	var pointing = player.dir;
	var meeting = false;
    
    x = xx;
    y = yy;
    
    //var meeting = tilemap_get_at_pixel(layer_id, bbox_left, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
    //              tilemap_get_at_pixel(layer_id, bbox_left, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
    //              tilemap_get_at_pixel(layer_id, bbox_left, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top)
    
	switch pointing{
		case facing.d:{
			meeting = tilemap_get_at_pixel(layer_id, x, bbox_top+1);
		}
		case facing.u:{
			meeting = tilemap_get_at_pixel(layer_id, x, bbox_bottom-1);
		}
		case facing.l:{
			meeting = tilemap_get_at_pixel(layer_id, bbox_left, y);
		}
		case facing.r:{
			meeting = tilemap_get_at_pixel(layer_id, bbox_right, y);
		}
	}
    
    x = xp;
    y = yp;
	
	if meeting{
		show_debug_message("THERE IS A COLLISION TILE BEHIND ME!!!");
	}
    
    return meeting;
}

dir = 0;

dmgsp = 150;

kbsp = 0; //70

kb = 0; //0.4

hitstop = 0; //0.2

