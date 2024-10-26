/// @description Code to run the computer vision server.

// This code executes a .bat file in datafiles/ComputerVision, which activates the virtual environment
// (to ensure that the correct libraries are installed), and runs the correct python file. This then
// starts the computer vision.
global.target_time = current_time + 15000;
ProcessExecuteAsync("run_computer_vision.exe");