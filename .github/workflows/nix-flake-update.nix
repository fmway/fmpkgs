{ writeScriptBin, bash, lib, moreutils, jq, ... }:
writeScriptBin "nix-flake-update" /* sh */ ''
  #!${lib.getExe bash}

  export PATH=${lib.makeBinPath [
    moreutils
    jq
  ]}:$PATH

  nix flake lock .github/workflows
  jq --argjson chaotic "$(cat .github/workflows/flake.lock)" '.nodes.nixpkgs |= $chaotic.nodes.nixpkgs' flake.lock | sponge flake.lock
  rm .github/workflows/flake.lock
''
