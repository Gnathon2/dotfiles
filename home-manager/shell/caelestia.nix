{local-inputs, pkgs, ...}:

{
  home.packages = with pkgs; [
    local-inputs.caelestia-shell.packages."${stdenv.hostPlatform.system}".default
    local-inputs.caelestia-cli.packages."${stdenv.hostPlatform.system}".default
  ];
  
  # programs.caelestia = {
  #   enable = true;
  #   systemd.enable = false;

  #   cli.enable = true;
  # };
}