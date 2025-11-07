if instance_exists(slashhbox){
	if array_contains(slashhbox.hitenemies, id) and dmgrecieved = false{
		enemy_jellyfish.hp -= 25
		dmgrecieved = true;
		show_debug_message("enemy hit!")
	}
}

if player.state != pState.atk{
	dmgrecieved = false;
}