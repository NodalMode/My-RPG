x = round(x);
y = round(y);

if global.transitioning or global.gstate != gamestate.gameplay{
    image_speed = 0;
}
else{
    image_speed = 1;
}