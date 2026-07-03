{lib, ...}:
{
  wayland.windowManager.hyprland.settings = {
    #"$TUI" = "ghostty -e";
    #"$wount" = "sudo mount /dev/nvme0n1p3 /mnt/win";
    #"$IDE" = "zeditor";

    #"local TUI" = "ghostty -e";
    #"local IDE" = "zeditor";
    TUI = {_var = "ghostty -e";};
    
    bind = [
       #(F11)
      { _args = [" + XF86Calculator" (lib.mkLuaInline "hl.dsp.exec_cmd(TUI .. \" bc\")")]; } #(F12)
      { _args = [" + Print" (lib.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -o ~/Pics/screenshots -m region\")")]; }
      { _args = ["SHIFT + Print" (lib.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -o ~/Pics/screenshots -m window\")")]; }

      # "CONTROL SHIFT, Escape, exec, $TUI btop"

      { _args = ["SUPER + A" (lib.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")]; }
      { _args = ["SUPER + Z" (lib.mkLuaInline "hl.dsp.exec_cmd(\"zen-beta\")")]; }
      { _args = ["SUPER + E" (lib.mkLuaInline "hl.dsp.exec_cmd(\"thunar\")")]; } # file manager
      { _args = ["SUPER + R" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$TUI ranger\")")]; }
      { _args = ["SUPER + T" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$TUI twt\")")]; }
      { _args = ["SUPER + I" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$IDE ~/.config\")")]; } #(F9)
      # { _args = ["SUPER + O" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$TUI $wount && obsidian || obsidian\")")]; }
      { _args = ["SUPER + O" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$TUI $wount && code ~/Public/Documents/TNCY || code ~/Public/Documents/TNCY\")")]; }
      { _args = ["SUPER + P" (lib.mkLuaInline "hl.dsp.exec_cmd(\"code ~/contest\")")]; }

      { _args = ["SUPER + Q" (lib.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")]; }
      # { _args = ["SUPER + S" (lib.mkLuaInline "hl.dsp.exec_cmd(\"spotify\")")]; }
      { _args = ["SUPER + D" (lib.mkLuaInline "hl.dsp.exec_cmd(\"discord\")")]; }
      { _args = ["SUPER + F" (lib.mkLuaInline "hl.dsp.exec_cmd(\"firefox\")")]; }
      { _args = ["SUPER + G" (lib.mkLuaInline "hl.dsp.exec_cmd(\"glide\")")]; }
      # L
      { _args = ["SUPER + M" (lib.mkLuaInline "hl.dsp.exec_cmd(\"ghostty --class=pap.er -e cava\")")]; }

      # "SUPER, W, exec, dmenu-wl_run"
      { _args = ["SUPER + W" (lib.mkLuaInline "hl.dsp.exec_cmd(\"rofi -show drun\")")]; }
      { _args = ["SUPER + X" (lib.mkLuaInline "hl.dsp.exec_cmd(\"zeditor\")")]; }
      { _args = ["SUPER + C" (lib.mkLuaInline "hl.dsp.exec_cmd(\"code\")")]; }
      # "SUPER, V, exec, $TUI \"cd~/visual2 && nix-shell\""
      # { _args = ["SUPER + B" (lib.mkLuaInline "hl.dsp.exec_cmd(\"\")")]; }
      { _args = ["SUPER + N" (lib.mkLuaInline "hl.dsp.exec_cmd(\"$TUI nano ./notes.txt\")")]; }

      { _args = ["SUPER + SPACE" (lib.mkLuaInline "hl.dsp.exec_cmd(\"hyprpanel toggleWindow bar-0\")")]; }
    ];

    #bindr = [ # release
    #  { _args = ["SUPER + SPACE" (lib.mkLuaInline "hl.dsp.exec_cmd(\"hyprpanel toggleWindow bar-0\")")]; }
    #];
  };
}
