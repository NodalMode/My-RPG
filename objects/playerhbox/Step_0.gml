var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor*moveSpeed*global.dt, _ver*moveSpeed*global.dt, global.tilemap, undefined, undefined, undefined, moveSpeed*global.dt, moveSpeed*global.dt);


x = round(x);
y = round(y);


show_debug_message("delta time is - " + string(global.dt));
