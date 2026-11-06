{pkgs, ...}:

{
  home.package = with pkgs; [
    dux-shell
  ]; 
}