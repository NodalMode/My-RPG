global.dt = delta_time / 1000000;


cleaninstancearray(global.hurtbox);
cleaninstancearray(global.ehitbox);

if damageCooldown<=0 and invincibleCooldown>0 and state!=pState.dead{
	flashtime = invincibleflash(flashtime);
}
else{
	image_alpha = 1;
}



//show_debug_message("all existing hurtboxes: " + arraytostring(hurtbox))

_hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
_ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

prevState = state;

if global.hp <= 0{
    global.hp = 0;
}

if state != pState.atk{
	instance_destroy(slashhbox);
    instance_destroy(slashwall);
}


if global.transitioning or global.gstate != gamestate.gameplay{
	image_speed = 0;    //freeze animations while going between rooms
}
else{
	image_speed = 1;
}
     


if (keyboard_check_pressed(ord("L"))) && (state = pState.idle or state = pState.run) && (attackCooldown <= 0) and global.gstate = gamestate.gameplay
{
    audio_play_sound(choose(swingsound[0], swingsound[1]), 1, false);
    audio_sound_pitch(swingsound[0], random_range(1, 1.5));
    audio_sound_pitch(swingsound[1], random_range(1, 1.15));
    clearedlist = false;
	state = pState.atk;
    image_index = 0;   
}    


if (state == pState.idle or state == pState.run) and global.gstate = gamestate.gameplay
{
	if (_hor == 0 && _ver == 0 && !global.transitioning) state = pState.idle;
    else state = pState.run;
}   

if (state == pState.idle or state == pState.run) and global.gstate = gamestate.gameplay{
	if keyboard_check_pressed(ord("P")) && dashCooldown <= 0{
        audio_play_sound(dash, 1, false);
        audio_sound_pitch(dash, random_range(1, 2));
		dashTime = 0.25;
		playerhbox.dashSpeed = 250;
		state = pState.dash;
	}
}

if keyboard_check_pressed(ord("M")) and global.gstate = gamestate.gameplay{
    audio_play_sound(menuselection, 1, false);
    if global.displaydebug{global.displaydebug=false;}
    else{global.displaydebug=true;}    
}


