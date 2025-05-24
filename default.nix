{ pkgs ? import <nixpkgs> {}
 , lib ? pkgs.lib
 , ...
}: let
  inherit (pkgs) callPackage;
in {
  firefox-addons = import ./firefox-addons { inherit pkgs lib; };
  firefoxAddonsUpdater = callPackage ./firefox-addons/firefoxAddonsUpdater.nix {};
  ktechlab = callPackage ./ktechlab {};
  mpv-scripts = let
    buildLua = import ./mpv-scripts/buildLua.nix { inherit pkgs lib; };
  in {
    multiloop = callPackage ./mpv-scripts/multiloop.nix { inherit buildLua; };
    menu = callPackage ./mpv-scripts/menu.nix { inherit buildLua; };
    bookmarker = callPackage ./mpv-scripts/bookmarker.nix { inherit buildLua; };
  };
  xdman = callPackage ./xdman {
    xdm-gtk = callPackage ./xdman/xdm-gtk {};
    xdm-app = callPackage ./xdman/xdm-app {};
  };
}
