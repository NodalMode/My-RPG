if instance_exists(slashhbox){
	if array_contains(slashhbox.hitenemies, id) and dmgrecieved = false{
		enemy_jellyfish.hp -= 25
		dmgrecieved = true;
		show_debug_message("enemy hit!")
        instance_create_layer(playerhbox.x, playerhbox.y, "anims", slashimpact);
	}
}

if player.state != pState.atk{
	dmgrecieved = false;
}