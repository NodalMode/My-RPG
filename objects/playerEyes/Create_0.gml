//the reason for this objects existence is purely so that the animation of the player's ears and eyes are desynced. cat blinking and ear twitching look funny ^-^

visible = true;
solid = false;

function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        image_index = 0;
        sprite_index = _sprite;
    }
}    

function sprite_swap_rand(_sprite) {
    if (sprite_index != _sprite) {          //same as above, but also starts the sprite on a random frame.
        sprite_index = _sprite;
        image_index = random_range(0, sprite_get_number-1);     
    }
}  


flashtime = 0;

function invincibleflash(flashtime){
	if (current_time-flashtime)>35{
		flashtime = current_time;
		if image_alpha == 1{
			image_alpha = 0.1;
		}
		else{
			image_alpha = 1;
		}
	}
	return flashtime;
}