{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hyprland
    ./other
  ];

  home.packages = with pkgs; [
    cava
    inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default

    olympus
    discord
    graphviz
    geogebra
    # dmenu-wayland
    cool-retro-term
    hyprlauncher

    inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };

    
    cursorTheme = {
      name = "custom";
      size = 39;
    };
  };



  programs.bash.enable = true;
  home.shellAliases = {
    papier = "ghostty --class=pap.er -e";
    stream = "streamlink --player mpv";
    streambg = "streamlink --player mpv --player-args '--wayland-app-id=pap.er'";
    marex = "streamlink --player mpv twitch.tv/marex";
  };
  home.sessionVariables = {
  };


  nixpkgs.config = import ../nixpkgs/config.nix;

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

    # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hypruser";
  home.homeDirectory = "/home/hypruser";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
