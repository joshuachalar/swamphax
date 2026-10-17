// This runs 60 times a second (EVERY FRAME) to track the camera
var _cam_x = camera_get_view_x(view_camera);
var _cam_y = camera_get_view_y(view_camera);

x = anchor_x + (_cam_x * parallax_factor);
y = anchor_y + (_cam_y * parallax_factor);
