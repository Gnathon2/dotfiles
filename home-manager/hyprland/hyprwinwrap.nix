{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprwinwrap];
    settings = {
      exec-once = [
        "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprwinwrap.so'"
      ];
      "plugin:hyprwinwrap" = {
        class = "pap.er";
      };
    };
  };
}