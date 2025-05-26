{ lib
, stdenv
, coreutils
, binutils
, makeDesktopItem
, copyDesktopItems
, wrapGAppsHook
, xdm-gtk
# , xdm-app
, ... }: stdenv.mkDerivation rec {
  pname = "xdman";
  version = "8.0.29";
  inherit (xdm-gtk) passthru;

  src = ./.;

  buildInputs = [
    binutils.bintools
    coreutils
  ];

  nativeBuildInputs = [
    copyDesktopItems
    wrapGAppsHook
  ];

  desktopItems = [
    (makeDesktopItem rec {
      name = "Xtreme Download Manager";
      desktopName = name;
      comment = meta.description;
      exec = pname;
      icon = "xdm-app";
      categories = [ "Utility" ];
      keywords = [ "download" "internet" "manager" ];
      startupWMClass = "xdm-app";
      startupNotify = false;
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/applications $out/bin $out/share/icons/hicolor/512x512/apps/ $out/share/icons/hicolor/scalable/apps $out/share/xdman/chrome-extension
    ln -sv ${xdm-gtk}/bin/xdm-app $out/bin/${pname}
    install -m 644 ${xdm-gtk}/lib/xdm-gtk/xdm-logo-512.png $out/share/icons/hicolor/512x512/apps/xdm-logo.png
    install -m 644 ${xdm-gtk}/lib/xdm-gtk/xdm-logo-512.png $out/share/icons/hicolor/512x512/apps/xdm-app.png
    install -m 644 ${xdm-gtk}/lib/xdm-gtk/xdm-logo.svg $out/share/icons/hicolor/scalable/apps/xdm-logo.svg
    install -m 644 ${xdm-gtk}/lib/xdm-gtk/xdm-logo.svg $out/share/icons/hicolor/scalable/apps/xdm-app.svg

    cp ${xdm-gtk}/lib/xdm-gtk/chrome-extension/* $out/share/xdman/chrome-extension/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Powerful download accelerator and video downloader";
    homepage = "https://github.com/subhra74/xdm";
    license = licenses.gpl2Only;
    # maintainers = with maintainers; [ ];
    mainProgram = "xdman";
    platforms = platforms.all;
  };
}
