{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hyprland
    ./other
  ];

  home.packages = with pkgs; [
    # cava
    inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default

    # olympus
    discord
    betterdiscordctl # just an installer | discord is still needed
    # graphviz
    geogebra
    dmenu-wayland
    # cool-retro-term
    hyprlauncher
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    # inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default

    clipse 
    hyprshot
    hyprpicker
    hyprpolkitagent

    twitch-tui
    streamlink
    mpv

    spotify
    # celluloid

    yt-dlp
  ];

  programs.vscode.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      true_color = true;
    };
  };

  programs.cava = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
  };

  programs.obsidian = {
    enable = true;
  };


  programs.bash.enable = true;

  home.shellAliases = {
    bn = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
    re = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";

    papier = "ghostty --class=pap.er -e";
    stream = "streamlink --player mpv";
    streambg = "streamlink --player mpv --player-args '--wayland-app-id=pap.er'";
    marex = "streamlink --player mpv twitch.tv/marex";
  };


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

    # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hypruser";
  home.homeDirectory = "/home/hypruser";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  nixpkgs.config = import ../nixpkgs/config.nix;
  programs.home-manager.enable = true;
}
