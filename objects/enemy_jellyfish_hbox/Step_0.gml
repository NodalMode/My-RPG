if instance_exists(slashhbox){
	if array_contains(slashhbox.hitenemies, id){
    	if dmgrecieved = false{	
            parent.hp -= 25;
    		dmgrecieved = true;
            myimpact = instance_create_layer(playerhbox.x, playerhbox.y, "anims", slashimpact);
			with (myimpact){
				type = "slash";
			}
            audio_play_sound(choose(enemyhit1, enemyhit2, enemyhit3), 1, false);
        }
        
	}
}

if player.state != pState.atk{
	dmgrecieved = false;
}


if !global.transitioning and global.gstate == gamestate.gameplay and parent.state == eState.run{    
	movetoplayer(parent.sp*global.dt);
}


if dmgrecieved{
    parent.hurt = 8
}



while tilemap_get_at_pixel(edges, x, bbox_top) or tilemap_get_at_pixel(tlayerfg, x, bbox_top) or tilemap_get_at_pixel(walls, x, bbox_top)
    or tilemap_get_at_pixel(edges, bbox_left, bbox_top) or tilemap_get_at_pixel(tlayerfg, bbox_left, bbox_top) or tilemap_get_at_pixel(walls, bbox_left, bbox_top)
    or tilemap_get_at_pixel(edges, bbox_right, bbox_top) or tilemap_get_at_pixel(tlayerfg, bbox_right, bbox_top) or tilemap_get_at_pixel(walls, bbox_right, bbox_top)
    {
        y += 1
    }
    
while tilemap_get_at_pixel(edges, x, bbox_bottom) or tilemap_get_at_pixel(tlayerfg, x, bbox_bottom) or tilemap_get_at_pixel(walls, x, bbox_bottom)
    or tilemap_get_at_pixel(edges, bbox_left, bbox_bottom) or tilemap_get_at_pixel(tlayerfg, bbox_left, bbox_bottom) or tilemap_get_at_pixel(walls, bbox_left, bbox_bottom)
    or tilemap_get_at_pixel(edges, bbox_right, bbox_bottom) or tilemap_get_at_pixel(tlayerfg, bbox_right, bbox_bottom) or tilemap_get_at_pixel(walls, bbox_right, bbox_bottom)
    {
        y -= 1
    }
    
while tilemap_get_at_pixel(edges, bbox_right+1, y) or tilemap_get_at_pixel(tlayerfg, bbox_right+1, y) or tilemap_get_at_pixel(walls, bbox_right+1, y){
        x -= 1
    }
    
while tilemap_get_at_pixel(edges, bbox_left-1, y) or tilemap_get_at_pixel(tlayerfg, bbox_left-1, y) or tilemap_get_at_pixel(walls, bbox_left-1, y){
        x += 1
    }