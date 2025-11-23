distfromplayer = sqrt(sqr(x-playerhbox.x)+sqr(y-playerhbox.y)); //pythagoras

if global.transitioning{
    image_speed = 0;
}

if variable_global_exists("deadenemies"){
    if state == eState.dead and !array_contains(global.deadenemies, mydata){
        array_push(global.deadenemies, mydata);
    }
    //for (var i=0; i<array_length(global.deadenemies)-1; i+=1){
    //    if global.deadenemies[i]==mydata{
    if array_contains(global.deadenemies, mydata){
            state = eState.dead;
            hp = 0;
            killsoundplayed = true;
            sprite_index = NOTHING;
        }
    } 
//}


