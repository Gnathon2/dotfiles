{ config, pkgs, inputs, ... }:

{
  imports = [
    ./theme.nix
    ./hyprland
    ./shell

    ./term
    ./dev
    
    ./audio.nix
    ./video.nix
    ./gaming.nix

  ];

  home.packages = with pkgs; [
    kitty 
    
    nautilus # super mega super cool file manager (gnome)
    baobab # super mega super cool disk analyzer (gnome)

    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;  
    })
    # inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default

    firefox
    
    discord
    # betterdiscordctl # just an installer | discord is still needed
    # geogebra
    # dmenu-wayland
    
    
    # clipse
    # celluloid
    # yt-dlp
  ];

  

  programs.vscode.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      true_color = true;
    };
  };

  

  programs.rofi = {
    enable = true;
  };

  # programs.obsidian = {
  #   enable = true;
  # };



  home.sessionVariables = {
  };




  home.file = {

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

  };

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "hypruser";
  home.homeDirectory = "/home/hypruser";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  nixpkgs.config = import ../nixpkgs/config.nix;
  programs.home-manager.enable = true;
}
