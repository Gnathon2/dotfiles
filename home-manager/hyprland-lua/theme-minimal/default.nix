{...}:
{

  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    # ./hyprpanel.nix
  ];
  wayland.windowManager.hyprland.settings = {

    config.general = {
      gaps_in = 0;
      gaps_out = 0;

      border_size = 0;
      col = {
        active_border = "0xffff00000";
      };
      
      layout = "dwindle";
      
      resize_on_border = false;      
      allow_tearing = true;

      snap = {
        enabled = true;
        border_overlap = true;
      };
    };

    config.decoration = {
      rounding = 0;
      rounding_power = 4;
      
      fullscreen_opacity = 1;
      active_opacity = 1;
      inactive_opacity = 1;

      dim_special = 0.6;
      dim_inactive = false;
      dim_around = 0.3;

      border_part_of_window = false;

      blur = {
        enabled = false;
        new_optimizations = true;
        size = 12;
        passes = 2;
        noise = 0;
        contrast = 1;
        brightness = 1;
        vibrancy = 0;
        ignore_opacity = true;
        xray = true;
      };

      shadow = {
        enabled = false;
        range = 16;
        render_power = 1;
        sharp = false;
        color = "0xff000000";
        color_inactive = "0x80000000";
        # ignore_window = true;
      };

      glow = {
        enabled = false;
        range = 16;
        render_power = 3;
        color = "0xfffff000";
        # color_inactive = "";
      };
    };

    config.animations = {
      enabled = true;
      workspace_wraparound = true;
    };

    

    # misc = {
    #   disable_hyprland_logo = true;
    # };

  };

}