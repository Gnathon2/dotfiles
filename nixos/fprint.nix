{...}:

{
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  services.fprintd = {
    enable = true;
    # tod.enable = true;
    # tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
  };

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=ideapad
  ''; # wtf is that ?
  
}