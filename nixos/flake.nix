# /etc/nixos/flake.nix
{
  description = "flocon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    musnix  = { url = "github:musnix/musnix"; };
    # nixpkgs-python.url = "github:cachix/nixpkgs-python";

    # hyprland-plugins.url = "github:Hyprland/Hyprland-plugins?ref=main";    
  };

  outputs = { 
      self,
      nixpkgs, 
      unstable,
      hyprland,
      musnix, 
      ...
  } @ inputs : 
  
  {
    nixosConfigurations = {
      systmateur = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          inputs.musnix.nixosModules.musnix
          ./configuration.nix
        ];
      };
    };
  };
}
