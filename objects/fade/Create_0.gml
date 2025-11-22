function sprite_swap(_sprite){
    if (sprite_index != _sprite){     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        image_index = 0;
        sprite_index = _sprite;
    }
} 

image_xscale *= 1000;
image_yscale *= 1000;


visible = true;



global.fadedone = false;