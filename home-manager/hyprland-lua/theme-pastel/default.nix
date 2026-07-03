{...}:
{

  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    # ./hyprpanel.nix
  ];
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 0;
      hover_icon_on_border = false;
      resize_on_border = false;
      allow_tearing = false;
      snap = {
        enabled = true;
        border_overlap = true;
      };
    };

    decoration = {
      rounding = 4;
      # active_opactiy = .85;
      # inactive_opacity = .75;
      fullscreen_opacity = 1;

      dim_special = .6;
      dim_inactive = false;
      dim_around = 0;

      blur = {
        enabled = true;
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
        enabled = true;
        range = 16;
        render_power = 1;
        sharp = false;
        color = "0xff000000";
        color_inactive = "0x80000000";
        ignore_window = true;
      };
    };

    misc = {
      disable_hyprland_logo = true;
    };

    windowrulev2 = [
      "opaque 1, class:.*mpv"
      "opacity .8, class:.*ghostty"
      "noblur, class:negative:.*ghostty"
    ];


  };

}