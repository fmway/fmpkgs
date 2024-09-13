{ pkgs, lib, ... }: let
  # buildFirefoxXpiAddon = import ./buildFirefoxXpiAddon.nix { inherit pkgs lib; };
in import ./generated_addons.nix { inherit lib pkgs; } // {
  
}
