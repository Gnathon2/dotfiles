{lib, ...}:
let util = import ../lua_utils.nix {lib = lib;}; in
{
  wayland.windowManager.hyprland.settings = {
    bind = map util.bind [
      { key = "SUPER + code:49"; dsp = "togglespecialworkspace, magic"; } #²
      { key = "SUPER + code:10"; dsp = "workspace, 1"; } #1
      { key = "SUPER + code:11"; dsp = "workspace, 2"; } 
      { key = "SUPER + code:12"; dsp = "workspace, 3"; }
      { key = "SUPER + code:13"; dsp = "workspace, 4"; }
      { key = "SUPER + code:14"; dsp = "workspace, 5"; }
      { key = "SUPER + code:15"; dsp = "workspace, 6"; }
      { key = "SUPER + code:16"; dsp = "workspace, 7"; }
      { key = "SUPER + code:17"; dsp = "workspace, 8"; }
      { key = "SUPER + code:18"; dsp = "workspace, 9"; } #9
      { key = "SUPER + code:19"; dsp = "workspace, 10"; } #0
      { key = "SUPER + code:20"; dsp = "togglespecialworkspace, "; } #°

      { key = "SUPER ALT + code:49"; dsp = "movetoworkspace, special:magic"; }
      { key = "SUPER ALT + code:10"; dsp = "movetoworkspace, 1"; }
      { key = "SUPER ALT + code:11"; dsp = "movetoworkspace, 2"; }
      { key = "SUPER ALT + code:12"; dsp = "movetoworkspace, 3"; }
      { key = "SUPER ALT + code:13"; dsp = "movetoworkspace, 4"; }
      { key = "SUPER ALT + code:14"; dsp = "movetoworkspace, 5"; }
      { key = "SUPER ALT + code:15"; dsp = "movetoworkspace, 6"; }
      { key = "SUPER ALT + code:16"; dsp = "movetoworkspace, 7"; }
      { key = "SUPER ALT + code:17"; dsp = "movetoworkspace, 8"; }
      { key = "SUPER ALT + code:18"; dsp = "movetoworkspace, 9"; }
      { key = "SUPER ALT + code:19"; dsp = "movetoworkspace, 10"; }
      { key = "SUPER ALT + code:20"; dsp = "movetoworkspace, special"; }

      { key = "SUPER + TAB"; dsp = "workspace, e-1"; }
      { key = "SUPER SHIFT + TAB"; dsp = "workspace, e+1, "; }

      { key = "SUPER + left"; dsp = "movefocus, l"; }
      { key = "SUPER + right"; dsp = "movefocus, r"; }
      { key = "SUPER + up"; dsp = "movefocus, u"; }
      { key = "SUPER + down"; dsp = "movefocus, d"; }

      { key = "CONTROL SUPER + E"; dsp = "pin"; }
      # { key = "CONTROL SUPER + H"; dsp = "togglesplit"; }
      { key = "CONTROL SUPER + D"; dsp = "pseudo,"; }
      { key = "CONTROL SUPER + F"; dsp = "togglefloating"; }
      { key = "CONTROL SUPER + G"; dsp = "togglegroup"; }
      { key = "CONTROL SUPER + O"; dsp = "exec, \"$(if hyprctl getoption decoration:blur:ignore_opacity | grep 1; then hyprctl keyword decoration:blur:ignore_opacity false; else hyprctl keyword decoration:blur:ignore_opacity true; fi)\""; }
      { key = "CONTROL SUPER + K"; dsp = "exec, hyprctl keyword general:layout dwindle"; }
      { key = "CONTROL SUPER + M"; dsp = "exec, hyprctl keyword general:layout master"; }

      { key = "CONTROL SUPER + mouse_down"; dsp = "workspace, e+1"; }
      { key = "CONTROL SUPER + mouse_up"; dsp = "workspace, e+1"; }
    ];
    binds.drag_threshold = 10;

    bindm = [
      { key = "CONTROL SUPER + A"; dsp = "movewindow"; } #leftclick
      { key = "CONTROL SUPER + Z"; dsp = "resizewindow"; } #rightclick
    ];
    
    gesture = [
      "4, horizontal, workspace"
    ];
  };
}