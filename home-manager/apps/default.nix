{inputs, pkgs, ...}:

{
  imports = [
    ./gaming.nix
    ./musique.nix
    ./video.nix
  ];

  home.packages = with pkgs; [
    nautilus # super mega super cool file manager (gnome)
    baobab # super mega super cool disk analyzer (gnome)

    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;  
    })
    # inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # discord
    # betterdiscordctl # just an installer | discord is still needed
    # geogebra
    # dmenu-wayland
    
    
    # clipse
    # celluloid
    # yt-dlp
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "caelestia";
      theme_background = false;
      true_color = true;
    };
  };

  programs.rofi = {
    enable = true;
  };
}