if instance_exists(slashhbox){
	if array_contains(slashhbox.hitenemies, id){
    	if dmgrecieved = false{	
            parent.hp -= 25;
    		dmgrecieved = true;
    		show_debug_message("enemy hit!");
            instance_create_layer(playerhbox.x, playerhbox.y, "anims", slashimpact);
            audio_play_sound(choose(enemyhit1, enemyhit2, enemyhit3), 1, false);
        }
        
	}
}

if player.state != pState.atk{
	dmgrecieved = false;
}




x = parent.x;
y = parent.y;
if dmgrecieved{
    parent.hurt = 8
}

while tilemap_get_at_pixel(edges, x, bbox_top) or tilemap_get_at_pixel(foreground, x, bbox_top) or tilemap_get_at_pixel(walls, x, bbox_top){
    y += 1
}

while tilemap_get_at_pixel(edges, x, bbox_bottom) or tilemap_get_at_pixel(foreground, x, bbox_bottom) or tilemap_get_at_pixel(walls, x, bbox_bottom){
    y -= 1
}

while tilemap_get_at_pixel(edges, bbox_right-1, y) or tilemap_get_at_pixel(foreground, bbox_right-1, y) or tilemap_get_at_pixel(walls, bbox_right-1, y){
    y -= 1
}

while tilemap_get_at_pixel(edges, bbox_left, y) or tilemap_get_at_pixel(foreground, bbox_left, y) or tilemap_get_at_pixel(walls, bbox_left, y){
    y += 1
}