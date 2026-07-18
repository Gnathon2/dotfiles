{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  
  outputs = local-inputs @ {
    self,
    nixpkgs,
    caelestia-cli,
    caelestia-shell,
    noctalia,
    ...
  }: {
   
    homeModules.default = {
      _module.args = { inherit local-inputs; };
      imports = [ ./default.nix ];
    };

    # {pkgs, ...}: { 
    #   # _module.args = { inherit caelestia-shell; };
    #   # imports = [./default.nix]; 

    #   home.packages = with pkgs; [
    #     inputs.caelestia-shell.packages."${stdenv.hostPlatform.system}".default
    #     inputs.caelestia-cli.packages."${stdenv.hostPlatform.system}".default
    #   ];
    # };
  };
}