// --- PART 1: CORE CONFIGURATION ---
var _min_distance_apart = 24; // 🛑 Prevents stars from overlapping

// --- PART 2: ORGANIC CLUSTERS (Dense Star Fields) ---
var _number_of_clusters = 6; 

repeat (_number_of_clusters) {
    var _cluster_center_x = irandom_range(0, room_width);
    var _cluster_center_y = irandom_range(0, room_height);
    var _stars_in_this_cluster = irandom_range(15, 25);
    
    repeat (_stars_in_this_cluster) {
        var _spawn_success = false;
        var _attempts = 0;
        var _star_x = 0;
        var _star_y = 0;
        
        while (!_spawn_success && _attempts < 30) {
            var _radius = irandom_range(0, 200);
            var _angle  = random(360);
            
            _star_x = _cluster_center_x + lengthdir_x(_radius, _angle);
            _star_y = _cluster_center_y + lengthdir_y(_radius, _angle);
            
            var _nearest = instance_nearest(_star_x, _star_y, stars_obj);
            if (_nearest == noone || point_distance(_star_x, _star_y, _nearest.x, _nearest.y) > _min_distance_apart) {
                _spawn_success = true;
            }
            _attempts++;
        }
        
        if (_spawn_success) {
            instance_create_layer(_star_x, _star_y, "stars_bg", stars_obj, {
                anchor_x: _star_x, anchor_y: _star_y, parallax_factor: 0.95
            });
        }
    }
}

// --- PART 3: GLOBAL FILLER (Eliminates Large Blank Spaces) ---
// This acts as a safety blanket, scattering extra stars across the entire map
var _filler_stars_count = 40; 

repeat (_filler_stars_count) {
    var _spawn_success = false;
    var _attempts = 0;
    var _star_x = 0;
    var _star_y = 0;
    
    while (!_spawn_success && _attempts < 50) {
        // Pick completely random spots anywhere in the room
        _star_x = irandom_range(0, room_width);
        _star_y = irandom_range(0, room_height);
        
        var _nearest = instance_nearest(_star_x, _star_y, stars_obj);
        // Only spawn here if it's far enough from existing cluster stars
        if (_nearest == noone || point_distance(_star_x, _star_y, _nearest.x, _nearest.y) > _min_distance_apart) {
            _spawn_success = true;
        }
        _attempts++;
    }
    
    if (_spawn_success) {
        instance_create_layer(_star_x, _star_y, "stars_bg", stars_obj, {
            anchor_x: _star_x, anchor_y: _star_y, parallax_factor: 0.95
        });
    }
}
