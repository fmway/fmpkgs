{ pkgs ? import <nixpkgs> {}
 , lib ? pkgs.lib
 , ...
}: let
  inherit (pkgs) callPackage;
in {
  bluetui = callPackage ./bluetui {};
  firefox-addons = import ./firefox-addons { inherit pkgs lib; };
  mpv-scripts = let
    buildLua = import ./mpv-scripts/buildLua.nix { inherit pkgs lib; };
  in {
    multiloop = callPackage ./mpv-scripts/multiloop.nix { inherit buildLua; };
    menu = callPackage ./mpv-scripts/menu.nix { inherit buildLua; };
    bookmarker = callPackage ./mpv-scripts/bookmarker.nix { inherit buildLua; };
  };
  xdman = callPackage ./xdman {};
}
