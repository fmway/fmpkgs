{ lib
, fetchFromGitHub
, unstableGitUpdater
, buildLua
}:
buildLua rec {
  pname = "menu";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "jonniek";
    repo = "mpv-menu";
    rev = "cdcf587de26719deaee31bed9bd2372e722509dd";
    hash = "sha256-I3YyJbdTDLP3DhSEHWe3CitxZE9QgXPawWnj7HPn2ic=";
  };

  passthru.updateScript = unstableGitUpdater { };
  passthru.scriptName = "menu.lua";

  meta = with lib; {
    description = "Simple mpv menu to launch commands from";
    homepage = "https://github.com/jonniek/mpv-menu";
    license = with licenses; [ unlicense ];
    maintainers = with maintainers; [ ];
    platforms = platforms.all;
  };
}
