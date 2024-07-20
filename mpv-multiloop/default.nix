{ lib
, stdenvNoCC
, fetchFromGitHub
, unstableGitUpdater
, buildLua ? import ./buildLua.nix { inherit lib stdenvNoCC; }
}:
buildLua {
  pname = "mpv-multiloop";
  version = "unstable-2020-11-29";
  src = fetchFromGitHub {
    owner = "unusualpepe";
    repo = "mpv-multiloop";
    rev = "0bc5503d938c729d2c41bfe6b4e889b56eb5540a";
    hash = "sha256-cT3o7tGfUs/iALKhBfftb28suh73ja1fHr8rMhaVYrU=";
  };

  passthru.updateScript = unstableGitUpdater { };

  meta = with lib; {
    description = "Loop over multiple A-B points in mpv";
    homepage = "https://github.com/unusualpepe/mpv-multiloop";
    license = with licenses; [ mit gpl3Only ];
    maintainers = with maintainers; [ ];
    mainProgram = "mpv-multiloop";
    platforms = platforms.all;
  };
}
