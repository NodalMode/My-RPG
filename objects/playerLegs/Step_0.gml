

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var playerFrame = floor(player.image_index);



if (player.sprite_index == spr_player_body_run_down) or (player.sprite_index == spr_player_body_run_up) or (player.sprite_index == spr_player_body_run_left) or (player.sprite_index == spr_player_body_run_right)
{
    switch (player.dir)
    {
        case facing.d:
        {
            sprite_index = spr_player_legs_run_updown
            switch (playerFrame)
            { 
                case 0: if (image_index != 0 and image_index != 2) { if (i == false) { image_index = 0; runFrame = 0; i = true; } else { runFrame = 2; image_index = 2; i = false; } }  break; 
                case 1: image_index = 1; runFrame = 1; break; 
            }
            break;
        }
        case facing.u:
        {
            sprite_index = spr_player_legs_run_updown
            switch (playerFrame)
            {
                case 0: if (image_index != 0 and image_index != 2) { if (i == false) { image_index = 0; runFrame = 0; i = true; } else { runFrame = 2; image_index = 2; i = false; } }  break;
                case 1: image_index = 1; runFrame = 1; break;
            }
            break;    
        }    
        case facing.r: 
        {
            sprite_index = spr_player_legs_run_right
            switch (playerFrame)
            {
                case 0: image_index = 0; runFrame = 0; break;
                case 1: image_index = 1; runFrame = 1; break;
            }
            break;    
        }    
        case facing.l:
        {
            sprite_index = spr_player_legs_run_left
            switch (playerFrame)
            {
                case 0: image_index = 0; runFrame = 0; break;
                case 1: image_index = 1; runFrame = 1; break;
            }
            break;     
        }                 
    }
}     
else
{
    if (sprite_index == spr_player_legs_run_updown)
    {
        sprite_index = spr_player_legs_idle_updown
    }
    else if (sprite_index == spr_player_legs_run_left)
    {
        sprite_index = spr_player_legs_idle_left
    }
    else if (sprite_index == spr_player_legs_run_right)
    {
        sprite_index = spr_player_legs_idle_right
    }
} 




    

