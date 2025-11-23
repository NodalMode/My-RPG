global.dt = delta_time / 1000000;


cleaninstancearray(global.hurtbox);
cleaninstancearray(global.ehitbox);



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


if global.transitioning{
	image_speed = 0;
}
     


if (keyboard_check_pressed(ord("L"))) && (state = pState.idle or state = pState.run) && (attackCooldown <= 0) 
{
    audio_play_sound(choose(swingsound[0], swingsound[1], swingsound[2]), 1, false);
    clearedlist = false;
	state = pState.atk;
    image_index = 0;   
}    


if (state == pState.idle or state == pState.run) 
{
	if (_hor == 0 && _ver == 0) state = pState.idle;
    else state = pState.run;
}   

if (state == pState.idle or state == pState.run) {
	if keyboard_check_pressed(ord("P")) && dashCooldown <= 0{
        audio_play_sound(dash, 1, false);
		dashTime = 0.25;
		playerhbox.dashSpeed = 250;
		state = pState.dash;
	}
}


switch (state)
{
    case pState.idle:
    { 
        switch (dir)
        {
            case facing.d: sprite_swap_rand(spr_player_body_idle_down); break;
            case facing.u: sprite_swap_rand(spr_player_body_idle_up); break; 
            case facing.r: sprite_swap_rand(spr_player_body_idle_right); break; 
            case facing.l: sprite_swap_rand(spr_player_body_idle_left); break; 
        }
        if (_hor!=0 or _ver!=0) && !global.transitioning
        {
            state = pState.run; 
        }
        if (keyboard_check_pressed(ord("L")) && attackCooldown <= 0 && !global.transitioning)
        {
            audio_play_sound(choose(swingsound[0], swingsound[1], swingsound[2]), 1, false);
            state = pState.atk; 
			clearedlist = false;
			image_index = 0;
        }
		if keyboard_check_pressed(ord("P")) && dashCooldown <= 0  && !global.transitioning{
			audio_play_sound(dash, 1, false);
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
        if playerhbox.kb <= 0 and global.transitioning == false{    
            if (_hor>0  && _ver == 0) dir = facing.r;
            else if (_hor<0  && _ver == 0) dir = facing.l;
            else if (_ver>0  && _hor == 0) dir = facing.d;
            else if (_ver<0  && _hor == 0) dir = facing.u;   
        }      
            
        if (_hor == 0 and _ver == 0)
        {
            state = pState.idle; 
        }
        if (keyboard_check_pressed(ord("L")) && attackCooldown <= 0  && !global.transitioning)
        {
            audio_play_sound(choose(swingsound[0], swingsound[1], swingsound[2]), 1, false);
            state = pState.atk; 
			clearedlist = false;
			image_index = 0;
        }
		if keyboard_check_pressed(ord("P")) && dashCooldown <= 0  && !global.transitioning{
			audio_play_sound(dash, 1, false);
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
            
	if (image_index >= image_number - 1) 
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
}


show_debug_message("horizontal speed - " + string(_hor));
show_debug_message("vertical speed - " + string(_ver));


if !global.transitioning{
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
	if invincibleCooldown <= 0{
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

show_debug_message("atk cooldown - " + string(attackCooldown));
show_debug_message("dmg cooldown - " + string(damageCooldown));