{...}:
{
  wayland.windowManager.hyprland.settings = {
    "$tui" = "ghostty -e";
    bind = [
      "SUPER, Z, exec, zen"
      "SUPER, E, exec, thunar" # file manager
      "SUPER, T, exec, kitty twt"
      "SUPER, I, exec, code ~/.config" # (F9)
      "SUPER, O, exec, $tui wount && obsidian || obsidian"

      "SUPER, Q, exec, ghostty"
      "SUPER, S, exec, spotify"
      "SUPER, D, exec, discord"
      "SUPER, F, exec, firefox"
      "SUPER, L, exec, hyprlock "
      "SUPER SHIFT, L, exec, systemctl suspend"
      "SUPER, M, exec, ghostty --class=pap.er -e cava"

      "SUPER, W, exec, dmenu-wl_run"
      "SUPER, C, exec, code"
      "SUPER, N, exec, $tui nano ./notes.txt"

      "SUPER, SPACE, exec, hyprpanel toggleWindow bar-0"
    ];
  
  bindr = [
      "SUPER, SPACE, exec, hyprpanel toggleWindow bar-0"
  ];
  };
}