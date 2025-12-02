//this object purely exists to check if a wall is being hit, so that a quirky and cool knockback thing will happen. What? No i didn't copy this from hollow knight.

visible = false;
solid = false;

function tile_place_meeting(xx, yy, layer_id){
    var xp = x;
    var yp = y;
    
    x = xx;
    y = yy;
    
    var meeting = tilemap_get_at_pixel(layer_id, bbox_left, bbox_top) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, y) || tilemap_get_at_pixel(layer_id, bbox_right, y) ||
                  tilemap_get_at_pixel(layer_id, bbox_left, bbox_bottom) || tilemap_get_at_pixel(layer_id, bbox_right, bbox_top)
    
    
    x = xp;
    y = yp;
    
    return meeting;
}

edges = layer_tilemap_get_id("edges");
foreground = layer_tilemap_get_id("tlayerfg");
walls = layer_tilemap_get_id("walls");

knockback = false;
soundplayed = false;

