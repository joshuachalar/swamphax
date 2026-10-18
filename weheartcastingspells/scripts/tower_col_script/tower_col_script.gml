
function tower_collision_at(_x, _y) {

    if (tower_tilemap == noone) return false;

    var dx = _x - x;
    var dy = _y - y;

    var left = bbox_left + dx;
    var right = bbox_right + dx;
    var top = bbox_top + dy;
    var bottom = bbox_bottom + dy;

    return (
        tilemap_get_at_pixel(tower_tilemap, left, top) != 0 ||
        tilemap_get_at_pixel(tower_tilemap, right, top) != 0 ||
        tilemap_get_at_pixel(tower_tilemap, left, bottom) != 0 ||
        tilemap_get_at_pixel(tower_tilemap, right, bottom) != 0
    );
}