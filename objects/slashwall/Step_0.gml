switch player.dir{
    case facing.u:{
        sprite_index = spr_slash_upwall;
        if tile_place_meeting(x, y, edges) || tile_place_meeting(x, y, foreground) || (checkcollisionlist(x, y, player.hurtbox) and player.state = pState.idle){
            knockback = true;
        }
        break;
    }
    case facing.d:{
        sprite_index = spr_slash_downwall;
        if tile_place_meeting(x, y, edges) || tile_place_meeting(x, y, foreground) || (checkcollisionlist(x, y, player.hurtbox) and player.state = pState.idle){
            knockback = true;
        }
        break;
    }
    case facing.l:{
        sprite_index = spr_slash_leftwall;
        if tile_place_meeting(x, y, edges) || tile_place_meeting(x, y, foreground) || (checkcollisionlist(x, y, player.hurtbox) and player.state = pState.idle){
            knockback = true;
        }
        break;
    }        
    case facing.r:{
        sprite_index = spr_slash_rightwall;
        if tile_place_meeting(x, y, edges) || tile_place_meeting(x, y, foreground) || (checkcollisionlist(x, y, player.hurtbox) and player.state = pState.idle){
            knockback = true;
        }
        break;
    }    
}