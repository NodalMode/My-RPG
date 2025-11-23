

distfromplayer = sqrt(sqr(x-playerhbox.x)+sqr(y-playerhbox.y)); //pythagoras

if global.transitioning{
    image_speed = 0;
}

if variable_global_exists("deadenemies"){
    if state == eState.dead and !array_contains(global.deadenemies, mydata){
        array_push(global.deadenemies, mydata);
    }
}

if deathanimationplayed{
    sprite_index = NOTHING;
}







