{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprscrolling];
    settings = {
      exec-once = [
        "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprscrolling.so'"
        ];
      general.layout = "scrolling";
      "plugin:hyprscrolling" =  {
        fullscreen_on_one_column = true;
        column_width = 0.69;
        focus_fit_method = 0;
        explicit_column_widths = ".3, 0.493, 0.69, 0.99";
        follow_focus = true;
      };
      gesture = [
        "3, right,  dispatcher,   layoutmsg, move -col"
        "3, left,   dispatcher,   layoutmsg, move +col"
        "3, up,     dispatcher,   layoutmsg, colresize +conf"
        "3, down,   dispatcher,   layoutmsg, colresize -conf"
      ];
      bind = [
        "CTRL SUPER, L, exec, hyprctl keyword general:layout scrolling"
      ];
    };
  };
}
