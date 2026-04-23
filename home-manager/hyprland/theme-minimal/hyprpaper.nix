{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprpaper"
  ];
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      preload = "~/.config/fonds/candy.png";
      wallpaper = ",~/.config/fonds/candy.png";
    };
  };
}