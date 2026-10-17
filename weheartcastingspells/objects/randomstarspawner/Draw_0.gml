// Define the grid spacing between stars
var _grid_size = 128; 

// Loop through the width and height of your room
for (var _x = 0; _x < room_width; _x += _grid_size) {
    for (var _y = 0; _y < room_height; _y += _grid_size) {

        // Add random jitter so they aren't stuck on a perfect grid
        var _jitter_x = _x + irandom_range(-40, 40);
        var _jitter_y = _y + irandom_range(-40, 40);

        // Spawn the star and inject the parallax variables into it instantly!
        instance_create_layer(_jitter_x, _jitter_y, "stars_bg", stars_obj, {
            anchor_x: _jitter_x,
            anchor_y: _jitter_y,
            parallax_factor: 0.95
        });

    }
}
