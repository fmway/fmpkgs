{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; import ./by-name.nix { inherit pkgs; } // {
  firefox-addons = callPackage ../applications/browser/firefox/addons {};
  mpv-scripts = callPackage ./mpv-packages.nix {};

  # FIXME 
  updater = {
    firefox-addons = callPackage ../applications/browser/firefox/addons/firefoxAddonsUpdater.nix {};
  };
}
