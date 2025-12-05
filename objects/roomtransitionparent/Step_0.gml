x = 160;
y = 90;

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

if variable_global_exists("fadedone") and instance_exists(playerhbox){
    if global.fadedone{
        instance_destroy(player);
        if variable_instance_exists(global.phbox, "run"){    
            audio_stop_sound(playerhbox.run);
        }
        playerhbox.runningplaying = false;
    	room_goto(global.targetroom);    //actual transition of the room
    }
}

if variable_global_exists("fadedone"){
    if global.fadedone{
        instance_destroy(player);
    	room_goto(global.targetroom);    //actual transition of the room
    }
}

if room == loading{
    sprite_index = black;
    global.gstate = gamestate.menu;
    room_goto(mainmenu);
}
else if room == mainmenu{
    sprite_index = darkgrey;
    draw_set_halign(fa_center);
    global.gstate = gamestate.menu;
	menumovearray = menuMove(menuindex, mainoptions);
	menuindex = floor(real(menumovearray[1]));
    if menumovearray[0] == "true"{
		if menuindex==0{
            room_goto(Room1);
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==2{
            game_end();
        }
	}
}
else if room == gameover{
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
            global.targetdir = facing.d;
            global.hp = 200;
            global.deadenemies = [];
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==1{
            game_end();
        }
	}
}
else{
    sprite_index = black;
    if keyboard_check_pressed(vk_escape) and paused == false and !global.transitioning and global.gstate = gamestate.gameplay and player.state != pState.damaged and player.state != pState.dead and player.state != pState.atk{
        global.gstate = gamestate.menu;
        paused = true;
    }
    else if keyboard_check_pressed(vk_escape) and paused == true{
        global.gstate = gamestate.gameplay;
        paused = false
    }
}
if paused == true{
	draw_set_halign(fa_center);
	global.gstate = gamestate.menu;
	menumovearray = menuMove(menuindex, pauseoptions);
	menuindex = floor(real(menumovearray[1]));
    if menumovearray[0] == "true"{
		if menuindex==0{
            paused = false;
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==1{
            global.gstate = gamestate.menu;
            room_goto(mainmenu)
        }
	}
}
    