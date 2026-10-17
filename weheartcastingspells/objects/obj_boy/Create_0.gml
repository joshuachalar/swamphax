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
#macro HORIZONTAL_FORCE_ON_KEY 1.
#macro VERTICAL_FORCE_ON_JUMP 12
#macro GRAVITY_FORCE 0.8
#macro HORIZONTAL_GROUND_FRICTION_COEFFICIENT 0.25
#macro HORIZONTAL_AIR_FRICTION_COEFFICIENT 0.1
#macro HORIZONTAL_FORCE_BOOST_ON_JUMP_ADD 2.5
#macro HORIZONTAL_FORCE_BOOST_ON_JUMP_MULTIPLY 1.3
#macro VELOCITY_EPSILON 0.05

mass = 1.
velocity = [0., 0.]

is_on_ground = false
