{pkgs, input, ...}:

{
  imports = [
    # ./fish.nix
    # ./foot.nix
    ./ghostty.nix
  ];

  home.packages = with pkgs; [
    # cool-retro-term
  ];

  programs.bash = {
    enable = true;
    sessionVariables = {
      PS1 = "\\W\\$";
    };
    initExtra = ''
      export PS1="\\n\e[1;32m\\w \\$ \e[0m"
    '';
  };

  
  home.shellAliases = {
    bn = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
    re = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";

    papier = "ghostty --class=pap.er -e";
    stream = "streamlink --player mpv";
    streambg = "streamlink --player mpv --player-args '--wayland-app-id=pap.er'";
    marex = "streamlink --player mpv twitch.tv/marex";
  };
}