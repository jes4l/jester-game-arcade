if (hp <= 0) {
	global.coins += 10;
	audio_play_sound(snd_bush, 1, false);
    instance_destroy();
    
    var unique_position = false;
    var random_x, random_y;
    
    while (!unique_position) {
        random_x = x + irandom_range(-35, 35);
        random_y = y + irandom_range(-35, 35);
        unique_position = true;
        
        if (collision_line(x, y, random_x, random_y, oCollision, true, true)) {
            unique_position = false;
        }

        if (collision_circle(random_x, random_y, 10, oCollision, true, true)) {
            unique_position = false;
        }
    }
    
    var wood = instance_create_layer(random_x, random_y, "Instances", oWood);
    wood.image_angle = irandom_range(0, 359);  // Rotate the sprite randomly
    wood.image_index = irandom_range(0, 1);    // Random frame of the sprite
}
