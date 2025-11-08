
event_inherited();
sp = 23;

atkcooldown = 3;
atkdelay = 0.9;

atkspawned = false;

function sprite_swap_rand(_sprite) {
    if (sprite_index != _sprite) {          
        sprite_index = _sprite;
        image_index = random_range(0, sprite_get_number-1);     
    }
} 


function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     
        image_index = 0;
        sprite_index = _sprite;
    }
}   

coordx = player.x;
coordy = player.y;

sprite_swap_rand(spr_enemy_jellyfish_idle);

hitbox = instance_create_layer(x, y, "hurtboxes", enemy_jellyfish_hbox);

with hitbox{
    parent = other.id;
}

array_push(player.hurtbox, hitbox);

array_push(player.ehitbox, hitbox);

hp = 500;



