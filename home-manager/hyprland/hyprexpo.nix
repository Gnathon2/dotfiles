{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = pkgs.hyprlandPlugins.hyprexpo;
    settings."plugin:hyprexpo" = {
      columns = 3;
      gap_size = 12;
      bg_col = "rgb(000000)";
      workspace_method = "first 0";
      enable_gesture = true;
      gesture_finger = 4;
      gesture_distance = 300;
      gesture_positive = false;
    };
  };
}
