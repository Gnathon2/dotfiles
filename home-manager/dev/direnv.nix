{pkgs, ...}:
# direnv add shell to gcroots so it doesn't get wiped
{
  programs.direnv= {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}