{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, dbus
}:

rustPlatform.buildRustPackage rec {
  pname = "bluetui";
  version = "v0.6";

  src = fetchFromGitHub {
    owner = "pythops";
    repo = "bluetui";
    rev = "v${version}";
    hash = "sha256-JgxzpFpz/fyFZwyxTtAkG9XB5qkxj46lUnZ3mM44dHk=";
  };

  cargoHash = "sha256-i0hlCMYpfllI3BiNq2yS1YgSrp9GldzOjJMQ8dKFlmU=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    dbus
  ];

  meta = with lib; {
    description = "TUI for managing bluetooth on Linux";
    homepage = "https://github.com/pythops/bluetui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "bluetui";
  };
}
