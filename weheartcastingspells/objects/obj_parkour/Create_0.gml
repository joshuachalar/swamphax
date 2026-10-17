
randomize();

var platform_x = 800;
var platform_y = 350;

// Platform spacing
var gap_min = 285;
var gap_max = 399;

// Maximum vertical difference
var height_change = 80;

// Generate until near the end of the room
while (platform_x < room_width - 200) {

    instance_create_layer(
        platform_x,
        platform_y,
        "Instances",
        obj_jump
    );

    // Move right randomly
    platform_x += irandom_range(gap_min, gap_max);

    // Randomize height
    platform_y += irandom_range(-height_change, height_change);

    // Prevent platforms from leaving the room
    platform_y = clamp(platform_y, 200, 420);
}
