{pkgs, ...}:

{ 
  home.packages = with pkgs; [
    twitch-tui
    # streamlink # broken as of july 2026
    mpv
  ];
}