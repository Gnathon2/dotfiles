{inputs, pkgs, ...}:

{
  home.packages = with pkgs; [
    inputs.caelestia-shell.packages."${stdenv.hostPlatform.system}".default
    inputs.caelestia-cli.packages."${stdenv.hostPlatform.system}".default
  ];

  
  home.file."~/.config/caelestia/shell.json".source = 
  let 
    jsonFormat = pkgs.formats.json {};
  in jsonFormat.generate "caelestia.json" {

    appearance = {
      transparancy = {
        enabled = true;
      };
    };
    
    background = {
      enabled = false;
      wallpaperEnabled = false;
    }; 

    bar = {
      showOnHover = true;
      persistent = false;
    
      activeWindow = {
        compact = true;
        inverted = true;
        showOnHover = false;
      };
      popouts.activeWindow = false;
      workspaces = {
        activeIndicator = true;
        activeTrail = false;
        occupiedBg = true;
        perMonitorWorkspaces = true;
        showWindows = false;
        showWindowsOnSpeciaWorkspaces = true;
        shown = 5;
      };
    };

    border = {
      rounding = 0;
      smouthing = 0;
      thickness = 0;
    };

    dashboard = {
      enabled = true;
      resourceUpdateInterval = 2000;
      showOnHover = false;
      showWeather = false;
    };

    general = {
      apps = {
        terminal = [
          "ghostty"
          "kitty"
          "foot"
        ];
        explorer = [
          "nautilus"
        ];
      };
      
      idle = {
        
        timeouts = [
          {
            timeout = 300;
            idleAction = "lock";
            inhibitWhenAudio = false;
          }
          {
              timeout = 300;
              idleAction = "dpms off";
              returnAction = "dpms on";
          }
        ];
      };
    };

    launcher = {
      enableDangerousActions = true;
      enabled = true;
    };

    lock = {
      hideNotifs = true;
      useWallpaper = true;
    };

    # services = {};

    sidebar = {
      enabled = false;
    };
  };
  
  # programs.caelestia = {
  #   enable = true;
  #   systemd.enable = false;

  #   cli.enable = true;
  # };
}