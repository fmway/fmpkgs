{
  description = "My Awkward nix package";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... } @ inputs: 
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
    
  in {
    packages = import ./. {
      inherit pkgs lib;
    };
  }) // {
    overlays.default = import ./overlay.nix;
  };
}
