if hurt-- > 0 {
    var _flash_time = 4;
    if (flash_counter++ < _flash_time) {
        gpu_set_fog(true, c_white, 0, 0);
        draw_self();
        gpu_set_fog(false, c_white, 0, 0);
    } else {
        draw_self();
    }
    if (flash_counter > _flash_time * 2) flash_counter = 0;
} else {
    draw_self();    
}

//CREDIT TO SLYDDAR ON GAMEMAKER FORUMS - I HAVE NO IDEA WHAT THE F*** IS HAPPENING HERE
//censored by martin scherer 