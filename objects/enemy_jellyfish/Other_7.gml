if (sprite_index == spr_enemy_jellyfish_atk1){
    atkcooldown = 3;
    state = eState.run;
}

if (sprite_index == spr_enemy_jellyfish_death){
    sprite_index = NOTHING;
}