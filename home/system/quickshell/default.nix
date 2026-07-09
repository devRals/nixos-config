{
  inputs,
  lib,
  ...
}: {
  programs.quickshell.enable = true;
  programs.quickshell.systemd.enable = true;

  home.file.".config/quickshell".source = ./quickshell;
}
