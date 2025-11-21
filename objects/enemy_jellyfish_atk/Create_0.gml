visible = true;
solid = false;
hitbox = instance_create_layer(x, y-13, "hurtboxes", enemy_jellyfish_atk_hbox);
array_push(global.hurtbox, hitbox);
