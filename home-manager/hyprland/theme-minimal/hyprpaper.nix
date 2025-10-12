{ ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprpaper"
  ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/.config/fonds/candy.png";
      wallpaper = ",~/.config/fonds/candy.png";
    };
  };
}