{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: let
  concord = inputs.concord.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  home.packages = with pkgs-stable; [
    concord # An open-source and simple TUI based discord clone
    prismlauncher # An open-source minecraft launcher
    olympus # Celeste Mod Loader (Everest) Launcher
    localsend # Send files between devices that connected the same network
    proton-vpn
    krita
  ];

  programs.thunderbird.enable = true;
}
