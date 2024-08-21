{ pkgs ? import <nixpkgs> {}
 , lib ? pkgs.lib
 , ...
}: let
  getDefaultNixs = folder: let
    filtered = key: value: value == "directory" && lib.pathExists (lib.path.append folder "${key}/default.nix"); # get directory that have children default.nix
    list-dir = builtins.readDir folder;
  in lib.mapAttrsToList (name: value: "${name}") (lib.filterAttrs filtered list-dir); 
  folder = ./.;
  list = getDefaultNixs folder;
in builtins.foldl' (all: package: {
  "${package}" = pkgs.callPackage (folder + ("/" + package)) { };
} // all) {
  firefoxAddons = import ./firefoxAddons.nix {
    inherit pkgs lib;
  };
} list
