{pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
  ];

  programs.cava = {
    enable = true;
  };
}