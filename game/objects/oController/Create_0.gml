// Resolution
enum RES {
	WIDTH = 440,
	HEIGHT = 260,
	SCALE = 3
	}

// Create Camera
var _camera = camera_create_view(0, 0, RES.WIDTH, RES.HEIGHT, 0, oPlayer, -1, -1, RES.WIDTH/2, RES.HEIGHT/2);

// Set up view
view_enabled = true;
view_visible[0] = true;


view_set_camera(0, _camera);
