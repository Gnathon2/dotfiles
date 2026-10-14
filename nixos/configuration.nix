{config, pkgs, inputs, lib,  ...}:

{
  imports = [
    # <home-manager/nixos>
    ./hardware-configuration.nix # Include the results of the hardware scan.

    ./audio.nix
    ./fprint.nix
    ./gaming.nix
    # ./hyprland.nix
    ./tncy.nix

  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    brightnessctl
    ntfs3g # mount windows
    neofetch # distro logo
    lshw # info hardware
    xorg.xev # inputs
    pulseaudio # pactl
    playerctl # media actions

    unzip
    zip
    # poppler-utils # ?
    btop # task manager
    # nnn # file explorer
    ranger # file explorer
    bc # calculator
    alsa-utils # alsamixer
    bluetuith

    git

    nix-index
    ncdu # tree du
    nix-tree
    inputs.nix-viz.packages.${stdenv.hostPlatform.system}.nix-visualize
    nix-du
  ];

  programs.bash = {
    promptInit = ''
      export PS1="\\n\[\e[1;32m\\]\w \\$ \[\e[0m\]"
    '';
    shellInit = ''
      if [ -f ~/.bashrc_local ]; then 
        source ~/.bashrc_local
      fi
    '';
  };

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.symbols-only
    dejavu_fonts
    freefont_ttf
    # nerd-fonts
    # nerd-fonts._3270
    # nerd-fonts.terminess-ttf
    # nerd-fonts.symbols-only
  ];


  services.upower.enable = true; # needed for shells

  programs.bash.shellAliases = {
    ## system
    kys = "shutdown 0";
    tg = "systemctl suspend";

    # dual boot
    wount = "sudo mount /dev/nvme0n1p3 /mnt/win";
    uwount = "sudo umount /mnt/win";

    ## nix
    nxrebuild = "sudo nixos-rebuild --flake /etc/nixos";
    nxre = "sudo nixos-rebuild --flake /etc/nixos --impure switch";

    nxpoubelle = "sudo nix-collect-garbage";
    nxcg = "sudo nix-collect-garbage -d";
    nxclean = '' home-manager expire-generations "-now"
      nix profile wipe-history 
      sudo nix-collect-garbage -d
      nix store optimise'';

    nxchan = "sudo nix-channel";
    nxflake = "sudo nix flake";
    nxfu = "sudo nix flake update --flake";
    nxsh = "nix-shell";

    nxconf = "sudo nano /etc/nixos/configuration.nix";
    nxhardware = "sudo nano /etc/nixos/hardware-configuration.nix";

    nxhome = "home-manager";
    nxhm = "home-manager switch -b backup";
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
