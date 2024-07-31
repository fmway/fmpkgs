{ lib
, python3
, fetchFromGitHub
# , cairo
# , pango
# , gtk3
, callPackage
}:

python3.pkgs.buildPythonApplication rec {
  pname = "scribdl";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Phoenix124";
    repo = "scribd-downloader";
    rev = version;
    hash = "sha256-Izxxc39jKZbyoRleWcrddlzY35SLhMIfr1EszZcJ16s=";
  };

  propagatedBuildInputs = [
    (callPackage ./md2pdf.nix {})
  ] ++ (with python3.pkgs; [
    setuptools
    wheel
    pip
    requests
    beautifulsoup4
    img2pdf
  ]);

  # nativeBuildInputs = ;

  # pythonImportsCheck = [ "scribd_downloader" ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/Phoenix124/scribd-downloader";
    license = licenses.unlicense;
    maintainers = with maintainers; [ ];
    mainProgram = "scribd-downloader";
  };
}
