gpu_set_texfilter(false);   //no bluriness

draw_set_font(roomtransitionparent.MYFONT);

screenshake = layer_get_id("screenshake");

swingsound = [swing1, swing2, swing3];


layer_set_visible(screenshake, false);

moveSpeed = 1;
image_speed = 1;

function animation_end(_sprite = sprite_index, _image = image_index, _rate = undefined) {
  var _type = sprite_get_speed_type(_sprite);
  var _spd = sprite_get_speed(_sprite) * image_speed;
  if(_type == spritespeed_framespersecond)
  	_spd = _spd / room_speed;
  _spd = _rate == undefined ? _spd : _rate;
  return _image + _spd >= sprite_get_number(_sprite);
}    
    
function sprite_swap(_sprite) {
    if (sprite_index != _sprite) {     //swaps a sprite to the chosen sprite UNLESS the sprite is already set to the requested sprite.
        image_index = 0;
        sprite_index = _sprite;
    }
}    

function sprite_swap_rand(_sprite) {
    if (sprite_index != _sprite) {          //same as above, but also starts the sprite on a random frame.
        sprite_index = _sprite;
        image_index = random_range(0, sprite_get_number-1);     
    }
}  

tilemap = layer_tilemap_get_id("tlayerfg")

global.phbox = instance_create_layer(x, y, "hitboxes", playerhbox)
peyes = instance_create_layer(x, y, "anims", playerEyes)
plegs = instance_create_layer(x, y, "anims", playerLegs)
pslash = instance_create_layer(x, y, "anims", slash)



enum pState
{
    idle,  
    run,   
    atk,
	dash,
	damaged,
	dead
}

enum facing
{
    u,    
    d,  
    l,  
    r  
}

enum attackIndex
{
    o,    //attack animations alternate
    i   
}

prevstate = pState.idle;
state = pState.idle;
displaystate="";
dir = facing.d;
displaydir = "";
swingNum = attackIndex.o;

_hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
_ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

attackCooldown = 0;  //0.25 - amount of time between attacks

invincibleCooldown = 0; //3 - amount of time player is invincible after taking damage

damageCooldown = 0;  //0.25 - amount of time player is stunned by an attack

dashTime = 0; //0.25 - the length of the dash
dashCooldown = 0; // 0.15 - amount of time between dashes

deathCooldown = 0; //3 - amount of time until player respawns (will be death screen)
deathanimplayed = false; 

attackIntent = false;

if !variable_global_exists("hp"){
    global.hp = 50;
}

function checkcollisionlist(x, y, list){
	var length = array_length(list);
	var beenhit = false;
	for (var i = 0; i < length; i+=1)
	{
		 if place_meeting(x, y, list[i])  //this function takes a list of hitboxes as a parameter and checks if the player is making contact with any of them.
		 {
			 beenhit = true;
		 }
	}
	return beenhit;
}

function cleaninstancearray(list){
	var len = array_length(list);
	for (var i = 0; i < len; i+=1){
		if !instance_exists(list[i]){   //takes an array of instance ids and if an instance id in the array does not exist, then it is removed from the array
			list[i] = list[len-1]
			array_resize(list, len-1)
		}
		len = array_length(list)
	}
}

if !variable_global_exists("hurtbox"){
    global.hurtbox = [];
}

if !variable_global_exists("ehitbox"){
    global.ehitbox = [];
}

function arraytostring(list){
	var len = array_length(list);
	var str = "";
	for (var i=0; i<len;i+=1){
		str += string(list[i]);
		str += " ";
	}
	return str;
}		


flashtime = 0;

function invincibleflash(flashtime){
	if (current_time-flashtime)>35{
		flashtime = current_time;
		if image_alpha == 1{
			image_alpha = 0.1;
		}                               //gives the player a visual effect of flashing while they are invincible
		else{
			image_alpha = 1;
		}
	}
	return flashtime;
}


hurt = 0;
flash_counter = 0;

if !variable_global_exists("displaydebug"){    
    global.displaydebug = false;
}

global.dt = delta_time / 1000000;   //for convenience - and so that time passes correctly at different frame rates.

