_hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
_ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if global.transitioning or global.gstate != gamestate.gameplay{
    image_speed = 0;
}
else{
    image_speed = 1;
}

if player.state == pState.atk
{
    visible = true;
    switch (player.dir)
            {
                case facing.d:
                {
                    switch (player.sprite_index)
                    {
                        case spr_player_body_slash_down0:
                        {
                            
                            if (sprite_index != spr_slash_down1){
                                sprite_swap(spr_slash_down0); break;  //this took too long to code. DO NOT ask why. it works now though.
                            }
                        }
                        
                        case spr_player_body_slash_down1:
                        {
                            
                            if (sprite_index != spr_slash_down0){
                                sprite_swap(spr_slash_down1); break; 
                               
                            }
                        }
                        
                    }
                    break;
                } 
                case facing.u:
                {
                    switch (player.sprite_index)
                    {
                        case spr_player_body_slash_up0:
                        {
                            
                            if (sprite_index != spr_slash_up1){
                                sprite_swap(spr_slash_up0); break;
                                 
                            }
                        }
                         
                        case spr_player_body_slash_up1:
                        {
                            
                            if (sprite_index != spr_slash_up0){
                                sprite_swap(spr_slash_up1); break; 
                                
                            }
                        }
                         
                    }
                    break;
                }
                case facing.r:
                {
                    switch (player.sprite_index)
                    {
                        case spr_player_body_slash_right0:
                        {
                            
                            if (sprite_index != spr_slash_right1){
                                sprite_swap(spr_slash_right0); break;
                                
                            }
                        }
                         
                        case spr_player_body_slash_right1:
                        {
                            
                            if (sprite_index != spr_slash_right0){
                                sprite_swap(spr_slash_right1); break; 
                                
                            }
                        }
                          
                    }
                    break;
                }
                case facing.l:
                {
                    switch (player.sprite_index)
                    {
                        case spr_player_body_slash_left0:
                        {
                            
                            if (sprite_index != spr_slash_left1){
                                sprite_swap(spr_slash_left0); break;
                                
                            }
                        }
                         
                        case spr_player_body_slash_left1:
                        {
                            
                            if (sprite_index != spr_slash_left0){
                                sprite_swap(spr_slash_left1); break; 
                                
                            }
                        }
                          
                    }
                    break;
                }
            }                                  //Game development is hard.
        }                                      //Maybe i should just be a software engineer like my dad says.
    
