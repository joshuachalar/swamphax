
var old_position = [
	camera_get_view_x(view_camera[0]), 
	camera_get_view_y(view_camera[0])
]

var old_size = [
	camera_get_view_width(view_camera[0]), 
	camera_get_view_height(view_camera[0])
]

var goal_position = [
	42 * obj_boy.velocity[0] + obj_boy.x - old_size[0] / 2, 
	20 * obj_boy.velocity[1] + obj_boy.y - old_size[1] / 2
]

var goal_size = [
	old_size[0], 
	old_size[1]
]

var new_position = [
	lerp(old_position[0], goal_position[0], 0.06), 
	lerp(old_position[1], goal_position[1], 0.02)
]

var new_size = [
	lerp(old_size[0], goal_size[0], 0.1), 
	lerp(old_size[1], goal_size[1], 0.1), 
]

camera_set_view_pos(view_camera[0], new_position[0], new_position[1])
camera_set_view_size(view_camera[0], new_size[0], new_size[1])