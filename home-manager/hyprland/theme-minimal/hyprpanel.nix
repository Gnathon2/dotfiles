{ inputs, pkgs, ... } :

let 
  couleur = import ./colors.nix;
in let
  colors = {
    background = couleur.black;
    button_background = couleur.black;
    default = "#f00";
    menu_background = couleur.crust;
    text1 = couleur.text;
    text2 = couleur.subtext1;
    text3 = couleur.subtext0;
    tooltip = couleur.text;
    popover = couleur.lavender;
    # modules
    battery = couleur.yellow;
    bluetooth = couleur.sapphire;
    cava = couleur.flamingo;
    clock = couleur.green;
    cpu = couleur.red;
    cpuTemp = couleur.red;
    dashboard = couleur.blue;
    disk = couleur.sky;
    hypridle = couleur.mauve;
    hyprsunset = couleur.peach;
    media = couleur.flamingo;
    network = couleur.rosewater;
    notification = couleur.lavender;
    osd = couleur.pink;
    ram = couleur.yellow;
    systray = couleur.green;
    volume = couleur.pink;
    windowtitle = couleur.lavender;
    workspaces = {
      active = couleur.lavender;
      occupied = couleur.rosewater;
      available = couleur.green;
      hover = couleur.red;

    };
    #misc
    scaling = 92;
  };
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
          autoSensitivity = true;
          bars = 14;
          channels = 2;
          framerate = 60;
          highCutoff = 10000;
          lowCutoff = 50;
          noiseReduction = 0.77;
          samplerate = 44100;
          showActiveOnly = true;
          showIcon = false;
          spaceCharacter = "";
          stereo = false;
        };

        clock = {
          format = "%H:%M";
          showIcon = false;
        };

        customModules.hypridle = {
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
              "bluetooth"
              "network"
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
          class_name = false;
          custom_title = false;
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
          raiseMaximumVolume= true;
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
          background = colors.background;
          border = {
            location = "none"; # none | full | top | right | bottom | left | horizontal | vertical
            width = "0.1rem";
            color = colors.default;
          };
          dropdownGap = "2em";
          enableShadow = false;
          layer = "background";
          location = "top"; # top | bottom 
          outer_spacing = "0em";
          scaling = 100;
          transparent = false;

          buttons = {
            borderSize = "0.1rem";
            borderColor = colors.default;
            enableBorders = false;
            innerRadiusMultiplier = "0.4";
            outer_spacing = "0em";
            padding_x = "0.7em";
            padding_y = "0em";
            radius = "0em";
            spacing = "0em";
            y_margins = "0em"; #vertical spacing
            background = "#0F0";
            icon_background = "#00F";
            hover = couleur.surface1;
            icon = couleur.lavender;
            text = couleur.lavender;
            style = "default";

            dashboard = {
             background = colors.button_background; 
              border = colors.dashboard;
              icon = colors.dashboard;
            };

            notifications = {
              background = colors.button_background;
              border = colors.notification;
              icon_background = colors.notification;
              icon = colors.notification;
              total = colors.notification;
            };

            battery = {
              background = colors.button_background;
              border = colors.battery;
              icon = colors.battery;
              icon_background = colors.battery;
              text = colors.battery;
            };

            systray = {
              background = colors.button_background;
              border = colors.systray;
              customIcon = colors.systray;
            };

            clock = {
              spacing = "0em";
              background = colors.button_background;
              border = colors.clock;
              icon = colors.clock;
              icon_background = colors.clock;
              text = colors.clock;
            };

            media = {
              background = colors.button_background;
              border = colors.media;
              icon = colors.media;
              icon_background = colors.media;
              text = colors.media;
            };

            volume = {
              background = colors.button_background;
              border = colors.volume;
              icon = colors.volume;
              icon_background = colors.volume;
              text = colors.volume;
            };

            network = {
              background = colors.button_background;
              border = colors.network;
              icon = colors.network;
              icon_background = colors.network;
              text = colors.network;
            };

            bluetooth = {
              background = colors.button_background;
              border = colors.bluetooth;
              icon = colors.bluetooth;
              icon_background = colors.bluetooth;
              text = colors.bluetooth;
            };

            windowtitle = {
              background = colors.button_background;
              border = colors.windowtitle;
              icon = colors.windowtitle;
              icon_background = colors.windowtitle;
              text = colors.windowtitle;
            };

            workspaces = {
              fontSize = "1em";
              background = colors.button_background;
              border = colors.workspaces.occupied;
              available = colors.workspaces.available;
              occupied = colors.workspaces.occupied;
              active = colors.workspaces.active;
              hover = colors.workspaces.hover;
              numbered_active_highlighted_text_color = couleur.mantle;
              numbered_active_underline_color = couleur.pink;
            };

            modules.cava = {
              spacing = "0em";
              background = colors.button_background;
              border = colors.cava;
              icon = colors.cava;
              text = colors.cava;
            };

            modules.hypridle = {
              background = colors.button_background;
              border = colors.hypridle;
              icon_background = colors.hypridle;
              icon = colors.hypridle;
              text = colors.hypridle;
            };

            modules.hyprsunset = {
              background = colors.button_background;
              border = colors.hyprsunset;
              icon = colors.hyprsunset;
              text = colors.hyprsunset;
            };

            modules.cpuTemp = {
              background = colors.button_background;
              border = colors.cpuTemp;
              icon = colors.cpuTemp;
              text = colors.cpuTemp;
            };
          };
          
          menus = {
            background = colors.background;
            border.size = "0em";
            cards = colors.menu_background;
            text = colors.text1;
            dimtext = colors.text2;
            feinttext = colors.text3;
            label = colors.default; # subtitles in settings

            popover = {
              background = colors.background;
              # border = couleur.mantle;
              text = colors.popover;
              scaling = 70;
            };
            listitems = {
              passive = couleur.text;
              active = couleur.lavender;
            };
            icons = {
              passive = couleur.overlay0;
              active = couleur.lavender;
            };
            switch = {
              enabled = couleur.lavender;
              disabled = couleur.surface0;
              puck = couleur.overlay0;
            };
            check_radio_button = {
              active = couleur.lavender;
              background = couleur.surface1;
            };
            buttons = {
              default = couleur.lavender;
              active = couleur.pink;
              disabled = couleur.overlay0;
              text = couleur.mantle;
            };
            iconbuttons = {
              passive = couleur.subtext0;
              active = couleur.lavender;
            };
            progressbar = {
              background = couleur.surface1;
              foreground = couleur.lavender;
            };
            slider = {
              primary = couleur.lavender;
              background = couleur.overlay0;
              backgroundhover = couleur.surface1;
              puck = couleur.overlay0;
            };
            dropdownmenu = {
              background = couleur.crust;
              text = couleur.text;
              divider = couleur.base;
            };
            tooltip = {
              background = couleur.crust;
              text = couleur.text;
            };

            menu = {
              battery = {
                scaling = colors.scaling;
              };
              bluetooth = {
                scaling = colors.scaling+2;
              };
              clock = {
                scaling = colors.scaling;
              };
              dashboard = {
                scaling = colors.scaling;
                profile = {
                  size = "15em";
                };
                monitors = {
                  cpu.bar = colors.cpu;
                  cpu.icon = colors.cpu;
                  cpu.label = colors.cpu;
                  disk.bar = colors.disk;
                  disk.icon = colors.disk;
                  disk.label = colors.disk;
                  ram.bar = colors.ram;
                  ram.icon = colors.ram;
                  ram.label = colors.ram;
                };
              };
              media = {
                scaling = colors.scaling;
                card.tint = 0;
              };
              network = {
                scaling = colors.scaling+4;
              };
              notifications = {
                height = "20em";
              };
              power = {
                scaling = colors.scaling;
              };
              volume = {
                background.color = colors.background;
                card.color = colors.menu_background;
                label.color = colors.volume;
                scaling = colors.scaling;
                text = colors.volume;

                audio_slider.primary = colors.volume;
                input_slider.primary = colors.volume;
                listitems = {
                  active = colors.volume;
                  passive = colors.text1;
                };
                iconbutton = {
                  active = colors.volume;
                  passive = colors.text1;
                };
              };
            };
          };
        };

        font = {
          label = "Monospace Bold";
          name = "Monospace";
          size = "1em";
          # style = "normal";
          weight = 300;
        };

        osd = {
          duration = 500; # ms
          location = "top";
          margins = "0px 0px 0px 0px";
          orientation = "horizontal";
          radius = "2em";
          scaling = 88;
          icon_container = colors.background;
          bar_container = colors.background;
          bar_color = colors.osd;
          bar_empty_color = couleur.surface0;
          bar_overflow_color = couleur.red;
          icon = colors.osd;
          label = colors.osd;
        };

        tooltip = {
          scaling = 80;
          text = colors.tooltip;
          background = colors.background;
        };

        notification = {
          background = colors.background;
          label = couleur.lavender;
          time = colors.text3;
          text = colors.text1;
          labelicon = colors.notification;
          scaling = colors.scaling;
          actions = {
            background = colors.notification;
            text = colors.menu_background;
          };
          close_button = {
            background = couleur.red;
            label = colors.menu_background;
          };
        };
      };
    };
  };
}