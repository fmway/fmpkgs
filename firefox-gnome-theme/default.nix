{ lib
, stdenv
, fetchFromGitHub
}: let
  pname = "firefox-gnome-theme";
  version = "128";

  src = fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "v${version}";
    hash = "sha256-zB+Zd0V0ayKP/zg9n1MQ8J/Znwa49adylRftxuc694k=";
  };
in 
stdenv.mkDerivation {
  inherit pname version src;

  installPhase = ''
    mkdir -p $out/share/${pname}
    cp -rf * $out/share/${pname}
  '';

  meta = with lib; {
    description = "A GNOME👣 theme for Firefox";
    homepage = "https://github.com/rafaelmardojai/firefox-gnome-theme";
    license = licenses.unlicense;
    # maintainers = with maintainers; [ ];
    mainProgram = "firefox-gnome-theme";
    platforms = platforms.all;
  };
}
