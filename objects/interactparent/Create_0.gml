function dialoguedisplay(text, texttime, textdelay, textcounter){
	var dialogue = text;
	var length = string_length(dialogue);
	if current_time-texttime >textdelay{
		texttime = current_time;
		textcounter+=1;
		if textcounter>=length-1{
			textcounter = length-1;
		}
	}
	if keyboard_check_pressed(vk_enter){
		textcounter = length-1;
	}
	var newdialogue = string_copy(dialogue, 1, textcounter);
	return newdialogue;
}

texttime = 0;
textcounter = 1;

default_textdelay = 65;


practicestring = "A quick brown fox jumps over the lazy dog.";