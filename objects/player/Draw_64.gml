debugcount = 8;

draw_set_halign(fa_left);

draw_text(8, debugcount, "HP: " + string(global.hp));

switch string(state){
    case "0":{
        displaystate = "idle"; break;
    } 
    case "1":{
        displaystate = "run"; break;
    }
    case "2":{
        displaystate = "atk"; break;
    }
    case "3":{
        displaystate = "dash"; break;
    }
    case "4":{
        displaystate = "damaged"; break;
    }
    case "5":{
        displaystate = "dead"; break;
    }          
}

switch string(dir){
    case "0":{
        displaydir = "up"; break;
    }
    case "1":{
        displaydir = "down"; break;
    } 
    case "2":{
        displaydir = "left"; break;
    }
    case "3":{
        displaydir = "right"; break;
    }        
}

if global.displaydebug{
     debugcount+=12
     draw_text(8, debugcount, "x speed: " + string(round(_hor*playerhbox.moveSpeed)));
     debugcount+=12
     draw_text(8, debugcount, "y speed: " + string(round(_ver*playerhbox.moveSpeed)));
     debugcount+=12
     draw_text(8, debugcount, "coordinates: (" + string(round(playerhbox.x)) + ", " + string(round(playerhbox.y)) + ")");
     debugcount+=12
     draw_text(8, debugcount, "attack cooldown: " + string(attackCooldown));
     debugcount+=12
     draw_text(8, debugcount, "damage cooldown: " + string(damageCooldown));
     debugcount+=12
     draw_text(8, debugcount, "invincible cooldown: " + string(invincibleCooldown));    //debug messages - activate by pressing M
     debugcount+=12
     draw_text(8, debugcount, "dash time: " + string(dashTime));
     debugcount+=12
     draw_text(8, debugcount, "dash cooldown: " + string(dashCooldown));
     debugcount+=12
     draw_text(8, debugcount, "death cooldown: " + string(deathCooldown));
     debugcount+=12
     draw_text(8, debugcount, "delta time is: " + string(global.dt));
     debugcount+=12
     draw_text(8, debugcount, "room: " + string(room));
     debugcount+=12
     draw_text(8, debugcount, "state: " + displaystate);
     debugcount+=12
     draw_text(8, debugcount, "direction: " + displaydir);    
}