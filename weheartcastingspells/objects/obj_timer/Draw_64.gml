
var seconds = ceil(countdown / room_speed);

draw_set_font(start_font)
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_transformed(
    (display_get_gui_width() / 2) - 90,
    20,
    "get to the end!",
    3, 3, 0
);

draw_text_transformed(
    (display_get_gui_width() / 2) + 140,
    20,
    string(seconds),
    3, 3, 0
);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
