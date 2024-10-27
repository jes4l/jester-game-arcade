// Create Event
global.hp_jesal = 50;
hp = global.hp_jesal;
max_hp = global.hp_jesal;

timer = 0;
/// @description Insert description here
moveSpeed = 1; // Initialize moveSpeed

// Initialize global.msg
global.msg = ""; // Use an empty string instead of null

// Choose the path immediately
currentPathIndex = irandom_range(0, 3);




// Set a delay before starting the path
alarm[0] = room_speed * 2; // Set alarm for 3 seconds

// Variables
moveX = 0;
moveY = 0;
startMovement = false; // Flag to start movement

// Create Pickaxe
heldItem = instance_create_layer(x, y, "Instances", oPickaxe);


cooldownTime = 0;