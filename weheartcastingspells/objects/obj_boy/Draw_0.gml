draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha)

#macro HEALTH_BAR_WIDTH (display_get_gui_width() * 0.15)
#macro HEALTH_BAR_HEIGHT (display_get_gui_height() * 0.045)
#macro HEALTH_BAR_LEFT (display_get_gui_width() * 0.05)
#macro HEALTH_BAR_TOP (display_get_gui_height() * 0.92)

draw_healthbar(
	HEALTH_BAR_LEFT + camera_get_view_x(view_camera[0]), 
	HEALTH_BAR_TOP + camera_get_view_y(view_camera[0]), 
	HEALTH_BAR_LEFT + HEALTH_BAR_WIDTH + camera_get_view_x(view_camera[0]),
	HEALTH_BAR_TOP + HEALTH_BAR_HEIGHT + camera_get_view_y(view_camera[0]), 
	health, 
	make_colour_rgb(0, 0, 0),  // discarded
	make_colour_rgb(255, 0, 0), 
	make_colour_rgb(0, 255, 0), 
	0, 
	true, 
	false
)


#macro MANA_BAR_WIDTH (display_get_gui_width() * 0.15)
#macro MANA_BAR_HEIGHT (display_get_gui_height() * 0.045)
#macro MANA_BAR_LEFT (display_get_gui_width() * 0.05)
#macro MANA_BAR_TOP (display_get_gui_height() * 0.84)

draw_healthbar(
	MANA_BAR_LEFT + camera_get_view_x(view_camera[0]), 
	MANA_BAR_TOP + camera_get_view_y(view_camera[0]), 
	MANA_BAR_LEFT + MANA_BAR_WIDTH + camera_get_view_x(view_camera[0]),
	MANA_BAR_TOP + MANA_BAR_HEIGHT + camera_get_view_y(view_camera[0]), 
	mana, 
	make_colour_rgb(0, 0, 0),  // discarded
	make_colour_rgb(125, 125, 125), 
	make_colour_rgb(0, 0, 255), 
	0, 
	true, 
	false
)