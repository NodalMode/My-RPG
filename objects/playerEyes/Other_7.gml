switch sprite_index{
	case spr_player_eyes_idle_down:{
		sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_down);
		while image_index>33{	
			sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_down);
		}
		break;
	}
	case spr_player_eyes_idle_up:{
		sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_up); 
		while image_index>33{
			sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_up); 
		}
		break;
	}
	case spr_player_eyes_idle_left:{
		sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_left);
		while image_index>33{
			sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_left);
		}
		break;
	}
	case spr_player_eyes_idle_right:{
		sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_right);
		while image_index>33{
			sprite_index = NOTHING; sprite_swap_rand(spr_player_eyes_idle_right);
		}
		break;
	}
}
