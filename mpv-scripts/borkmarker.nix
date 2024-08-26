{ lib
, fetchFromGitHub
, unstableGitUpdater
, buildLua
}:
buildLua rec {
  pname = "mpv-bookmarker";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "NurioHin";
    repo = "mpv-bookmarker";
    rev = "v${version}";
    hash = "sha256-hGqYIllKXJYQpUw5zEs81U0zHg8SOftdSczQ15BmJd4=";
  };

  meta = {
    description = "A bookmarker menu to manage all your bookmarks in MPV";
    homepage = "https://github.com/NurioHin/mpv-bookmarker";
    license = with lib.licenses; [ unlicense ];
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };

  passthru.updateScript = unstableGitUpdater { };
  passthru.scriptName = "bookmarker-menu.lua";
}
