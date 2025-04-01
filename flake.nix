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
  }) // rec {
    nixConfig = nixpkgs.config;
    nixpkgs.config = {
      permittedInsecurePackages = [
        "dotnet-runtime-wrapped-6.0.36"
        "dotnet-runtime-6.0.36"
        "dotnet-sdk-wrapped-6.0.428"
        "dotnet-sdk-6.0.428"
      ];
    };
    overlays.default = import ./overlay.nix;
  };
}
