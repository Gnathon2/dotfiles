{ inputs, pkgs, ... } :

{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.system}.default;
    settings = {
      theme = {
        bar = {
          transparent = false;
        };
        font = {
          size = "0.79rem";
        };
      };
    };
  };
}