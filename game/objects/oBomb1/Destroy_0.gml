if (!shrapnel_fired) {
    // Create shrapnel bullets in random directions
    var num_shrapnel = 11; // Number of shrapnel bullets

    for (var i = 0; i < num_shrapnel; i++) {
        var angle = irandom_range(0, 359); // Generate a random angle between 0 and 359
        var shrapnel = instance_create_depth(x, y, -9, oBombShrapnel);
        shrapnel.direction = angle;
        shrapnel.speed = 5; // Adjust speed as needed
    }

    shrapnel_fired = true; // Set the flag to true
}