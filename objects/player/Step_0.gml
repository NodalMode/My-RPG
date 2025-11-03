global.dt = delta_time / 1000000;

_hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
_ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

prevState = state;

     


if (mouse_check_button_pressed(mb_left) && state != pState.atk && attackCooldown <= 0) 
{
    state = pState.atk;
    image_index = 0;   
}    


if (state != pState.atk) 
{
    if (_hor == 0 && _ver == 0) state = pState.idle;
    else state = pState.run;
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
        if (_hor!=0 or _ver!=0)
        {
            state = pState.run; 
        }
        if (mouse_check_button(mb_left) && attackCooldown <= 0)
        {
            state = pState.atk; 
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
        if (_hor>0) dir = facing.r;
        else if (_hor<0) dir = facing.l;
        else if (_ver>0) dir = facing.d;
        else if (_ver<0) dir = facing.u;         
            
        if (_hor == 0 and _ver == 0)
        {
            state = pState.idle; 
        }
        if (mouse_check_button(mb_left) && attackCooldown <= 0)
        {
            state = pState.atk; 
        }
        break;
    }
    
    case pState.atk:
    {
        slashbox = instance_create_layer(x, y, "hurtboxes", slashhbox)    
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
        }
    if (image_index >= image_number - 1) 
    { 
        if (_hor == 0 && _ver == 0) state = pState.idle; 
        else state = pState.run; 
            
        attackCooldown = 0.25;
        instance_destroy(slashhbox)
    }
    break;    
}    


show_debug_message("horizontal speed - " + string(_hor));
show_debug_message("vertical speed - " + string(_ver));

attackCooldown -= global.dt;
if (attackCooldown <= 0){
    attackCooldown = 0
}

show_debug_message("atk cooldown - " + string(attackCooldown))