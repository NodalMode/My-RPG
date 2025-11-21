x = view_xport[0];
y = view_yport[0];

if global.transitioning and image_alpha<1 and room!=global.transition.targetroom{
	image_alpha+=2*global.dt;
}

if global.transitioning and image_alpha>=1 and room!=global.transition.targetroom{
	image_alpha = 1;
	room_goto(global.transition.targetroom);
	instance_create_layer(global.transition.targetx, global.transition.targety, "Instances", player)
	player.x = global.transition.targetx;
	player.y = global.transition.targety;
	player.dir = global.transition.targetdir;
}

if global.transitioning and room==global.transition.targetroom{
	global.transitioning = false;
}

//if !global.transitioning and image_alpha>0{
//	image_alpha-=2*global.dt;
//}

if !global.transitioning and image_alpha<=0{
	image_alpha = 0;
}


