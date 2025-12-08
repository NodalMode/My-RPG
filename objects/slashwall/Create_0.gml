//this object purely exists to check if a wall is being hit, so that a quirky and cool knockback thing will happen. What? No i didn't copy this from hollow knight.

visible = false;
solid = false;

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

function checkcollisionlist(xx, yy, list){
	var length = array_length(list);
	var beenhit = false;
	for (var i = 0; i < length; i+=1)
	{
		//if object_exists(list[i]){
			 if place_meeting(xx, yy, list[i])  //this function takes a list of hitboxes as a parameter and checks if the player is making contact with any of them.
			 {
				 beenhit = true;
			 }
		//}
	}
	return beenhit;
}

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");
walls = layer_tilemap_get_id("walls");

knockback = false;
soundplayed = false;

