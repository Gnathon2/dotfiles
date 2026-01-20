{ inputs, pkgs, ...}:

{

  imports = [
    ./hyprbind
    ./theme-minimal

    # ./hyprexpo.nix
    ./hypridle.nix
    # ./hyprscrolling.nix
    # ./hyprsunset.nix
    # ./hyprwinwrap.nix 
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

    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "idleinhibit fullscreen, class:.*"

      "stayfocused, class:Code, title:^Open\sfile"
      "workspace special:music, class:Spotify"
      "float, title:^Picture-in-Picture"
      "float, class:Matplotlib"
      "float, class:.*mpv.*"
      "pin, class:.*mpv.*"
      "float, class:Qemu.*"
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