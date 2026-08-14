{inputs, pkgs, ...}:

{
  home.packages = with pkgs; [
    inputs.caelestia-shell.packages."${stdenv.hostPlatform.system}".default
    inputs.caelestia-cli.packages."${stdenv.hostPlatform.system}".default
  ];
  
  # programs.caelestia = {
  #   enable = true;
  #   systemd.enable = false;

  #   cli.enable = true;
  # };
}