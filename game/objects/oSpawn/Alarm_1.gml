if (instance_number(oEnemy) <= 0 && spawn_count >= spawn_amount) {
    if (!boss_spawned) {
        oPlayer.message = "The Red Ghost Has Spawned";
        oPlayer.alarm[0] = room_speed * 3;
        show_debug_message("Message set: " + oPlayer.message);
        boss_spawned = true;
    } else if (spawn_count_boss < spawn_amount_boss) {
        instance_create_depth(x, y, -1, oEnemyBoss);
        spawn_count_boss++;
    }
}
alarm[1] = room_speed * 5;