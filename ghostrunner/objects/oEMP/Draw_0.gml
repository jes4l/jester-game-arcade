draw_self();
if (mouseOver(x, y, sprite_width, sprite_height)) {
    draw_circle(x, y, range, true);
}

// Shooting enemy code
shooting = false;
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
if (array_length(enemies) > 0) {
    if (!shooting) {
        alarm[0] = 1;
        shooting = true;
    }
    if (mouseOver(x, y, sprite_width, sprite_height)) {
        for (var i = 0; i < array_length(enemies); i++) {
            draw_line(x, y, enemies[i].x, enemies[i].y);
        }
    }
} else {
    shooting = false;
}
