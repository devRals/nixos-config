{
  inputs,
  pkgs,
  ...
}: {
  programs.quickshell = {
    enable = true;
    package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;

    systemd.enable = true;

    activeConfig = "default";
    configs = {
      default = ./configs/default;
    };
  };
}
