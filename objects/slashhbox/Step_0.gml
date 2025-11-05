x = slash.x;
y = slash.y;

switch (player.dir){
    case facing.u:{
        sprite_index = spr_slash_uphbox;
		break;
    }
    case facing.d:{
        sprite_index = spr_slash_downhbox;
        break;
    }
    case facing.r:{
        sprite_index = spr_slash_righthbox;
        break;
    }
    case facing.l:{
        sprite_index = spr_slash_lefthbox;
        break;
    }
}