# fmway/pkgs
Nothing. Just some unofficial nix packages

[![CI](https://github.com/fmway/fmpkgs/actions/workflows/ci.yml/badge.svg?event=pull_request)](https://github.com/fmway/fmpkgs/actions/workflows/ci.yml)

## How to use?
<details>
  <summary>Flakes</summary>
  
  add this repo to inputs in flake.nix
  ```nix
    inputs = {
  
      fmway-pkgs.url = "github:fmway/pkgs";

    };
  ```
  and then, you can do:
  - add to your configurations
    ```nix
    { inputs, ... }: {
      imports = [
        inputs.fmway-pkgs.nixosModules.default
      ];
      # and finally, you can add the package, this packages is defined in pkgs.fmway prefix
      environment.systemPackages = with pkgs; [
        fmway.xdman
      ];
    }
    ```
  - install package with nix profile
    ```sh
    nix profile install github:fmway/pkgs#cage-xtmapper
    ```
  - temporary run using nix shell
    ```sh
    nix shell github:fmway/pkgs#eth-wake
    ```
</details>
<details>
  <summary>Non-flakes</summary>
  
  You must add this repo to your nix channel
  ```sh
  nix-channel --add https://github.com/fmway/pkgs/archive/master.tar.gz fmway-pkgs
  nix-channel --update
  ```
  and then, you can do:
  - add to your configurations
    ```nix
    {
      imports = [
        <fmway-pkgs/module.nix>
      ];
      # and finally, you can add the package, this packages is defined in pkgs.fmway prefix
      environment.systemPackages = with pkgs; [
        fmway.xdman
      ];
    }
    ```
  - install package with nix-env
    ```sh
    nix-env '<fmway-pkgs>' -iA cage-xtmapper
    ```
  - temporary run using nix-shell
    ```sh
    nix-shell '<fmway-pkgs>' -A eth-wake
    ```
</details>
