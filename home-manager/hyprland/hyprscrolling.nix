{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprscrolling];
    settings = {
      general.layout = "scrolling";
      "plugin:hyprscrolling" =  {
        fullscreen_on_one_column = true;
        column_width = .493;
        focus_fit_method = 1;
        explicit_column_width = ".31, 0.493, 0.69, 0.99";
      };
      gesture = [
        "3, right,  dispatcher,   layoutmsg, move -col"
        "3, left,   dispatcher,   layoutmsg, move +col"
        "3, up,     dispatcher,   layoutmsg, colresize +conf"
        "3, down,   dispatcher,   layoutmsg, colresize -conf"
      ];

      bind = "CTRL SUPER, L, exec, hyprctl keyword general:layout scrolling";
    };
  };
}