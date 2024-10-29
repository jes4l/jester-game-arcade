if (!global.canLevelUpone) {
    global.level += 1;
    global.canLevelUpone = true; // Prevents increasing more than once
    show_debug_message("Level Up: " + string(global.level));
}
