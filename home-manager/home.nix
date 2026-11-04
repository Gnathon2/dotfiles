{pkgs, ...}:

{
  imports = [
    ./apps
    ./dev
    ./hyprland
    ./shell
    ./term   
   ./theme.nix 
  ];

  home.packages = with pkgs; [ kitty firefox ]; # core apps

  # home.sessionVariables = {};

  # home.file = {};

  home.username = "hypruser";
  home.homeDirectory = "/home/hypruser";
  home.stateVersion = "25.05";
  nixpkgs.config = import ../nixpkgs/config.nix;
  programs.home-manager.enable = true;
}
