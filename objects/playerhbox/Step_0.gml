var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if player.state != pState.damaged{	
	move_and_collide(_hor*moveSpeed*global.dt, _ver*moveSpeed*global.dt, global.tilemap, undefined, undefined, undefined, moveSpeed*global.dt, moveSpeed*global.dt);
}

x = round(x);
y = round(y);



show_debug_message("delta time is - " + string(global.dt));

switch (player.state)
{
	case pState.idle:
	{
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.1;
            player.invincibleCooldown = 3;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
		}
        break;	
	}
    case pState.run:
	{
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.1;
            player.invincibleCooldown = 3;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
		}
        break;	
	}	
	case pState.atk:
	{
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.1;
            player.invincibleCooldown = 3;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
		}
        break;
	}
    case pState.damaged:
    {
        switch point{
            case facing.u:{
                if (!place_meeting_tile(x, y-2*dmgsp*global.dt, edges)){
                    y-=dmgsp*global.dt;
                }
                break;
            }
            case facing.d:{
                if (!place_meeting_tile(x, y+2*dmgsp*global.dt, edges)){
                    y+=dmgsp*global.dt;
                }
                break;
            }
            case facing.r:{
                if (!place_meeting_tile(x-2*dmgsp*global.dt, y, edges)){
                    x-=dmgsp*global.dt;
                }
                break;
            }
            case facing.l:{
                if (!place_meeting_tile(x+2*dmgsp*global.dt, y, edges)){
                    x+=dmgsp*global.dt;
                }
                break;
            }
        }
    } 
    break;       	
}


//if (!place_meeting_tile(x+dmgsp*global.dt, y, edges)){ 
//    x -= lengthdir_x(dmgsp*global.dt, dir)
//}    
//if (!place_meeting_tile(x, y+dmgsp*global.dt, edges)){
//    y -= lengthdir_y(dmgsp*global.dt, dir)
//}

hitstop -= global.dt;
if hitstop <= 0{
    hitstop = 0;
}
