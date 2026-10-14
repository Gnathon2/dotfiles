{pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
    # supercollider
    sonic-pi
  ];

  programs.cava = {
    enable = true;
  };
}