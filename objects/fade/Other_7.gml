if sprite_index == fadein{
    global.fadedone = true;
    instance_destroy(self);
}

if sprite_index == fadeout{
    instance_destroy(self);
}