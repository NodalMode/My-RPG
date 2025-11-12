x = global.phbox.x;
y = global.phbox.y-10;

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

switch (player.state)
{
    case pState.run:
        visible = false;
        sprite_index = NOTHING;
        break;    
    case pState.idle:
        visible = true;
        if (player.dir == facing.d) sprite_swap_rand(spr_player_eyes_idle_down);
        else if (player.dir == facing.u) sprite_swap_rand(spr_player_eyes_idle_up);
        else if (player.dir == facing.r) sprite_swap_rand(spr_player_eyes_idle_right);
        else if (player.dir == facing.l) sprite_swap_rand(spr_player_eyes_idle_left);
        break; 
    case pState.atk:
        visible = false;
        sprite_index = NOTHING;
        break;
    case pState.damaged:
        sprite_index = NOTHING;
        break;
	case pState.dash:
		sprite_index = NOTHING;
		break;
}



