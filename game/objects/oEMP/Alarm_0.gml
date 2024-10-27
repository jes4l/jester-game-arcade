if (shooting) {
    var enemies = array_create(0);
    with (oEnemy) {
        if (point_distance(x, y, other.x, other.y) <= other.range) {
            array_push(enemies, id);
        }
    }
    with (oEnemyBoss) {
        if (point_distance(x, y, other.x, other.y) <= other.range) {
            array_push(enemies, id);
        }
    }
    with (oEnemyHomelander) {
        if (point_distance(x, y, other.x, other.y) <= other.range) {
            array_push(enemies, id);
        }
    }
    with (oGhost) {
        if (point_distance(x, y, other.x, other.y) <= other.range) {
            array_push(enemies, id);
        }
    }
    for (var i = 0; i < array_length(enemies); i++) {
        var enemy = enemies[i];
        var future_x = enemy.x + lengthdir_x(enemy.speed * 2, enemy.direction);
        var future_y = enemy.y + lengthdir_y(enemy.speed * 2, enemy.direction);
        var bullet = instance_create_depth(x, y, -9, oBulletEMP);
        bullet.speed = 20;
        bullet.direction = point_direction(x, y, future_x, future_y);
    }
    alarm[0] = fire_rate;
} else {
    shooting = false;
}
