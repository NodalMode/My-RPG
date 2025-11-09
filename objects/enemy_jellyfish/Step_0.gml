event_inherited();

if hp <= 0{
	state = eState.dead;
}



switch (state){
    case eState.idle:{
        sprite_swap(spr_enemy_jellyfish_idle);
        if (distfromplayer<=125){
            state = eState.run;
            atkcooldown = 3
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
        if (atkcooldown<=0){
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
            coordx = player.x;
            coordy = player.y;
        }
        if (atkdelay<=0) and (atkspawned==false){     
            instance_create_layer(coordx, coordy+13, "Instances", enemy_jellyfish_atk);
            atkspawned=true;
        }
        x = round(x);
        y = round(y);
        break;  
    }
	case (eState.dead):{
		sprite_swap(NOTHING);
		instance_destroy(hitbox);
	}
        
}


if state == eState.dead and killsoundplayed == false{
    audio_play_sound(killsound, 10, false);
    killsoundplayed = true;
}


    
    
    
    



