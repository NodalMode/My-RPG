visible = false;
solid = false;
image_speed = 1;
sprite_index = NOTHING;

function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     
        image_index = 0;
        sprite_index = _sprite;
    }
}    