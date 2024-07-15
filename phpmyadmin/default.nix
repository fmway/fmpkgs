{ stdenv
, fetchzip
, lib
, writeText
, ...
}: let
  pname = "phpmyadmin";
  version = "5.2.1";
  src = fetchzip {
    url = "https://files.phpmyadmin.net/phpMyAdmin/${version}/phpMyAdmin-${version}-all-languages.zip";
    hash = "sha256-KGW5qVFJrdqPkPujfPSWnQZOhx9zGPbB0hJxq2qb2dM=";
  };
  config = writeText "config.inc.php" (builtins.readFile ./config.inc.php);
in stdenv.mkDerivation {
  inherit pname version src;

  installPhase = ''
    mkdir -p $out/share/phpmyadmin
    cp -r * $out/share/phpmyadmin
    cp ${config} $out/share/phpmyadmin/config.inc.php
  '';

  meta = with lib; {
    description = "A web interface for MySQL and MariaDB";
    homepage = "https://github.com/phpmyadmin/phpmyadmin";
    license = licenses.gpl2Only;
  };
}
