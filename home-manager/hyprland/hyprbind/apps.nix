{...}:
{
  wayland.windowManager.hyprland.settings = {
    "$TUI" = "ghostty -e";
    bind = [
      "ALT CONTROL, TAB, exec, hyprexpo" #(F11)
      ", XF86Calculator, exec, $TUI bc" #(F12)
      ", Print, exec, hyprshot -o ~/Pics/screenshots -m region"
      "SHIFT, Print, exec, hyprshot -o ~/Pics/screenshots -m window"

      "CONTROL SHIFT, Escape, exec, $TUI btop"

      "SUPER, Z, exec, zen"
      "SUPER, E, exec, thunar" # file manager
      "SUPER, T, exec, kitty twt"
      "SUPER, I, exec, code ~/.config" #(F9)
      "SUPER, O, exec, $TUI wount && obsidian || obsidian"

      "SUPER, Q, exec, ghostty"
      "SUPER, S, exec, spotify"
      "SUPER, D, exec, discord"
      "SUPER, F, exec, firefox"
      "SUPER, L, exec, hyprlock "
      "SUPER, M, exec, ghostty --class=pap.er -e cava"

      "SUPER, W, exec, dmenu-wl_run"
      "SUPER, C, exec, code"
      "SUPER, N, exec, $TUI nano ./notes.txt"

      "SUPER, SPACE, exec, hyprpanel toggleWindow bar-0"
    ];
  
  bindr = [
      "SUPER, SPACE, exec, hyprpanel toggleWindow bar-0"
  ];
  };
}