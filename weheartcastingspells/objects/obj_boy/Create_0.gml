move_speed = 10;
normal_speed = move_speed;

vs = 0;
slow_timer = 0;
jitter_timer = 0;
jitter = 0;

jitter_x = 0;
jitter_y = 0;

inAir = 0;
burning = false;
burn_timer = 0;

wind = false;
wind_timer = 30;

gravity_reg = false;
gravity_rev = false;

lightning = false;



draw_healthbar(100, 100, 100, 100, 100, c_orange, c_red, c_green, 1, true, true);