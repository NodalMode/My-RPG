x = view_xport[0];
y = view_yport[0];


if variable_global_exists("transitioning") and variable_global_exists("transition"){
	if global.transitioning{
		instance_create_layer(global.targetx, global.targety, "Instances", player)
		player.x = global.targetx;
		player.y = global.targety;
		player.dir = global.targetdir;
	}
}

global.transitioning = false;

image_alpha = 0.5;