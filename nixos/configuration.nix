{config, pkgs, inputs, lib,  ...}:

{
  imports = [ 
    # <home-manager/nixos>
    ./hardware-configuration.nix # Include the results of the hardware scan.
 
    ./audio.nix
    ./gaming.nix 
    ./hyprland.nix 
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    brightnessctl
    ntfs3g # mount windows
    neofetch # distro logo
    lshw # info hardware
    xorg.xev 
    pulseaudio # provides pactl
    playerctl # media actions

    unzip
    zip
    nix-index 
    ncdu # tree du
    # poppler-utils # ?
    btop # task manager
    # nnn # file explorer
    ranger # file explorer 
    bc # calculator
    alsa-utils # alsamixer
    bluetuith

    git
    gitflow 
    openconnect # pour le vpn
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.symbols-only
    # nerd-fonts
    # nerd-fonts._3270
    # nerd-fonts.terminess-ttf
    # nerd-fonts.symbols-only
  ];


  # virtualisation.docker.enable = true;


  services.upower.enable = true; # needed for hyprpanel

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=ideapad
  ''; # wtf is that ?

  
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  services.fprintd = {
    enable = true;
    # tod.enable = true;
    # tod.driver = pkgs.libfprint-2-tod1-goodix-550a;
  };
  
  programs.bash.shellAliases = {
    ## system
    kys = "shutdown 0";
    re = "reboot";
    dodo = "systemctl suspend";

    wount = "sudo mount /dev/nvme0n1p3 /mnt/win";
    uwount = "sudo umount /mnt/win";

    ## nix
    nxrebuild = "sudo nixos-rebuild --flake /etc/nixos";
    nxre = "sudo nixos-rebuild --flake /etc/nixos --impure switch";
    
    nxpoubelle = "sudo nix-collect-garbage";
    nxcg = "sudo nix-collect-garbage -d";

    nxchan = "sudo nix-channel";
    nxflake = "sudo nix flake";
    nxfu = "sudo nix flake update --flake";
    nxsh = "nix-shell";

    nxconf = "sudo nano /etc/nixos/configuration.nix";
    nxhardware = "sudo nano /etc/nixos/hardware-configuration.nix";
    
    nxhome = "home-manager";
    nxhm = "home-manager switch -b backup";

    vpn = "sudo openconnect -u e11726u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr";
  };  

  # FLAKE
  nix = {
    # package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  }; 
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "systmateur"; # nom de la machine systmateur mieux non?

  networking.networkmanager.enable = true;


  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  console.keyMap = "fr";

  users.users.hypruser = {
    isNormalUser = true;
    description = "thomas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  }; 
  
  system.stateVersion = "25.05"; # Did you read the comment?
}
