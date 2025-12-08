distfromplayer = sqrt(sqr(x-playerhbox.x)+sqr(y-playerhbox.y)); //pythagoras

x = round(x);
y = round(y);

if global.transitioning or global.gstate != gamestate.gameplay{
    image_speed = 0;
}
else{
	image_speed = 1;
}

if variable_global_exists("deadenemies"){
    if state == eState.dead and !array_contains(global.deadenemies, mydata){
        array_push(global.deadenemies, mydata);
    }
}

if deathanimationplayed{
    sprite_index = NOTHING;
}







