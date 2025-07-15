{
  nixpkgs.overlays = [
    (import ./overlay.nix)
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-wrapped-6.0.36"
    "dotnet-runtime-6.0.36"
    "dotnet-sdk-wrapped-6.0.428"
    "dotnet-sdk-6.0.428"
  ];
}
