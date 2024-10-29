// Draw event
draw_set_font(fntGUI_smallest);
draw_self();
if (mouseOver(x, y, sprite_width, sprite_height)) {
    draw_circle(x, y, range, true);
}

// Draw the timer in the middle of the bomb with white color
var timer_text = string(floor(bomb_timer / room_speed)); // Convert timer to seconds
var text_width = string_width(timer_text);
var text_height = string_height(timer_text);
var offset_y = 2;
draw_set_color(c_red);
draw_text(x - text_width / 2, y - text_height / 2 + offset_y, timer_text);
draw_set_color(-1); 
draw_set_font(-1);