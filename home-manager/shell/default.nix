{pkgs, local-inputs, ...}:

{
  imports = [
    ./caelestia.nix
  ];

  # home.packages = with pkgs; [
  #   inputs.caelestia-shell.packages."${stdenv.hostPlatform.system}".default
  #   inputs.caelestia-cli.packages."${stdenv.hostPlatform.system}".default
  # ];
}