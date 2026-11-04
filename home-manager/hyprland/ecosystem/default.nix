{inputs, pkgs, ...}:

{
  imports = [
    ./hypridle.nix
    # ./hyprlock.nix
    # ./hyprpanel.nix
    # ./hyprpaper.nix
    ./hyprsunset.nix
  ];

  home.packages = with pkgs; [
    inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprlauncher
    hyprshot
    hyprpicker
    # hyprpolkitagent
  ];
}