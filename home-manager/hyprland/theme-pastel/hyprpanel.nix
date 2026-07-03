{ inputs, pkgs, ... }  :

{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.system}.default; # flake pkg
    settings = {
      bar = {};

      theme = {
        bar = {
          transparent = true;
        };
        font = {
          size = "0.8rem";
        };
      };
    
    };
  };
}
