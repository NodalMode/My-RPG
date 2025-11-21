x = view_xport[0];
y = view_yport[0];

if global.transitioning and image_alpha<1 and room!=global.targetroom{
	image_alpha+=2*global.dt;
}

if global.transitioning and image_alpha>=1 and room!=global.targetroom{
	image_alpha = 1;
	instance_destroy(player);
	room_goto(global.targetroom);
}

if global.transitioning and room==global.targetroom{
	global.transitioning = false;
}

//if !global.transitioning and image_alpha>0{
//	image_alpha-=2*global.dt;
//}

if !global.transitioning and image_alpha<=0{
	image_alpha = 0;
}


