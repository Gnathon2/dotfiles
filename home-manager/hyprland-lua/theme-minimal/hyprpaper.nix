{ inputs, pkgs, lib, ... }:

let util = import ../lua_utils.nix {lib = lib;}; in
{
  home.packages = with pkgs; [
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  wayland.windowManager.hyprland.settings.on = [
    (util.on_start "hyprpaper")
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
