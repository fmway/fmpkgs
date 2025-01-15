{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, sqlite
, xz
, stdenv
, darwin
, ... }:

rustPlatform.buildRustPackage rec {
  pname = "pkgx";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "pkgxdev";
    repo = "pkgx";
    rev = "v${version}";
    hash = "sha256-kCFbeGqtZxwslkYAO1GJJSLBKguFOg/HNUjqxPuu08M=";
  };

  cargoHash = "sha256-/C1Gf0V84vjIXEy47qZnMiZ3gPfJdZnuJubbp+iQerM=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
    xz
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };

  meta = {
    description = "Run anything";
    homepage = "https://github.com/pkgxdev/pkgx";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pkgx";
  };
}
