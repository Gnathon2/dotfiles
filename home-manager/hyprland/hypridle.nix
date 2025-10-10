{...}:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        { # kb
          timeout = 5;
          on-timeout = "brightnresctl -sd platform::kbd_backlight set 0";
          on-resume = "brightnessctl -rd platform::kbd_backlight";
          ignore_inhibit = "true";
        }
        { # dim
          timeout = 150;
          on-timeout = "brightnessctl -s set 1         # set monitor backlight to minimum, avoid 0 on OLED monitor.";
          on-resume = "brightnessctl -r                 # monitor backlight restore.";
        }
        { # lock
          timeout = 300; # 5min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed";
        }
        { # sleep
          timeout = 305;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
          # ignore_inhibit = "true";
        }
        { # suspend
          timeout = "330";
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}