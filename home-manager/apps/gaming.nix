{pkgs, input, ...}:

{
  home.packages = with pkgs; [
    olympus
  ];
}
