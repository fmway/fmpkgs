{ lib
, fetchPypi
, python3
, ...

}: python3.pkgs.buildPythonPackage rec {
  pname = "lazy-import";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "lazy_import";
    inherit version;
    hash = "sha256-IUmu+FeUWUB8Ys/szxGFJ5OcmTGs4STzVSNjYGRPij0=";
  };

  build-system = with python3.pkgs; [
    setuptools
    wheel
    six
  ];

  pythonImportsCheck = [
    "lazy_import"
  ];

  meta = {
    description = "A module for lazy loading of Python modules";
    homepage = "https://pypi.org/project/lazy-import/";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ ];
  };
}