switch (state)
{
    case pState.idle:
    { 
        peyes.visible = true;
		switch (dir)
        {
            case facing.d: sprite_swap_rand(spr_player_body_idle_down); break;
            case facing.u: sprite_swap_rand(spr_player_body_idle_up); break; 
            case facing.r: sprite_swap_rand(spr_player_body_idle_right); break; 
            case facing.l: sprite_swap_rand(spr_player_body_idle_left); break; 
        }
        if (_hor!=0 or _ver!=0) && !global.transitioning && global.gstate = gamestate.gameplay
        {
            state = pState.run; 
        }
        if (keyboard_check_pressed(ord("L")) && attackCooldown <= 0 && !global.transitioning && global.gstate = gamestate.gameplay)
        {
            audio_play_sound(choose(swingsound[0], swingsound[1]), 1, false);
            audio_sound_pitch(swingsound[0], random_range(1, 1.5));
            audio_sound_pitch(swingsound[1], random_range(1, 1.15));
            state = pState.atk; 
			clearedlist = false;
			image_index = 0;
        }
		if keyboard_check_pressed(ord("P")) && dashCooldown <= 0  && !global.transitioning && global.gstate = gamestate.gameplay{
			audio_play_sound(dash, 1, false);
            audio_sound_pitch(dash, random_range(1, 2));
            dashTime = 0.25;
			playerhbox.dashSpeed = 250;
			state = pState.dash;
		}
        break;

    }  
    
    case pState.run:
    {
        switch (dir)
        {
            case facing.d: sprite_index = spr_player_body_run_down; break; 
            case facing.u: sprite_index = spr_player_body_run_up; break; 
            case facing.r: sprite_index = spr_player_body_run_right; break; 
            case facing.l: sprite_index = spr_player_body_run_left; break; 
        }
        if playerhbox.kb <= 0 and global.transitioning == false and global.gstate = gamestate.gameplay{    
            if (_hor>0  && _ver == 0) dir = facing.r;
            else if (_hor<0  && _ver == 0) dir = facing.l;
            else if (_ver>0  && _hor == 0) dir = facing.d;
            else if (_ver<0  && _hor == 0) dir = facing.u;   
        }      
            
        if (_hor == 0 and _ver == 0 and !global.transitioning and global.gstate = gamestate.gameplay)
        {
            state = pState.idle; 
        }
        if (keyboard_check_pressed(ord("L")) && attackCooldown <= 0  && !global.transitioning && global.gstate = gamestate.gameplay)
        {
            audio_play_sound(choose(swingsound[0], swingsound[1]), 1, false);
            audio_sound_pitch(swingsound[0], random_range(1, 1.5));
            audio_sound_pitch(swingsound[1], random_range(1, 1.15));
            state = pState.atk; 
			clearedlist = false;
			image_index = 0;
        }
		if keyboard_check_pressed(ord("P")) && dashCooldown <= 0  && !global.transitioning && global.gstate = gamestate.gameplay{
			audio_play_sound(dash, 1, false);
            audio_sound_pitch(dash, random_range(1, 2));
            dashTime = 0.25;
			playerhbox.dashSpeed = 250;
			state = pState.dash;
		}
        break;
    }
	case pState.dash:
	{
		if player.dashTime <= 0{
			player.state = pState.idle;
			player.dashCooldown = 0.25;
		}
		switch dir{
			case facing.d:{
				sprite_swap(spr_player_body_dash_down);
				break;
			}
			case facing.u:{
				sprite_swap(spr_player_body_dash_up);
				break;
			}
			case facing.r:{
				sprite_swap(spr_player_body_dash_right);
				break;
			}
			case facing.l:{
				sprite_swap(spr_player_body_dash_left);
				break;
			}
		}
		break;
	}
    
    case pState.atk:
    {
        slashbox = instance_create_layer(x, y, "hurtboxes", slashhbox);
		if clearedlist == false{
			slashhbox.hitenemies = [];
			clearedlist = true;
		}
        switch (dir)
            {
                case facing.d:
                {
                    switch (swingNum)
                    {
                        case attackIndex.o:
                        {
                            
                            if (sprite_index != spr_player_body_slash_down1){
                                sprite_swap(spr_player_body_slash_down0);
                                swingNum = attackIndex.i; break; 
                            }
                        }
                        case attackIndex.i:
                        {
                            
                            if (sprite_index != spr_player_body_slash_down0){
                                sprite_swap(spr_player_body_slash_down1); 
                                swingNum = attackIndex.o; break;
                            }
                        } 
                    }
                    break;
                } 
                case facing.u:
                {
                    switch (swingNum)
                    {
                        case attackIndex.o:
                        {
                            
                            if (sprite_index != spr_player_body_slash_up1){
                                sprite_swap(spr_player_body_slash_up0);
                                swingNum = attackIndex.i; break; 
                            }
                        }
                        case attackIndex.i:
                        {
                            
                            if (sprite_index != spr_player_body_slash_up0){
                                sprite_swap(spr_player_body_slash_up1); 
                                swingNum = attackIndex.o; break;
                            }
                        } 
                    }
                    break;
                }
                case facing.r:
                {
                    switch (swingNum)
                    {
                        case attackIndex.o:
                        {
                            
                            if (sprite_index != spr_player_body_slash_right1){
                                sprite_swap(spr_player_body_slash_right0);
                                swingNum = attackIndex.i; break; 
                            }
                        }
                        case attackIndex.i:
                        {
                            
                            if (sprite_index != spr_player_body_slash_right0){
                                sprite_swap(spr_player_body_slash_right1); 
                                swingNum = attackIndex.o; break;
                            }
                        } 
                    }
                    break;
                }
                case facing.l:
                {
                    switch (swingNum)
                    {
                        case attackIndex.o:
                        {
                            
                            if (sprite_index != spr_player_body_slash_left1){
                                sprite_swap(spr_player_body_slash_left0);
                                swingNum = attackIndex.i; break; 
                            }
                        }
                        case attackIndex.i:
                        {
                            
                            if (sprite_index != spr_player_body_slash_left0){
                                sprite_swap(spr_player_body_slash_left1); 
                                swingNum = attackIndex.o; break;
                            }
                        } 
                    }
					break;
				}
			}	
            
	if (image_index >= image_number - 1) //animation end
	{ 
		if (_hor == 0 && _ver == 0) state = pState.idle; 
		else state = pState.run; 
	            
	    attackCooldown = 0.25;
	    instance_destroy(slashhbox);
		layer_set_visible(screenshake, false);
        instance_destroy(slashwall);
	}
    break;    
    }   
	case pState.damaged:
    {
		if global.hp<=0{
            state=pState.dead; 
            roomtransitionparent.list = roomtransitionparent.gameovertext();
            roomtransitionparent.deathmsg = roomtransitionparent.list[0];
            roomtransitionparent.gameoveroptions[0] = roomtransitionparent.list[1];
            roomtransitionparent.gameoveroptions[1] = roomtransitionparent.list[2];  //assigns the different random death messages upon death.
            audio_play_sound(killsound, 1, false); break;
        }
        if damageCooldown <= 0
		{
			state = pState.idle;
            playerhbox.dmgsp = 150;
        }
        else if damageCooldown <0.2{
            layer_set_visible(screenshake, false);
        }
        switch playerhbox.point{
            case facing.u:{
                sprite_swap_rand(spr_player_body_dmg_down);
				dir = facing.d;
                break;
            }
            case facing.d:{
                sprite_swap_rand(spr_player_body_dmg_up);
				dir = facing.u;
                break;
            }
            case facing.r:{
                sprite_swap_rand(spr_player_body_dmg_right);
				dir = facing.r;
                break;
            }
            case facing.l:{
                sprite_swap_rand(spr_player_body_dmg_left);
				dir = facing.l;
                break;
            }
        }
        break;
	}
        case pState.dead:{
            if !deathanimplayed{   
                switch dir{
                   case facing.d:{
                       sprite_swap(spr_player_body_death_down); break;
                   } 
                   case facing.u:{
                       sprite_swap(spr_player_body_death_up); break;
                   }
                   case facing.l:{
                       sprite_swap(spr_player_body_death_left); break;
                   }    
                   case facing.r:{
                       sprite_swap(spr_player_body_death_right); break;
                   }    
               }
            }
            if sprite_index == NOTHING and deathCooldown<=0{
                room_goto(gameover);  //go to game over screen. Why am i even writing this?
            }
        }
}





if !global.transitioning and global.gstate = gamestate.gameplay{
	attackCooldown -= global.dt;
	if (attackCooldown <= 0){
	    attackCooldown = 0;
	}

	damageCooldown -= global.dt;
	if damageCooldown <= 0{
	    damageCooldown = 0;
		layer_set_visible(screenshake, false);
	}
	else{
		layer_set_visible(screenshake, true);
	}

	invincibleCooldown -= global.dt;
	if invincibleCooldown <= 0{             //all the cooldowns are counting down
	    invincibleCooldown = 0;
	}

	dashCooldown -= global.dt;
	if dashCooldown <= 0{
	    dashCooldown = 0;
	}

	dashTime -= global.dt;
	if dashTime <= 0{
		dashTime = 0
	}
}

deathCooldown -= global.dt;
if deathCooldown <= 0{
	deathCooldown = 0
}