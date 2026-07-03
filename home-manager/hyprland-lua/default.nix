{ inputs, pkgs, lib, ...}:


let 
  on_start = some_cmd : 
    let func = lib.generators.mkLuaInline 
      ("function () hl.exec_cmd(\"" + some_cmd + "\") end"); 
    in { _args = ["hyprland.start" func]; };
in
{
  imports = [
    ./hyprbind
    # ./theme-minimal

    # ./hyprexpo.nix
    # ./hypridle.nix
    # ./hyprscrolling.nix
    # ./hyprsunset.nix
    # ./hyprwinwrap.nix 
  ];

  home.packages = with pkgs; [
    inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprlauncher
    hyprshot
    hyprpicker
    # hyprpolkitagent
  ];


  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "lua";
  
  
  wayland.windowManager.hyprland.settings =  {
    
    # debug = {
    #   disable_logs = false;
    # };
    
    monitor = {
      output = "";
      mode = "preferred";
      position = "auto";
      scale = "1";
    };

    config.input = {
      kb_layout = "fr";
      numlock_by_default = true;
      follow_mouse = 1; #focus
      # sensitivity = -0.2;
      touchpad = {
        scroll_factor = 0.2;
        natural_scroll = true;
      };
    };

    on = [
      (on_start "hyprctl setcursor custom 39")
    ];
    
  
    window_rule = [
      # tricks:  (?i:re) case insensitive
       
      { match.class = ".*"; maximize = true; 
        # idle_inhibit = "fullsceen";
      }
      { match.class = "i?:picture-in-picture"; float = true; }
      { match.class = "Matplotlib"; float = true; }
      { match.class = ".*mpv.*"; pin = true; float = true; }

      { match.class = "i?dev.zed.*"; workspace = "3"; }
      { match.class = "i?:zen.*"; workspace = "5"; }
      { match.class = "i?:obsidian"; workspace = "6"; }
      { match.class = "i?:discord.*"; workspace = "9"; }
      { match.class = "i?:spotify.*"; workspace = "music"; }
    ];


    #cursor = {
    #  enable_hyprcursor = false;
    #};

    # env = [
    #   "XCURSOR_THEME,bibata"
    #   "XCURSOR_SIZE,18"
    #   "HYPRCURSOR_THEME,bibata"
    #   "HYPRCURSOR_SIZE,18"
    # ];
    

    config.dwindle = {
      # pseudotile = true;
      preserve_split = true;
    };

    # misc = {
    #   vfr = true;
    # };

    config.master = {
      new_status = "slave";
      new_on_active = "after";
      allow_small_split = false;
    };


    #device = {
    #  name = "steelseries-steelseries-rival-3";
    #  sensitivity = -.8;
    #};
  };

  wayland.windowManager.hyprland.extraLuaFiles = {
    "base".content = ./default.lua;
    };
}

