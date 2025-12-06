x = global.phbox.x;
y = global.phbox.y-10;

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if player.damageCooldown<=0 and player.invincibleCooldown>0 and player.state!=pState.dead{
	flashtime = invincibleflash(flashtime);
}
else{
	image_alpha = 1;
}

if global.transitioning or global.gstate != gamestate.gameplay{
    image_speed = 0;
}
else{
    image_speed = 1;
}




	
 if !global.transitioning and global.gstate == gamestate.gameplay{	
   if player.state == pState.idle{
   	visible = true;
   	if (player.dir == facing.d) sprite_swap_rand(spr_player_eyes_idle_down);
   	else if (player.dir == facing.u) sprite_swap_rand(spr_player_eyes_idle_up)
   	else if (player.dir == facing.r) sprite_swap_rand(spr_player_eyes_idle_right);
   	else if (player.dir == facing.l) sprite_swap_rand(spr_player_eyes_idle_left);
   }
   else{
       visible = false;
   }
}
	


//if (sprite_index == spr_player_eyes_idle_down or sprite_index == spr_player_eyes_idle_up
//    or sprite_index == spr_player_eyes_idle_left or sprite_index == spr_player_eyes_idle_right){
//    visible = true;
//}




