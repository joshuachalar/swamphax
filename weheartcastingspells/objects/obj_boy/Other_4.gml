var spawn = instance_find(obj_spawn, 0);

if (spawn != noone) {
    x = spawn.x;
    y = spawn.y;

    // Reset momentum
    velocity[0] = 0;
    velocity[1] = 0;

    is_on_ground = false;
    in_slam = false;
}


var lay_id = layer_get_id("tower_col_tiles");

tower_tilemap = noone;

if (lay_id != -1) {
    tower_tilemap = layer_tilemap_get_id(lay_id);
}