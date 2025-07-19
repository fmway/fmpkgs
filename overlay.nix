final: prev: {
  fmpkgs = final.lib.warn "Use pkgs.fmway instead" final.fmway;
  fmway = import ./pkgs/top-level {
    pkgs = prev;
  };
}
