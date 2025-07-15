{ buildFHSEnv
, pkgs
, ...
}: let
  name = "cage_xtmapper";
  version = "0.2.0";
  source = pkgs.stdenv.mkDerivation {
    name = "${name}-source";
    src = pkgs.fetchurl {
      url = "https://github.com/Xtr126/cage-xtmapper/releases/latest/download/cage-xtmapper-v${version}.tar";
      hash = "sha256-B/XmuX/4ZmATCZgEbFOzSMYO63/SE5T/nPMuadqO9z0=";
    };
    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r local/* $out/
      runHook postInstall
    '';
  };
  wrapped = buildFHSEnv {
    inherit name;
    runScript = "${source}/bin/${name}";
    targetPkgs = pkgs: with pkgs; [
      bash
      coreutils
    ];
    multiPkgs = pkgs: with pkgs; [
      wayland
      glibc
      libxcrypt
      libGL

      libdrm
      libgbm
      seatd
      udev
      vulkan-loader
      libudev0-shim
      xorg.libxcb
      xorg.xcbutilrenderutil
      pixman
      libxkbcommon
    ];
  };
in source.overrideAttrs {
  postInstall = ''
    rm $out/bin/${name}
    install -m755 ${wrapped}/bin/${name} $out/bin/${name}
    substituteInPlace $out/bin/${name}.sh --replace ${name} $out/bin/${name}
  '';
}
