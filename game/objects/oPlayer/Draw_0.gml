// Call the default draw event
event_inherited();
draw_self();

// Draw the health bar
var bar_width = 10;
var bar_height = 1;
var offset = 1;
var bar_x = x - bar_width / 2 - offset;
var bar_y = y - 20; // Y position of the health bar (slightly higher)

// Calculate the width of the filled part of the health bar
var filled_width = (hp / max_hp) * bar_width;

// Draw the black outline of the health bar
draw_set_color(c_black); // Set color to black
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, false);

// Draw the filled part of the health bar
draw_set_color(c_green); // Set color to green
draw_rectangle(bar_x, bar_y, bar_x + filled_width, bar_y + bar_height, false);

// Draw the background of the health bar (remaining part)
if (hp < max_hp) {
    draw_set_color(c_red); // Set color to red
    draw_rectangle(bar_x + filled_width, bar_y, bar_x + bar_width, bar_y + bar_height, false);
}
draw_set_color(-1);