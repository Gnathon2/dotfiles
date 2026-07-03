{
  description = "flake for home-manager";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlauncher = {
      url = "github:hyprwm/hyprlauncher";
      inputs.hyprland.follows = "hyprland";
    };
    hyprshutdown = {
      url = "github:hyprwm/hyprshutdown";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    caelestia = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # glide.url = "github:glide-browser/glide.nix";

    

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-plugins,
    hyprlauncher,
    hyprshutdown,
    hyprpaper,
    hyprpanel,
    catppuccin,
    zen-browser,
    caelestia,
    noctalia,
    # glide, 
    ...
  }:

  {
    homeConfigurations = {
      hypruser = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home.nix
          catppuccin.homeModules.catppuccin
          # { nixpkgs.overlays = [ inputs.hyprpanel.overlay ];} # potentially a bad idea
        ];
      };
    };
  };
}
