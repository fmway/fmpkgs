{ lib
, fetchPypi
, python3

}: python3.pkgs.buildPythonPackage rec {
  pname = "md2pdf";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PVqrd9zVtvWCexk4GasajBzsUGzl9sd3w0EbcDNSzZg=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    weasyprint
    setuptools
    pytest-runner
    docopt
    markdown2
  ];

  meta = with lib; {
    description = "Markdown to PDF conversion tool";
    homepage = "https://github.com/jmaupetit/md2pdf";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
}
