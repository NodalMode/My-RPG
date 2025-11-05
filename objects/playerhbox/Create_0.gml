visible = false;
solid = true;

moveSpeed = 42;

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");

global.tilemap = [layer_tilemap_get_id("tlayerfg"), layer_tilemap_get_id("edges"), duckhbox]

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

dir = 0;

dmgsp = 150;

kbsp = 0; //70

kb = 0; //0.4

hitstop = 0; //0.2

