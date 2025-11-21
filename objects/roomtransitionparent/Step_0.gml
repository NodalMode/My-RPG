x = view_xport[0];
y = view_yport[0];

if global.transitioning and room!=global.targetroom{
	visible = true;
    sprite_swap(fadein);
}

if global.transitioning and room!=global.targetroom and image_index >= 5{
	instance_destroy(player);
	room_goto(global.targetroom);
}

if global.transitioning and room==global.targetroom{
	global.transitioning = false;
    sprite_swap(fadeout);
}



