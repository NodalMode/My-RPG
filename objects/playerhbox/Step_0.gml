var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));   //these variables check for wasd key presses.
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));   //if _hor = 1, then the player is moving right. if it is -1, they are moving left.

moveSpeed = 45;
if _hor!=0 and _ver!=0{
	moveSpeed *= sqrt(1/2);  //i have no idea if this even works (speed cap)
}

if player.state != pState.damaged  and player.state!=pState.dead and kb <= 0 and player.state != pState.dash and !global.transitioning and global.gstate = gamestate.gameplay{	
	move_and_collide(_hor*moveSpeed*global.dt, _ver*moveSpeed*global.dt, global.tilemap, undefined, undefined, undefined, moveSpeed*global.dt, moveSpeed*global.dt);
    if runningplaying == false and player.state!=pState.idle{       //actual movement code, crosschecked with any tile collisions
        run = audio_play_sound(rungrass, 1, true);
        runningplaying = true;
    }
}
if ((player.state == pState.idle and runningplaying == true) or !global.gstate = gamestate.gameplay) and variable_instance_exists(id, "run"){
    audio_stop_sound(run);
    runningplaying = false;   //to avoid duplicate running sounds
}

if player.state != pState.damaged{    
    x = round(x);
    y = round(y);   //alignment with pixels
}  

if keyboard_check_pressed(ord("R")) and global.gstate = gamestate.gameplay{   //reset
    if runningplaying == true{
		audio_stop_sound(run);
		runningplaying = false;
	}
    global.transitioning = true;
    room_goto(Room1);
    x = startx;
    y = startx;
}  




