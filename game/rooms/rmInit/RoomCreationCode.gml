//RESIZE GAME SURFACE
surface_resize(application_surface, RES.WIDTH, RES.HEIGHT);

//RESIZE WINDOW
var _windowWidth = RES.WIDTH * RES.SCALE;
var _windowHeight = RES.HEIGHT * RES.SCALE;

window_set_size(_windowWidth, _windowHeight);

//start game
room_goto_next();