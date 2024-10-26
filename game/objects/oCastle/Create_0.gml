// Create Event for oCastle
/// @description Insert description here

// Create enemies
var enemy1 = instance_create_layer(x, y, "Instances", oEnemy1);
var enemy2 = instance_create_layer(x, y, "Instances", oEnemyGhost1);
var enemy3 = instance_create_layer(x, y, "Instances", oEnemyHomelander1);

// Start enemies on their respective paths
with (enemy1) path_start(Path4, 1, path_action_continue, true);
with (enemy2) path_start(Path5, 1, path_action_continue, true);
with (enemy3) path_start(Path6, 1, path_action_continue, true);
