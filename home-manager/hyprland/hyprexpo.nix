{pkgs, ...}:
# workspaces overview
{
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprexpo];
    settings.exec-once = [
      "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprexpo.so'"
    ];
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
    settings.bind = [
      # "ALT CONTROL, TAB, hyprexpo:expo, toggle"
    ];
  };
}
