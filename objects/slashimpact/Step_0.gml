image_angle = rotation;

if global.transitioning or global.gstate != gamestate.gameplay{
    image_speed = 0;
}
else{
    image_speed = 1;
}



switch effect{
	case "1":{
		sprite_swap(spr_effect_impact1);
        break;
	}
	case "2":{
		sprite_swap(spr_effect_impact2);
        break;
	}
	case "3":{
		sprite_swap(spr_effect_impact3);
        break;
	}
}


