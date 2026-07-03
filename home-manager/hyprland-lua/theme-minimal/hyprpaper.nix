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
      splash = false;
      wallpaper = let
        wp = name: {
          monitor = "";
          path = "~/.config/media/" + name;
          order = "random";
          timeout = 3600;
          recursive = true;
        };
      in [
        (wp "wallpaper/")
      ];
    };
  };
}
