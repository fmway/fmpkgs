{ writeScriptBin, bash, lib, moreutils, jq, ... }:
writeScriptBin "nix-flake-update" /* sh */ ''
  #!${lib.getExe bash}

  export PATH=${lib.makeBinPath [
    moreutils
    jq
  ]}:$PATH

  temp="$(mktemp -d)"
  cp .github/workflows/flake.nix "$temp/flake.nix"

  nix flake lock "$temp"
  jq --argjson chaotic "$(cat "$temp/flake.lock")" '.nodes.nixpkgs |= $chaotic.nodes.nixpkgs' flake.lock | sponge flake.lock
''
