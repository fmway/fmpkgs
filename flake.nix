{
  description = "My Awkward nix package";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... } @ inputs: let
    module.imports = [
      {
        nixpkgs.overlays = [ self.overlays.default ];
        nixpkgs = { inherit config; };
      }
    ]; 
    config.permittedInsecurePackages = [
      "dotnet-runtime-wrapped-6.0.36"
      "dotnet-runtime-6.0.36"
      "dotnet-sdk-wrapped-6.0.428"
      "dotnet-sdk-6.0.428"
    ];
  in flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs {
      inherit system config;
    };
    lib = nixpkgs.lib;
  in {
    packages = import ./. {
      inherit pkgs lib;
    };
  }) // {
    overlays.default = self: super: {
      fmpkgs = inputs.self.packages.${self.system};
    };
    nixosModules.default = module;
    homeManagerModules.default = module;
    nixDarwinModules.default = module;
  };
  nixConfig = {
    permittedInsecurePackages = [
      "dotnet-runtime-wrapped-6.0.36"
      "dotnet-runtime-6.0.36"
      "dotnet-sdk-wrapped-6.0.428"
      "dotnet-sdk-6.0.428"
    ];
  };
}
