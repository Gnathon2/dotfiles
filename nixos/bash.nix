{}:

{
  programs.bash = {
    promptInit = ''
      export PS1="\\n\[\e[1;32m\\]\w \\$ \[\e[0m\]"
    '';
    shellInit = ''
      if [ -f ~/.bashrc_local ]; then
        source ~/.bashrc_local
      fi
    '';

    shellAliases = {
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
  };
}