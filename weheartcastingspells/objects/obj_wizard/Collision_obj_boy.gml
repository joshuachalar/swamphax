draw_set_font(start_font);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if (obj_boy.mana < 50){
draw_text_transformed(
    display_get_gui_width() / 2,
    175,
    "go collect potions. you are weak",
    3, 3, 0
);
}else{
	
	room_goto_next();
}
