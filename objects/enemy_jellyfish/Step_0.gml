event_inherited();

if hp <= 0{
	state = eState.dead;
}



switch (state){
    case eState.idle:{
        sprite_swap(spr_enemy_jellyfish_idle);
        if (distfromplayer<=125){
            state = eState.run;
            atkcooldown = 3    //3 second intervals inbetween attacks
        }
        x = round(x);
        y = round(y);
        break;
    }
    case (eState.run):{
        sprite_swap(spr_enemy_jellyfish_idle);
        movetoplayer(sp*global.dt);
        if (distfromplayer>=250){
            state = eState.idle;
        }
        atkcooldown -= global.dt;
        if (atkcooldown<=0){
            atkcooldown=0;
        }
        if (atkcooldown<=0) and !global.transitioning and global.gstate = gamestate.gameplay{ 
            state = eState.atk1;
            atkdelay = 0.6
            atkspawned = false
        }
        break;
    }
    case (eState.atk1):{
        sprite_swap(spr_enemy_jellyfish_atk1);
        atkdelay -= global.dt;
        if (atkdelay<=0){
            atkdelay=0;
        }
        if (image_index==5){
            coordx = player.x;   //the coordinates of the player are only recorded partway through the animation, to simulate the effect of a delayed strike.
            coordy = player.y;   //this is done so that the player would only be hit by this if they were completely still.
        }
        if (atkdelay<=0) and (atkspawned==false){     
            instance_create_layer(coordx, coordy+13, "Instances", enemy_jellyfish_atk);
            atkspawned=true;
            lightningsound = audio_play_sound(choose(lightning1, lightning2, lightning3), 1, false);
            audio_sound_pitch(lightningsound, random_range(1, 1.5));
        }
        x = round(x);
        y = round(y);
        break;  
    }
	case (eState.dead):{
		if sprite_index!=NOTHING{  
            sprite_swap(spr_enemy_jellyfish_death);
			layer_set_visible(player.screenshake, true);
        }
		instance_destroy(hitbox);
	}
        
}


if state == eState.dead and killsoundplayed == false{
    audio_play_sound(killsound, 1, false);
    killsoundplayed = true;
}

if sprite_index = spr_enemy_jellyfish_death && image_index >= 4{
	layer_set_visible(player.screenshake, false);
}


    
    

    



