/// @description Switch paths based on key input
function switch_paths(currentPathIndex, current_pos) {
    var paths = [Path1, Path2, Path3];

    var leftKey = keyboard_check_pressed(vk_left);
    var rightKey = keyboard_check_pressed(vk_right);

    if (leftKey && currentPathIndex > 1) {
        currentPathIndex -= 1;
        cooldownTime = room_speed; // Set cooldown for 1 second
    } else if (rightKey && currentPathIndex < 3) {
        currentPathIndex += 1;
        cooldownTime = room_speed; // Set cooldown for 1 second
    }

    path_start(paths[currentPathIndex - 1], moveSpeed, path_action_continue, true);
    path_position = current_pos;

    return currentPathIndex; // Return the updated path index
}
