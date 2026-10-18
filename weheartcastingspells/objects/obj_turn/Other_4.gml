var tile_layer = layer_get_id("tower_col_tiles");
var tilemap = layer_tilemap_get_id(tile_layer);

var tile_size = 32;

var cols = ceil(room_width / tile_size);
var rows = ceil(room_height / tile_size);

for (var col = 0; col < cols; col++) {
    for (var row = 0; row < rows; row++) {

        var px = col * tile_size;
        var py = row * tile_size;

        if (tilemap_get_at_pixel(tilemap, px, py) != 0) {
            instance_create_layer(
                px,
                py,
                "Instances",
                obj_turn
            );
        }
    }
}