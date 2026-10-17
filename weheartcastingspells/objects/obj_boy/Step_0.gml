if (abs(velocity[0]) < VELOCITY_EPSILON) {
	velocity[0] = 0
}
if (abs(velocity[1]) < VELOCITY_EPSILON) {
	velocity[1] = 0
}

var dir = [
	keyboard_check(ord("D")) - keyboard_check(ord("A")),
	keyboard_check(ord("S")) - keyboard_check(ord("W"))
]
// TD rename to key dir

var force = [0., 0.]

if (dir[0] != 0) {
	force[0] += HORIZONTAL_FORCE_ON_KEY * dir[0]
}

if (is_on_ground && dir[1] == -1) {
	force[1] -= VERTICAL_FORCE_ON_JUMP
	force[0] *= HORIZONTAL_FORCE_BOOST_ON_JUMP_MULTIPLY 
	force[0] += HORIZONTAL_FORCE_BOOST_ON_JUMP_ADD * sign(velocity[0])
}

//wind

if (keyboard_check(ord("Y"))){
	wind_timer = room_speed * 5;
}

if (wind_timer > 0) {
    move_speed = normal_speed * 0.3;
    wind_timer--;
}
else {
    move_speed = normal_speed;
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

var acceleration = [force[0] / mass, force[1] / mass]

if (is_on_ground) {
	velocity[0] += acceleration[0] - HORIZONTAL_GROUND_FRICTION_COEFFICIENT * velocity[0]
}
else {
	velocity[0] += acceleration[0] - HORIZONTAL_AIR_FRICTION_COEFFICIENT * velocity[0]
}

velocity[1] += acceleration[1]

x += velocity[0]
y += velocity[1]

var collider = instance_place(x, y + 1, obj_platform)
if (collider) {
	velocity[1] = 0
	y = collider.y - sprite_height + 1;
	is_on_ground = true
}
else {
	is_on_ground = false	
}