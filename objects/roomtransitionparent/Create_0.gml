//visible = false;



//THE NAME OF THIS OBJECT IS MISLEADING! while it does manage room transitions, i am planning for it to essentially act as the 'game manager'.
//Yes, i know there is an already an object called game manager with no code. Yes, this object is called room transition parent when it doesnt 
//do just that. Should i do something about that? Yes. Will I? Fuck no. Maybe one day (no)

MYFONT = font_add_sprite(nodalfont, ord(" "), true, 2);

gpu_set_texfilter(false);

draw_set_font(MYFONT);

enum gamestate{
    gameplay,
    dialogue,
    menu
}

image_alpha = 1;

global.gstate = gamestate.menu;

x = 160;   //since this is a persistent object, i made its coordinates always be in the top left corner of every room.
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

if room!=loading and room!=mainmenu and room!=gameover{
    global.gstate = gamestate.gameplay;
}
else{
    global.gstate = gamestate.menu;
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
    var intervals = round((180-y)/(array_length(options)+1));   //this function takes an array of strings as a parameter and displays it on 
    for (var i=0; i<array_length(options); i+=1){                                    //screen to act as a menu. it is flexible to allow arrays of many lengths.
        yy += intervals;                                                             //the selected option will be highlighted yellow, and the default selection
        if menuindex == i{                                                           //index is always the first option.
            draw_set_color(#fcef8d);
        }                                                                            //the flexibility comes from the fact that you can set the point at which the
        else{                                                                      //options will begin, and it will equally spread out until reaching the bottom
            draw_set_color(c_white);                                                 //sprite.
        }
        draw_text(xx, yy, options[i]);
    }
}


function menuMove(menuindex, menuoptions){
	var output = []
	
	if keyboard_check_pressed(vk_down) and menuindex < array_length(menuoptions)-1{
		menuindex+=1;
		audio_play_sound(menumove, 1, false);
		array_push(output, "false");
	}
	else if keyboard_check_pressed(vk_up) and menuindex > 0{    //function to allow movement between options in a menu
		menuindex-=1;
		audio_play_sound(menumove, 1, false);
		array_push(output, "false");
	}
	else if keyboard_check_pressed(vk_enter){
		audio_play_sound(menuselection, 1, false);
		array_push(output, "true");
	}
	else{
		array_push(output, "false");
	}
	array_push(output, string(menuindex));
	return output;
}

function gameovertext(){
    var gameovermsg = []
    var deathmsg = choose("end", "nothing", "oblivion", "death", "void", "finish", "termination", "nihility", "zero", "null", 
    "annihilation", "emptiness", "darkness", "erasure", "silence");
    var contmsg = choose("deny", "resist", "oppose", "reject", "defy", "rebel", "push back", "refuse")
    var quitmsg = choose("accept", "embrace", "surrender", "yield", "submit", "comply", "obey", "abide", "succumb")
    gameovermsg = [deathmsg, contmsg, quitmsg];
    return gameovermsg;     //i wanted the game over screen to contain randomized messages for "death", "continue" and "quit". I must note that a lot of these
}                           //were from internet searches for synonyms and i did not come up with them myself.


list = gameovertext();
deathmsg = list[0];
gameoveroptions[0] = list[1];
gameoveroptions[1] = list[2];


menuindex = 0;

paused = false;