//visible = false;

MYFONT = font_add_sprite(nodalfont, ord(" "), true, 2);

gpu_set_texfilter(false);

draw_set_font(MYFONT);

enum gamestate{
    gameplay,
    dialogue,
    menu
}

global.gstate = gamestate.menu;

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
		instance_create_layer(global.targetx, global.targety, "Instances", player)
		player.x = global.targetx;
		player.y = global.targety;
		player.dir = global.targetdir;
	}
}

global.transitioning = false;

instance_create_layer(x, y, "fadetoblack", fade);

in = false;

if !variable_global_exists("deadenemies"){
    global.deadenemies = [];
}


mainoptions[0] = "Start";
mainoptions[1] = "Settings";
mainoptions[2] = "Quit";

pauseoptions[0] = "Continue";
pauseoptions[1] = "Settings";
pauseoptions[2] = "Back to main menu"

function menuselect(options, x, y){
    var xx = x;
    var yy = y;
    var intervals = round(sprite_get_height(black)/(array_length(options)+1));
    for (var i=0; i<array_length(options); i+=1){
        yy += intervals;
        if menuindex == i{ 
            draw_set_color(c_yellow);
        }
        else{
            draw_set_color(c_white);
        }
        draw_text(xx, yy, options[i]);
    }
}



menuindex = 0;

paused = false;