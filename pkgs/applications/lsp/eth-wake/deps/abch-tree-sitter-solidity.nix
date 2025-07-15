{ lib
, python3
, fetchPypi
, abch-tree-sitter
, ... }:

python3.pkgs.buildPythonPackage rec {
  pname = "abch-tree-sitter-solidity";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "abch_tree_sitter_solidity";
    inherit version;
    hash = "sha256-RepzVV9rr3RpduzxWXKV4HETvH0VAHbejWPV1omoYDk=";
  };

  build-system = with python3.pkgs; [
    setuptools
    wheel
    abch-tree-sitter
  ];

  pythonImportsCheck = [
    "tree_sitter_solidity"
  ];

  meta = {
    description = "Solidity grammar for tree sitter";
    homepage = "https://github.com/Ackee-Blockchain/tree-sitter-solidity";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
