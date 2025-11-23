if (sprite_index == spr_enemy_jellyfish_atk1){
    atkcooldown = 3;
    state = eState.run;
}

if (sprite_index == spr_enemy_jellyfish_death){
    deathanimationplayed = true;
    sprite_index = NOTHING;
}