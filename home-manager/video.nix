{pkgs, ...}:

{ 
  home.packages = with pkgs; [
    twitch-tui
    streamlink
    mpv
  ];
}