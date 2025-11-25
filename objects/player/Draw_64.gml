draw_text(0, 6, "HP: " + string(global.hp));

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
     draw_text(0, 38, "x speed: " + string(round(_hor*playerhbox.moveSpeed)));
     draw_text(0, 74, "y speed: " + string(round(_ver*playerhbox.moveSpeed)));
     draw_text(0, 110, "coordinates: (" + string(round(playerhbox.x)) + ", " + string(round(playerhbox.y)) + ")");
     draw_text(0, 146, "attack cooldown: " + string(attackCooldown));
     draw_text(0, 182, "damage cooldown: " + string(damageCooldown));
     draw_text(0, 218, "invincible cooldown: " + string(invincibleCooldown));
     draw_text(0, 254, "dash time: " + string(dashTime));
     draw_text(0, 290, "dash cooldown: " + string(dashCooldown));
     draw_text(0, 326, "death cooldown: " + string(deathCooldown));
     draw_text(0, 362, "delta time is: " + string(global.dt));
     draw_text(0, 398, "room: " + string(room));
     draw_text(0, 434, "state: " + displaystate);
     draw_text(0, 470, "direction: " + displaydir);    
}