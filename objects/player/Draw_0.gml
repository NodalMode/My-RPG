var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));



draw_self()

// player is drawn underneath eyes and slash


if hurt-- > 0 {
    var _flash_time = 4;
    if (flash_counter++ < _flash_time) {
        gpu_set_fog(true, c_white, 0, 0);
        draw_self();
        gpu_set_fog(false, c_white, 0, 0);           //flash effect while stunned
    } else {
        draw_self();
    }
    if (flash_counter > _flash_time * 2) flash_counter = 0;
} else {
    draw_self();    
}

if state == pState.idle
{
    with (playerEyes) 
    {
        draw_self();
    }
}


with (slash){
    draw_self();
}    




