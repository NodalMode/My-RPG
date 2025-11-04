visible = false;
solid = true;

moveSpeed = 42;

global.tilemap = [layer_tilemap_get_id("tlayerfg"), layer_tilemap_get_id("edges"), duckhbox]

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