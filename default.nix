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
  mpv-scripts = {
    multiloop = callPackage ./mpv-scripts/multiloop.nix {};
    
  };
  xdman = callPackage ./xdman {};
}
