{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, code:49, togglespecialworkspace, magic" #²
      "SUPER, code:10, workspace, 1" #1
      "SUPER, code:11, workspace, 2" 
      "SUPER, code:12, workspace, 3"
      "SUPER, code:13, workspace, 4"
      "SUPER, code:14, workspace, 5"
      "SUPER, code:15, workspace, 6"
      "SUPER, code:16, workspace, 7"
      "SUPER, code:17, workspace, 8"
      "SUPER, code:18, workspace, 9" #9
      "SUPER, code:19, workspace, 10" #0
      "SUPER, code:20, togglespecialworkspace, " #°
      "SUPER ALT, code:49, movetoworkspace, special:magic"
      "SUPER ALT, code:10, movetoworkspace, 1"
      "SUPER ALT, code:11, movetoworkspace, 2"
      "SUPER ALT, code:12, movetoworkspace, 3"
      "SUPER ALT, code:13, movetoworkspace, 4"
      "SUPER ALT, code:14, movetoworkspace, 5"
      "SUPER ALT, code:15, movetoworkspace, 6"
      "SUPER ALT, code:16, movetoworkspace, 7"
      "SUPER ALT, code:17, movetoworkspace, 8"
      "SUPER ALT, code:18, movetoworkspace, 9"
      "SUPER ALT, code:19, movetoworkspace, 10"
      "SUPER ALT, code:20, movetoworkspace, special"
    ];
    gesture = [
      "4, horizontal, workspace"
    ];
  };
}