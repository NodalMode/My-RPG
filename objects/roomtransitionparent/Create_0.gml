visible = false;

x = view_xport[0];
y = view_yport[0];

function sprite_swap(_sprite){
    if (sprite_index != _sprite){     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        image_index = 0;
        sprite_index = _sprite;
    }
} 


if variable_global_exists("transitioning") and variable_global_exists("targetroom"){
	if global.transitioning and room==global.targetroom{
        instance_destroy(player);
        instance_destroy(playerhbox);
        instance_destroy(slashhbox);
		instance_create_layer(global.targetx, global.targety, "Instances", player)
		player.x = global.targetx;
		player.y = global.targety;
		player.dir = global.targetdir;
	}
}

global.transitioning = false;

instance_create_layer(x, y, "fadetoblack", fade);

in = false;