if (1){
y += vs;
}

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



