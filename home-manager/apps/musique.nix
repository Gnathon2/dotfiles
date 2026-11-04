{pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
    # supercollider
    sonic-pi
    reaper
  ];

  programs.cava = {
    enable = true;
  };
}