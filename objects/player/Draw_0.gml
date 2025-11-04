var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));



draw_self()

// then draw eyes

if(_hor = 0 and _ver = 0)
{
    with (playerEyes) 
    {
        draw_self();
    }
}


with (slash){
    draw_self();
}    

