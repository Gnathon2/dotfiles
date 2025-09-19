{config, pkgs, inputs, lib,  ...}:

{
  # FLAKE
  nix = {
    # package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  }; 
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  

  imports = [ 
      # <home-manager/nixos>
      ./hardware-configuration.nix # Include the results of the hardware scan.
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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


  #MARK: pkgs
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =  with pkgs; [
    ## SYS ##
    brightnessctl
    ntfs3g # mount windows
    neofetch # distro logo
    lshw # info hardware
    xorg.xev 
    pulseaudio # provides pactl
    playerctl # media actions

    ## CLI ##
    unzip
    zip
    nix-index 
    poppler_utils # ?
    

    ## TUI ##
    btop # task manager
    # nnn # file explorer
    ranger # file explorer
    clipse 
    bc # calculator
    alsa-utils # alsamixer

    ## GUI ##
    ghostty
    kitty # backup terminal
    inputs.zen-browser.packages."${system}".default
    vscode
    discord-ptb
    obsidian 
    #godot-4
    spotify
  
    twitch-tui # chat in terminal
    streamlink # livestream into videoplayer
    # celluloid # video player
    mpv # video player but simpler



    ## HYPR ## 
    # hyprpaper
    hyprlock
    # mako
    # waybar 
    hyprpicker # color picker
    hyprshot
    hypridle
    hyprsunset # blue light
    hyprpolkitagent
    wofi
    # fuzzle
 
    ## TNCY ##
    # gcc
    git
    gitflow 
    openconnect # pour le vpn
    # python3Full
    # clang 
    # gnumake
    # ocaml
    # jdk21 #java
    # jetbrains.idea-community #ide java

    # libgcc # g++ 
    # wireshark 
    # wget # telecharge un fichier à un adresse donnée
   
    ## TEST ##
    # dterm 
    # dnote 
    # dstask
    hollywood
    pipes

  ];
    
    
    
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;

    firefox.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        tumbler
      ];
    };

    steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
     localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };


  #MARK: audio


  # services.jack = {
  #   jackd.enable = true;
  #   # support ALSA only programs via ALSA JACK PCM plugin
  #   alsa.enable = true;
  #   # support ALSA only programs via loopback device (supports programs like Steam)
  #   loopback = {
  #     enable = false;
  #     # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
  #     #dmixConfig = ''
  #     #  period_size 2048
  #     #'';
  #   };
  # };
  # users.extraUsers.thomax.extraGroups = [ "jackaudio" ];





  # this one works but does not provide pulseaudio
  security.rtkit.enable = true;   # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; 
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };


  
  

  

  #MARK: VisUAL2
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   # Add any missing dynamic libraries for unpackaged programs
  #   # here, NOT in environment.systemPackages
  #   patchelf
  #   # haskellPackages.gi-pangocairo
  #   atk
  #   cairo
  #   gdk-pixbuf
  #   glib
  #   # gstreamer
  #   # gst-plugins-base
  #   gtk3
  #   gtksourceview4
  #   libpeas
  #   librsvg
  #   pango
  #   vte

  #   dbus
  #   xorg.libX11
  #   xorg.libxcb
  #   xorg.libXi
  #   xorg.libXcursor
  #   xorg.libXdamage
  #   xorg.libXrandr
  #   xorg.libXcomposite
  #   xorg.libXext
  #   xorg.libXfixes
  #   xorg.libXrender
  #   xorg.libXtst
  #   xorg.libXScrnSaver

  #   # gnome2.GConf
  #   nss
  #   nspr
  #   alsa-lib
  #   cups
  #   fontconfig
  #   expat
  #   # libgtk
  # ];


  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.symbols-only
    # nerd-fonts
    # nerd-fonts._3270
    # nerd-fonts.terminess-ttf
    # nerd-fonts.symbols-only
  
  ];
  
  programs.bash.shellAliases = {
    ## system
    bn = "shutdown 0";
    re = "reboot";
    dodo = "systemctl suspend";

    wount = "sudo mount /dev/nvme0n1p3 ~/win";
    uwount = "sudo umount ~/win";

    ## nix
    nxrebuild = "sudo nixos-rebuild --flake /etc/nixos";
    nxre = "sudo nixos-rebuild --flake /etc/nixos switch --impure";
    
    nxpoubelle = "sudo nix-collect-garbage";
    nxcg = "sudo nix-collect-garbage -d";

    nxchan = "sudo nix-channel";
    nxflake = "sudo nix flake";
    nxsh = "nix-shell";

    nxconf = "sudo nano /etc/nixos/configuration.nix";
    nxhardware = "sudo nano /etc/nixos/hardware-configuration.nix";
    
    nxhome = "home-manager";
    nxhm = "home-manager switch -b backup";

    vpn = "sudo openconnect -u e11726u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr";
  };  

  
  # AutoStart
  services.getty.autologinUser = "hypruser";
  services.getty.autologinOnce = true; 
  
  environment.etc."profile.local" = {
    text = ''
      if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        exec Hyprland
      fi
    '';
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}
