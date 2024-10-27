// Draw Event
draw_set_color(c_gray);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, true);
draw_set_font(fntGUI_small);

// Draw "Home" text
var play_text = "Home";
var text_width = string_width(play_text);
var start_x = x1 + (box_width - text_width) / 2;  // Center text horizontally
var start_y = y1 + 2;  // Add a small vertical offset if needed
draw_text(start_x, start_y, play_text);

// Draw global.level and global.coins
var level_text = "Level: " + string(global.level);
var coins_text = "Coins: " + string(global.coins);
draw_text(start_x, start_y + 20, level_text);  // Adjust offset as needed
draw_text(start_x, start_y + 40, coins_text);  // Adjust offset as needed
