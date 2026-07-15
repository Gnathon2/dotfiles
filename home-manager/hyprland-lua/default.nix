{ inputs, pkgs, lib, ...}:


let util = import ./lua_utils.nix {lib = lib;}; in
{
  imports = [
    ./hyprbind
    ./theme-minimal
    ./layout.nix

    # ./hyprexpo.nix
    # ./hypridle.nix
    ./hyprsunset.nix
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
    
    on = [
      (util.on_start "hyprctl setcursor custom 39")
    ];
    
  
    window_rule = [
      # tricks:  (?i:re) case insensitive
       
      { match.class = ".*"; suppress_event = "maximize"; name = "suppress-maximize-event"; }
      #   # idle_inhibit = "fullsceen";
      # }
      { match.class = "i?:picture-in-picture"; float = true; }
      { match.class = "Matplotlib"; float = true; }
      { match.class = ".*mpv.*"; pin = true; float = true; }

      { match.class = "i?dev.zed.*"; workspace = "3"; }
      { match.class = "i?:zen.*"; workspace = "5"; }
      { match.class = "i?:obsidian"; workspace = "6"; }
      { match.class = "i?:discord.*"; workspace = "9"; }
      { match.class = "i?:spotify.*"; workspace = "music"; }
    ];

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


    # config.cursor = {
    #   enable_hyprcursor = false;
    # };

    # env = [
    #   "XCURSOR_THEME,bibata"
    #   "XCURSOR_SIZE,18"
    #   "HYPRCURSOR_THEME,bibata"
    #   "HYPRCURSOR_SIZE,18"
    # ];
    

    config.xwayland = {
      force_zero_scaling = true;
    };
    
    config.opengl.nvidia_anti_flicker = false;

    config.ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };
    
  };

  wayland.windowManager.hyprland.extraLuaFiles = {
    # "base".content = ./default.lua;
    "func".content = ''
      function toggle_layout()
        local current_layout = hl.get_config("general.layout")
          
        if current_layout == "dwindle" then
            hl.config({ general = { layout = "scrolling" } })
        else
            hl.config({ general = { layout = "dwindle" } })
        end
      end 
    '';
  };
}

