{inputs, pkgs, ...}:
# dedicated to hyprplugins
{
  imports = [
    ./hyprexpo.nix
    ./hyprfocus.nix
  ];  
}