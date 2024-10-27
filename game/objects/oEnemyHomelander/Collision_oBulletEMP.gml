// In the collision event
stored_position = path_position; // Store the current path position
path_end(); // Stop the current path
// Set an alarm to restart the path after 3 seconds (90 steps)
alarm[0] = 90;
with(other) instance_destroy();
