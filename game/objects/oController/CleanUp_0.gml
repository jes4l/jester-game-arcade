var _camera = view_get_camera(0);  // Get the camera associated with view 0
if (_camera != -1) {               // Ensure the camera exists
    camera_destroy(_camera);       // Destroy the camera
}
