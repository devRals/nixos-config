{pkgs, ...}: {
  home.packages = [pkgs.killall]; # Pywal uses this
  programs.pywal.enable = true;
  programs.pywal.package = pkgs.pywal16;
}
