display_set_gui_size(320, 180);
show_debug_message(sprite_get_width(black), sprite_get_height(black), "room: " + string(room));

if room == mainmenu{
    menuselect(mainoptions, x, bbox_top);
}

if paused == true{
    visible = true;
    menuselect(pauseoptions, playerhbox.x, playerhbox.y-90);
}