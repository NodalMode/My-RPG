visible = true;
solid = false;

x = round(x);
y = round(y); 

effect = choose("1", "2", "3");

type = "wall";

rotation = choose(0, 90, 180, 270);  //each impact will have a random rotation value to make each impact more unique


if instance_exists(slashwall){
	switch player.dir{
		case facing.d:{
			x = slashwall.x;
			y = slashwall.bbox_bottom;
	        break;
	    }
	    case facing.u:{
			x = slashwall.x;
			y = slashwall.bbox_top; 
	        break;
	    }
	    case facing.r:{
			x = slashwall.bbox_right;
			y = slashwall.y;
	        break;
	    }
	    case facing.l:{
			x = slashwall.bbox_left;
			y = slashwall.y;
	        break;
	    }            
	}
}

function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        sprite_index = _sprite;
        image_index = 0;
    }
} 