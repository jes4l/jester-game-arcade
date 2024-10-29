// In the Create event of oSpawn or a global initialization script
global.message_set = false;

spawn_amount = 20;
spawn_count = 0;
spawn_rate = 1 * room_speed;
alarm[0] = 1;



/*
//test
global.coins += 9000;
*/

// oEnemy
global.hp = 50;
global.spd = random_range(1.5, 1.9);


// oEnemyBoss
global.hp_homelander = 200;
global.spd_homelander = random_range(1.3, 1.6);
spawn_amount_homelander = 20;
spawn_count_homelander = 0;
spawn_rate_homelander = 1 * room_speed;


// Countdown
global.countdown = 3;
boss_spawned = false;


global.all_enemies_spawned = false;