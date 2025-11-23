switch player.dir{
    case facing.u:{
        sprite_index = spr_slash_upwall;
        if tile_place_meeting(x, y, edges) or tile_place_meeting(x, y, foreground) or tile_place_meeting(x, y, walls){
            knockback = true;
            if slashwall.soundplayed == false{
                audio_play_sound(choose(hitwall1, hitwall2, hitwall3), 1, false);
                slashwall.soundplayed = true;
            }
        }
        break;
    }
    case facing.d:{
        sprite_index = spr_slash_downwall;
        if tile_place_meeting(x, y, edges) or tile_place_meeting(x, y, foreground){
            knockback = true;
            if slashwall.soundplayed == false{
                audio_play_sound(choose(hitwall1, hitwall2, hitwall3), 1, false);
                slashwall.soundplayed = true;
            }
        }
        break;
    }
    case facing.l:{
        sprite_index = spr_slash_leftwall;
        if tile_place_meeting(x, y, edges) or tile_place_meeting(x, y, foreground){
            knockback = true;
            if slashwall.soundplayed == false{
                audio_play_sound(choose(hitwall1, hitwall2, hitwall3), 1, false);
                soundplayed = true;
            }
        }
        break;
    }        
    case facing.r:{
        sprite_index = spr_slash_rightwall;
        if tile_place_meeting(x, y, edges) or tile_place_meeting(x, y, foreground){
            knockback = true;
            if slashwall.soundplayed == false{
                audio_play_sound(choose(hitwall1, hitwall2, hitwall3), 1, false);
                slashwall.soundplayed = true;
            }
        }
        break;
    }  
}

if knockback == true{
    show_debug_message("HIT WALL");
}