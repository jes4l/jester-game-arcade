// Step Event
/// @description Insert description here
if (startMovement) { // Only run if movement is allowed
	if (cooldownTime > 0) {
        cooldownTime -= 1;
    }

if (global.life <= 0) {
	timer += 1;
    if (timer >= 1 * room_speed) {
		room_goto(rmEnd);
        instance_destroy();
	}
}

if (!place_meeting(x, y, oReglava)) {
    in_contact_with_spikes_lava = false;
}

	
// spikes
if (!place_meeting(x, y, Object23)) {
    in_contact_with_wall = false;
}
	
	
    var current_pos = path_position;

    // Check for left and right key presses
    var leftKey = keyboard_check_pressed(vk_left);
    var rightKey = keyboard_check_pressed(vk_right);

    if (cooldownTime == 0) {
        currentPathIndex = switch_paths(currentPathIndex, current_pos);
    }

    // Continue your existing movement and collision code
    var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
    var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
    var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
    var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));

    // Input Axis
    var _inputX = _right - _left;
    var _inputY = _down - _up;

    // Get movement speed
    moveX = _inputX * moveSpeed;
    moveY = _inputY * moveSpeed;

    // Collisions
    if (CollisionScript(x + moveX, y)) {
        while (!CollisionScript(x + sign(moveX), y)){
            x += sign(moveX);
        }
        moveX = 0;
    }
    if (CollisionScript(x, y + moveY)) {
        while (!CollisionScript(x, y + sign(moveY))){
            y += sign(moveY);
        }
        moveY = 0;
    }

    // Move instance
    x += moveX;
    y += moveY;

    // Animate Player
    if (moveX != 0 or moveY != 0) {
        sprite_index = sPlayer_move;
        // Flip sprite
        // if (moveX != 0) image_xscale = -sign(moveX); // Multiply by -1 to flip directions
    } else {
        sprite_index = sPlayer_idle;
    }

    // Direction
    var _signMouse = sign(mouse_x - x);
    if (_signMouse != 0) {
        image_xscale = _signMouse;
    }

    // Animation Speed
    if (moveX != 0 && sign(moveX) != _signMouse) {
        image_speed = -1;
    } else {
        image_speed = 1;
    }
}
