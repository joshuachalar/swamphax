
inAir = place_meeting(x,y+1, obj_platform);
if (keyboard_check(ord("D"))){
	x += move_speed;
}else if (keyboard_check(ord("A"))){
	x -= move_speed;
}

if (keyboard_check(vk_space)) {
	y -= 3;
	image_speed = 1;
	inAir = 1;
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







