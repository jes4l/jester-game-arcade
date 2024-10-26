if (hp <= 0) {
	audio_play_sound(snd_tree, 1, false);
	global.coins += 10;
    instance_destroy();
    
    var num_wood = 2;
    var positions = [];
    
    for (var i = 0; i < num_wood; i++) {
        var unique_position = false;
        var random_x, random_y;
        
        while (!unique_position) {
            random_x = x + irandom_range(-35, 35);
            random_y = y + irandom_range(-35, 35);
            unique_position = true;
            
            for (var j = 0; j < array_length(positions); j++) {
                if (positions[j][0] == random_x && positions[j][1] == random_y) {
                    unique_position = false;
                    break;
                }
            }
            
            if (collision_line(x, y, random_x, random_y, oCollision, true, true)) {
                unique_position = false;
            }

            if (collision_circle(random_x, random_y, 10, oCollision, true, true)) {
                unique_position = false;
            }
        }
        
        array_push(positions, [random_x, random_y]);
        
        instance_create_layer(random_x, random_y, "Instances", oWood);
    }
}
