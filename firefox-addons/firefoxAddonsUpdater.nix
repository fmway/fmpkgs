{ pkgs, lib, ... }:
pkgs.writeScriptBin "update-firefox" /* fish */ ''
  #!${lib.getExe pkgs.fish}
  
  set -xa PATH ${lib.replaceStrings [":"] [" "] (lib.makeBinPath (with pkgs; [
    jq
    curl
    gawk
  ]))}

  ${lib.fileContents ./update.fish}
''
