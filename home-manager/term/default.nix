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
    bashrcExtra = ''
      if [ -f ~/.bashrc_local ]; then 
        source ~/.bashrc_local
      fi
    '';
    initExtra = ''
      export PS1="\\n\e[1;32m\\w \\$ \e[0m"
    '';
  };

  
  home.shellAliases = {
    bn = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
    re = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
  };
}