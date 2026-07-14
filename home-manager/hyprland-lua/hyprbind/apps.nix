{lib, ...}:
let util = import ../lua_utils.nix {lib = lib;}; in
let TUI = "ghostty -e"; in
let IDE = "zeditor"; in
let dspexc = cmd : util.arg "exec_cmd" cmd; in
{
  wayland.windowManager.hyprland.settings = {
    #"$wount" = "sudo mount /dev/nvme0n1p3 /mnt/win";
    
    bind = map util.bind [
      {key = " + XF86Calculator"; dsp = dspexc "${TUI} bc"; } #(F12)
      {key = " + XF86Cut"; dsp = dspexc "hyprshot -o ~/Pics/screenshots -m region"; }
      {key = "SHIFT + XF86Cut"; dsp = dspexc "hyprshot -o ~/Pics/screenshots -m window"; }

      {key = "CONTROL + SHIFT + Escape"; dsp = dspexc "${TUI} btop"; }

      # A = kitty
      {key = "SUPER + Z"; dsp = dspexc "zen-beta"; }
      {key = "SUPER + E"; dsp = dspexc "thunar"; } # file manager
      {key = "SUPER + R"; dsp = dspexc "${TUI} ranger"; }
      {key = "SUPER + T"; dsp = dspexc "${TUI} twt"; }
      {key = "SUPER + I"; dsp = dspexc "${IDE} ~/.config"; } #(F9)
      # {key = "SUPER + O"; dsp = dspexc "${TUI} $wount && obsidian || obsidian"; }
      # {key = "SUPER + O"; dsp = dspexc "${TUI} $wount && code ~/Public/Documents/TNCY || code ~/Public/Documents/TNCY"; }
      {key = "SUPER + P"; dsp = dspexc "code ~/contest"; }

      {key = "SUPER + Q"; dsp = dspexc "ghostty"; }
      {key = "SUPER + S"; dsp = dspexc "spotify"; }
      {key = "SUPER + D"; dsp = dspexc "discord"; }
      {key = "SUPER + F"; dsp = dspexc "firefox"; }
      {key = "SUPER + G"; dsp = dspexc "glide"; }
      {key = "SUPER + L"; dsp = dspexc "hyprlock"; }
      # {key = "SUPER + M"; dsp = dspexc "ghostty --class=pap.er -e cava"; }

      # "SUPER, W, exec, dmenu-wl_run"
      {key = "SUPER + W"; dsp = dspexc "rofi -show drun"; }
      {key = "SUPER + X"; dsp = dspexc "zeditor"; }
      {key = "SUPER + C"; dsp = dspexc "code"; }
      {key = "SUPER + V"; dsp = dspexc "vivaldi"; }
      # {key = "SUPER + B"; dsp = dspexc ""; }
      {key = "SUPER + N"; dsp = dspexc "${TUI} nano ./notes.txt"; }
    ];
  };
}