switch (player.state)
{
	case pState.idle:
	{
		if checkcollisionlist(x, y, global.hurtbox) and player.invincibleCooldown <= 0 and global.gstate = gamestate.gameplay//damage check. i should make this a function but im lazy :P
		{
			audio_play_sound(playerdamage, 1, false);
            audio_sound_pitch(playerdamage, random_range(1, 1.25));
            player.state = pState.damaged;
			global.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, global.hurtbox);
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
		if checkcollisionlist(x, y, global.hurtbox) and player.invincibleCooldown <= 0 and global.gstate = gamestate.gameplay
		{
			audio_play_sound(playerdamage, 1, false);
            audio_sound_pitch(playerdamage, random_range(1, 1.25));
            player.state = pState.damaged;
			global.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, global.hurtbox);
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
				if !tile_place_meeting(x, y+dashSpeed*global.dt, edges) and !tile_place_meeting(x-1, y+dashSpeed*global.dt, walls) and !tile_place_meeting(x-1, y+dashSpeed*global.dt, foreground) and !global.transitioning and global.gstate = gamestate.gameplay{
					y += dashSpeed*global.dt;
				}
				break;
			}
			case facing.u:{
				if !tile_place_meeting(x, y-dashSpeed*global.dt, edges) and !tile_place_meeting(x-1, y-dashSpeed*global.dt, walls) and !tile_place_meeting(x-1, y-dashSpeed*global.dt, foreground) and !global.transitioning and global.gstate = gamestate.gameplay{
					y -= dashSpeed*global.dt;
				}
				break;
			}
			case facing.l:{
				if !tile_place_meeting(x-dashSpeed*global.dt, y, edges) and !tile_place_meeting(x-dashSpeed*global.dt, y, walls) and !tile_place_meeting(x-dashSpeed*global.dt, y, foreground) and !global.transitioning and global.gstate = gamestate.gameplay{
					x -= dashSpeed*global.dt;
				}
				break;
			}
			case facing.r:{
				if !tile_place_meeting(x+dashSpeed*global.dt, y, edges) and !tile_place_meeting(x+dashSpeed*global.dt, y, walls) and !tile_place_meeting(x+dashSpeed*global.dt, y, foreground) and !global.transitioning and global.gstate = gamestate.gameplay{
					x += dashSpeed*global.dt;
				}
				break;
			}
		}
		if checkcollisionlist(x, y, global.hurtbox) and player.invincibleCooldown <= 0 and global.gstate = gamestate.gameplay
		{
			audio_play_sound(playerdamage, 1, false);
            audio_sound_pitch(playerdamage, random_range(1, 1.25));
            player.state = pState.damaged;
			global.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, global.hurtbox);
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
        if checkcollisionlist(x, y, global.hurtbox) and player.invincibleCooldown <= 0 and global.gstate = gamestate.gameplay
		{
			audio_play_sound(playerdamage, 1, false);
            audio_sound_pitch(playerdamage, random_range(1, 1.25));
            player.state = pState.damaged;
			global.hp -= 50;
			player.damageCooldown = 0.35;
            player.invincibleCooldown = 3;
            player.hurt = 16;
            dir = whohitme(x, y, global.hurtbox);
            point = dircardinal(dir);
            hitstop = 0.2;
            dmgspeed = 150;
            x = round(x);
            y = round(y);
		}
		if slashwall.knockback and kbsp <= 0{
			kbsp = 70;    //knockback when the slashwall object collides with a wall.
			kb = 0.4;
			check = 0;
		}
        break;
	}
    case pState.damaged:
    {
        audio_stop_sound(run);
        runningplaying = false;
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
    case pState.dead:{
        audio_stop_sound(run);
        runningplaying = false;
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
	audio_stop_sound(run);
    runningplaying = false;
    if check == 0{
        instance_create_layer(x, y, "anims", slashimpact);//whenever you see this, it makes the screen shake effect visible.
    }
	if kb>0.3{	
		layer_set_visible(player.screenshake, true);
	}
	else{
		layer_set_visible(player.screenshake, false);
	}
    switch player.dir{
		case facing.u:{
			if (!tile_place_meeting(x, y+kbsp*global.dt*2, edges) and !tile_place_meeting(x, y+kbsp*global.dt*2, foreground) and !tile_place_meeting(x, y+kbsp*global.dt*2, walls)){
				y+=kbsp*global.dt;
            }    
			kbsp -= 5;	
			if kbsp <= 0{
				kbsp = 0;
            }
			break;
		}	
		case facing.d:{
			if (!tile_place_meeting(x, y-kbsp*global.dt*2, edges) && !tile_place_meeting(x, y-kbsp*global.dt*2, foreground) && !tile_place_meeting(x, y-kbsp*global.dt*2, walls)){
				y-=kbsp*global.dt;
            }
			kbsp -= 5;	
			if kbsp <= 0{
				kbsp = 0;
			}
			break;
		}	
		case facing.l:{
			if (!tile_place_meeting(x+kbsp*global.dt*2, y, edges) && !tile_place_meeting(x+kbsp*global.dt*2, y, foreground) && !tile_place_meeting(x+kbsp*global.dt*2, y, walls)){
				x+=kbsp*global.dt;
            }
			kbsp -= 5;
			if kbsp <= 0{
				kbsp = 0;
			}
			break;
		}	
		case facing.r:{
			if (!tile_place_meeting(x-kbsp*global.dt*2, y, edges) && !tile_place_meeting(x-kbsp*global.dt*2, y, foreground) && !tile_place_meeting(x-kbsp*global.dt*2, y, walls)){
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

while tilemap_get_at_pixel(edges, x, bbox_top) or tilemap_get_at_pixel(foreground, x, bbox_top) or tilemap_get_at_pixel(walls, x, bbox_top)
or tilemap_get_at_pixel(edges, bbox_left, bbox_top) or tilemap_get_at_pixel(foreground, bbox_left, bbox_top) or tilemap_get_at_pixel(walls, bbox_left, bbox_top)
or tilemap_get_at_pixel(edges, bbox_right, bbox_top) or tilemap_get_at_pixel(foreground, bbox_right, bbox_top) or tilemap_get_at_pixel(walls, bbox_right, bbox_top)
{
    y += 1
}

while tilemap_get_at_pixel(edges, x, bbox_bottom) or tilemap_get_at_pixel(foreground, x, bbox_bottom) or tilemap_get_at_pixel(walls, x, bbox_bottom)
or tilemap_get_at_pixel(edges, bbox_left, bbox_bottom) or tilemap_get_at_pixel(foreground, bbox_left, bbox_bottom) or tilemap_get_at_pixel(walls, bbox_left, bbox_bottom)
or tilemap_get_at_pixel(edges, bbox_right, bbox_bottom) or tilemap_get_at_pixel(foreground, bbox_right, bbox_bottom) or tilemap_get_at_pixel(walls, bbox_right, bbox_bottom)
{
    y -= 1
}

while tilemap_get_at_pixel(edges, bbox_right+1, y) or tilemap_get_at_pixel(foreground, bbox_right+1, y) or tilemap_get_at_pixel(walls, bbox_right+1, y){
    x -= 1
}

while tilemap_get_at_pixel(edges, bbox_left-1, y) or tilemap_get_at_pixel(foreground, bbox_left-1, y) or tilemap_get_at_pixel(walls, bbox_left-1, y){
    x += 1
}

//^this makes sure that in the case the hitbox DOES go out of bounds, the game will push them back out.
//so no matter whatever bugs cause the player to leave the walkable space, this will act as a band-aid that fixes all.

