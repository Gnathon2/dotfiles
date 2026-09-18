{pkgs, ...} :

{
  environment.systemPackages = with pkgs; [
    # framac
    # alt-ergo
    # gitflow
    openconnect # pour le vpn
  ];
  
  virtualisation.docker.enable = true;
  users.users.hypruser.extraGroups = [ "docker" ]; # Optional: Add your user to the "docker" group to run docker without sudo

  programs.bash.shellAliases.vpn = "sudo openconnect -u e11726u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr";

  programs.nix-ld.enable = true; # dynamic links
}
