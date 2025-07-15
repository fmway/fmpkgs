{ lib
, python3
, fetchPypi
, ... }:

python3.pkgs.buildPythonPackage rec {
  pname = "abch-tree-sitter";
  version = "1.1.4";
  pyproject = true;

  src = fetchPypi {
    pname = "abch_tree_sitter";
    inherit version;
    hash = "sha256-BAI8uS9SXNVrRnVZkPCZ41YqDKBwg6kyo+9C3NqUeh0=";
  };

  build-system = with python3.pkgs;[
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "tree_sitter"
  ];
  meta = {
    description = "Python bindings to the Tree-sitter parsing library";
    homepage = "https://github.com/Ackee-Blockchain/py-tree-sitter";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "py-tree-sitter";
  };
}
