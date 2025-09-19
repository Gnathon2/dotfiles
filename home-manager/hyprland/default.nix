{ inputs, pkgs, ...}:

{

  imports = [
    ./hyprpaper.nix
    # ./hyprpanel.nix
  ];


  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprscrolling
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo

    # pkgs.hyprlandPlugins.hyprexpo
    pkgs.hyprlandPlugins.hyprscrolling
    pkgs.hyprlandPlugins.hyprwinwrap

  ];

  
  wayland.windowManager.hyprland.settings = {
    monitor = "eDP-1,prefferred, auto, 1";
    source = [
      "/home/hypruser/.config/hypr/hyprold.conf"
    ];
    

    exec-once = [
      "hyprpaper & hyprlock"
      # "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprexpo.so'"
      "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprscrolling.so'"
      "hyprctl plugin load '$HYPR_PLUGIN_DIR/lib/libhyprwinwrap.so'"
      "hyprpanel"
    ];

    gesture = [
      "4, horizontal, workspace"
    ];


    # gestures = {
    #   workspace_swipe = "true";
    #   workspace_swipe_fingers = 4;
    # };
  };
}