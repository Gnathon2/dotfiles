{pkgs, input, ...}:

{
  imports = [
    # ./fish.nix
    # ./foot.nix
    ./ghostty.nix
  ];

  home.packages = with pkgs; [
    # cool-retro-term
  ];
}