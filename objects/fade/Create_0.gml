//this object is created when a fade in/fadeout transition is needed.

function sprite_swap(_sprite){
    if (sprite_index != _sprite){     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        image_index = 0;
        sprite_index = _sprite;
    }
} 

image_xscale *= 1000;
image_yscale *= 1000;   // if i didnt do this, the sprite would not appear.
                        //even when i set the coordinates to the player's.
                        //why is this the case? I don't know. Do i care? No.
visible = true;



global.fadedone = false;