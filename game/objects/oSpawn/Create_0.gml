// In the Create event of oSpawn or a global initialization script
global.message_set = false;

spawn_amount = 5;
spawn_count = 0;
spawn_rate = 1 * room_speed;
alarm[0] = 1;
alarm[1] = room_speed * 5;

// Game
global.life_max = 3;
global.level = 1;
global.life = 3;
global.coins = 1000; 

/*
//test
global.coins += 9000;
*/

// oEnemy
global.hp = 50;
global.spd = 1;

// oEnemyBoss
global.hp_boss = 200;
global.spd_boss = 1.5;
spawn_amount_boss = 1;
spawn_count_boss = 0;
spawn_rate_boss = 1 * room_speed;


// Countdown
global.countdown = 3;
boss_spawned = false;


global.all_enemies_spawned = false;