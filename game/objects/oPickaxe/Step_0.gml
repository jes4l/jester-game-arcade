/// @description Insert description here
// You can write your code in this editor

rotations = lerp(rotations, 45, 0.1);

image_angle = rotations * oPlayer.image_xscale;

// Get input
var _mousePress = mouse_check_button(mb_left);

// Get breakable instance at mouse position
var _breakable = instance_position(mouse_x, mouse_y, oBreakableParent);

with (_breakable) {
	// Get distance
	var _dist = distance_to_object(oPlayer);
	
	// In range?
	if (_dist < other.breakDistance) {
		// set selected
		other.selectorInst = id;
		
		// click
		if (other.cooldown == 0 && _mousePress) {
		
		// reduce hp
		hp --;
		
		// Set rotation
		other.rotations = -80;
		
		// set Cool down
		other.cooldown = 20;
		}
	}
}
		
// cooldown
if (cooldown > 0) cooldown --;