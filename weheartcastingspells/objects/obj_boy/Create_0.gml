depth = -6767
tower_tilemap = noone;
move_speed = 10;
normal_speed = move_speed;
show_show = false;
vs = 0;
slow_timer = 0;
jitter_timer = 0;
jitter = 0;

jitter_x = 0;
jitter_y = 0;

#macro STARTING_BURN_TIME (room_speed * 5)
inAir = 0;
burning = false;
burn_timer = 0;

#macro STARTING_WIND_TIME (room_speed * 5)
#macro WIND_FORCE 1.3
wind_timer = 0;

gravity_reg = false;
gravity_rev = false;

#macro STARTING_LIGHTNING_TIME (room_speed * 10)
#macro LIGHTNING_HORIZONTAL_LENGTH 100
#macro LIGHTNING_WARNING_TIME 3.1  // seconds? 
lightning_timer = 0;
future_lightning_locations = []

HORIZONTAL_GROUND_FORCE_ON_KEY = 2.5;
HORIZONTAL_AIR_FORCE_ON_KEY = 0.2;
health = 100
mana = 0
mana_cooldown = 0

draw_healthbar(100, 100, 100, 100, 100, c_orange, c_red, c_green, 1, true, true);
#macro VERTICAL_FORCE_ON_JUMP 12
#macro VERTICAL_FORCE_ON_SLAM 8.
#macro HORIZONTAL_FORCE_DAMP_WHILE_SLAM_MULT 0.2
#macro GRAVITY_FORCE 0.8
#macro HORIZONTAL_GROUND_FRICTION_COEFFICIENT 0.25
#macro HORIZONTAL_AIR_FRICTION_COEFFICIENT 0.05
#macro HORIZONTAL_FORCE_BOOST_ON_JUMP_ADD 2.5
#macro VELOCITY_EPSILON 0.1

mass = 1.
velocity = [0., 0.]

is_on_ground = false
slam_available = true
in_slam = false
facing = 0  // 0 = forwards, -1 = left, 1 = right

time_since_movement = 0