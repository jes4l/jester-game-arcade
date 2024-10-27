// In the Create event of oSpawn or a global initialization script
global.message_set = false;

spawn_amount = 15;
spawn_count = 0;
spawn_rate = 1 * room_speed;
alarm[0] = 1;

// Game
global.life_max = 30;
global.level = 1;
global.life = 30;
global.coins = 0; 

/*
//test
global.coins += 9000;
*/

// oEnemy
global.hp = 50;
global.spd = random_range(1.2, 1.5);


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