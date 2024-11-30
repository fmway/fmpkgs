{ pkgs, lib, ... }:
pkgs.stdenvNoCC.mkDerivation {
  name = "firefox-updater";
  src = pkgs.writeScriptBin /* fish */ ''
    #!${lib.getExe pkgs.fish}
    
    set -xa PATH ${lib.replaceStrings [":"] [" "] (lib.makeBinPath (with pkgs; [
      jq
      curl
      gawk
    ]))}

    ${lib.fileContents ./update.fish}
  '';
  installPhase = ''
    mkdir $out/bin
    cp -rf bin/* $out/bin/
  '';
}
