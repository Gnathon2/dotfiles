{pkgs, ...} :

{
  environment.systemPackages = with pkgs; [
    framac
    alt-ergo
  ];
}
