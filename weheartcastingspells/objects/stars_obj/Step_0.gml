// 1. Get the current camera coordinates
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

// 2. Track the camera super slowly using our anchored positions
x = anchor_x + (_cam_x * parallax_factor);
y = anchor_y + (_cam_y * parallax_factor);
