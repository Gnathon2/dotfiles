{
  inputs = {
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

  
  outputs = inputs @ {
    self,
    caelestia-cli,
    caelestia-shell,
    noctalia,
    ...
  }: {
    homeModules.default = import ./default.nix;
  };
}