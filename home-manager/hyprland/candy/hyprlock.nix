{...}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        no_fade_in = true;
        no_fade_out = true;
      };

      background = {
        path = "~/.config/fonds/cp.png";
        color = "0xFF0000FF";
        blur_size = 4;
        blur_passes = 4;
        brightness = .8;
      };
      label = {
        text = "<span font_family=\"FreeMono\"><b>$TIME</b></span>";
        text_align = "center";
        color = "0xFFF7768E";
        halign = "center";
        valign = "center";
        position = "0,20";
        font_size=20;
      };
      input-field = {
        monitor = "";
        size = "1000,100";
        outline_thickness = 0;
        dots_size = .2;
        dots_spacing = .2;
        dots_center = true;
        dots_rounding = -2;
        outer_color = "0xFFFF0000";
        inner_color = "0x00000000";
        font_color = "0xFFF7768E";
        font_family = "FreeMono";
        fade_on_empty = false;
        rounding = -1;
        placeholder_text = "";
        hide_input = false;
        check_color = "0x000000FF";
        fail_color = "0xFFFF0000";
        fail_text = "RATIO";
        fail_timeout = 0;
        fail_transition = 0;

        capslock_color = -2;
        numlock_color = -2;
        bothlock_color = -1;
        invert_numlock = true;
        swap_font_color = true;
        position = "0, -15";
      };

    };
  };

}