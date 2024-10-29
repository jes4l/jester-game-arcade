x = room_width / 2;
y = room_height / 2;

// Select a Custom Theme for All Dialogs 
// Classic=-1, Dark=0, Light=1, Custom=2
// Example themes -1 to 1 are from ImGui
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(2));

// Set the Custom Color Theme 
// Color Scheme (R,G,B=0,1,2) 
EnvironmentSetVariable("IMGUI_TEXT_COLOR_0", string(1));
EnvironmentSetVariable("IMGUI_TEXT_COLOR_1", string(1));
EnvironmentSetVariable("IMGUI_TEXT_COLOR_2", string(1));
EnvironmentSetVariable("IMGUI_HEAD_COLOR_0", string(0.35));
EnvironmentSetVariable("IMGUI_HEAD_COLOR_1", string(0.35));
EnvironmentSetVariable("IMGUI_HEAD_COLOR_2", string(0.35));
EnvironmentSetVariable("IMGUI_AREA_COLOR_0", string(0.05));
EnvironmentSetVariable("IMGUI_AREA_COLOR_1", string(0.05));
EnvironmentSetVariable("IMGUI_AREA_COLOR_2", string(0.05));
EnvironmentSetVariable("IMGUI_BODY_COLOR_0", string(1));
EnvironmentSetVariable("IMGUI_BODY_COLOR_1", string(1));
EnvironmentSetVariable("IMGUI_BODY_COLOR_2", string(1));
EnvironmentSetVariable("IMGUI_POPS_COLOR_0", string(0.07));
EnvironmentSetVariable("IMGUI_POPS_COLOR_1", string(0.07));
EnvironmentSetVariable("IMGUI_POPS_COLOR_2", string(0.07));

// Other various settings for dialogs
environment_set_variable("IMGUI_DIALOG_CAPTION", "xProcess");
environment_set_variable("IMGUI_DIALOG_WIDTH", string(720));
environment_set_variable("IMGUI_DIALOG_HEIGHT", string(360));
environment_set_variable("IMGUI_FONT_PATH", working_directory + "fonts");
environment_set_variable("IMGUI_FONT_SIZE", string(20));
pid = 0;