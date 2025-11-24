x = view_xport[0];
y = view_yport[0];

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
    