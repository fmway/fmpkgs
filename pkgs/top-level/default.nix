{ pkgs ? import <nixpkgs> {}, ... }: import ./all-packages.nix { inherit pkgs; }
