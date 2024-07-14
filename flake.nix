{
  description = "My Awkward nix package";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };
  outputs = { self, nixpkgs, flake-utils, ... } @ inputs: 
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
    getDefaultNixs = folder: let
      filtered = key: value: value == "directory" && lib.pathExists (lib.path.append folder "${key}/default.nix"); # get directory that have children default.nix
      list-dir = builtins.readDir folder;
    in  lib.mapAttrsToList (name: value: "${name}") (lib.filterAttrs filtered list-dir);
  in {
    packages = let
      folder = ./.;
      list = getDefaultNixs folder;
    in builtins.foldl' (all: package: {
      "${package}" = pkgs.callPackage (folder + ("/" + package)) { };
    } // all) {} list;
  });
}
