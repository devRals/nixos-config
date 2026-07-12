{
  pkgs,
  inputs,
  config,
  ...
}: {
  home.packages = [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.waypaper
  ];
  home.file.".config/wallpapers".source = config.theme.wallpapers;
}
