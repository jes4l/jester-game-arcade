// Create Event
/// @description Choose a random path for the object to follow
randomPath = irandom_range(1, 3); // Store as an instance variable

// Start the selected path
switch (randomPath) {
    case 1: path_start(Path10, global.spd, path_action_continue, true); break;
    case 2: path_start(Path11, global.spd, path_action_continue, true); break;
    case 3: path_start(Path12, global.spd, path_action_continue, true); break;
}

// Initialize health
hp = global.hp_ghost;
max_hp = global.hp_ghost;

// Initialize the stored_position variable
stored_position = 0;
