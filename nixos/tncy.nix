{pkgs, ...} :

{
  environment.systemPackages = with pkgs; [
    # framac
    # alt-ergo
    # gitflow
    openconnect # pour le vpn
  ];
}
