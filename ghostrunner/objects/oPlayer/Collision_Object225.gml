if (!global.canLevelUp) {
    global.level += 1;
    global.canLevelUp = true; // Prevents increasing more than once
    show_debug_message("Level Up: " + string(global.level));
}
