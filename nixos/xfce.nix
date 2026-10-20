{lib, ...}:

{
  specialisation.xonze.configuration = {
    programs.hyprland.enable = lib.mkForce false;
    
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    services.displayManager.defaultSession = "xfce";
  };
}