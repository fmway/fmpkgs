{ lib
, python3
, fetchPypi
, callPackage
, ...
}: let
  abch-tree-sitter = callPackage ./deps/abch-tree-sitter.nix {};
  abch-tree-sitter-solidity = callPackage ./deps/abch-tree-sitter-solidity.nix {
    inherit abch-tree-sitter;
  };
  lazy-import = callPackage ./deps/lazy-import.nix {};
in python3.pkgs.buildPythonApplication rec {
  pname = "eth-wake";
  version = "4.19.0";
  pyproject = true;

  src = fetchPypi {
    pname = "eth_wake";
    inherit version;
    hash = "sha256-QC+V2EpOaojgBoMDn6CQK1DtyYq4KqwFgoKwd803qV4=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies = with python3.pkgs; [
    abch-tree-sitter
    abch-tree-sitter-solidity
    aiofiles
    aiohttp
    certifi
    click
    eth-abi
    eth-account
    eth-utils
    graphviz
    importlib-metadata
    intervaltree
    ipdb
    jschema-to-python
    lazy-import
    networkx
    packaging
    parsimonious
    pathvalidate
    pillow
    pycryptodome
    pydantic
    pytest
    rich
    rich-click
    sarif-om
    tblib
    tomli
    tomli-w
    typing-extensions
    watchdog
    websocket-client
  ];

  optional-dependencies = with python3.pkgs; {
    dev = [
      black
      cairosvg
      isort
      mike
      mkdocs-material
      mkdocstrings
      mkdocstrings-python
      pillow
      pygments
      pymdown-extensions
    ];
    tests = [
      GitPython
      pytest-asyncio
    ];
  };

  dontCheckRuntimeDeps = true;

  pythonImportsCheck = [
    "wake"
    "wake_detectors"
    "wake_printers"
  ];

  meta = {
    description = "Wake is a Python-based Solidity development and testing framework with built-in vulnerability detectors";
    homepage = "https://github.com/Ackee-Blockchain/wake";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "eth-wake";
  };
}
