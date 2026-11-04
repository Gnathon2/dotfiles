{ inputs, pkgs, lib, ...}:


let util = import ./lua_utils.nix {lib = lib;}; in
{
  imports = [
    ./bind 
    ./conf 
    ./ecosystem
    # ./plugins
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "lua";
  
  
  wayland.windowManager.hyprland.settings =  {
    
    # debug = {
    #   disable_logs = false;
    # };
    
    on = [
      (util.on_start "hyprctl setcursor custom 39")
      (util.on_start "caelestia shell -d && caelestia shell lock lock")
      # (util.on_start "hyprlock")
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
    
    # config.opengl.nvidia_anti_flicker = false;

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

