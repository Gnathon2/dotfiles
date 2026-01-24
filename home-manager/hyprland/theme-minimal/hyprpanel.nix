{ inputs, pkgs, ... } :

let
  couleur = import ./colors.nix;
in
{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      terminal = "ghostty";


      bar = {
        autoHide = "never"; # never | fullscreen | single-window
        # scrollSpeed = 1;

        customModules.cava = {
          autoHide = true;
          autoSensitivity = true;
          bars = 14;
          channels = 2;
          framerate = 60;
          highCutoff = 10000;
          lowCutoff = 50;
          noiseReduction = 0.77;
          samplerate = 44100;
          showIcon = false;
          spaceCharacter = "";
          stereo = false;
        };

        clock = {
          format = "%H:%M";
          showIcon = false;
        };

        custromModule.hypridle = {
          label = false;
          pollingInterval = 60000;
        };

        customModules.hyprsunset = {
          label = false;
          pollingInterval = 60000;
          temperature = "6000k";
        };

        launcher = {
          autoDetectIcon = true;
        };

        layouts = { # what to place where
          "0" = { # screen n°
            left = [
              "dashboard"
              "systray"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
              "cava"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "cputemp"
              "hyprsunset"
              "hypridle"
              "battery"
              "clock"
              "notifications"
            ];
          };
        };

        media = {
          show_active_only = true;
        };

        network = {
          showWifiInfo = true; # tooltip
          truncation_size = 3;
        };

        volume = {
          scrollUp = "hyprpanel vol +1";
          scrollDown = "hyprpanel vol -1";
        };


        windowtitle = {
          class_name = true;
          custom_title = true;
          label = true;
          icon = false;
          truncation = false;

           title_map = [
            ["firefox" "󰈹" "Firefox"]
          ];
        };

        workspaces = {
          applicationIconOncePerWorkspace = false;
          ignored = ""; # regex
          monitorSpecific = true;
          scroll_speed = 1;
          show_numbered = false;
          showAllActive = true;
          showApplicationIcons = true;
          showWsIcons = true;
          number_active_indicator = "underline";
          workspaceMask = false;
          workspaces = 1;

          applicationIconEmptyWorkspace = "󰢤";
          applicationIconFallback = "󰘔";
          applicationIconMap = {
            ghostty= "";
          };
        };
      };


      menus = {
        transition = "none";

        clock = {
          weather.enabled = false;
          time = {
            hideSeconds = false;
            military = true; #24
          };
        };

        dashboard = {
          control.enabled = true;
          directories.enabled = false;
          stats.enabled = true;
          powermenu = {
            avatar.image = "/home/hypruser/.config/fonds/canvas.png";
          };
          shortcuts = {
            enabled = true;
            left = {
              shortcut1 = {
                icon = "";
                command = "";
                tooltip = "";
              };
              shortcut4 = {
                icon = "";
                command = "";
                tooltip = "";
              };
            };
            right = {
              shortcut1 = {
                icon = "";
                command = "";
                tooltip = "";
              };
              shortcut3 = {
                icon = "";
                command = "";
                tooltip = "";
              };
            };
          };
        };

        media = {
          displayTime = true;
          displayTimeTooltip = true;
          # hideAuthor = false;
          noMediaText = "";
        };

        volume = {
          raiseMaximumVolme= true;
        };
      };


      notifications = {
        active_monitor = false; # follow cursor
        cache_actions = false;
        clearDelay = 0;
        displayedTotal = 100; 
        hideCountWhenZero = true;
        show_total = true;
        showActionOnHover = true;
        timeout = 1000;

        ignore = [
          "spotify"
        ];
      };


      theme = {
        bar = {
          dropdownGap = "1.6em";
          enableShadow = false;
          layer = "background";
          location = "top"; # top | bottom 
          outer_spacing = "1.6em";
          scaling = 100;
          transparent = false;

          border = {
            location = "none"; # none | full | top | right | bottom | left | horizontal | vertical
            width = "0.1rem";
          };

          buttons = {
            borderSize = "0.1rem";
            enableBorders = false;
            y_margins = "0.4em";

            customModules.cava.spacing = "0em";
            clock.spacing = "0em";
            workspaces.fontSize = "1em";
          };
          
          menus = {
            # enableShadow = false;
            menu = {
              dashboard = {
                profile = {
                  size = "15em";
                };
              };
              media = {
                scaling = 80;
                card.tint = 0;
              };
              notifications = {
                height = "20em";
              };
            };
            popovers = {
            };
          };
        };

        font = {
          label = "Monospace Bold";
          name = "Monospace";
          size = "0.8rem";
          # style = "normal";
          weight = 600;
        };
        osd = {
          duration = 500; # ms
          location = "top";
          margins = "0px 0px 0px 0px";
          orientation = "horizontal";
          radius = "10em";
          scaling = 50;
        };
        tooltip = {
          scaling = 50;
        };
      };
    };
  };
}