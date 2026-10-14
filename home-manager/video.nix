{pkgs, ...}:

{ 
  home.packages = with pkgs; [
    twitch-tui
    # streamlink # broken as of july 2026
    mpv
  ];

  home.shellAliases = {
    papier = "ghostty --class=pap.er -e";
    stream = "streamlink --player mpv";
    streambg = "streamlink --player mpv --player-args '--wayland-app-id=pap.er'";
    # marex = "streamlink --player mpv twitch.tv/marex";
  };
}