#!/usr/bin/env -S nix shell nixpkgs#jq nixpkgs#nurl nixpkgs#curl nixpkgs#nix-init nixpkgs#fish nixpkgs#gawk --command fish
function unescape
  string replace / '\\/' -- $argv
end
set owner pythops
set pname bluetui
set latest_version "$(curl https://api.github.com/repos/$owner/$pname/releases/latest 2>/dev/null | jq -r '.tag_name')"
set src_expr "$(nurl https://github.com/$owner/$pname $latest_version 2>/dev/null)"
set hash "$(nurl https://github.com/$owner/$pname $latest_version -H 2>/dev/null)"
set cargoHash "$(nix build --expr 'let pkgs = import <nixpkgs> {}; in with pkgs; rustPlatform.fetchCargoTarball { name="'$pname'-'$latest_version'"; src = '$src_expr'; hash=lib.fakeHash; }' --impure --show-trace --verbose --no-link &| grep got | awk '{print $2}')"
sed -i 's/version = ".\\+";/version = "'$latest_version'";/' ./bluetui/default.nix
sed -i 's/hash = ".\\+";/hash = "'(unescape $hash)'";/' ./bluetui/default.nix
sed -i 's/cargoHash = ".\\+";/cargoHash = "'(unescape $cargoHash)'";/' ./bluetui/default.nix
