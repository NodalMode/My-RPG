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
	case pState.run:
	{
		if checkcollisionlist(x, y, player.hurtbox)
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 3;
		}	
	}	
	case pState.atk:
	{
		if checkcollisionlist(x, y, player.hurtbox)
		{
			player.state = pState.damaged;
			player.hp -= 50;
			player.damageCooldown = 3;
		}
	}	
}

