visible = true;
solid = false;

effect = choose("1", "2", "3");

rotation = choose(0, 90, 180, 270);

switch player.dir{
	case facing.d:{
		x = slashwall.x;
		y = slashwall.bbox_bottom;
        x = round(x);
        y = round(y); 
        break;
    }
    case facing.u:{
		x = slashwall.x;
		y = slashwall.bbox_top;
        x = round(x);
        y = round(y); 
        break;
    }
    case facing.r:{
		x = slashwall.bbox_right;
		y = slashwall.y;
        x = round(x);
        y = round(y); 
        break;
    }
    case facing.l:{
		x = slashwall.bbox_left;
		y = slashwall.y;
        x = round(x);
        y = round(y); 
        break;
    }            
}

function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        sprite_index = _sprite;
        image_index = 0;
    }
} 