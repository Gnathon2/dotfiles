# /etc/nixos/flake.nix
{
  description = "flocon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";


    # nixpkgs-python.url = "github:cachix/nixpkgs-python";

    # hyprland-plugins.url = "github:Hyprland/Hyprland-plugins?ref=main";    
  };

  outputs = { 
      self,
      nixpkgs, 
      unstable,
      hyprland,
      
      ...
  } @ inputs : 
  
  {
    nixosConfigurations = {
      systmateur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
