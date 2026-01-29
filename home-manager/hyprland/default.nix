{ inputs, pkgs, ...}:

{

  imports = [
    ./hyprbind
    ./theme-minimal

    ./hyprexpo.nix
    ./hypridle.nix
    ./hyprscrolling.nix
    ./hyprsunset.nix
    ./hyprwinwrap.nix 
  ];


  wayland.windowManager.hyprland.enable = true;

  
  wayland.windowManager.hyprland.settings =  {
    monitor = [
      "eDP-1,prefferred, auto, 1"
      "HDMI-A-1, prefferred, auto, 1, mirror, eDP-1" # duplicate
      ", preferred, auto, 1"
    ];
    

    exec-once = [
      # "hyprpanel"
      "hyprctl setcursor custom 39"
      "hypridle"
    ];

    windowrule = [
      # tricks
      # (?i:re) case insensitive


      "suppress_event maximize, match:class .*"
      # "idleinhibit fullscreen, match:class .*"

      "float on, content video, match:class Picture-in-Picture"
      "float on, match:class Matplotlib"
      "float on, pin on, content video, match:class .*mpv.*"
      "float on, match:class Qemu.*"

      "float on, stay_focused on, match:class (?:code), match:title ^Open\sfile"

      "workspace 4, match:class (?i:code), match:title negative:Open\sfile"
      "workspace 5, match:class (?i:zen.*)"
      "workspace 6, match:class (?i:obsidian)"
      "workspace 9, match:class (?i:discord)"
      "workspace music, match:class (?i:spotify)"
    ];


    cursor = {
      enable_hyprcursor = false;
    };

    env = [
      "XCURSOR_THEME,bibata"
      "XCURSOR_SIZE,18"
      "HYPRCURSOR_THEME,bibata"
      "HYPRCURSOR_SIZE,18"
    ];
    

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      vfr = true;
    };

    master = {
      new_status = "slave";
      new_on_active = "after";
      allow_small_split = "false";
    };

    input = {
      kb_layout = "fr";
      numlock_by_default = true;
      follow_mouse = 1; #focus
      sensitivity = -.2;
      touchpad = {
        scroll_factor = 0.2;
        natural_scroll = true;
      };
    };

    device = {
      name = "steelseries-steelseries-rival-3";
      sensitivity = -.8;
    };
  };
}