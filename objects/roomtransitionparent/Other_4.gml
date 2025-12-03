//visible = false;

gpu_set_texfilter(false);

draw_set_font(MYFONT);

x = 160;
y = 90;

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
		instance_create_layer(global.targetx, global.targety, "Instances", player)  //each room transition object has target coordinates and a target room.
		player.x = global.targetx;                                                  //as soon as the player's hitbox is on contact with one, these target 
		player.y = global.targety;                                                  //target variables are made global.
		player.dir = global.targetdir;
	}                                                                               //the different instances are destroyed just to ensure no duplicates remain
}

global.transitioning = false;

instance_create_layer(x, y, "fadetoblack", fade);

in = false;

if !variable_global_exists("deadenemies"){
    global.deadenemies = [];
}


menuindex = 0;

paused = false;