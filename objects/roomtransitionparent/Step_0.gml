x = 160;
y = 90;

if !global.transitioning and global.gstate == gamestate.gameplay{    
    global.dt = delta_time / 1000000;
}
else{
    global.dt = 0;   //while transitioning or paused, all delta time based things like movement or countdowns are also paused
}

if global.transitioning and room!=global.targetroom and in == false{  //fading to black before moving to the next room.
    instance_create_layer(x, y, "fadetoblack", fade);
    in = true;
}
if instance_exists(player){
   if global.transitioning and player.state == pState.dead and room==global.targetroom and in==false{  //when dead, it will have the same appearance as a 
       instance_create_layer(x, y, "fadetoblack", fade);                                                    //room transition
       in = true;
   }
}

if variable_global_exists("fadedone"){
    if global.fadedone{
        instance_destroy(player);
        if instance_exists(playerhbox) and variable_instance_exists(global.phbox, "run"){    
            audio_stop_sound(playerhbox.run);
            playerhbox.runningplaying = false;
        }
    	room_goto(global.targetroom);    //actual transition of the room
    }
}

if room == loading{
    image_alpha = 1;
    sprite_index = black;
    global.gstate = gamestate.menu;
    room_goto(mainmenu);
}
else if room == mainmenu{
    image_alpha = 1;
    sprite_index = darkgrey;
    draw_set_halign(fa_center);
    global.gstate = gamestate.menu;
	menumovearray = menuMove(menuindex, mainoptions);
	menuindex = floor(real(menumovearray[1]));
    if menumovearray[0] == "true"{
		if menuindex==0{
            room_goto(Room1);
            global.gstate = gamestate.gameplay;   //i want to change this to load the current checkpoint
            global.hp = 200;
            global.deadenemies = [];
        }
        else if menuindex==2{
            game_end();
        }
	}
}
else if room == gameover{
    image_alpha = 1;
    sprite_index = darkgrey;
    draw_set_halign(fa_center);
    global.gstate = gamestate.menu;
	menumovearray = menuMove(menuindex, gameoveroptions);
	menuindex = floor(real(menumovearray[1]));
    if menumovearray[0] == "true"{
		if menuindex==0{
            global.transitioning = true;    
            global.targetroom = Room1;
            global.targetx = 256;
            global.targety = 640;
            global.targetdir = facing.d;   //i want to change this as well to load the current checkpoint
            global.hp = 200;
            global.deadenemies = [];
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==1{
            global.gstate = gamestate.menu;
            global.hp = 200;
            room_goto(mainmenu);
        }
	}
}
else{
    image_alpha = 0;
    sprite_index = darkgrey;
    if keyboard_check_pressed(vk_escape) and paused == false and !global.transitioning and global.gstate = gamestate.gameplay and player.state != pState.damaged and player.state != pState.dead and player.state != pState.atk{
        global.gstate = gamestate.menu;
        audio_play_sound(menumove, 1, false);
        draw_set_halign(fa_center);
        menuindex = 0;
        paused = true;
    }
    else if keyboard_check_pressed(vk_escape) and paused == true{
        global.gstate = gamestate.gameplay;
        audio_play_sound(menumove, 1, false);
        paused = false
    }
}
if paused == true{
    image_alpha = 0.5;
    sprite_index = darkgrey;
	draw_set_halign(fa_center);
	global.gstate = gamestate.menu;
	menumovearray = menuMove(menuindex, pauseoptions);
	menuindex = floor(real(menumovearray[1]));
    if menumovearray[0] == "true"{
		if menuindex==0{
            paused = false;
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==2{
            global.gstate = gamestate.menu;
            room_goto(mainmenu);
        }
	}
}
    