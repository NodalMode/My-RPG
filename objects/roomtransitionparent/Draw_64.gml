display_set_gui_size(320, 180);
show_debug_message(sprite_get_width(black), sprite_get_height(black), "room: " + string(room));

if room == mainmenu{
    menuselect(mainoptions, x, bbox_top);
}
else if room == gameover{
    draw_set_color(#a32858);
    draw_text(x, 60, deathmsg+".");
    menuselect(gameoveroptions, x, y);
}

if paused == true{
    visible = true;
    menuselect(pauseoptions, playerhbox.x, playerhbox.y-90);
}