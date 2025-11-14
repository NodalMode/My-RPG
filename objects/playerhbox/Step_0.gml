var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if player.state != pState.damaged and kb <= 0 and player.state != pState.dash{	
	move_and_collide(_hor*moveSpeed*global.dt, _ver*moveSpeed*global.dt, global.tilemap, undefined, undefined, undefined, moveSpeed*global.dt, moveSpeed*global.dt);
}

if player.state != pState.damaged{    
    x = round(x);
    y = round(y);
}  

if keyboard_check(ord("R")){
    x = 255;
    y = 642;
}  


show_debug_message("delta time is - " + string(global.dt));

switch (player.state)
{
	case pState.idle:
	{
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
            dmgspeed = 150;
            x = round(x);
            y = round(y);
		}
        break;	
	}
    case pState.run:
	{
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
            dmgspeed = 150;
            x = round(x);
            y = round(y);
		}
        break;	
	}
	case pState.dash:
	{
		switch player.dir{
			case facing.d:{
				if !tile_place_meeting(x, y+dashSpeed*global.dt, edges) and !tile_place_meeting(x-1, y+dashSpeed*global.dt, walls) and !tile_place_meeting(x-1, y+dashSpeed*global.dt, foreground){
					y += dashSpeed*global.dt;
				}
				break;
			}
			case facing.u:{
				if !tile_place_meeting(x, y-dashSpeed*global.dt, edges) and !tile_place_meeting(x-1, y-dashSpeed*global.dt, walls) and !tile_place_meeting(x-1, y-dashSpeed*global.dt, foreground){
					y -= dashSpeed*global.dt;
				}
				break;
			}
			case facing.l:{
				if !tile_place_meeting(x-dashSpeed*global.dt, y, edges) and !tile_place_meeting(x-dashSpeed*global.dt, y, walls) and !tile_place_meeting(x-dashSpeed*global.dt, y, foreground){
					x -= dashSpeed*global.dt;
				}
				break;
			}
			case facing.r:{
				if !tile_place_meeting(x+dashSpeed*global.dt, y, edges) and !tile_place_meeting(x+dashSpeed*global.dt, y, walls) and !tile_place_meeting(x+dashSpeed*global.dt, y, foreground){
					x += dashSpeed*global.dt;
				}
				break;
			}
		}
		if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
            dmgspeed = 150;
            x = round(x);
            y = round(y);
		}
		break;
	}
	case pState.atk:
	{
		slashhwall = instance_create_layer(x, y-10, "hitboxes", slashwall); 
        if checkcollisionlist(x, y, player.hurtbox) and player.invincibleCooldown <= 0
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, player.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
            dmgspeed = 150;
            x = round(x);
            y = round(y);
		}
		if slashwall.knockback and kbsp <= 0{
			kbsp = 70;
			kb = 0.4;
			check = 0;
		}
        break;
	}
    case pState.damaged:
    {
        switch point{
            case facing.u:{
                dmgsp -= 5;
                if dmgsp <= 0{
                    dmgsp = 0;
                }
                if (!tile_place_meeting(x, y-2*dmgsp*global.dt, edges)){
                    y-=dmgsp*global.dt;
                }
                break;
            }
            case facing.d:{
                dmgsp -= 5;
                if dmgsp <= 0{
                    dmgsp = 0;
                }
                if (!tile_place_meeting(x, y+2*dmgsp*global.dt, edges)){
                    y+=dmgsp*global.dt;
                }
                break;
            }
            case facing.r:{
                dmgsp -= 5;
                if dmgsp <= 0{
                    dmgsp = 0;
                }
                if (!tile_place_meeting(x-2*dmgsp*global.dt, y, edges)){
                    x-=dmgsp*global.dt;
                }
                break;
            }
            case facing.l:{
                dmgsp -= 5;
                if dmgsp <= 0{
                    dmgsp = 0;
                }
                if (!tile_place_meeting(x+2*dmgsp*global.dt, y, edges)){
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

kb -= global.dt;
if kb <= 0{
	kb = 0
}	

if  kb > 0{
	if check == 0{
        instance_create_layer(x, y, "anims", slashimpact);
    }
    switch player.dir{
		case facing.u:{
			if (!tile_place_meeting_dir(x, y+kbsp*global.dt*2, edges) and !tile_place_meeting_dir(x, y+kbsp*global.dt*2, foreground) and !tile_place_meeting_dir(x, y+kbsp*global.dt*2, walls)){
				y+=kbsp*global.dt;
            }    
			kbsp -= 5;	
			if kbsp <= 0{
				kbsp = 0;
            }
			break;
		}	
		case facing.d:{
			if (!tile_place_meeting_dir(x, y-kbsp*global.dt*2, edges) && !tile_place_meeting_dir(x, y-kbsp*global.dt*2, foreground) && !tile_place_meeting_dir(x, y-kbsp*global.dt*2, walls)){
				y-=kbsp*global.dt;
            }
			kbsp -= 5;	
			if kbsp <= 0{
				kbsp = 0;
			}
			break;
		}	
		case facing.l:{
			if (!tile_place_meeting_dir(x+kbsp*global.dt*2, y, edges) && !tile_place_meeting_dir(x+kbsp*global.dt*2, y, foreground) && !tile_place_meeting_dir(x+kbsp*global.dt*2, y, walls)){
				x+=kbsp*global.dt;
            }
			kbsp -= 5;
			if kbsp <= 0{
				kbsp = 0;
			}
			break;
		}	
		case facing.r:{
			if (!tile_place_meeting_dir(x-kbsp*global.dt*2, y, edges) && !tile_place_meeting_dir(x-kbsp*global.dt*2, y, foreground) && !tile_place_meeting_dir(x-kbsp*global.dt*2, y, walls)){
				x-=kbsp*global.dt;
            }
			kbsp -= 5;	
			if kbsp <= 0{
				kbsp = 0;
			}
			break;
		}	
	}
	check += 1;
}

dashSpeed-=7.5;
if dashSpeed <=0{
	dashSpeed = 0;
}

while tilemap_get_at_pixel(edges, x, bbox_top) or tilemap_get_at_pixel(foreground, x, bbox_top) or tilemap_get_at_pixel(walls, x, bbox_top){
    y += 1
}

while tilemap_get_at_pixel(edges, x, bbox_bottom) or tilemap_get_at_pixel(foreground, x, bbox_bottom) or tilemap_get_at_pixel(walls, x, bbox_bottom){
    y -= 1
}

while tilemap_get_at_pixel(edges, bbox_right-1, y) or tilemap_get_at_pixel(foreground, bbox_right-1, y) or tilemap_get_at_pixel(walls, bbox_right-1, y){
    y -= 1
}

while tilemap_get_at_pixel(edges, bbox_left, y) or tilemap_get_at_pixel(foreground, bbox_left, y) or tilemap_get_at_pixel(walls, bbox_left, y){
    y += 1
}

//^this makes sure that in the case the hitbox DOES go out of bounds, the game will push them back out.
//so no matter whatever bugs cause the player to leave the walkable space, this will act as a band-aid that fixes all.

