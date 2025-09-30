{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      ", XF86AudioPlay, exec, player play-pause"
      ",XF86AudioStop, togglespecialworkspace, music"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioNext, exec, playerctl next"

      "SUPER, P, exec, hyprctl dispatch dpms toggle"
    ];
    bindo = [ # long press
      ",XF86AudioPlay, exec, playerctl stop"
    ];

    bindl = [ # locked
      ", XF86AudioMute, exec, pactl set-sink-mute 0 toggle"
      "SUPER SHIFT, L, exec, systemctl suspend"
    ];
    binde = [ # continuous
      ", XF86AudioLowerVolume, exec, pactl set-sink-volume 0 -5%"
      ", XF86AudioRaiseVolume, exec, pactl set-sink-volume 0 +5%"
      "SHIFT, XF86AudioLowerVolume, exec, pactl set-sink-volume 0 -1%"
      "SHIFT, XF86AudioRaiseVolume, exec, pactl set-sink-volume 0 +1%"
    ];

    bindle = [
      ", code:232, exec, brightnessctl set 5%-"
      ", code:233, exec, brightnessctl set 5%+"
      "SHIFT, code:232, exec, brightnessctl set -1"
      "SHIFT, code:233, exec, brightnessctl set +1"
    ];
  };



      
}