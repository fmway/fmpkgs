{
  description = "My Awkward nix package";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... } @ inputs: let
    systems = [ "aarch64-linux" "x86_64-linux" ];
    eachSystem = nixpkgs.lib.genAttrs systems;
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
  in {
    packages = eachSystem (system: let
      pkgs = import nixpkgs {
        inherit system config;
      };
    in import ./pkgs/top-level { inherit pkgs; });
    overlays.default = self: super: {
      fmpkgs = nixpkgs.lib.warn "Use pkgs.fmway instead" self.fmway;
      fmway = inputs.self.packages.${self.system};
    };
    nixosModules.default = module;
    homeManagerModules.default = module;
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
