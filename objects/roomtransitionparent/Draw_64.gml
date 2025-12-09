display_set_gui_size(320, 180);
//show_debug_message(sprite_get_width(black), sprite_get_height(black), "room: " + string(room));

if room == mainmenu{
    menuselect(mainoptions, x, bbox_top);
}
else if room == gameover{
    draw_set_color(#a32858);
    draw_text(x, 60, deathmsg+".");
    menuselect(gameoveroptions, x, y);
}

if paused == true{
    draw_set_halign(fa_center);
    draw_sprite_ext(darkgrey, 0, view_xport[0], view_yport[0], 1000, 1000, 0, c_white, 0.5)
    visible = true;
    menuselect(pauseoptions, 160, 0);
}