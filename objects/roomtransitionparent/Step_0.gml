x = 160;
y = 90;

if global.transitioning and room!=global.targetroom and in == false{
    instance_create_layer(x, y, "fadetoblack", fade);
    in = true;
}
else if global.transitioning and player.state == pState.dead and room==global.targetroom and in==false{
    instance_create_layer(x, y, "fadetoblack", fade);
    in = true;
}

if variable_global_exists("fadedone"){
    if global.fadedone{
        instance_destroy(player);
        if variable_instance_exists(global.phbox, "run"){    
            audio_stop_sound(playerhbox.run);
        }
        playerhbox.runningplaying = false;
    	room_goto(global.targetroom);
    }
}

if room == loading{
    global.gstate = gamestate.menu;
    room_goto(mainmenu);
}
else if room == mainmenu{
    global.gstate = gamestate.menu;
    if keyboard_check_pressed(vk_down){
        menuindex+=1;
        if menuindex>array_length(mainoptions)-1{
            menuindex = array_length(mainoptions)-1;
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
            room_goto(Room1);
            global.gstate = gamestate.gameplay;
        }
        else if menuindex==2{
            game_end();
        }
    }
}
else{
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
        else if menuindex==2{
            global.gstate = gamestate.menu;
            room_goto(mainmenu)
        }
    }
}
    