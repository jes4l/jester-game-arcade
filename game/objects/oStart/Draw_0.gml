// Draw Event
draw_set_color(c_gray);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_font(fntGUI_small);

// Draw "Play" text
var play_text = "Play";
var text_width = string_width(play_text);
var start_x = x1 + (box_width - text_width) / 2;  // Center text horizontally
var start_y = y1 + 2;  // Add a small vertical offset if needed
draw_text(start_x, start_y, play_text);
