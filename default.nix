{ pkgs ? import <nixpkgs> {}
 , lib ? pkgs.lib
 , ...
}: let
  inherit (pkgs) callPackage;
in {
  bluetui = callPackage ./bluetui {};
  cargo-tauri = callPackage ./cargo-tauri {};
  cargo-create-tauri-app = callPackage ./cargo-create-tauri-app {};
  filebrowser = callPackage ./filebrowser {};
  firefoxAddons = import ./firefoxAddons { inherit pkgs lib; };
  keypunch = callPackage ./keypunch {};
  mpv-scripts = let
    buildLua = import ./mpv-scripts/buildLua.nix { inherit pkgs lib; };
  in {
    multiloop = callPackage ./mpv-scripts/multiloop.nix { inherit buildLua; };
    menu = callPackage ./mpv-scripts/menu.nix { inherit buildLua; };
    bookmarker = callPackage ./mpv-scripts/bookmarker.nix { inherit buildLua; };
  };
  xdman = callPackage ./xdman {};
}
