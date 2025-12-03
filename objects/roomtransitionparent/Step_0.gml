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
    if keyboard_check_pressed(vk_down){
        menuindex+=1;
        if menuindex>array_length(mainoptions)-1{
            menuindex = array_length(mainoptions)-1; //switch between options in the menu, with checks to make sure you dont go out of index.
        }
        else{
            audio_play_sound(lightning1, 1, false);
        }
    }
    else if keyboard_check_pressed(vk_up){
        menuindex-=1;
        if menuindex<0{
            menuindex = 0;
        }
        else{
            audio_play_sound(lightning1, 1, false);  //this would be better as a function. Too bad!
        }
    }
    if keyboard_check_pressed(vk_enter){
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
    if keyboard_check_pressed(vk_down){
        menuindex+=1;
        if menuindex>array_length(gameoveroptions)-1{
            menuindex = array_length(gameoveroptions)-1; //switch between options in the menu, with checks to make sure you dont go out of index.
        }
        else{
            audio_play_sound(lightning1, 1, false);
        }
    }
    else if keyboard_check_pressed(vk_up){
        menuindex-=1;
        if menuindex<0{
            menuindex = 0;
        }
        else{
            audio_play_sound(lightning1, 1, false);  //this would be better as a function. Too bad!
        }
    }
    if keyboard_check_pressed(vk_enter){
        if menuindex==0{
            global.transitioning = true;    
            global.targetroom = Room1;
            global.targetx = 256;
            global.targety = 640;
            global.targetdir = facing.d;
            global.hp = 50;
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
    if keyboard_check_pressed(vk_escape) and paused == false{
        global.gstate = gamestate.menu;
        paused = true;
    }
    else if keyboard_check_pressed(vk_escape) and paused == true{
        global.gstate = gamestate.gameplay;
        paused = false
    }
}
if paused == true{
    if keyboard_check_pressed(vk_down){
        menuindex+=1;
        if menuindex>array_length(pauseoptions)-1{
            menuindex = array_length(pauseoptions)-1;
        }
        else{
            audio_play_sound(lightning1, 1, false);
        }
    }
    else if keyboard_check_pressed(vk_up){
        menuindex-=1;
        if menuindex<0{
            menuindex = 0;
        }
        else{
            audio_play_sound(lightning1, 1, false);
        }
    }
    if keyboard_check_pressed(vk_enter){
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
    