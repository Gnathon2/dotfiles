# /etc/nixos/flake.nix
{
  description = "flocon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-23.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";


    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # nixpkgs-python.url = "github:cachix/nixpkgs-python";
    
  };

  outputs = { 
      self,
      nixpkgs, 
      # home-manager,
      hyprland,
      # hyprland-plugins,
      zen-browser,
      ...
  } @ inputs : 
  
  {
    nixosConfigurations = {
      systmateur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          # home-manager.nixosModules.home-manager {
          #   home-manager.users.systematr.imports = [ 
          #     ./home
          #   ];
          # }

        ];
      };
    };
  };
}
