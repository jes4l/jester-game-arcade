if (global.countdown > 0) {
    global.countdown--;
} else {
    if (spawn_count_ghost < spawn_amount_ghost) {
        instance_create_depth(x, y, -1, oGhost);
        spawn_count_ghost++;
    }
    if (!global.message_set) {
        oPlayer.message = "The Green Ghost Has Spawned";
        oPlayer.alarm[0] = room_speed * 3;
        show_debug_message("Message set: " + oPlayer.message);
        global.message_set = true;
    }
}
alarm[0] = spawn_rate_ghost;
