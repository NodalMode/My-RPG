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

if player.state = pState.atk{
	for (var i = 0; i < array_length(player.ehitbox); i += 1){
		if place_meeting(x, y, player.ehitbox[i]) and !array_contains(hitenemies, player.ehitbox[i]){
			array_push(hitenemies, player.ehitbox[i])
		}
	}
}