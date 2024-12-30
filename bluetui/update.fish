#!/usr/bin/env -S nix shell nixpkgs#expect nixpkgs#nix-init --command fish
expect (echo 'spawn nix-init -u https://github.com/pythops/bluetui ./bluetui/default.nix
expect "Enter tag or revision *"
send "\\r"
expect "Enter versio*"
send "\\r"
expect "Enter pnam*"
send "\\r"
expect "How should this package be bui*"
send "\\r"
expect "Overwrite*"
send "\\r"
interact' | psub)
