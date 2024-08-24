{ appimageTools
, fetchurl
, ... } :
let
  pname = "zen-browser";
  version = "1.0.0-a.28";
  src = fetchurl {
    url = "https://github.com/${pname}/desktop/releases/download/${version}/zen-specific.AppImage";
    hash = "sha256-S49M3QVpjQ36+f4xeC13XXn11IlzHmTvfIZkTS/YOF4=";
  };
  appimageContents = appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      substituteInPlace $out/zen.desktop --replace 'Exec=zen' 'Exec=${pname}'
    '';
  };
in 
appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: with pkgs; [ ];
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/zen.desktop $out/share/applications/${pname}.desktop
    cp -r ${appimageContents}/usr/share $out
  '';
}
