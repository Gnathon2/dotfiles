{ config, pkgs, inputs, ... }:

{

  imports = [
    ./hyprland
    ./other
  ];
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # hello
    cava
    inputs.hyprpanel.packages.${pkgs.system}.default

    olympus
    discord
    graphviz
    geogebra
    dmenu-wayland
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
      name = "bibata";
      size = 24;
    };
  };

  # home.pointerCursor = {
  #   name = "bibata"; # Nom exact du thème
  #   size = 24;
  #   gtk.enable = true;
  #   x11.enable = true;
  #   # package = null;
  # };
  home.sessionVariables = {
    XCURSOR_THEME = "bibata";
    XCURSOR_SIZE = 18;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
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

  programs.bash.enable = true;
  home.shellAliases = {
    papier = "ghostty --class=pap.er -e";
    stream = "streamlink --player mpv";
    streambg = "streamlink --player mpv --player-args '--wayland-app-id=pap.er'";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/thomax/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "ghostty -e nano";
    # THEME = "candy";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
