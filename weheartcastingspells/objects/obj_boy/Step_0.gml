

if (abs(velocity[0]) < VELOCITY_EPSILON) {
	velocity[0] = 0.
}
if (abs(velocity[1]) < VELOCITY_EPSILON) {
	velocity[1] = 0.
}

var dir = [
	keyboard_check(ord("D")) - keyboard_check(ord("A")),
	keyboard_check(ord("S")) - keyboard_check(ord("W"))
]
// TD rename to key dir

var force = [0., 0.]

if (dir[0] != 0) {
	facing = dir[0]
}

if (dir[0] != 0) {
	if (is_on_ground) {
		force[0] += HORIZONTAL_GROUND_FORCE_ON_KEY * dir[0]
	}
	else {
		force[0] += HORIZONTAL_AIR_FORCE_ON_KEY * dir[0]
	}
}

if (is_on_ground && dir[1] == -1) {
	force[1] -= VERTICAL_FORCE_ON_JUMP
	force[0] += HORIZONTAL_FORCE_BOOST_ON_JUMP_ADD * sign(velocity[0])
}
if (slam_available && not is_on_ground && dir[1] == 1) {
	force[1] += VERTICAL_FORCE_ON_SLAM
	slam_available = false
	in_slam = true
}

//wind

if (keyboard_check(ord("Y"))){
	wind_timer = room_speed * 5;
}

if (wind_timer > 0) {
    HORIZONTAL_GROUND_FORCE_ON_KEY = 0.9;
    wind_timer--;
}
else {
    HORIZONTAL_GROUND_FORCE_ON_KEY = 2.5;
}

//fire

if (keyboard_check(ord("U"))){
	burn_timer = room_speed * 5;
	burning = true;
	jitter_timer = 0;
}

if (burn_timer > 0){
	burn_timer--;
	jitter_timer++;
	
	image_blend = c_red;
	  if (jitter_timer >= 3) {
        jitter_x = random_range(-4, 4);
        jitter_y = random_range(-4, 4);
        jitter_timer = 0;
		x += jitter_x;
		y += jitter_y;
    }

    // Stop burning
    if (burn_timer <= 0) {
        is_burning = false;
        image_blend = c_white;

        jitter_x = 0;
        jitter_y = 0;
    }
}





force[1] += GRAVITY_FORCE * mass

if (in_slam) {
	force[0] *= HORIZONTAL_FORCE_DAMP_WHILE_SLAM_MULT	
}

var acceleration = [force[0] / mass, force[1] / mass]

if (is_on_ground) {
	velocity[0] += acceleration[0] - HORIZONTAL_GROUND_FRICTION_COEFFICIENT * velocity[0]
}
else {
	velocity[0] += acceleration[0] - HORIZONTAL_AIR_FRICTION_COEFFICIENT * velocity[0]
}

velocity[1] += acceleration[1]

var proposed_x = x + velocity[0]
var proposed_y = y + velocity[1]

var vertical_collider = instance_place(x, proposed_y, [obj_platform, obj_jump])
if (vertical_collider) {
	if (proposed_y < vertical_collider.bbox_top) {
		velocity[1] = 0
		y = vertical_collider.y - sprite_height
		is_on_ground = true
		slam_available = true
		in_slam = false
	}
	else {
		is_on_ground = false
	}
}
else {
	y = proposed_y
	
	is_on_ground = false
}

var horizontal_collider = instance_place(proposed_x, y, [obj_platform, obj_jump])
if (horizontal_collider) {
	if (proposed_x < horizontal_collider.bbox_left) {
		velocity[0] = 0
		x = horizontal_collider.x - sprite_width
		is_on_ground = true
		slam_available = true
		in_slam = false
	}
	
	// i thought this also needed another case (other side)
	// but it works without it (:
}
else {
	x = proposed_x
}

// OLD; IN CASE WE NEED IT: 
//x += velocity[0]
//y += velocity[1]

//var vertical_collider = instance_place(x, y, [obj_platform, obj_jump])
//if (vertical_collider) {
//	// assumes collision is always player above block
//	velocity[1] = 0
//	y = vertical_collider.y - sprite_height
//	is_on_ground = true
//	slam_available = true
//	in_slam = false
//}
//else {
//	is_on_ground = false	
//}

if (not is_on_ground) {
	if (velocity[0] < 0) {
		sprite_index = boy_left_jump
	}
	if (velocity[0] > 0) {
		sprite_index = boy_right
	}
}
else {
	if (facing == 0) {
		sprite_index = boy_sprite
	}
	else {
		if (velocity[0] == 0) {
			image_index = 0
		}
		
		if (facing < 0) {
			sprite_index = boy_left
		}
		if (facing > 0) {
			sprite_index = boy_right_jump
		}
	}
}


if (y > 700){
	x = 50
	y = 350
}