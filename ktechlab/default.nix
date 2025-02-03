{ stdenv
, fetchFromGitHub
, qt5
, cmake
, extra-cmake-modules
, plasma5Packages
, ... }: let
  pname = "ktechlab";
  version = "0.51.0";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "ktechlab";
    repo = "ktechlab";
    rev = "v${version}";
    hash = "sha256-dzm+Vom+WwdFlglEYzt5G62cQ4ud9swZTlfg1I3vBJg=";
  };

  buildInputs = [
    qt5.qtbase
    qt5.qtserialport
  ] ++ (with plasma5Packages.kdeFrameworks; [
    plasma-framework
    khtml
    kparts
    ktexteditor
  ]);

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    qt5.wrapQtAppsHook
  ];
}
