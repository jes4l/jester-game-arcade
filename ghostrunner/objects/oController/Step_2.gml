var _playerExists = instance_exists(oPlayer);
var _heldItem = noone;


if (_playerExists){
	_heldItem = oPlayer.heldItem;
}



//Depth
with (all) {
 	
	depth = -bbox_bottom;

	// Held Item
	if (_playerExists && _heldItem == id) {
		depth -= 100;
	}
}