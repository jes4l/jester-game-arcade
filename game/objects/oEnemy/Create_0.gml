// Create Event
/// @description Choose a random path for the object to follow
var randomPath = irandom_range(1, 3);

// Start the selected path
switch (randomPath) {
    case 1: path_start(Path1, global.spd, path_action_continue, true); break;
    case 2: path_start(Path2, global.spd, path_action_continue, true); break;
    case 3: path_start(Path3, global.spd, path_action_continue, true); break;
}

// Initialize health
hp = global.hp;
max_hp = global.hp;

// Initialize the stored_position variable
stored_position = 0;
