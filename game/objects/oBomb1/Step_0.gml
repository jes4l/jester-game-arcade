// Countdown the timer
if (bomb_timer > 0) {
    bomb_timer--;
} else {
    instance_destroy(); // Destroy the bomb instance
}