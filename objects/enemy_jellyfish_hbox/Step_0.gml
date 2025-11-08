if instance_exists(slashhbox){
	if array_contains(slashhbox.hitenemies, id){
    	if dmgrecieved = false{	
            parent.hp -= 25;
    		dmgrecieved = true;
    		show_debug_message("enemy hit!");
            instance_create_layer(playerhbox.x, playerhbox.y, "anims", slashimpact);
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