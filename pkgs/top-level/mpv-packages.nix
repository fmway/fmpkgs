# FIXME refactoring and add updater
{ pkgs ? import <nixpkgs> {}, ... }: let
  buildLua = import ../applications/video/mpv/scripts/buildLua.nix { inherit pkgs; };
in with pkgs; {
  multiloop = callPackage ../applications/video/mpv/scripts/multiloop.nix { inherit buildLua; };
  menu = callPackage ../applications/video/mpv/scripts/menu.nix { inherit buildLua; };
  bookmarker = callPackage ../applications/video/mpv/scripts/bookmarker.nix { inherit buildLua; };
}
