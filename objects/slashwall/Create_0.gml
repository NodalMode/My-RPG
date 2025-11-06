visible = true;
solid = false;

function tile_place_meeting(xx, yy, layer_id){
    var xp = x;
    var yp = y;
    
    x = xx;
    y = yy;
    
    var meeting = tilemap_get_at_pixel(layer_id, bbox_left, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
                  tilemap_get_at_pixel(layer_id, x, y);
    
    
    x = xp;
    y = yp;
    
    return meeting;
}

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

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");

knockback = false;