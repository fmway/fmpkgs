# https://github.com/stayfree-app/desktop-releases/releases/download/v2.6.10/stayfree-linux-x86_64.AppImage
{ appimageTools, fetchurl, ... } :
let
  pname = "stayfree-desktop";
  version = "2.6.10";
  src = fetchurl {
    url = "https://github.com/stayfree-app/desktop-releases/releases/download/v${version}/stayfree-linux-x86_64.AppImage";
    hash = "sha256-R4150TPr0RtcBIuy6w4ponQi4Dgteot+nz7HpK2hrRM=";
  };
  appimageContents = appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      substituteInPlace $out/${pname}.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
  };
in 
appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: with pkgs; [ ];
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
    cp -r ${appimageContents}/usr/share $out
  '';
}
