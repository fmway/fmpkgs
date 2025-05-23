{ lib
, fetchFromGitHub
, buildDotnetModule
, gtk3
, ffmpeg-full
, dotnetCorePackages
, ... }:
buildDotnetModule rec {
  pname = "xdm-gtk";
  version = "8.0.29";

  src = fetchFromGitHub {
    owner = "subhra74";
    repo = "xdm";
    rev = version;
    hash = "sha256-bdDiTwqsid+I2rsEYqcEOpvL9W3CwgAY0D1R837smdg=";
  };

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = dotnetCorePackages.runtime_6_0;

  projectFile = "./app/XDM/XDM.Gtk.UI/XDM.Gtk.UI.csproj";
  
  runtimeDeps = [
    gtk3
    ffmpeg-full
  ];

  nugetDeps = ./deps.nix;

  meta = with lib; {
    description = "Powerfull download accelerator and video downloader";
    homepage = "https://github.com/subhra74/xdm";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "xdman";
    platforms = platforms.all;
  };

  executables = [ "xdm-app" ];
}
