{...}:

{
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;

    firefox.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        tumbler
      ];
    };
  };

  # AutoStart
  services.getty.autologinUser = "hypruser";
  services.getty.autologinOnce = true; 
  
  environment.etc."profile.local" = {
    text = ''
      if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        exec start-hyprland
      fi
    '';
  };
}