{ inputs, pkgs, ...}:

{

  imports = [
    # ./hyprpanel.nix
    ./candy
    ./hyprscrolling.nix
    ./hyprexpo.nix
  ];


  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprscrolling
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo

    # pkgs.hyprlandPlugins.hyprexpo
    
    pkgs.hyprlandPlugins.hyprwinwrap

  ];

  
  wayland.windowManager.hyprland.settings =  {
    monitor = [
      "eDP-1,prefferred, auto, 1"
    ];

    source = [
      "/home/hypruser/.config/hypr/hyprbind.conf"
    ];
    

    exec-once = [
      "hyprpaper & hyprlock"
      # "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprexpo.so'"
      "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprscrolling.so'"
      "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprwinwrap.so'"
      "hyprpanel"
      "hypridle"
      # "systemctl --user start hyprpolkitagent"
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
      
    ];

    cursor = {
      enable_hyprcursor = false;
    };
    
    gesture = [
      "4, horizontal, workspace"
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