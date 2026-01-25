{
  description = "flake for home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };



    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlauncher = {
      url = "github:hyprwm/hyprlauncher";
      inputs.hyprland.follows = "hyprland";
    };

    glide = {
      url = "github:glide-browser/glide.nix";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-plugins,
    hyprpanel,
    hyprlauncher,
    glide, 
    catppuccin,
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
